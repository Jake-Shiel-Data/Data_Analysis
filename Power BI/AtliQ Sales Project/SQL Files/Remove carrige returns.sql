# Identify the Affected Rows
SELECT * FROM transactions
WHERE currency LIKE '%\r%';

# Turn safe mode on
SET SQL_SAFE_UPDATES = 0;

# Update the Data by using the REPLACE function
# Note(Carriage return characters are represented by \r in MySQL and '' is an empty string)
UPDATE transactions
SET currency = REPLACE(currency, '\r', '');

# Turn safe mode back on
SET SQL_SAFE_UPDATES = 1;


