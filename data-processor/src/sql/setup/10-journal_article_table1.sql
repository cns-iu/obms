-- View: public.journal_article_table1

DROP MATERIALIZED VIEW IF EXISTS public.journal_article_table1 CASCADE;

CREATE MATERIALIZED VIEW public.journal_article_table1
TABLESPACE pg_default
AS
 SELECT m.journal_title,
    m.journal_nlmuniqueid,
    m.pmid
   FROM medline_master m
  WHERE m.pub_year::integer >= 2013 AND m.pub_year::integer <= 2022
WITH DATA;

ALTER TABLE public.journal_article_table1
    OWNER TO avsinhas;

GRANT ALL ON TABLE public.journal_article_count_all_meshterms TO avsinhas;
GRANT SELECT ON TABLE public.journal_article_count_all_meshterms TO mginda;
GRANT SELECT ON TABLE public.journal_article_count_all_meshterms TO yokong;