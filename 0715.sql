-- CHAPTER 7
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
-- CHAPTER 8
/*
8.4.1 価格が 2000 円以上でページ数が 320 未満の書籍 ID、書籍名、ISBN の一覧を、
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
8.4.2 出版社名もしくは所在地に「京」が含まれる出版社を検索しなさい。
*/
SELECT
    publisher_name
FROM
    publisher
WHERE
    publisher_name LIKE '%京%'
OR 
    prefecture LIKE '%京%'
;

-------------

/*
8.4.3 書籍の書籍名と価格の一覧を、結果表の見出しが「書籍名」、「価格」
となるように表示しなさい。ただし、ページ数が 
200 未満か 300 以上のデータのみを表示しなさい。
*/
SELECT
    book_name AS "書籍名",   
    price AS "価格"
FROM
    book
WHERE
    page_count < 200
OR
    page_count >= 300
;
-------------

/*
8.4.4  2007 年度(2007 年 4 月 1 日~2008 年 3 月 31 日)に発売された価格が
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

/*
8.4.5 東京都もしくは山梨県在住の正会員の会員 ID と姓、名の一覧を、
結果表の見出しが「会員 ID」、「姓」、「名」となるように表示しなさい。
*/
SELECT
    member_id AS "会員 ID",
    first_name AS "名",
    last_name AS "姓"
FROM
    member
WHERE
    (address LIKE '東京都%' OR address LIKE '山梨県%')
AND 
    member_type = '1'
;
-------------
/*
8.4.6 血液型が A 型もしくは AB 型の正会員の一覧を表示しなさい。
結果表は「生年月日」を見出しとして表示しなさい。
*/
SELECT
    birthday AS "生年月日"
FROM
    member
WHERE
    (blood_type = 'A' OR blood_type = 'AB')
AND 
    member_type = '1'
;
-------------
/*
8.4.7 カード番号に 1111 または 2222 を含む会員クレジットカードを表示しなさい。
結果表は「会員 ID」、「カード番号」を見出しとして表示しなさい。
ただし、有効期限が 2012 年以前のものは除外して表示しなさい。
*/
SELECT
    member_id AS "会員 ID",
    card_number AS "カード番号"
FROM
    member_card
WHERE 
    (card_number LIKE '%1111%' OR card_number LIKE '%2222%')
AND
    CAST(expire_year AS INTEGER) > 2012
;
-------------
/*
8.4.7 血液型が A 型または AB 型の会員の会員 ID、血液型、登録日時の一覧を、
結果表の見出しが「会員 ID」、「血液型」、「登録日時」となるように表示しなさい。
ただし、2011 年または 2012 年に登録された会員のみを表示することとする。
*/
SELECT
    member_id AS "会員 ID",
    blood_type AS "血液型",
    regist_datetime AS "登録日時"
FROM
    member
WHERE
    (
        blood_type = 'A'
        OR
        blood_type = 'AB'
    )
AND 
    (
        EXTRACT(YEAR FROM regist_datetime) = 2011
        OR
        EXTRACT(YEAR FROM regist_datetime) = 2012
    )
;

-------------
/*
8.4.8 値引き金額が 100 円以下でページ数が 300 以上の書籍と、出版社 ID が 
P0002 で価格が 800 円以上の書籍の一覧を、結果表の見出しが
「書籍 ID」、「書籍名」、「価格」となるように表示しなさい。ただし、カテゴリ ID が
NULL のレコードは表示しないものとする。    
*/
SELECT
    book_id AS "書籍 ID",   
    book_name AS "書籍名",
    price AS "価格"
FROM
    book
WHERE
    category_id IS NOT NULL
AND
    (
        discount <= 100
        AND 
        page_count >= 300
    )
AND
    (
        publishser_id LIKE 'P0002'
        AND
        price >= 800 
    )
;

-------------

-- CHAPTER 9
/*
9.4.1 血液型が A 型もしくは AB 型の正会員の一覧を表示しなさい。結果表は「生年月日」
を見出しとして表示しなさい。※IN を利用して記述すること。
*/
SELECT
    birthday AS "生年月日"
FROM
    member
WHERE
    blood_type IN ('A' ,'AB') 
AND 
    member_type = '1'
;
-------------
/*
9.4.2 価格が 3000 円台の書籍の一覧を表示しなさい。結果表は「書籍 ID」、「書籍名」、
「価格」を見出しとして表示しなさい。
*/
SELECT
    book_id AS "書籍 ID",   
    book_name AS "書籍名",
    price AS "価格"
FROM
    book
WHERE
