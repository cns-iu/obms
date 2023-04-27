-- View: public.journal_article_count_all_meshterms


CREATE MATERIALIZED VIEW public.journal_article_count_all_meshterms
TABLESPACE pg_default
AS
 SELECT m.journal_nlmuniqueid,
    m.journal_title,
    count(m.pmid) AS article_count
   FROM journal_article_table1 m
  GROUP BY m.journal_nlmuniqueid, m.journal_title
WITH DATA;

ALTER TABLE public.journal_article_count_all_meshterms
    OWNER TO avsinhas;

GRANT ALL ON TABLE public.journal_article_count_all_meshterms TO avsinhas;
GRANT SELECT ON TABLE public.journal_article_count_all_meshterms TO mginda;
GRANT SELECT ON TABLE public.journal_article_count_all_meshterms TO yokong;