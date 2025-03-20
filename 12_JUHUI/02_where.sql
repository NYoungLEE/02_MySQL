
-- ==============================
-- WHERE
-- ==============================

# WHERE 비교 연산자
-- 표현식 사이의 관계를 비교하기 위해 사용하고, 비교 결과는 논리 결과 중에 하나 (TRUE/FALSE/NULL)가 된다.
-- 단, 비교하는 두 컬럼 값/표현식은 서로 동일한 데이터 타입이어야 한다.

#     연산자                    설명
#     --------------------------------------------------------------------------------
#     =                        같다
#     >,<                        크다/작다
#     >=,<=                    크거나 같다/작거나 같다
#     <>,!=                    같지 않다 (^= 없음)
#     BETWEEN AND                특정 범위에 포함되는지 비교
#     LIKE / NOT LIKE            문자 패턴 비교
#     IS NULL / IS NOT NULL    NULL 여부 비교
#     IN / NOT IN                비교 값 목록에 포함/미포함 되는지 여부 비교

# WHERE 논리 연산자
-- 여러 개의 제한 조건 결과를 하나의 논리결과로 만들어 줌 (&&,|| 사용불가)
-- AND &&    여러 조건이 동시에 TRUE일 경우에만 TRUE 값 반환
-- OR ||    여러 조건들 중에 어느 하나의 조건만 TRUE이면 TRUE값 반환
-- NOT !    조건에 대한 반대값으로 반환(NULL은 예외)
-- XOR        두 값이 같으면 거짓, 두 값이 다르면 참

-- 비교연산자
SELECT
          menu_name
        , menu_price
        , orderable_status
    FROM
        tbl_menu
WHERE
    orderable_status = 'N';

--  tbl_menu 테이블에서 가격이 만삼천원인 메뉴 이름, 메뉴 가격, 주문 여부 컬럼을 출력
SELECT
      menu_name
    , menu_price
    , orderable_status
    FROM
        tbl_menu
    WHERE
    menu_price = 13000;

-- 같지 않을 연산자와 함께 where절 사용
SELECT
       menu_name
     , menu_price
     , orderable_status
    FROM
        tbl_menu
    WHERE
#       orderable_status <> 'Y';
#       orderable_status != 'Y';
#       orderable_status = 'n';
        orderable_status = 'N';
-- MySQL은 비교나 검색을 수행할 때 기본적으로 대소문자 구별없이 비교 및 검색이 가능하다.

-- 대소비교 연산자와 함께 where절 사용
SELECT
        menu_name
      , menu_price
      , orderable_status
    FROM
        tbl_menu
    WHERE
        menu_price > 20000;

-- 위에서 조건만 바꿈
SELECT
    menu_name
     , menu_price
     , orderable_status
FROM
    tbl_menu
WHERE
    menu_price <= 20000;

-- 2. AND 연산자와 함께 WHERE절 사용
-- 0은 FALSE, 0외의 숫자는 TRUE로 임시적 형변환 후 평가된다.
-- 문자열은 0으로 반환, FALSE로 평가
-- NULL과의 연산결과는 null이다(0 && null 제외)

SELECT 1 AND 1, 2 && 2, -1 && 1, 1 && 'abc';
SELECT 1 AND 0, 0 && 1, 0 && 0, 0 && NULL;
SELECT 1 AND NULL, NULL && NULL;
SELECT 1 + NULL, 1 - NULL, 1 *  NULL, 1 / NULL;

-- 메뉴 테이블에서 주문여부가 'y'이면서, 카테고리 코드가 10인 메뉴 목록을 조회
SELECT
      menu_code
    , menu_price
    , category_code
    , orderable_status
    FROM
        tbl_menu
    WHERE
        orderable_status = 'Y' && category_code = 10;

-- 강사님 답변이 밑에꺼, 위에가 내가 생각한 답변
SELECT
    menu_code
     , menu_price
     , category_code
     , orderable_status
FROM
    tbl_menu
WHERE
    orderable_status = 'Y'
AND
    category_code = 10;

-- 메뉴 테이블에서 메뉴가격이 5000원보다 크고, 카테고리 코드가 10인 메뉴를 출력.
-- 단, 컬럼의 출력은 메뉴코드, 메뉴이름, 메뉴가격, 카테고리코드, 주문여부만 출력.
SELECT
       menu_code
     , menu_name
     , menu_price
     , category_code
     , orderable_status
    FROM
        tbl_menu
    WHERE
        menu_price > 5000
    AND
        category_code = 10;

-- OR 연산자와 함께 WHERE절 이용
SELECT  1 OR 1, 1 OR 0, 0 OR 1;
SELECT 0 OR 0;
SELECT 1 OR NULL, 0 OR NULL, NULL OR NULL;

-- 메뉴 테이블에서 주문여부가 'Y'이고, 카테고리 코드가 10인 메뉴 목록을 조회
SELECT
       menu_code
     , menu_price
     , category_code
     , orderable_status
    FROM
        tbl_menu
    WHERE
        orderable_status = 'Y'
    OR
        category_code = 10;

-- 우선순위
-- 나열되어 AND OR 중에는 AND가 높다.
SELECT 1 OR 0 AND 0;
SELECT (1 OR 0) AND 0;

-- 카테고리 번호가 4 또는 가격이 9000이면서 메뉴번호가 10번보다 큰 메뉴를 조회하자.
-- 모든 컬럼을 조회
SELECT
        menu_code
      , menu_price
      , category_code
    FROM
        tbl_menu
    WHERE
        category_code = 4
    OR
        menu_price = 9000
    AND
        menu_code = 10;

