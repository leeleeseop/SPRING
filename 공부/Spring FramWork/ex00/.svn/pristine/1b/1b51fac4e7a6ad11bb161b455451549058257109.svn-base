INSERT INTO goods(goods_no, cate_code1, cate_code2, goods_name,
			company, product_date, image_name, detail_image_name, content)
		VALUES (22, 2, 6, '럭셔리 남성 정장 구두', '웹짱닷컴', '2024-09-02',
            'ㄴㄹㄴㅇㄹㅇ', null, 'dsfs');
rollback;

INSERT INTO goods_image(image_no, goods_no, image_name) 
select goods_image_seq.nextval, goods_no, image_name
    from (
        select 26 goods_no, '/upload/goods/shoes016.png' image_name from dual
        union all
        select 26 goods_no, '/upload/goods/shoes036.png' image_name from dual
    );


update price set sale_startDate = sysdate, sale_endDate = '9999-12-31'
where sale_startDate is null;

commit;


select cate_code1, cate_code2, goods_no, goods_name, price, discount, discount_rate, hit, saved_rate, image_name from 
( 
select rownum rnum, cate_code1, cate_code2, goods_no, goods_name, price, discount, discount_rate, hit, saved_rate, 
image_name from ( 
select g.cate_code1, cate_code2, g.goods_no, g.goods_name, p.price, p.discount, p.discount_rate, g.hit, 
saved_rate, g.image_name from goods g, price p 
where 
-- 제품 검색 조건
(
    (cate_code1 = 2 and cate_code2 = 6)
    and (goods_name like '%구두%')
    and (15000 <= price and 400000 >=  price)
)
and
( sale_startDate <= sysdate and trunc(sysdate) <= sale_endDate )
and ( g.goods_no = p.goods_no ) order by goods_no desc ) ) 

where rnum between 1 and 8 ;

select g.goods_no, g.goods_name, p.price, p.discount, p.discount_rate, g.hit, 
saved_rate, g.image_name from goods g, price p where ( p.sale_startDate <= sysdate and 
trunc(sysdate) <= p.sale_endDate ) and ( g.goods_no = p.goods_no ) order by goods_no desc;

select goods_no,
    to_char(sysdate, 'yyyy-mm-dd') todat,
    to_char(sale_startDate, 'yyyy-mm-dd') sale_startDate,
    to_char(sale_endDate, 'yyyy-mm-dd') sale_endDate
    from price;
    
select trunc(123.123, -1) from dual;

select 
    price_no, price, discount, discount_rate,
    DECODE (discount, null, discount_rate,
        0, discount_rate, (price - discount)) salePrice
from price;

select *
from(
    select 
        price_no, price, discount, discount_rate,
        case
            when discount is not null and discount != 0
            then price - discount
            when discount_rate is not null and discount_rate != 0
            then trunc(price - (price * discount_rate / 100), -1)
            else price
        end salePrice
    from price
)
where
    salePrice >= 50000 and salePrice <= 200000;
    
    
    
		select
			goods_no, goods_name,
			price, discount, discount_rate, hit, saved_rate,
			image_name, salePrice
		from (
			select
				rownum rnum, goods_no, goods_name,
				price, discount, discount_rate, hit, saved_rate,
				image_name, salePrice
			from (
				select
					 g.goods_no, g.goods_name,
					 p.price, p.discount, p.discount_rate, g.hit, saved_rate,
					 g.image_name, sp.salePrice
				from
					goods g, price p,
					(
						 select 
                            goods_no,
					        case
					            when discount is not null and discount != 0
					            then price - discount
					            when discount_rate is not null and discount_rate != 0
					            then trunc(price - (price * discount_rate / 100), -1)
					            else price
					        end salePrice
					    from price
                        where 
                            -- 현재 판매
							sale_startDate <= sysdate
							and trunc(sysdate) <= sale_endDate
				) sp
				where
					(
						(
							sale_startDate <= sysdate
							and trunc(sysdate) <= sale_endDate
						)
                        and
                        (
                            -- 검색 조건에 따른 쿼리
                            salePrice >= 20000 and salePrice <= 100000
                        )
					)
					and
					(
						g.goods_no = p.goods_no
                        and g.goods_no = sp.goods_no
					)
					
				order by goods_no desc
			)
		)
		where rnum between 1 and 10
