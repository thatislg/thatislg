/*markdown
-- CHAPTER 11 
*/

/*markdown
1 会員区分毎の会員の人数を結果表の見出しが「会員区分」、「人数」となるように表示しなさい。
*/

SELECT
    member_type AS "会員区分"
    ,count(*) AS "人数"
FROM
    member
GROUP BY 
    member_type
;

/*markdown
<p style="color:yellow">-----------------------------------------------------<p/>
2 ページ数が 250 以上の書籍を対象にカテゴリ ID 毎の最大価格と平均価格の一覧を、結果表の見出しが「カテゴ
リ ID」、「最大価格」、「平均価格」となるように表示しなさい。
*/

SELECT
    category_id AS "カテゴリ ID"
    ,MAX(price) AS "最大価格"
    ,TRUNC(AVG(price)) AS "平均価格"
FROM
    book
WHERE 
    page_count >= 250
GROUP BY 
    category_id
ORDER BY
    category_id ASC
;

/*markdown
<p style="color:yellow">-----------------------------------------------------<p/>
3 会員が 2011 年 10 月以降に注文した回数の一覧を、結果表の見出しが「会員 ID」、「注文した回数」となるように
会員毎に表示しなさい。
*/

SELECT
    member_id AS "会員 ID"
    ,COUNT(*) AS "注文した回数"
FROM
    order_header
WHERE 
    order_datetime >= '2011-10-11 00:00:00'
GROUP BY 
    member_id
ORDER BY 
    member_id ASC
;

/*markdown
<p style="color:yellow">-----------------------------------------------------<p/>
4 会員区分と血液型毎の会員数の一覧を、結果表の見出しが「会員区分」、「血液型」、「会員数」となるように表示し
なさい。
*/

SELECT 
    member_type AS "会員区分"
    ,blood_type AS "血液型"
    ,COUNT(*) AS "会員数"
FROM
    member 
GROUP BY
    member_type
    ,blood_type
;

/*markdown
<p style="color:yellow">-----------------------------------------------------<p/>
5 カテゴリ ID、出版社 ID 毎に書籍の平均価格と平均値引き金額の一覧を、結果表の見出しが「カテゴリ ID」、「出版
社 ID」、「平均価格」、「平均値引き金額」となるように表示しなさい。ただし、価格が 2000 円未満の書籍を対象と
する。
*/

SELECT
    category_id AS "カテゴリ ID"
    ,publisher_id AS "出版社 ID"
    ,TRUNC(AVG(price)) AS "平均価格"
    ,TRUNC(AVG(discount)) AS "平均値引き金額"
FROM
    book
WHERE   
    price < 2000
GROUP BY
    category_id
    ,publisher_id
;

-- CHAPTER 12
-- 12.4.1 
/*
正会員が複数いる血液型を人数も含めて表示しなさい。
また、列の見出しはそれぞれ「血液型」、「人数」としなさい。
*/
SELECT
    blood_type AS "血液型",
    COUNT(*) AS "人数"  
FROM
    member
WHERE 
    member_type = '1'
GROUP BY 
    blood_type
HAVING 
    COUNT(*) > 1
;

-- 12.4.2 
/*
カテゴリ ID、出版社 ID 毎に平均値引き額が 200 円より高いものの一覧を表示しなさい。
結果表は「カテゴリ ID」、「出版社 ID」、「平均値引き額」を見出しとして表示しなさい。
*/
SELECT
    category_id AS "カテゴリ ID",
    publisher_id AS "出版社 ID",
    ROUND(AVG(discount),1) AS "平均値引き額"
FROM
    book
GROUP BY 
    category_id, publisher_id
HAVING  
    AVG(discount) > 200
; 

-- 12.4.3
/*
誕生月ごとの会員の人数の一覧を、結果表の見出しが「誕生月」、「人数」
となるように表示しなさい。ただし、人数が 2 人以上の月のみを表示すること。
なお、1 桁の月は 0 を付けずに 1 桁のままで表示する。
*/
SELECT
    EXTRACT(MONTH FROM birthday) AS "誕生月",
    COUNT(
        EXTRACT(MONTH FROM birthday)
    ) AS "人数"
FROM
    member
GROUP BY 
    EXTRACT(MONTH FROM birthday)
HAVING 
     COUNT(
        EXTRACT(MONTH FROM birthday)
    ) >= 2
ORDER BY 
    EXTRACT(MONTH FROM birthday)
;

--12.4.4
/*
同一有効期限年のクレジットカードを複数持っている会員の会員 ID と有効期限年の一覧を、結果表の見出しが
「会員 ID」、「有効期限年」となるように表示しなさい。
*/
SELECT
    member_id AS "会員 ID",
    expire_year AS "有効期限年"
FROM
    member_card
GROUP BY
    member_id, expire_year 
HAVING
    COUNT(member_card_id) >= 2
;