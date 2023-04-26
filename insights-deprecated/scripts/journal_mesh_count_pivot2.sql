-- View: public.journal_mesh_count_pivot2

-- DROP MATERIALIZED VIEW public.journal_mesh_count_pivot2;

CREATE MATERIALIZED VIEW public.journal_mesh_count_pivot2
TABLESPACE pg_default
AS
 SELECT m.journal_nlmuniqueid,
    m.journal_title,
    m.pmid,
    count(m.ui) AS mesh_count
   FROM "journal_article_meshID" m
  GROUP BY m.journal_nlmuniqueid, m.journal_title, m.pmid
WITH DATA;

ALTER TABLE public.journal_mesh_count_pivot2
    OWNER TO avsinhas;