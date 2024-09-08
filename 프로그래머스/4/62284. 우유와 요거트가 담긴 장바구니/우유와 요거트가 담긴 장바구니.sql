-- 코드를 입력하세요
SELECT distinct(CART_ID)
  FROM CART_PRODUCTS
 WHERE name = 'Milk'
   and cart_id in
       (select cart_id
       from cart_products
       where name = 'Yogurt')
 ORDER BY CART_ID;