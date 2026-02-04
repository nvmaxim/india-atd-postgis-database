drop table if exists temp_new_urban;
drop table if exists temp_urban_shapes;
drop table if exists temp_stats_before;

create temp table temp_stats_before as
select 
    count(*) as urban_count_before
from atd.info_area_devision 
where id_type_devis = 7 and date_end is null;

create temp table temp_new_urban as
select 
    u.lgdvilcode as code_devision,
    u.villname as name_full,
    null as name_alt,
    u.lgdtehcode as parent_tehsil_code,
    current_date as date_start,
    null::date as date_end,
    3 as id_status_shape,
    u.gid as source_gid,
    u.info as object_type
from public.karnataka_urban_areas u
where u.villname is not null 
  and u.lgdvilcode is not null;

update atd.info_area_devision 
set date_end = current_date
where 
    id_type_devis = 7
    and code_devision in (select code_devision from temp_new_urban)
    and date_end is null;

insert into atd.info_area_devision (
    id_country, id_type_devis, name_full, name_alt, code_devision,
    date_start, date_end, id_status_shape
)
select 
    108 as id_country,
    7 as id_type_devis,
    t.name_full,
    t.name_alt,
    t.code_devision,
    t.date_start,
    t.date_end,
    t.id_status_shape
from temp_new_urban t
where not exists (
    select 1 from atd.info_area_devision 
    where code_devision = t.code_devision
        and id_type_devis = 7
        and date_end is null
);

create temp table temp_urban_shapes as
select 
    iad.id as id_area,
    u.geom as polygon_full,
    iad.code_devision
from public.karnataka_urban_areas u
join temp_new_urban tmp on u.gid = tmp.source_gid
join atd.info_area_devision iad 
    on iad.code_devision = tmp.code_devision
    and iad.id_type_devis = 7
    and iad.date_end is null;

delete from atd.shape 
where id_area in (select id_area from temp_urban_shapes);

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
    'karnataka_urban_areas' as name_table,
    code_devision as mrd_code
from temp_urban_shapes;

delete from atd.link_up_down 
where id_area in (
    select iad.id 
    from atd.info_area_devision iad 
    where iad.id_type_devis = 7
        and iad.date_end is null
        and iad.code_devision in (select code_devision from temp_new_urban)
);

insert into atd.link_up_down (id_area, id_parent_area, id_type_link)
select 
    child.id as id_area,
    parent.id as id_parent_area,
    52 as id_type_link
from temp_new_urban t
join atd.info_area_devision child 
    on child.code_devision = t.code_devision
    and child.id_type_devis = 7
    and child.date_end is null
join atd.info_area_devision parent 
    on parent.code_devision = t.parent_tehsil_code
    and parent.id_type_devis = 6
    and parent.date_end is null
where t.parent_tehsil_code is not null;

do $$
declare
    urban_count integer;
    shapes_count integer;
    updated_urban integer;
    new_urban integer;
    total_in_db integer;
    urban_before_count integer;
    tehsil_links_count integer;
    new_tehsil_links integer;
begin
    select count(*) into urban_count from temp_new_urban;
    select count(*) into shapes_count from temp_urban_shapes;
    
    select urban_count_before into urban_before_count from temp_stats_before;
    
    select count(*) into updated_urban 
    from atd.info_area_devision 
    where id_type_devis = 7 
        and date_end = current_date
        and code_devision in (select code_devision from temp_new_urban)
        and date_start < current_date;
    
    select count(*) into new_urban 
    from atd.info_area_devision 
    where id_type_devis = 7 
        and date_start = current_date
        and date_end is null;

    select count(*) into total_in_db 
    from atd.info_area_devision 
    where id_type_devis = 7 and date_end is null;
    
    select count(*) into new_tehsil_links
    from atd.link_up_down lud
    join atd.info_area_devision iad on lud.id_area = iad.id
    where iad.id_type_devis = 7
        and iad.date_end is null
        and lud.id_type_link = 52
        and iad.code_devision in (select code_devision from temp_new_urban);
    
    select count(*) into tehsil_links_count
    from atd.link_up_down lud
    join atd.info_area_devision iad on lud.id_area = iad.id
    where iad.id_type_devis = 7
        and iad.date_end is null
        and lud.id_type_link = 52;
    
    raise info '=================================================';
    raise info 'отчет о загрузке urban';
    raise info '=================================================';
    raise info 'обработано объектов: %', urban_count;
    raise info 'обновлено геометрий: %', shapes_count;
    raise info '---';
    raise info 'было urban до обновления: %', urban_before_count;
    raise info 'обновлено существующих urban: %', updated_urban;
    raise info 'добавлено новых urban: %', new_urban;
    raise info 'стало urban после обновления: %', total_in_db;
    raise info '---';
    raise info 'созданные связи:';
    raise info 'связей urban→tehsil: %', new_tehsil_links;
    raise info '---';
    raise info 'всего связей в базе:';
    raise info 'связей urban→tehsil: %', tehsil_links_count;
    raise info '---';
    raise info 'таблица-источник: ****_urban';
    raise info 'id страны: 108 (индия)';
    raise info 'тип объектов: 7 (urban)';
    raise info 'тип связи: 52 (village up to tehsil)';
    raise info 'дата загрузки: %', current_timestamp;
    raise info '=================================================';
end $$;