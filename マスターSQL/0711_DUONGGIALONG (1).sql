/*
5.4.1 書籍の書籍 ID、価格、端数丸め消費税額、端数切り捨て消費税額を結果表の見出しが「
書籍 ID」、「価格」、「端数丸め消費税額」、「端数切り捨て消費税額」となるように表示しなさい。
消費税額は価格の5%とする。※切り捨ての関数は TRUNC
*/
SELECT
  book_id AS "書籍ID"
  ,price AS "価格"
  ,price  * 5 / 100 AS "端数丸め消費税額"
  ,TRUNC(price + price  * 5 / 100 - discount,0) AS "端数切り捨て消費税額"
FROM
  book
;
-------------------------------------------------------------------------------
/*
5.4.2 会員の会員 ID と氏名(姓と名と「さん」を連結したもの)の一覧を表示しなさい。
また結果表の見出しはそれぞれ「会員 ID」、「氏名」となるように表示しなさい。
*/
SELECT
  member_id AS "会員ID"
  ,first_name|| last_name || 'さん' AS "氏名"
FROM
  member
;

/*
5.4.3 注文番号と注文時刻(「時:分」形式)の一覧を、結果表の見出し「注文番号」、「注文時刻」
となるように表示しなさい。時刻は 24 時間表記で時、分ともに 2 桁固定で表示すること。
*/
SELECT
  order_no AS "注文番号"
  ,TO_CHAR(order_datetime, 'HH24時MI分') AS "注文時刻"
FROM
  order_header
;

/*
5.4.4 会員のクレジットカード番号の一覧を、結果表の見出しが「カード会社 ID」、「カード番号」
となるように表示しなさい。その際、カード番号の末尾 4 ケタは「****」として隠すこと。
*/
SELECT
  card_company_id AS "カード会社 ID"
  , SUBSTRING(card_number, 1,15) || '****' AS "カード番号"
FROM
  member_card
;

/*
5.4.5 会員の会員 ID と氏名と末っ子の一覧を表示しなさい。また、子供がいない際には「なし」
と表示すること。結果表の見出しは「会員 ID」、「氏名」、「末っ子の名前」としなさい。
*/
SELECT
  member_id AS "会員ID"
  ,first_name || last_name  AS "氏名"
  ,coalesce(child_name3, NULL, 'なし') AS "末っ子の名前"
FROM
  member
;
