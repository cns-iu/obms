drop materialized view if exists journal_meshterms_relation;
create materialized view journal_meshterms_relation as 
select 
  journal_nlmuniqueid, 
  string_agg(descriptor_name, '| ') 
from 
  journal_mesh 
group by 
  journal_nlmuniqueid;
