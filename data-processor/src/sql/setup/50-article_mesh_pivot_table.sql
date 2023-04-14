-- View: public.article_mesh_pivot_table

DROP MATERIALIZED VIEW public.article_mesh_pivot_table;

CREATE MATERIALIZED VIEW public.article_mesh_pivot_table
TABLESPACE pg_default
AS
 SELECT m.journal_nlmuniqueid,
    m.journal_title,
    m.ui,
    count(m.pmid) AS article_count
   FROM "journal_article_meshID" m
  GROUP BY m.journal_nlmuniqueid, m.journal_title, m.ui
WITH DATA;

-- \copy (SELECT * FROM article_mesh_pivot_table) to 'C:\Users\aishw\obms\data_extraction\output\article_mesh_pivot_table.csv' with csv header;
ALTER TABLE public.article_mesh_pivot_table
    OWNER TO avsinhas;

-- 