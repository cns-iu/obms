with edges as (select source,target,weight from journal_journal_top50), 
nodes as (SELECT source      AS id, 
       journal_name1 AS label 
FROM   journal_journal_top50 
UNION 
SELECT target, 
       journal_name2 
FROM   journal_journal_top50)

SELECT Jsonb_pretty(Jsonb_object_agg(field, val)) 
   FROM   ((SELECT 'nodes' 
                          AS 
                           field, 
                   Jsonb_agg(Jsonb_strip_nulls(Jsonb_build_object('id', id, 
                                               'label' 
                                               , label 
                                               ) 
                             )) AS 
                   val 
            FROM   nodes) 
           UNION ALL 
           (SELECT 'edges'                                                   AS 
                   field, 
                   Jsonb_agg(Jsonb_strip_nulls(Jsonb_build_object('source', 
                                               source, 
                                               'target', 
                                               target, 
                                                         'weight', weight))) AS 
                   val 
            FROM   edges)) AS a; 
            
