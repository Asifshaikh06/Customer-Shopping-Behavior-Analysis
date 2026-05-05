CREATE TABLE customer_shopping (
    customer_id INT PRIMARY KEY,
    age INT,
    gender VARCHAR(10),
    item_purchased VARCHAR(100),
    category VARCHAR(50),
    purchase_amount INT,
    location VARCHAR(100),
    size VARCHAR(10),
    color VARCHAR(20),
    season VARCHAR(20),
    review_rating FLOAT,
    subscription_status VARCHAR(10),
    shipping_type VARCHAR(50),
    discount_applied VARCHAR(10),
    previous_purchases INT,
    payment_method VARCHAR(50),
    frequency_of_purchases VARCHAR(50),
    age_group VARCHAR(20),
    purchase_frequency_days INT
);

SELECT*
FROM customer_shopping

-- Q1. Total revenue by gender
SELECT gender, SUM(purchase_amount) AS revenue
FROM customer_shopping
GROUP BY gender;


-- Q2. Customers who used a discount but spent more than average
SELECT customer_id, purchase_amount
FROM customer_shopping
WHERE discount_applied = 'Yes'
  AND purchase_amount >= (SELECT AVG(purchase_amount) FROM customer_shopping);


-- Q3. Top 5 products by average review rating
SELECT TOP 5
    item_purchased,
    ROUND(AVG(CAST(review_rating AS DECIMAL(10,2))), 2) AS [Average Product Rating]
FROM customer_shopping
GROUP BY item_purchased
ORDER BY AVG(CAST(review_rating AS DECIMAL(10,2))) DESC;


-- Q4. Average purchase amount: Standard vs Express shipping
SELECT shipping_type,
       ROUND(AVG(CAST(purchase_amount AS DECIMAL(10,2))), 2) AS avg_purchase
FROM customer_shopping
WHERE shipping_type IN ('Standard', 'Express')
GROUP BY shipping_type;


-- Q5. Subscriber vs non-subscriber: avg spend and total revenue
SELECT subscription_status,
       COUNT(customer_id)                                    AS total_customers,
       ROUND(AVG(CAST(purchase_amount AS DECIMAL(10,2))), 2) AS avg_spend,
       ROUND(SUM(CAST(purchase_amount AS DECIMAL(10,2))), 2) AS total_revenue
FROM customer_shopping
GROUP BY subscription_status
ORDER BY total_revenue DESC, avg_spend DESC;


-- Q6. Top 5 products with highest discount rate
SELECT TOP 5
    item_purchased,
    ROUND(
        100.0 * SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END)
              / COUNT(*),
        2
    ) AS discount_rate
FROM customer_shopping
GROUP BY item_purchased
ORDER BY discount_rate DESC;


-- Q7. Customer segmentation: New / Returning / Loyal
WITH customer_type AS (
    SELECT customer_id,
           previous_purchases,
           CASE
               WHEN previous_purchases = 1 THEN 'New'
               WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
               ELSE 'Loyal'
           END AS customer_segment
    FROM customer_shopping
)
SELECT customer_segment,
       COUNT(*) AS [Number of Customers]
FROM customer_type
GROUP BY customer_segment;


-- Q8. Top 3 most purchased products per category
WITH item_counts AS (
    SELECT category,
           item_purchased,
           COUNT(customer_id) AS total_orders,
           ROW_NUMBER() OVER (
               PARTITION BY category
               ORDER BY COUNT(customer_id) DESC
           ) AS item_rank
    FROM customer_shopping
    GROUP BY category, item_purchased
)
SELECT item_rank, category, item_purchased, total_orders
FROM item_counts
WHERE item_rank <= 3
ORDER BY category, item_rank;


-- Q9. Repeat buyers (>5 purchases) and their subscription status
SELECT subscription_status,
       COUNT(customer_id) AS repeat_buyers
FROM customer_shopping
WHERE previous_purchases > 5
GROUP BY subscription_status;


-- Q10. Revenue contribution by age group
SELECT age_group,
       SUM(purchase_amount) AS total_revenue
FROM customer_shopping
GROUP BY age_group
ORDER BY total_revenue DESC;