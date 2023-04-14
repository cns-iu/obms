-- View: public.journal_article_count

DROP MATERIALIZED VIEW public.journal_article_count;

CREATE MATERIALIZED VIEW public.journal_article_count
TABLESPACE pg_default
AS
 SELECT m.journal_nlmuniqueid,
    m.journal_title,
    count(m.pmid) AS article_count
   FROM "journal_article_meshID" m
  GROUP BY m.journal_nlmuniqueid, m.journal_title
WITH DATA;

\copy (SELECT * FROM journal_article_count) to 'C:\Users\aishw\obms\data_extraction\output\journal_article_count.csv' with csv header;

ALTER TABLE public.journal_article_count
    OWNER TO avsinhas;