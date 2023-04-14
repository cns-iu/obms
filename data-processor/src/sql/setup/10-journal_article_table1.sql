-- View: public.journal_article_table1

DROP MATERIALIZED VIEW public.journal_article_table1;

CREATE MATERIALIZED VIEW public.journal_article_table1
TABLESPACE pg_default
AS
 SELECT m.journal_title,
    m.journal_nlmuniqueid,
    m.pmid
   FROM medline_master m
  WHERE m.pub_year::integer >= 2013 AND m.pub_year::integer <= 2022
WITH DATA;

\copy (SELECT * FROM journal_article_table1) to 'C:\Users\aishw\obms\data_extraction\output\journal_article_table1.csv' with csv header;
ALTER TABLE public.journal_article_table1
    OWNER TO avsinhas;