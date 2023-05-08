DROP TABLE public.obms_mesh_terms_exclude CASCADE;
CREATE TABLE public.obms_mesh_terms_exclude
(
    mesh_id character varying(50) COLLATE pg_catalog."default",
    descriptor_name character varying(200) COLLATE pg_catalog."default"
);

\copy obms_mesh_terms_exclude(mesh_id,descriptor_name) from './src/sql/setup/input-meshids/geographic-descriptors.csv' DELIMITER ',' CSV HEADER;

\copy obms_mesh_terms_exclude(mesh_id,descriptor_name) from './src/sql/setup/input-meshids/MeshIDExclude.csv' DELIMITER ',' CSV HEADER;

GRANT ALL ON TABLE public.obms_mesh_terms_exclude TO avsinhas;
GRANT SELECT ON TABLE public.obms_mesh_terms_exclude TO mginda;
GRANT SELECT ON TABLE public.obms_mesh_terms_exclude TO bherr;

-- This sql script will create table obms_mesh_terms_exclude which we are using for excluding the mesh terms that are not related to biomedical data. 