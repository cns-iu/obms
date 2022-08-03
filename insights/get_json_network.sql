WITH edges AS (
	  SELECT journal1 as source, journal2 as target,
	    
	       (rascore_avg*count_repeatingjournals)
	as weight
	  FROM journal_journal_relation
	
	), nodes AS (
	  SELECT journal1 as id, journal_name1 as label
	  FROM journal_journal_relation
	  Union
Select journal2, journal_name2 from journal_journal_relation 

	
	)

SELECT jsonb_pretty(jsonb_object_agg(field, val))
	FROM (
	  (SELECT 'nodes' AS field, jsonb_agg(jsonb_strip_nulls(jsonb_build_object(
	    'id', id, 'label', label
	  ))) AS val FROM nodes)
	  UNION ALL
	  (SELECT 'edges' AS field, jsonb_agg(jsonb_strip_nulls(jsonb_build_object(
	    'source', source, 'target', target, 'weight', weight
	  ))) AS val FROM edges)
	) AS a;
