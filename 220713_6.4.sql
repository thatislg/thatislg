/*
1. 価格が 1680 円以上の書籍名とその価格の一覧を、結果表の見出しが
「書籍名」、「価格」となるように表示しなさ
い。
*/
SELECT
    book_name AS "書籍名",
    price AS "価格"
FROM 
    book
WHERE 
    price >= 1680 
;

/*
2. カテゴリテーブルのカテゴリ ID が C003 のカテゴリ名を結果表の見出しが
「カテゴリ名」となるように表示しなさい。
*/
SELECT
    category_name AS "カテゴリ名"
FROM 
    category
WHERE 
    category_id = 'C003' 
;

/*
3. ページ数が 200 ページ未満の書籍の書籍 ID と書籍名とページ数の一覧を、
結果表の見出しが「書籍 ID」、「書籍名」、「ページ数」となるように表示しなさい。
*/
SELECT
    book_id AS "書籍 ID",
    book_name AS "書籍名",
    page_count AS "ページ数"
FROM 
    book
WHERE 
    page_count < 200 
;

/*
4.注文日時が 2011 年 10 月以降の注文番号と注文した会員 ID の一覧を、
結果表の見出しが「注文番号」、「会員ID」となるように表示しなさい。
*/
SELECT
    order_no AS "書籍 ID",
    member_id AS "書籍名"
FROM 
    order_header
WHERE 
    order_datetime >= '2011-10-01 00:00:00' 
;

/*
5.正会員の会員 ID と姓、名の一覧を、結果表の見出しが
「会員 ID」、「名字」、「名前」となるように表示しなさい。
*/
SELECT
    member_id AS "会員 ID",
    last_name AS "名字",
    first_name AS "名前"
FROM 
    member 
WHERE 
    member_type = '1'
;

/*
6.ISBN 番号が設定されていない書籍の書籍名を結果表の見出しが「書籍名」となるように表示しなさい。
*/
SELECT
    book_name AS "書籍名"
FROM 
    book
WHERE 
    isbn13 IS NULL
;

/*
7.パスワードが 6 文字未満の会員の会員 ID、氏名、登録年の一覧を、結果表の見出しが
「会員 ID」、「氏名」、「登録年」となるように表示しなさい。登録年は「2010 年」
のように表示すること。
*/
SELECT
    member_id AS "会員 ID",
    first_name || last_name AS "名字",
    regist_datetime AS "登録年"
FROM 
    member 
WHERE 
    EXTRACT(YEAR FROM regist_datetime) = '2010'
AND 
    LENGTH(password) < 6
;

/**/