-- CHAPTER 13
/*
1 書籍の書籍 ID、書籍名の一覧を、結果表の見出しが「書籍 ID」、「書籍名」となるように発売日の昇順で表示しな
さい。
*/
SELECT
    book_id AS "書籍 ID"
    ,book_name AS "書籍 ID"
FROM
    book
ORDER BY
    on_sale_date
ASC 
;
-------

/*
2 2011 年の注文を会員 ID の昇順、会員 ID が同一の注文に対しては注文日時の降順で全ての項目を表示しなさ
い。
*/
SELECT
    member_id
FROM
    order_header
WHERE 
    EXTRACT(YEAR FROM order_datetime) = '2011'
ORDER BY 
    member_id ASC
    ,order_datetime DESC
;
-------

/*
3 会員情報を非会員、正会員の順に表示しなさい。
また、非会員、正会員毎に血液型の降順で、
会員区分と血液型が同一会員に対しては、会員 ID の昇順で表示しなさい。
結果表は「会員 ID]、「氏名」、「血液型」、「会員区分」を
見出しとして表示しなさい。
*/
SELECT
    member_id AS "会員 ID"
    ,first_name || last_name AS "氏名"
    ,blood_type AS "血液型"
    ,member_type AS "会員区分"
FROM
    member
ORDER BY 
    blood_type DESC
;
---------------

/*
4 カテゴリ毎の書籍の平均価格が高い順に書籍情報を表示しなさい。結果表は「カテゴリ ID」、「平均価格」を見出し
として表示しなさい。
*/
SELECT
    category_id AS "カテゴリ ID"
    ,ROUND(AVG(price),0) AS "平均価格"
FROM
    book
GROUP BY 
    category_id
ORDER BY 
    AVG(price) ASC
;
---------------------


/*
5 クレジットカードを複数所持する会員の会員 ID と所持枚数の一覧を、
結果表の見出しが「会員 ID」、「所持枚数」となるように所持枚数が多い順に表示しなさい。
所持枚数が同一の会員がいる場合は、会員 ID 順で並べなさい。
*/
SELECT
    member_id AS "会員 ID"
    ,COUNT(member_card_id) AS "所持枚数"
FROM
    member_card
GROUP BY 
    member_id
HAVING 
    COUNT(member_card_id) > 1
ORDER BY
    所持枚数 DESC
    ,member_id ASC
;


/*
6 血液型毎の会員の人数の一覧を、結果表の見出しが「血液型」、「人数」となるように人数の多い順で表示しなさい。
ただし、血液型が不明の会員については集計しない。また、人数が 2 以下の血液型は表示しない。
*/
SELECT
    blood_type AS "血液型"
    ,COUNT(member_id) AS "人数"
FROM
    member
WHERE 
    blood_type IS NOT NULL
GROUP BY 
    blood_type
HAVING 
    COUNT(member_id) > 2
ORDER BY
    COUNT(member_id) DESC
;


-------------------------------------
--- CHAPTER 14
/*
1 書籍と出版社を結合した一覧表を表示しなさい。なお、出版社が特定できない書籍は表示しない。
結果表は「書籍ID」、「書籍名」、「出版社 ID」、「出版社名」、「所在地(都道府県)」
を見出しとして表示しなさい。
*/
SELECT
    b.book_id AS "書籍ID",
    b.book_name AS "書籍名",
    p.publisher_id AS "出版社 ID",
    p.publisher_name AS "出版社名",
    p.prefecture AS "所在地(都道府県)"
FROM
    book AS b 
    INNER JOIN publisher AS p 
        ON b.publisher_id = p.publisher_id
--WHERE
    --b.publisher_id IS NOT NULL
;

/*
2 全ての注文に対する注文番号、注文した会員の氏名、生年月日の一覧を、結果表の見出しが「注文番号」、「氏
名」、「生年月日」となるように表示しなさい。表示順は第一ソート項目を会員 ID、第二ソート項目を注文番号としな
さい。
*/
SELECT 
    oh.member_id
    ,oh.order_no AS  "注文番号"
    ,m.last_name || m.first_name AS "氏名"
    ,m.birthday AS "生年月日"
FROM
    order_header AS oh 
    INNER JOIN member AS m 
        ON m.member_id = oh.member_id
ORDER BY
    m.member_id
    ,oh.order_no
;

/*
3 クレジットカード情報付きの会員一覧を表示しなさい。ただし、表示対象の会員は血液型が A 型と B 型とする。結
果表は「会員 ID」、「氏名」、「カード番号」、「有効期限年」、「有効期限月」を見出しとして表示しなさい。また、表示
順は会員 ID の昇順で表示しなさい。会員 ID が同じレコードの中では、カード番号の昇順で表示しなさい。
*/
SELECT 
    m.member_id AS "会員 ID"
    ,m.last_name || m.first_name AS "氏名"
    ,mc.card_number AS  "カード番号"
    ,mc.expire_year AS "有効期限年"
    ,mc.expire_month AS "有効期限月"
FROM
    member_card AS mc 
    INNER JOIN member AS m 
        ON m.member_id = mc.member_id
GROUP BY 
    m.member_id
    ,mc.card_number
    ,mc.expire_year
    ,mc.expire_month
HAVING
    m.blood_type IN ('A', 'B')        
ORDER BY
    m.member_id ASC
    ,mc.card_number ASC
;
-----------------

/*
4 東京都が所在地の出版社が出版する、書籍の一覧情報を表示しなさい。なお、出版社が特定できる書籍のみを
表示する。結果表は「書籍 ID」、「書籍名」を見出しとして表示しなさい。表示順は書籍 ID の昇順で表示しなさい。
*/
SELECT 
    book_id AS "書籍 ID"
    ,book_name AS "書籍名"
FROM
    book AS b
    INNER JOIN publisher AS p
        ON b.publisher_id = p.publisher_id
WHERE 
    prefecture = '東京都'
ORDER BY
    book_id ASC
;


---------------
/*
5 有効期限が 2012 年のクレジットカードで決済された注文の一覧を表示しなさい。結果表は「注文番号」、「会員
ID」、「カード番号」を見出しとして表示しなさい。
*/
SELECT
    oh.order_no AS "注文番号"
    ,oh.member_id AS "会員ID"
    ,mc.member_card_id AS "カード番号"
FROM
    order_header AS oh
    INNER JOIN member_card AS mc 
        ON oh.member_card_id  = mc.member_card_id
        AND oh.member_id = mc.member_id
WHERE   
    mc.expire_year = '12'
;


--------------
/*
6 出版社の所在地毎に書籍の出版数(書籍の数)の一覧を、結果表の見出しが「所在地」、「出版数」となるように表
示しなさい。なお、出版数が 1 以上の所在地のみを表示すればよい。列の見出しはそれぞれ「所在地」、「出版数」
としなさい。
*/
SELECT
    prefecture AS "所在地"
    ,COUNT(*) AS "出版数"
FROM
    publisher as p
    INNER JOIN book AS b
        ON p.publisher_id = b.publisher_id
GROUP BY 
    p.prefecture
HAVING
    COUNT(*) >= 1
;
