# OBMS 

## Steps to run:
- Change folder to data_processor
- Run Command
```
./run.sh
```

## Flow of database setup and data extraction:

### Setup
- /scripts/10-run-sql-setup which runs sql scripts in src/sql/setup. These scripts will create below views which are used to form the pivot table which has 
article count for journal and mesh term. 
#### journal_article_table1 view
- journal_article_table1 is formed by using medline_master table. We took journal_title, journal_nlmuniqueid(journal id), m.pmid(article_id) from medline_master table.
- In journal_article_table1 we are taking data journal data from publication year 2013 - 2022

```
You can change publication year in journal_article_table1 view as below:
m.pub_year::integer >= 2013 AND m.pub_year::integer <= 2022
```
#### journal_article_count_all_meshterms
- This table contains journal and count of articles for all its meshterms. 
#### journal_article_meshID
- Here we have excluded some of the mesh terms which are not related to the biomedical data. In the table we have mesh terms related to geography and 
some other mesh terms which are not related to biomedical data. 
- This View is created using medline_mesh_heading_msh table which contains fields such as:  pmid : artcile id, heading_ctr : heading of the article ui : mesh term id, descriptor_type : type of mesh term
descriptor_name : name of the mesh term. 
#### journal_article_count_meshid 
- This is pivot table which contains article count for journal and mesh terms in it. We have grouped the data of journal and and mesh term and calculated 
count of articles in that journal. 

### Data Extraction
- /script/20-export-data.sh will sql scripts to copy data to the output folder. 



