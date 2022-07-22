/*markdown
CHAPTER 15
*/

/*markdown
1. 書籍の一覧を表示しなさい。結果表は「書籍名」、「出版社名」を見出しとして表示しなさい。ただし、出版社名が特
定できない書籍も一覧表示しなさい。
*/

SELECT
    b.book_name AS "書籍名"
    ,p.publisher_name AS "出版社名"
FROM 
    book AS b
    LEFT JOIN publisher AS p 
        ON b.publisher_id = p.publisher_id        
;

/*markdown
2. 1990 年代生まれの会員の会員一覧を表示しなさい。結果表は「姓」、「名」、「職種名」を見出しとして表示しなさ
い。ただし、職種名が「技術」の値は職種名を NULL で表示する。
*/

SELECT
    m.last_name AS "姓"
    ,m.first_name AS "名"
    ,CASE jt.job_type_name
        WHEN '技術' THEN NULL
        ELSE jt.job_type_name
    END AS "職種名"
FROM member AS m
    LEFT JOIN job_type AS jt 
        ON m.job_type_id = jt.job_type_id
WHERE
    EXTRACT(YEAR FROM m.birthday) BETWEEN 1990 AND 1999
;

SELECT
   m.member_id AS "会員 ID"
   ,COUNT(member_card_id) AS 所持枚数
FROM 
    member_card AS mc
    LEFT JOIN member AS m 
        ON mc.member_id = m.member_id
GROUP BY 
    "会員 ID"
HAVING
   -- Không thể thực hiện dùng Alias tại đây, 
   -- do mệnh đề này được thực hiện trước mệnh đề SELECT
   COUNT(member_card_id) >= 3
ORDER BY 
     "会員 ID"  ASC
    ,所持枚数 DESC
;

/*markdown
4. 2010 年に発売されたページ数が 200 以上の書籍の一覧を価格の安い順に表示しなさい。結果表は「書籍名」、
「価格」、「カテゴリ名」を見出しとして表示しなさい。カテゴリが設定されていない書籍については、カテゴリ名を「な
し」と表示すること。
*/

SELECT
    b.book_name AS "書籍名"
    ,b.price AS "価格"
    ,COALESCE(c.category_name,'なし') AS "カテゴリ名" 
FROM
    book AS b
    LEFT JOIN category AS c
        ON b.category_id = c.category_id
WHERE
    b.page_count >= 200
    AND
    EXTRACT(YEAR FROM on_sale_date) = '2010'
ORDER BY 
    b.price ASC
;