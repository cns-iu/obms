-- View: public.journal_article_meshterms_table2

-- DROP MATERIALIZED VIEW public.journal_article_meshterms_table2;

CREATE MATERIALIZED VIEW public.journal_article_meshterms_table2
TABLESPACE pg_default
AS
 SELECT a.journal_nlmuniqueid,
    a.journal_title,
    a.pmid,
    me.descriptor_name
   FROM journal_meshterms_exclude_relation me
     JOIN journal_article_table1 a ON a.journal_nlmuniqueid::text = me.journal_nlmuniqueid::text
WITH DATA;

ALTER TABLE public.journal_article_meshterms_table2
    OWNER TO avsinhas;