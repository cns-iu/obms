# OBMS SQL Data Processor

## Prerequisites

Create a db-config.sh in the root of the repository. See [db-config.example.sh](../db-config.example.sh) for a template to use.

## Steps to run:

- Change folder to data_processor
- Run Command: `./run.sh`

## Flow of database setup and data extraction:

### Setup

- [./scripts/10-run-sql-setup.sh](./scripts/10-run-sql-setup.sh) which runs sql scripts in [./src/sql/setup](./src/sql/setup/). These scripts will create below views which are used to form the pivot table which has 
article count for journal and mesh term.

#### journal_article_table1 view

- `journal_article_table1` is a view that is created using data from the `medline_master` table. Specifically, it includes the journal title, journal NLM unique ID (journal ID), and article ID (PMID) for journal articles published between the years 2013 and 2022. This table provides a subset of the original data that is filtered to only include articles published within the specified timeframe. 

#### Customizing publication year range

You can change publication year range in `journal_article_table1` view as below:
```
m.pub_year::integer >= 2013 AND m.pub_year::integer <= 2022
```

#### journal_article_count_all_meshterms

- This view `journal_article_count_all_meshterms` contains journal and count of articles for all its meshterms. 

#### journal_article_meshID

- Here we have excluded some of the mesh terms which are not related to the biomedical data. In the table we have mesh terms related to geography and some other mesh terms which are not related to biomedical data. 
- This View `journal_article_meshID` is created using `medline_mesh_heading_msh` table which contains fields such as:  pmid : artcile id, heading_ctr : heading of the article ui : mesh term id, descriptor_type : type of mesh term
descriptor_name : name of the mesh term. 

#### journal_article_count_meshid 

- This is the pivot table which contains article count for journal and mesh terms in it. We have grouped the data of journal and mesh term and calculated count of articles in that journal. 

### Data Extraction

- [./scripts/20-export-data.sh](./scripts/20-export-data.sh) will run the sql scripts in [./src/sql/export](./src/sql/export/) to copy data to the output folder. 
