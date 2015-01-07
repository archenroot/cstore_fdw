CREATE TABLE text_data AS
SELECT string_agg(random()::text, '')
FROM generate_series(1, 1000) a, generate_series(1, 10) b
GROUP BY b;

CREATE FOREIGN TABLE cstore_text_data(A text) SERVER cstore_server;

INSERT INTO cstore_text_data SELECT * FROM text_data;

SELECT char_length(md5(a)) FROM cstore_text_data;

DROP TABLE text_data;

SELECT char_length(md5(a)) FROM cstore_text_data;

DROP FOREIGN TABLE cstore_text_data;
