-- View: public.journal_article_count_meshid


CREATE MATERIALIZED VIEW public.journal_article_count_meshid
TABLESPACE pg_default
AS
 SELECT m.journal_nlmuniqueid,
    m.journal_title,
    m.ui,
    m.descriptor_name,
    count(m.pmid) AS mesh_art_count
   FROM "journal_article_meshID" m
  GROUP BY m.journal_nlmuniqueid, m.journal_title, m.ui, m.descriptor_name
WITH DATA;

ALTER TABLE public.journal_article_count_meshid
    OWNER TO avsinhas;

GRANT ALL ON TABLE public.journal_article_count_meshid TO bherr;
GRANT ALL ON TABLE public.journal_article_count_meshid TO avsinhas;
GRANT ALL ON TABLE public.journal_article_count_meshid TO mginda;

-- This is the pivot table which generates count of articles for journal and mesh term. We are using view journal_article_meshID 
-- which contains journal id, article id and mesh terms data. 
-- This view excludes mesh terms that are not related to biomedical data.