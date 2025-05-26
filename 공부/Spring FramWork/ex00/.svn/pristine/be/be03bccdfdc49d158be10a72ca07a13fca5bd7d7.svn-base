-- 1. 객체 제거(FK -> PK)
    -- 1-8. 상품 가격
    DROP TABLE price CASCADE CONSTRAINTS;
    -- 1-7. 상품옵셥
    DROP TABLE goods_option CASCADE CONSTRAINTS;
    -- 1-6. 상품사이즈&색상
    DROP TABLE goods_sizeColor CASCADE CONSTRAINTS;
    -- 1-5. 상품이미지
    DROP TABLE goods_image CASCADE CONSTRAINTS;
    -- 1-4. 상품
    DROP TABLE goods CASCADE CONSTRAINTS;
    -- 1-3. 색상(기본)
    DROP TABLE basic_color CASCADE CONSTRAINTS;
    -- 1-2. 사이즈(기본)
    DROP TABLE basic_size CASCADE CONSTRAINTS;
    -- 1-1. 카테고리
    DROP TABLE category CASCADE CONSTRAINTS;

    DROP SEQUENCE price_seq;
    DROP SEQUENCE goods_option_seq;
    DROP SEQUENCE goods_sizeColor_seq;
    DROP SEQUENCE goods_image_seq;
    DROP SEQUENCE goods_seq;
    DROP SEQUENCE color_seq;
    DROP SEQUENCE size_seq;

-- 2. 객체 생성 (PK -> FK : 판매가 되면 지우면 안된다.)
    -- << 테이블 >>
    -- 2-1. 카테고리
    CREATE TABLE category(
        cate_code1 NUMBER(3),
        cate_code2 NUMBER(3) DEFAULT 0,
        cate_name VARCHAR2(30) NOT NULL,
        CONSTRAINT category_pk PRIMARY KEY (cate_code1, cate_code2)
    );
    -- 2-2. 사이즈(기본)
    CREATE TABLE basic_size(
        size_no NUMBER PRIMARY KEY,
        cate_code1 NUMBER(3) NOT NULL,
        cate_code2 NUMBER(3) NOT NULL,
       size_name VARCHAR2(30) NOT NULL,
        CONSTRAINT basic_size_cate_fk FOREIGN KEY(cate_code1,cate_code2)
        REFERENCES category(cate_code1,cate_code2)

    );
    -- 2-3. 색상(기본)
     CREATE TABLE basic_color(
        color_no NUMBER PRIMARY KEY ,
        cate_code1 NUMBER(3) NOT NULL,
        cate_code2 NUMBER(3) NOT NULL,
        color_name VARCHAR2(30) NOT NULL,
        CONSTRAINT basic_color_cate_fk FOREIGN KEY(cate_code1,cate_code2)
        REFERENCES category(cate_code1,cate_code2)

    );
   -- 2-4. 상품
     CREATE TABLE goods(
        goods_no NUMBER PRIMARY KEY,
        cate_code1 NUMBER(3) NOT NULL,
        cate_code2 NUMBER(3) NOT NULL,
        goods_name VARCHAR2(300) NOT NULL,
        company VARCHAR2(60) NOT NULL,
        product_Date DATE NOT NULL,
        image_name VARCHAR2(200) NOT NULL,
        detail_image_name VARCHAR2(200),
        content VARCHAR2(2000),
        hit NUMBER DEFAULT 0,
        CONSTRAINT goods_cate_fk FOREIGN KEY(cate_code1,cate_code2)
        REFERENCES category(cate_code1,cate_code2)
    );
   -- 2-5. 상품이미지
    CREATE TABLE goods_image(
        image_no NUMBER PRIMARY KEY,
        goods_no NUMBER REFERENCES goods(goods_no) ON DELETE CASCADE NOT NULL,
        image_name VARCHAR2(200) NOT NULL
    );
    -- 2-6. 상품사이즈&색상
    CREATE TABLE goods_sizeColor(
        goods_sizeColor_no NUMBER PRIMARY KEY,
        goods_no NUMBER REFERENCES goods(goods_no) ON DELETE CASCADE NOT NULL,
        size_no NUMBER REFERENCES basic_size(size_no) NOT NULL,
        color_no NUMBER REFERENCES basic_color(color_no)
    );
   -- 2-7. 상품옵셥
    CREATE TABLE goods_option(
        goods_option_no NUMBER PRIMARY KEY,
        goods_no NUMBER REFERENCES goods(goods_no) ON DELETE CASCADE NOT NULL,
        option_name VARCHAR2(300) NOT NULL
    );
    -- 2-8. 상품 가격
    CREATE TABLE price(
        price_no NUMBER PRIMARY KEY,
        goods_no NUMBER REFERENCES goods(goods_no) ON DELETE CASCADE NOT NULL,
        price NUMBER(10) NOT NULL,
        discount NUMBER(10) DEFAULT 0,
        discount_rate NUMBER(3) DEFAULT 0,
        delivery_charge NUMBER(5) DEFAULT 0,
        saved_rate NUMBER(3) DEFAULT 0,
        sale_price NUMBER(10) NOT NULL,
        sale_startDate DATE DEFAULT sysdate,
        sale_endDate DATE DEFAULT '9999-12-31'
    );

    -- << 시퀀스 >>
    CREATE SEQUENCE price_seq;
    CREATE SEQUENCE goods_option_seq;
    CREATE SEQUENCE goods_sizeColor_seq;
    CREATE SEQUENCE goods_image_seq;
    CREATE SEQUENCE goods_seq;
    CREATE SEQUENCE color_seq;
    CREATE SEQUENCE size_seq;
    -- category의 시퀀스는 데이터가 얼마 안되고 작업이 많이 이루어지지 않는다. 그래서 max()를 사용해서 등록

-- 3. 샘플 데이터
    -- 3-1. 카테고리
    -- 대분류 카테고리
    INSERT INTO category(cate_code1, cate_name)
    VALUES((select NVL(max(cate_code1),0) + 1 from category), '의류');
    INSERT INTO category(cate_code1, cate_name)
    VALUES((select NVL(max(cate_code1),0) + 1 from category), '신발');
    select NVL(max(cate_code1),0) + 1 from category;
    INSERT INTO category(cate_code1, cate_name)
    VALUES((select NVL(max(cate_code1),0) + 1 from category), '팻');
    select NVL(max(cate_code1),0) + 1 from category;
   
    select * from category where cate_code1 = 1;
    INSERT INTO category(cate_code1, cate_code2, cate_name)
    VALUES(1, (select NVL(max(cate_code2),0) + 1 from category), '남성복상의');
    INSERT INTO category(cate_code1, cate_code2, cate_name)
    VALUES(1, (select NVL(max(cate_code2),0) + 1 from category), '남성복하의');
    INSERT INTO category(cate_code1, cate_code2, cate_name)
    VALUES(1, (select NVL(max(cate_code2),0) + 1 from category), '여성복상의');
    INSERT INTO category(cate_code1, cate_code2, cate_name)
    VALUES(1, (select NVL(max(cate_code2),0) + 1 from category), '여성복하의');
    
    INSERT INTO category(cate_code1, cate_code2, cate_name)
    VALUES(2, (select NVL(max(cate_code2),0) + 1 from category), '러닝화');
    INSERT INTO category(cate_code1, cate_code2, cate_name)
    VALUES(2, (select NVL(max(cate_code2),0) + 1 from category), '남성구두');

    INSERT INTO category(cate_code1, cate_code2, cate_name)
    VALUES(3, (select NVL(max(cate_code2),0) + 1 from category), '고양이');
    INSERT INTO category(cate_code1, cate_code2, cate_name)
    VALUES(3, (select NVL(max(cate_code2),0) + 1 from category), '강아지');

  commit;
    
    -- 대분류 가져오기
    select * from category where cate_code2 = 0;
    -- 중분류 가져오기
    select * from category where cate_code1 = 1 and cate_code2 != 0;
    
    -- 3-2. 기본 사이즈(대분류)
    INSERT INTO basic_size(size_no, cate_code1, cate_code2, size_name)
    VALUES(size_seq.nextval, 1, 0, 'S');
    INSERT INTO basic_size(size_no, cate_code1, cate_code2, size_name)
    VALUES(size_seq.nextval, 1, 0, 'M');
    INSERT INTO basic_size(size_no, cate_code1, cate_code2, size_name)
    VALUES(size_seq.nextval, 1, 0, 'L');
    INSERT INTO basic_size(size_no, cate_code1, cate_code2, size_name)
    VALUES(size_seq.nextval, 1, 0, 'XL');
    INSERT INTO basic_size(size_no, cate_code1, cate_code2, size_name)
    VALUES(size_seq.nextval, 1, 0, 'XXL');
    INSERT INTO basic_size(size_no, cate_code1, cate_code2, size_name)
    VALUES(size_seq.nextval, 2, 0, '270');
    INSERT INTO basic_size(size_no, cate_code1, cate_code2, size_name)
    VALUES(size_seq.nextval, 2, 0, '275');
    commit;
    select * from basic_size where cate_code1 = 1;
    -- 3-3. 기본 컬러
    INSERT INTO basic_color(color_no, cate_code1, cate_code2, color_name)
    VALUES(color_seq.nextval, 1, 0, 'RED');
    INSERT INTO basic_color(color_no, cate_code1, cate_code2, color_name)
    VALUES(color_seq.nextval, 1, 0, 'BLACK');
    INSERT INTO basic_color(color_no, cate_code1, cate_code2, color_name)
    VALUES(color_seq.nextval, 1, 0, 'BLUE');
    commit;
    select * from basic_color where cate_code1 = 1;
    
    -- 아래의 내용을 한꺼번에 성공해야 하므로 트랜젝션 처리를 한다.
    -- 3-4. 상품
    INSERT INTO goods(goods_no, cate_code1, cate_code2, goods_name, company, product_date,
    image_name, detail_image_name, content)
    VALUES(goods_seq.nextval, 1, 1, '정장 스타일 남성 상의', '웹짱 닷컴', '2024-08-20', 
    '/upload/goods/man01.jpg', '/upload/goods/man02.jpg', '멋지고 편한 남성용 상의. 물빨래 가능');
    commit;
    select * from goods;
    -- 3-5. 상품이미지 - 상품 상세 보기에서 리스트로 가져와서 처리
    INSERT INTO goods_image(image_no, goods_no, image_name)
    VALUES (goods_image_seq.nextval, 1,'/upload/goods/man03.jpg');
    INSERT INTO goods_image(image_no, goods_no, image_name)
    VALUES (goods_image_seq.nextval, 1,'/upload/goods/man04.jpg');
    commit;
    -- 3-6. 상품 사이즈컬러.
    INSERT INTO goods_sizeColor(goods_sizeColor_no, goods_no, size_no, color_no)
    VALUES(goods_sizeColor_seq.nextval, 1, 3, '3');
    INSERT INTO goods_sizeColor(goods_sizeColor_no, goods_no, size_no, color_no)
    VALUES(goods_sizeColor_seq.nextval, 1, 4, '3');
    INSERT INTO goods_sizeColor(goods_sizeColor_no, goods_no, size_no, color_no)
    VALUES(goods_sizeColor_seq.nextval, 1, 3, '1');
    commit;
    -- 3-7. 상품 옵션 - 사이즈컬러와 같이 운영하지 않는다.
    -- 3-8. 가격 - 가격 기간이 중복이 되면 안된다.
    -- 1. 현재 가격 : 1개
    -- 현재 날짜 : 2024-08-28
    INSERT INTO price(price_no, goods_no, price, discount, discount_rate, delivery_charge,
        saved_rate,sale_startDate, sale_endDate)
    VALUES(price_seq.nextval, 1, 60000, 0, 0, 0, 2, '2024-08-22', '2024-09-30');
    -- 2. 지난 가격 : 여러개
    INSERT INTO price(price_no, goods_no, price, discount, discount_rate, delivery_charge,
        saved_rate,sale_startDate, sale_endDate)
    VALUES(price_seq.nextval, 1, 60000, 10000, 0, 0, 1, '2024-08-19', '2024-08-21');
    -- 3. 예약 가격 : 여러개
    INSERT INTO price(price_no, goods_no, price, discount, discount_rate, delivery_charge,
        saved_rate,sale_startDate, sale_endDate)
    VALUES(price_seq.nextval, 1, 60000, 0, 50, 0, 0, '2024-10-01', '999-12-31');
    commit;