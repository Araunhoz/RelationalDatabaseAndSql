-- DEFINE DATA MODEL
CREATE TYPE product_category_enum AS ENUM ('type1', 'type2', 'type3', 'type4', 'type5');

CREATE TABLE class6.products_v3(
	id       SERIAL PRIMARY KEY,
	name     VARCHAR(50) NOT NULL,
	category product_category_enum NOT NULL,
	price    FLOAT NOT NULL,
	quantity INT NOT NULL
);

SELECT * FROM class6.products_v3

-- ==================
-- ORDER OF EXECUTION
-- ==================
-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- ORDER BY
-- LIMIT

-- DATA INSERTIONS
INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 1', 'type1', 10.99, 5);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 2', 'type2', 15.99, 3);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 3', 'type3', 20.99, 7);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 4', 'type4', 8.99, 10);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 5', 'type1', 12.99, 2);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 6', 'type3', 18.99, 6);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 7', 'type2', 14.99, 8);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 8', 'type4', 9.99, 12);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 9', 'type1', 11.99, 4);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 10', 'type5', 22.99, 3);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 11', 'type2', 16.99, 7);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 12', 'type3', 21.99, 9);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 13', 'type1', 13.99, 5);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 14', 'type4', 10.99, 8);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 15', 'type2', 17.99, 6);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 16', 'type3', 19.99, 3);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 17', 'type1', 14.99, 4);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 18', 'type4', 11.99, 7);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 19', 'type2', 18.99, 5);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 20', 'type5', 24.99, 2);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 21', 'type3', 22.99, 6);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 22', 'type1', 15.99, 3);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 23', 'type4', 12.99, 9);

INSERT INTO class6.products_v3 (name, category, price,quantity)
VALUES ('Product 24', 'type2', 19.99, 7);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 25', 'type3', 24.99, 4);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 26', 'type1', 16.99, 6);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 27', 'type4', 13.99, 8);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 28', 'type2', 20.99, 5);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 29', 'type5', 26.99, 3);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 30', 'type3', 25.99, 7);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 31', 'type1', 17.99, 4);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 32', 'type4', 14.99, 6);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 33', 'type2', 21.99, 9);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 34', 'type3', 26.99, 5);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 35', 'type1', 18.99, 7);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 36', 'type4', 15.99, 4);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 37', 'type2', 22.99, 8);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 38', 'type5', 28.99, 6);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 39', 'type3', 27.99, 3);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 40', 'type1', 19.99, 5);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 41', 'type4', 16.99, 7);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 42', 'type2', 23.99, 2);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 43', 'type3', 28.99, 5);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 44', 'type1', 20.99, 4);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 45', 'type4', 17.99, 6);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 46', 'type2', 24.99, 3);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 47', 'type5', 30.99, 8);

INSERT INTO class6.products_v3 (name, category, price,quantity)
VALUES ('Product 48', 'type3', 29.99, 4);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 49', 'type1', 21.99, 6);

INSERT INTO class6.products_v3 (name, category, price, quantity)
VALUES ('Product 50', 'type4', 18.99, 9);


-- print all the products that more than 20 dollars
SELECT * FROM class6.products_v3 
WHERE price > 20;

-- print all the products that more than 20 dollars in desc order
SELECT * FROM class6.products_v3 
WHERE price > 20 
ORDER BY price DESC;

-- print all the products that more than 20 dollars in asc order
SELECT * FROM class6.products_v3 
WHERE price > 20 
ORDER BY price ASC;

-- print only first 5 products that more than 20 dollars 
SELECT * FROM class6.products_v3 
WHERE price > 20 
LIMIT 5;

-- print only first 5 products that more than 20 dollars in desc order
SELECT * FROM class6.products_v3 
WHERE price > 20 
ORDER BY price DESC 
LIMIT 5;

-- group by category and find AVG Price for each category
SELECT category, AVG(price) AS avg_price 
FROM class6.products_v3 
GROUP BY category;

-- in the group by find the Type with AVG price more than 20
SELECT category, AVG(price) AS avg_price
FROM class6.products_v3
GROUP BY category
HAVING AVG(price) > 20;
