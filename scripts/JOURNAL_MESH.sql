DROP materialized VIEW if exists journal_mesh;
CREATE materialized VIEW journal_mesh AS 
select 
  * 
from 
  (
    SELECT 
      journal_nlmuniqueid, 
      descriptor_name, 
      Count(DISTINCT a.pmid) AS pmids, 
      row_number() OVER (
        partition BY journal_nlmuniqueid 
        ORDER BY 
          (
            Count(DISTINCT a.pmid)
          ) DESC
      ) rank 
    FROM 
      medline_master m 
      join medlinex_rascore_nodes a ON a.pmid = m.pmid 
      join medline_mesh_heading b ON a.pmid = b.pmid 
    GROUP BY 
      journal_nlmuniqueid, 
      descriptor_name
  ) k 
WHERE 
  rank <= 20;
