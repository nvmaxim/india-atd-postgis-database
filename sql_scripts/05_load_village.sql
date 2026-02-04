drop table if exists temp_new_villages;
drop table if exists temp_village_shapes;
drop table if exists temp_stats_before;

create temp table temp_stats_before as
select 
    count(*) as villages_count_before
from atd.info_area_devision 
where id_type_devis = 5 and date_end is null;

create temp table temp_new_villages as
select 
    v.lgdvilcode as code_devision,
    v.villname as name_full,
    null as name_alt,
    v.lgdgpcode as parent_gp_code,
    v.lgdtehcode as parent_tehsil_code,
    current_date as date_start,
    null::date as date_end,
    3 as id_status_shape,
    v.gid as source_gid,
    v.info as object_type
from public.karnataka_villages v
where v.villname is not null 
  and v.lgdvilcode is not null;

update atd.info_area_devision 
set date_end = current_date
where 
    id_type_devis = 5
    and code_devision in (select code_devision from temp_new_villages)
    and date_end is null;

insert into atd.info_area_devision (
    id_country, id_type_devis, name_full, name_alt, code_devision,
    date_start, date_end, id_status_shape
)
select 
    108 as id_country,
    5 as id_type_devis,
    t.name_full,
    t.name_alt,
    t.code_devision,
    t.date_start,
    t.date_end,
    t.id_status_shape
from temp_new_villages t
where not exists (
    select 1 from atd.info_area_devision 
    where code_devision = t.code_devision
        and id_type_devis = 5
        and date_end is null
);

create temp table temp_village_shapes as
select 
    iad.id as id_area,
    v.geom as polygon_full,
    iad.code_devision
from public.karnataka_villages v
join temp_new_villages tmp on v.gid = tmp.source_gid
join atd.info_area_devision iad 
    on iad.code_devision = tmp.code_devision
    and iad.id_type_devis = 5
    and iad.date_end is null;

delete from atd.shape 
where id_area in (select id_area from temp_village_shapes);

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
    'karnataka_villages' as name_table,
    code_devision as mrd_code
from temp_village_shapes;

delete from atd.link_up_down 
where id_area in (
    select iad.id 
    from atd.info_area_devision iad 
    where iad.id_type_devis = 5
        and iad.date_end is null
        and iad.code_devision in (select code_devision from temp_new_villages)
);

insert into atd.link_up_down (id_area, id_parent_area, id_type_link)
select 
    child.id as id_area,
    parent.id as id_parent_area,
    5 as id_type_link
from temp_new_villages t
join atd.info_area_devision child 
    on child.code_devision = t.code_devision
    and child.id_type_devis = 5
    and child.date_end is null
join atd.info_area_devision parent 
    on parent.code_devision = t.parent_gp_code
    and parent.id_type_devis = 4
    and parent.date_end is null
where t.parent_gp_code is not null;

insert into atd.link_up_down (id_area, id_parent_area, id_type_link)
select 
    child.id as id_area,
    parent.id as id_parent_area,
    52 as id_type_link
from temp_new_villages t
join atd.info_area_devision child 
    on child.code_devision = t.code_devision
    and child.id_type_devis = 5
    and child.date_end is null
join atd.info_area_devision parent 
    on parent.code_devision = t.parent_tehsil_code
    and parent.id_type_devis = 6
    and parent.date_end is null
where t.parent_tehsil_code is not null;

do $$
declare
    villages_count integer;
    shapes_count integer;
    updated_villages integer;
    new_villages integer;
    total_in_db integer;
    villages_before_count integer;
    gp_links_count integer;
    tehsil_links_count integer;
    villages_with_gp integer;
    villages_with_tehsil integer;
    villages_without_panchayat integer;
    new_gp_links integer;
    new_tehsil_links integer;
begin
    select count(*) into villages_count from temp_new_villages;
    select count(*) into shapes_count from temp_village_shapes;
    
    select villages_count_before into villages_before_count from temp_stats_before;
    
    select count(*) into updated_villages 
    from atd.info_area_devision 
    where id_type_devis = 5 
        and date_end = current_date
        and code_devision in (select code_devision from temp_new_villages)
        and date_start < current_date;
    
    select count(*) into new_villages 
    from atd.info_area_devision 
    where id_type_devis = 5 
        and date_start = current_date
        and date_end is null;

    select count(*) into total_in_db 
    from atd.info_area_devision 
    where id_type_devis = 5 and date_end is null;
    
    select count(*) into new_gp_links
    from atd.link_up_down lud
    join atd.info_area_devision iad on lud.id_area = iad.id
    where iad.id_type_devis = 5
        and iad.date_end is null
        and lud.id_type_link = 5
        and iad.code_devision in (select code_devision from temp_new_villages);
        
    select count(*) into new_tehsil_links
    from atd.link_up_down lud
    join atd.info_area_devision iad on lud.id_area = iad.id
    where iad.id_type_devis = 5
        and iad.date_end is null
        and lud.id_type_link = 52
        and iad.code_devision in (select code_devision from temp_new_villages);
    
    select count(*) into gp_links_count
    from atd.link_up_down lud
    join atd.info_area_devision iad on lud.id_area = iad.id
    where iad.id_type_devis = 5
        and iad.date_end is null
        and lud.id_type_link = 5;
        
    select count(*) into tehsil_links_count
    from atd.link_up_down lud
    join atd.info_area_devision iad on lud.id_area = iad.id
    where iad.id_type_devis = 5
        and iad.date_end is null
        and lud.id_type_link = 52;
    
    select count(*) into villages_with_gp from temp_new_villages where parent_gp_code is not null;
    select count(*) into villages_with_tehsil from temp_new_villages where parent_tehsil_code is not null;
    select count(*) into villages_without_panchayat from temp_new_villages where object_type like '%Not under any panchayat%';
    
    raise info '=================================================';
    raise info 'отчет о загрузке деревень';
    raise info '=================================================';
    raise info 'обработано объектов: %', villages_count;
    raise info 'обновлено геометрий: %', shapes_count;
    raise info '---';
    raise info 'было деревень до обновления: %', villages_before_count;
    raise info 'обновлено существующих: %', updated_villages;
    raise info 'добавлено новых: %', new_villages;
    raise info 'стало деревень после обновления: %', total_in_db;
    raise info '---';
    raise info 'статистика по объектам:';
    raise info 'деревень с гп: %', villages_with_gp;
    raise info 'деревень без гп: %', villages_without_panchayat;
    raise info 'деревень с техсилом: %', villages_with_tehsil;
    raise info '---';
    raise info 'созданные связи:';
    raise info 'связей с гп: %', new_gp_links;
    raise info 'связей с техсилами: %', new_tehsil_links;
    raise info '---';
    raise info 'всего связей в базе:';
    raise info 'связей с гп: %', gp_links_count;
    raise info 'связей с техсилами: %', tehsil_links_count;
    raise info '---';
    raise info 'таблица-источник: ****_villages';
    raise info 'id страны: 108 (индия)';
    raise info 'тип объектов: 5 (village)';
    raise info 'дата загрузки: %', current_timestamp;
    raise info '=================================================';
end $$;