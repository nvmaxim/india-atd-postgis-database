drop table if exists temp_new_states;   
drop table if exists temp_state_shapes;
drop table if exists temp_stats_before;

create temp table temp_stats_before as
select 
    count(*) as states_count_before
from atd.info_area_devision 
where id_type_devis = 1 and date_end is null;

create temp table temp_new_states as
select 
    s.statecode as code_devision,
    s.statename as name_full,
    current_date as date_start,
    null::date as date_end,
    3 as id_status_shape
from public.india_states_20250919 s;

update atd.info_area_devision 
set date_end = current_date
where 
    id_type_devis = 1
    and code_devision in (select code_devision from temp_new_states)
    and date_end is null;

insert into atd.info_area_devision (
    id_country, id_type_devis, name_full, code_devision, 
    date_start, date_end, id_status_shape
)
select 
    108 as id_country,
    1 as id_type_devis,
    t.name_full,
    t.code_devision,
    t.date_start,
    t.date_end,
    t.id_status_shape
from temp_new_states t
where not exists (
    select 1 from atd.info_area_devision 
    where code_devision = t.code_devision
        and id_type_devis = 1
        and date_end is null
);

create temp table temp_state_shapes as
select 
    iad.id as id_area,
    s.geom as polygon_full,
    iad.code_devision
from public.india_states_20250919 s
join atd.info_area_devision iad 
    on iad.code_devision = s.statecode
    and iad.id_type_devis = 1
    and iad.date_end is null;

delete from atd.shape 
where id_area in (select id_area from temp_state_shapes);

insert into atd.shape (
    id_area, polygon_full, polygon_legal, polygon_shot, 
    line, centroid, name_table, mrd_code
)
select 
    id_area,
    polygon_full,                       
    polygon_full as polygon_legal,      
    polygon_full as polygon_shot,
    st_boundary(polygon_full) as line,  
    st_centroid(polygon_full) as centroid,
    'india_states_20250919' as name_table,
    code_devision as mrd_code
from temp_state_shapes;

do $$
declare
    states_count integer;
    shapes_count integer;
    updated_states integer;
    new_states integer;
    total_in_db integer;
    states_before_count integer;  
begin
    select count(*) into states_count from temp_new_states;
    select count(*) into shapes_count from temp_state_shapes;
    
    select states_count_before into states_before_count from temp_stats_before;
    
    select count(*) into updated_states 
    from atd.info_area_devision 
    where id_type_devis = 1 
        and date_end = current_date
        and code_devision in (select code_devision from temp_new_states)
        and date_start < current_date;
        
    select count(*) into new_states 
    from atd.info_area_devision 
    where id_type_devis = 1 
        and date_start = current_date
        and date_end is null;
        
    select count(*) into total_in_db 
    from atd.info_area_devision 
    where id_type_devis = 1 and date_end is null;
    
    raise info '=================================================';
    raise info 'отчет о загрузке штатов индии';
    raise info '=================================================';
    raise info 'обработано штатов: %', states_count;
    raise info 'обновлено геометрий: %', shapes_count;
    raise info '---';
    raise info 'было штатов до обновления: %', states_before_count;
    raise info 'обновлено существующих штатов: %', updated_states;
    raise info 'добавлено новых штатов: %', new_states;
    raise info 'стало штатов после обновления: %', total_in_db;
    raise info '---';
    raise info 'таблица-источник: ****_states_****';
    raise info 'id страны: 108 (индия)';                  
    raise info 'тип объектов: 1 (штаты)';                 
    raise info 'дата загрузки: %', current_timestamp;
    raise info '=================================================';
end $$;