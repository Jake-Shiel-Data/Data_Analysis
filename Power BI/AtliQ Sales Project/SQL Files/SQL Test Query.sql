
# Test Query
SELECT SUM(transactions.sales_amount) As Total_Sales
FROM transactions
INNER JOIN date ON transactions.order_date = date.date
WHERE date.year = 2020 and transactions.market_code = "Mark001";

# Check for zero and non negative
SELECT COUNT(sales_amount) AS Total_zero_or_less_sales 
FROM transactions                                                                                             
WHERE sales_amount <=0; 

SELECT currency, count(currency)
FROM transactions
group by currency;                                                                                           
