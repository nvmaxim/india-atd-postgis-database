drop table if exists temp_new_gp_block;
drop table if exists temp_gp_block_shapes;
drop table if exists temp_stats_before;

create temp table temp_stats_before as
select 
    count(*) as gp_count_before
from atd.info_area_devision 
where id_type_devis = 4 and date_end is null;

create temp table temp_new_gp_block as
select 
    g.lgdgpcode as code_devision,
    g.gpname as name_full,
    null as name_alt,
    g.lgdblkcode as parent_code_devision,
    current_date as date_start,
    null::date as date_end,
    3 as id_status_shape
from public.karnataka_gram_panchayats g
where g.lgdblkcode is not null;

update atd.info_area_devision 
set date_end = current_date
where 
    id_type_devis = 4
    and code_devision in (select code_devision from temp_new_gp_block)
    and date_end is null;

insert into atd.info_area_devision (
    id_country, id_type_devis, name_full, name_alt, code_devision,
    date_start, date_end, id_status_shape
)
select 
    108 as id_country,
    4 as id_type_devis,
    t.name_full,
    t.name_alt,
    t.code_devision,
    t.date_start,
    t.date_end,
    t.id_status_shape
from temp_new_gp_block t
where not exists (
    select 1 from atd.info_area_devision 
    where code_devision = t.code_devision
        and id_type_devis = 4
        and date_end is null
);

create temp table temp_gp_block_shapes as
select 
    iad.id as id_area,
    g.geom as polygon_full,
    iad.code_devision
from public.karnataka_gram_panchayats g
join atd.info_area_devision iad 
    on iad.code_devision = g.lgdgpcode
    and iad.id_type_devis = 4
    and iad.date_end is null;

delete from atd.shape 
where id_area in (select id_area from temp_gp_block_shapes);

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
    'karnataka_gram_panchayats' as name_table,
    code_devision as mrd_code
from temp_gp_block_shapes;

delete from atd.link_up_down 
where id_area in (
    select iad.id 
    from atd.info_area_devision iad 
    where iad.id_type_devis = 4
        and iad.date_end is null
        and iad.code_devision in (select lgdgpcode from public.karnataka_gram_panchayats where lgdblkcode is not null)
);

insert into atd.link_up_down (id_area, id_parent_area, id_type_link)
select 
    child.id as id_area,
    parent.id as id_parent_area,
    41 as id_type_link
from temp_new_gp_block tng
join atd.info_area_devision child 
    on child.code_devision = tng.code_devision
    and child.id_type_devis = 4
    and child.date_end is null
join atd.info_area_devision parent 
    on parent.code_devision = tng.parent_code_devision
    and parent.id_type_devis = 3
    and parent.date_end is null;

do $$
declare
    gp_count integer;
    shapes_count integer;
    updated_gp integer;
    new_gp integer;
    total_in_db integer;
    gp_before_count integer;  
    total_links_count integer;
    new_links_count integer;
    blocks_count integer;
    new_blocks_count integer;
begin
    select count(*) into gp_count from temp_new_gp_block;
    select count(*) into shapes_count from temp_gp_block_shapes;
    
    select gp_count_before into gp_before_count from temp_stats_before;
    
    select count(*) into updated_gp 
    from atd.info_area_devision 
    where id_type_devis = 4 
        and date_end = current_date
        and code_devision in (select code_devision from temp_new_gp_block)
        and date_start < current_date;
    
    select count(*) into new_gp 
    from atd.info_area_devision 
    where id_type_devis = 4 
        and date_start = current_date
        and date_end is null;
        
    select count(*) into total_in_db 
    from atd.info_area_devision 
    where id_type_devis = 4 and date_end is null;
    
    select count(*) into new_links_count
    from atd.link_up_down lud
    join atd.info_area_devision iad ON lud.id_area = iad.id
    where iad.id_type_devis = 4
        and iad.date_end is null
        and lud.id_type_link = 41
        and iad.code_devision in (select code_devision from temp_new_gp_block);
    
    select count(distinct parent.code_devision) into new_blocks_count
    from atd.link_up_down lud
    join atd.info_area_devision child ON lud.id_area = child.id
    join atd.info_area_devision parent ON lud.id_parent_area = parent.id
    where child.id_type_devis = 4
        and child.date_end is null
        and parent.id_type_devis = 3
        and lud.id_type_link = 41
        and child.code_devision in (select code_devision from temp_new_gp_block);
    
    select count(*) into total_links_count
    from atd.link_up_down lud
    join atd.info_area_devision iad ON lud.id_area = iad.id
    where iad.id_type_devis = 4
        and iad.date_end is null
        and lud.id_type_link = 41;
    
    select count(distinct parent.code_devision) into blocks_count
    from atd.link_up_down lud
    join atd.info_area_devision child ON lud.id_area = child.id
    join atd.info_area_devision parent ON lud.id_parent_area = parent.id
    where child.id_type_devis = 4
        and child.date_end is null
        and parent.id_type_devis = 3
        and lud.id_type_link = 41;
    
    raise info '=================================================';
    raise info 'отчет о загрузке GPs';
    raise info '=================================================';
    raise info 'обработано гп: %', gp_count;
    raise info 'обновлено геометрий: %', shapes_count;
    raise info '---';
    raise info 'было гп до обновления: %', gp_before_count;
    raise info 'обновлено существующих гп: %', updated_gp;
    raise info 'добавлено новых гп: %', new_gp;
    raise info 'стало гп после обновления: %', total_in_db;
    raise info '---';
    raise info 'иерархия гп по блокам:';
    raise info 'создано связей гп→блок: %', new_links_count;
    raise info 'блоков с гп: %', new_blocks_count;
    raise info '---';
    raise info 'всего связей в базе:';
    raise info 'связей гп→блок: %', total_links_count;
    raise info 'блоков с гп: %', blocks_count;
    raise info '---';
    raise info 'таблица-источник: ****_gram_panchayats';
    raise info 'id страны: 108 (индия)';
    raise info 'тип объектов: 4 (грам-панчаяты)';
    raise info 'тип связи: 41 (гп к блоку)';
    raise info 'дата загрузки: %', current_timestamp;
    raise info '=================================================';
end $$;