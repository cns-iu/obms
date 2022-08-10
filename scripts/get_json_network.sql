CREATE materialized VIEW journal_journal_top50 
AS (SELECT journal1 AS source, 
           journal2 AS target, 
           weight, 
           journal_name1 AS source_label,
           journal_name2 AS target_label
    FROM   (SELECT journal1, 
                   journal2, 
                   ( rascore_avg * count_repeatingjournals ) 
                   AS 
                   weight, 
                   journal_name1, 
                   journal_name2, 
                   Rank() 
                     over ( 
                       PARTITION BY journal1 
                       ORDER BY ( rascore_avg * count_repeatingjournals ) DESC ) 
                   rank 
            FROM   journal_journal_relation) a 
    WHERE  rank <= 50); 
