use library

select title, title_no
from title

select title
from title
where title_no = 10

select title_no, author
from title
where author in ('Charles Dickens' , 'Jane Austen')

select title_no, title
from title
where title like '%adventure%'

SELECT TOP 10 member_no, SUM(fine_paid) AS FinePaid
FROM loanhist
WHERE fine_paid IS NOT NULL
GROUP BY member_no
ORDER BY FinePaid DESC;

select distinct city, state
from adult

select title
from title
order by title

SELECT member_no,
       isbn,
       fine_assessed,
       2 * fine_assessed AS "double fine"
FROM loanhist
WHERE fine_assessed IS NOT NULL and fine_assessed != 0
ORDER BY fine_assessed;

SELECT CONCAT(LOWER(firstname), LOWER(middleinitial), LOWER(SUBSTRING(lastname, 0, 3))) AS email_name
FROM member
WHERE lastname = 'Anderson';

SELECT 'The title is: ' + title + ', title number'+ ' ' + LTRIM(str(title_no)),
       'The title is: ' + title + ', title number'+ ' ' + cast(title_no as varchar)
FROM title;







