drop table if exists temp_new_blocks;
drop table if exists temp_block_shapes;
drop table if exists temp_stats_before;

create temp table temp_stats_before as
select 
    count(*) as blocks_count_before
from atd.info_area_devision 
where id_type_devis = 3 and date_end is null;

create temp table temp_new_blocks as
select 
    b.lgdblkcode as code_devision,
    b.blockname as name_full,
    null as name_alt,
    b.lgddstcode as parent_code_devision,
    current_date as date_start,
    null::date as date_end,
    3 as id_status_shape
from public.karnataka_blocks b;

update atd.info_area_devision 
set date_end = current_date
where 
    id_type_devis = 3
    and code_devision in (select code_devision from temp_new_blocks)
    and date_end is null;

insert into atd.info_area_devision (
    id_country, id_type_devis, name_full, name_alt, code_devision,
    date_start, date_end, id_status_shape
)
select 
    108 as id_country,
    3 as id_type_devis,
    t.name_full,
    t.name_alt,
    t.code_devision,
    t.date_start,
    t.date_end,
    t.id_status_shape
from temp_new_blocks t
where not exists (
    select 1 from atd.info_area_devision 
    where code_devision = t.code_devision
        and id_type_devis = 3
        and date_end is null
);

create temp table temp_block_shapes as
select 
    iad.id as id_area,
    b.geom as polygon_full,
    iad.code_devision
from public.karnataka_blocks b
join atd.info_area_devision iad 
    on iad.code_devision = b.lgdblkcode
    and iad.id_type_devis = 3
    and iad.date_end is null;

delete from atd.shape 
where id_area in (select id_area from temp_block_shapes);

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
    'karnataka_blocks' as name_table,
    code_devision as mrd_code
from temp_block_shapes;

delete from atd.link_up_down 
where id_area in (
    select iad.id 
    from atd.info_area_devision iad 
    where iad.id_type_devis = 3
        and iad.date_end is null
        and iad.code_devision in (select lgdblkcode from public.karnataka_blocks)
);

insert into atd.link_up_down (id_area, id_parent_area, id_type_link)
select 
    child.id as id_area,
    parent.id as id_parent_area,
    3 as id_type_link
from temp_new_blocks tnb
join atd.info_area_devision child 
    on child.code_devision = tnb.code_devision
    and child.id_type_devis = 3
    and child.date_end is null
join atd.info_area_devision parent 
    on parent.code_devision = tnb.parent_code_devision
    and parent.id_type_devis = 2
    and parent.date_end is null;

do $$
declare
    blocks_count integer;
    shapes_count integer;
    updated_blocks integer;
    new_blocks integer;
    total_in_db integer;
    blocks_before_count integer;  
    total_links_count integer;
    new_links_count integer;
    total_districts_count integer;
    new_districts_count integer;
begin
    select count(*) into blocks_count from temp_new_blocks;
    select count(*) into shapes_count from temp_block_shapes;
    
    select blocks_count_before into blocks_before_count from temp_stats_before;
    
    select count(*) into updated_blocks 
    from atd.info_area_devision 
    where id_type_devis = 3 
        and date_end = current_date
        and code_devision in (select code_devision from temp_new_blocks)
        and date_start < current_date;
        
    select count(*) into new_blocks 
    from atd.info_area_devision 
    where id_type_devis = 3 
        and date_start = current_date
        and date_end is null;
        
    select count(*) into total_in_db 
    from atd.info_area_devision 
    where id_type_devis = 3 and date_end is null;
    
    select count(*) into new_links_count
    from atd.link_up_down lud
    join atd.info_area_devision iad ON lud.id_area = iad.id
    where iad.id_type_devis = 3
        and iad.date_end is null
        and lud.id_type_link = 3
        and iad.code_devision in (select code_devision from temp_new_blocks);
    
    select count(distinct parent.code_devision) into new_districts_count
    from atd.link_up_down lud
    join atd.info_area_devision child ON lud.id_area = child.id
    join atd.info_area_devision parent ON lud.id_parent_area = parent.id
    where child.id_type_devis = 3
        and child.date_end is null
        and parent.id_type_devis = 2
        and lud.id_type_link = 3
        and child.code_devision in (select code_devision from temp_new_blocks);
    
    select count(*) into total_links_count
    from atd.link_up_down lud
    join atd.info_area_devision iad ON lud.id_area = iad.id
    where iad.id_type_devis = 3
        and iad.date_end is null
        and lud.id_type_link = 3;
    
    select count(distinct parent.code_devision) into total_districts_count
    from atd.link_up_down lud
    join atd.info_area_devision child ON lud.id_area = child.id
    join atd.info_area_devision parent ON lud.id_parent_area = parent.id
    where child.id_type_devis = 3
        and child.date_end is null
        and parent.id_type_devis = 2
        and lud.id_type_link = 3;
    
    raise info '=================================================';
    raise info 'отчет о загрузке блоков';
    raise info '=================================================';
    raise info 'обработано блоков: %', blocks_count;
    raise info 'обновлено геометрий: %', shapes_count;
    raise info '---';
    raise info 'было блоков до обновления: %', blocks_before_count;
    raise info 'обновлено существующих блоков: %', updated_blocks;
    raise info 'добавлено новых блоков: %', new_blocks;
    raise info 'стало блоков после обновления: %', total_in_db;
    raise info '---';
    raise info 'иерархия блоков по районам:';
    raise info 'создано связей блок→район: %', new_links_count;
    raise info 'районов с блоками: %', new_districts_count;
    raise info '---';
    raise info 'всего связей в базе:';
    raise info 'связей блок→район: %', total_links_count;
    raise info 'районов с блоками: %', total_districts_count;
    raise info '---';
    raise info 'таблица-источник: ****_blocks';
    raise info 'id страны: 108 (индия)';
    raise info 'тип объектов: 3 (блоки)';
    raise info 'тип связи: 3 (блок к району)';
    raise info 'дата загрузки: %', current_timestamp;
    raise info '=================================================';
end $$;