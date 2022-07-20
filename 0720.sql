--CHAPTER 15 

--LEFT OUTER JOIN
SELECT
    *
FROM
    -- book LEFT OUTER JOIN category
    book AS b
    LEFT OUTER JOIN category AS c
        ON b.category_id = c.category_id 
WHERE 
    c.category_name = '文字'
; 

--LEFT OUTER JOIN
SELECT
    *
FROM
    -- category LEFT OUTER JOIN book
    category AS c
    LEFT OUTER JOIN book AS b
        ON c.category_id = b.category_id 
WHERE 
    c.category_name = '文字'
; 

--RIGHT OUTER JOIN
SELECT
    *
FROM
    -- book RIGHT OUTER JOIN category
    book AS b
    RIGHT OUTER JOIN category AS c
        ON b.category_id = c.category_id 
; 