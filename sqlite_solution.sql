Write a SQL query that sums up reading for horror readers by day

SELECT "Number of horror readings per day";

SELECT strftime('%Y %m %d',tracking_time) AS date, COUNT(visit_id) AS no_horror_readings 
FROM (
	SELECT R.visit_id, R.tracking_time 
	FROM reading as R JOIN stories as S 
	ON R.story_id == S.id 
	WHERE S.category_one == 'horror'
     )
GROUP BY strftime('%Y %m %d',tracking_time) 
ORDER BY strftime('%Y %m %d',tracking_time) ASC
;

SELECT "==================================";


How much did they read?

SELECT "Number of horror readings per reader";

SELECT reader,rid 
FROM (SELECT visitor_id as reader,count(id) as rid,strftime('%Y %m %d',tracking_time) as date 
FROM (
	SELECT visitor_id,R.id as id,visit_id,tracking_time 
	FROM reading as R JOIN stories as S 
	ON R.story_id == S.id 
	WHERE category_one == 'horror'
     ) 
GROUP BY visitor_id
     ) 
GROUP BY date
;

SELECT "==================================";


How many readers are there?

SELECT "Number of unique readers of horror stories";

SELECT count(DISTINCT visitor_id) 
FROM reading as R JOIN stories as S 
ON R.story_id == S.id 
WHERE category_one=='horror';

SELECT "==================================";


What country are the readers from?

SELECT "The readers of horror stories are from";
SELECT DISTINCT reader, country
FROM visits as V JOIN (
	SELECT R.visit_id as visit_id, R.visitor_id as Reader 
	FROM reading as R JOIN stories as S 
	ON R.story_id == S.id WHERE category_one=='horror' 
	GROUP BY R.visit_id
) 
ON visit_id==V.visitor_id;

