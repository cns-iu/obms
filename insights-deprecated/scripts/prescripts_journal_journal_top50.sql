DROP MATERIALIZED VIEW IF EXISTS journal_journal_relation;
CREATE materialized VIEW journal_journal_relation 
AS SELECT a.journal_nlmuniqueid                  AS journal1, 
          a.iso_abbrev                           AS journal_name1, 
          b.journal_nlmuniqueid                  AS journal2, 
          b.iso_abbrev                           AS journal_name2, 
          ( Avg(rascore :: INTEGER) ) :: INTEGER AS rascore_avg, 
          Count(DISTINCT b.pmid)                 AS count_repeatingjournals 
   FROM   medlinex_rascore_edges m 
          join medline_master a 
            ON a.pmid = m.pmid 
          join medline_master b 
            ON b.pmid = m.pmid2 
   GROUP  BY a.journal_nlmuniqueid, 
             b.journal_nlmuniqueid, 
             a.iso_abbrev, 
             b.iso_abbrev; 
