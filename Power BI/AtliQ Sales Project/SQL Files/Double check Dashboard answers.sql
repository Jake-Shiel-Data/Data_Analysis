# Show total revenue in year 2020 
SELECT SUM(transactions.sales_amount) AS Revenue  
FROM transactions 
INNER JOIN date ON transactions.order_date=date.date 
WHERE date.year=2020 and transactions.currency="INR" or transactions.currency="USD";

# Show total sales quantity in Jan 2020 
SELECT SUM(transactions.sales_qty) As Total_sales_qty
FROM transactions 
INNER JOIN date ON transactions.order_date=date.date 
WHERE date.year=2020 and date.month_name="January" and (transactions.currency="INR" or transactions.currency="USD");

# Show total revenue in year 2020 from the Chennai market 
SELECT SUM(transactions.sales_amount) AS Revenue
FROM transactions 
INNER JOIN date ON transactions.order_date=date.date 
WHERE date.year=2020 and transactions.market_code="Mark001";