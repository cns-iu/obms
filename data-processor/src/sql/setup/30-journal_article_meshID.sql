-- View: public.journal_article_meshID


CREATE MATERIALIZED VIEW public."journal_article_meshID"
TABLESPACE pg_default
AS
 SELECT m.journal_nlmuniqueid,
    m.journal_title,
    msh.pmid,
    msh.ui,
    msh.descriptor_name
   FROM medline_mesh_heading msh
     JOIN journal_article_table1 m ON msh.pmid::text = m.pmid::text
  WHERE msh.ui not in (select mse.mesh_id from obms_mesh_terms_exclude mse)
WITH DATA;

ALTER TABLE public."journal_article_meshID"
    OWNER TO avsinhas;

GRANT ALL ON TABLE public."journal_article_meshID" TO bherr;
GRANT ALL ON TABLE public."journal_article_meshID" TO avsinhas;
GRANT ALL ON TABLE public."journal_article_meshID" TO mginda;

-- This View is created using medline_mesh_heading_msh table which contains fields such as: 
-- pmid : artcile id, heading_ctr : heading of the article
-- ui : mesh term id, descriptor_type : type of mesh term
-- descriptor_name : name of the mesh term.  

