-- Databricks notebook source
---SECTION 1 - UNION 

---QUESTION 1

SELECT*
FROM unionexercise.unionspace.branch_rosebank_accounts;

SELECT*
FROM unionexercise.unionspace.branch_sandton_accounts;

SELECT account_id,account_holder,
'rosebank'AS city -----Adding City returns duplicates , the only way to remove them is by removing City 
FROM unionexercise.unionspace.branch_rosebank_accounts
UNION 
SELECT account_id,account_holder,
'sandton'AS city -----Adding City returns duplicates , the only way to remove them is by removing City 
FROM unionexercise.unionspace.branch_sandton_accounts; 

---Running the code again without "City "


SELECT account_id,account_holder
FROM unionexercise.unionspace.branch_rosebank_accounts
UNION 
SELECT account_id,account_holder
FROM unionexercise.unionspace.branch_sandton_accounts; 

---QUESTION 2


SELECT product_code,product_name,
'Savings'AS product_type 
FROM unionexercise.unionspace.savings_products
UNION
SELECT product_code,product_name,
'Current'AS product_type 
FROM unionexercise.unionspace.current_products;


---QUESTION 3 
---Using NULL for the expected 'Email' column since theres no staff emails provided

SELECT staff_id,staff_name,
NULL AS email
FROM unionexercise.unionspace.retail_banking_staff
UNION 
SELECT staff_id,staff_name,
NULL AS email
FROM unionexercise.unionspace.corporate_banking_staff;


---QUESTION 4

SELECT city_code,city_name,
CASE
WHEN city_name IN ('Johannesburg', 'Pretoria') THEN 'Gauteng'
WHEN city_name = 'Cape Town' THEN 'Western Cape'
WHEN city_name = 'Durban' THEN 'KwaZulu-Natal'
WHEN city_name = 'Polokwane' THEN 'Limpopo'
WHEN city_name = 'Port Elizabeth' THEN 'Eastern Cape'
END AS region
FROM unionexercise.unionspace.mobile_branch_cities
UNION
SELECT city_code,city_name,
CASE
WHEN city_name IN ('Johannesburg', 'Pretoria') THEN 'Gauteng'
WHEN city_name = 'Cape Town' THEN 'Western Cape'
WHEN city_name = 'Durban' THEN 'KwaZulu-Natal'
WHEN city_name = 'Polokwane' THEN 'Limpopo'
WHEN city_name = 'Port Elizabeth' THEN 'Eastern Cape'
END AS region
FROM unionexercise.unionspace.digital_branch_cities;


---QUESTION 5 

SELECT customer_id,customer_name,
'Target Customer' AS segment
FROM unionexercise.unionspace.push_notification_targets
UNION
SELECT customer_id,customer_name,
'Target Customer' AS segment
FROM unionexercise.unionspace.inapp_banner_targets;



---SECTION 2 -UNION ALL
----QUESTION 6

SELECT txn_id AS transaction_id,
       account_id,amount,
NULL AS transaction_date
FROM unionexercise.unionspace.atm_01_transactions
UNION ALL
SELECT txn_id AS transaction_id,
       account_id,amount,
NULL AS transaction_date
FROM unionexercise.unionspace.atm_02_transactions;


---QUESTION 7
--- This question alse requires an 'amount requested' column however that data is not available 

SELECT app_id AS application_id,
    customer_id,loan_type
FROM unionexercise.unionspace.gauteng_loan_applications
UNION ALL
SELECT app_id AS application_id,
    customer_id,loan_type
FROM unionexercise.unionspace.western_cape_loan_applications;


---QUESTION 8
--No logged date info given , therfore used NULL

SELECT complaint_id,customer_id,
'Email' AS category,
NULL AS logged_date
FROM unionexercise.unionspace.email_complaints
UNION ALL
SELECT complaint_id,customer_id,
'Mobile App' AS category,
NULL AS logged_date
FROM unionexercise.unionspace.app_complaints;


--QUESTION 9
--No payment date data given , used NULL 

SELECT payment_id,account_id,amount,
NULL AS payment_date
FROM unionexercise.unionspace.april_payments
UNION ALL
SELECT payment_id,account_id,amount,
NULL AS payment_date
FROM unionexercise.unionspace.may_payments;


---QUESTION 10
--No Amount and Entry date data given , NULL function has been used to create expected columns 


SELECT entry_id,account_id,entry_type,
NULL AS amount,
NULL AS entry_date
FROM unionexercise.unionspace.credit_entries
UNION ALL
SELECT entry_id,account_id,entry_type,
NULL AS amount,
NULL AS entry_date
FROM unionexercise.unionspace.debit_entries;












