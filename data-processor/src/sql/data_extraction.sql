-- \copy (SELECT * FROM journal_article_table1) to 'C:\Users\aishw\obms\data_extraction\Output\journal_article_table1.csv' with csv header;

-- \copy (SELECT * FROM journal_article_count) to 'C:\Users\aishw\obms\data_extraction\Output\journal_article_count.csv' with csv header;

-- \copy (SELECT * FROM journal_article_count_all_meshterms) to 'C:\Users\aishw\obms\data_extraction\Output\journal_article_count_all_meshterms.csv' with csv header;

\COPY (SELECT * FROM journal_article_count_meshID) to './output/journal_article_count_meshid.csv' with csv header;
