-- 코드를 입력하세요
SELECT FOOD_TYPE,REST_ID,REST_NAME,favorites
  from REST_INFO
 where (FOOD_TYPE,favorites) in
 (select FOOD_TYPE,max(favorites)
 from rest_info
  group by FOOD_TYPE
 )
 order by FOOD_TYPE desc;