/*markdown
CHAPTER16
*/

-- 1.
-- Ví dụ kết hợp nhiều lần LEFT JOIN 
-- Bảng b LEFT p -> Bảng bp' LEFT c -> Bảng bp'c'
SELECT
    b.book_name
    ,p.publisher_name
    ,c.category_name
FROM
    book AS b
    LEFT JOIN publisher AS p 
        ON b.publisher_id = p.publisher_id
    LEFT JOIN category AS c 
        ON b.category_id = c.category_id
;

-- Bảng b LEFT p -> Bảng bp' LEFT c -> Bảng bp'c'
-- Đảo ngược thứ tự c và p check Cardinality Impact 
SELECT
    b.book_name
    ,p.publisher_name
    ,c.category_name
FROM
    book AS b
    LEFT JOIN category AS c 
        ON b.category_id = c.category_id
    LEFT JOIN publisher AS p 
        ON b.publisher_id = p.publisher_id    
;

