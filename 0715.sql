/*
7.1
*/
SELECT
    address AS "住所"
FROM
    member
WHERE
    post_code
LIKE
    '18%'
;
-------------

/*
7.2
*/
SELECT
    book_name AS "書籍名",
    page_count AS "ページ数",
    price AS "価格"
FROM
    book
WHERE
    book_name
LIKE
    '%版'
;

-------------

/*
7.3 名が 2 文字の「子」で終わる会員の姓、名の一覧を、結果表の見出しが
「姓」、「名」となるように表示しなさい。
*/
SELECT
    first_name AS "名",
    last_name AS "姓"
FROM
    member
WHERE
    first_name
LIKE
    '%子子'
;
-------------

-------------

/*
8.1 価格が 2000 円以上でページ数が 320 未満の書籍 ID、書籍名、ISBN の一覧を、
結果表の見出しが「書籍 ID」、「書籍名」、「ISBN」となるように表示しなさい。
*/
SELECT
    book_id AS "書籍 ID",
    book_name AS "書籍名",   
    isbn13 AS "ISBN"
FROM
    book
WHERE
    page_count < 320
AND
    price >= 2000
;
-------------

/*
8.4  2007 年度(2007 年 4 月 1 日~2008 年 3 月 31 日)に発売された価格が
 800 円以上の書籍の書籍名と ISBNの一覧を、結果表の見出しが
 「書籍名」、「ISBN」となるように表示しなさい。
*/
SELECT
    book_id AS "書籍 ID",   
    isbn13 AS "ISBN"
FROM
    book
WHERE
    -- ((on_sale_date >= '2007-4-1') AND (on_sale_date <= '2008-3-31'))
    (on_sale_date BETWEEN '2007-4-1' AND '2008-3-31')
AND
    price >= 800
;
-------------
