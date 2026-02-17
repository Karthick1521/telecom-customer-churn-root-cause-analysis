### ------DATA BASE CREATION ------
SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;


CREATE DATABASE telecom_churn;
USE telecom_churn;

# TABLE CRERATION 
CREATE TABLE churn_data(
	customerID VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    SeniorCitizen TINYINT,
    Partner VARCHAR(5),
    Dependends VARCHAR(5),
    tenure INT,
    PhoneService VARCHAR(5),
    MultipleLines VARCHAR(20),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(20),
    OnlineBackup VARCHAR(20),
    DeviceProtection VARCHAR(20),
    TechSupport VARCHAR(20),
    StreamingTV VARCHAR(20),
    StreamingMovies VARCHAR(20),
    Contract VARCHAR(20),
    PaperlessBilling VARCHAR(5),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges VARCHAR(20),
    Churn VARCHAR(5)
    );
    
        
# LOAD CSV INTO SQL TABLE:
SHOW VARIABLES LIKE 'secure_file_priv';
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/WA_Fn-UseC_-Telco-Customer-Churn.csv'
INTO TABLE churn_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;



# DATA CLEANING & VALIDATION:

#1.ROW COUNT VALIDATION:
SELECT COUNT(*) FROM churn_data;

#2.CHECK FOR NULL & BLANK VALUES:

SELECT COUNT(*) FROM churn_data
WHERE TotalCharges = ' ';

SELECT * FROM churn_data
WHERE TotalCharges = ' ';

#3.LETS CONVERT TOTAL CHARGES INTO PROPER NUMERIC:

UPDATE churn_data
SET TotalCharges = null
WHERE TotalCharges = ' ';

SELECT COUNT(*) FROM 
churn_data 
WHERE TotalCharges =' ';

SELECT COUNT(*) FROM 
churn_data 
WHERE TotalCharges IS NULL;

ALTER TABLE churn_data
MODIFY COLUMN TotalCharges DECIMAL(10,2);

#4. ADD CHURN FLAG IN CHURN DATA:
ALTER TABLE churn_data
ADD COLUMN churn_flag TINYINT;

UPDATE churn_data
SET churn_flag = CASE
	WHEN churn = 'YES' THEN 1
    ELSE 0
END;

SELECT churn, churn_flag, COUNT(*)
FROM churn_data
GROUP BY churn, churn_flag;

# 5. MIN & MAX TENURE RANGE:
SELECT 
    MIN(tenure) AS min_tenure,
    MAX(tenure) AS max_tenure
FROM churn_data;

# CHURN ANĀLYSIS:

#1.OVER  ALL CHURN RATE:

SELECT 
	COUNT(*) as total_customers,
    SUM(churn_flag) as total_churned,
    ROUND(SUM(churn_flag)* 100/ COUNT(*), 2) as churn_percentage
FROM churn_data;

#2. CHURN BY CONTRACT TYPE

SELECT
	Contract,
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS total_churned,
    ROUND(SUM(churn_flag) * 100.0/ COUNT(*), 2) AS churn_percentage
FROM churn_data
GROUP BY contract
ORDER BY churn_percentage;

#3. CHURN BY TENURE BUCKET:

SELECT
	CASE
		WHEN tenure <= 12 THEN '0-1 Year'
		WHEN tenure <= 24 THEN '1-2 Year'
		WHEN tenure <= 48 THEN '2-4 Year'
		ELSE '4+ Years'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS total_churned,
    ROUND(SUM(churn_flag) * 100.0/ COUNT(*), 2) AS total_churn_rate
FROM churn_data
GROUP BY tenure_group
ORDER BY total_churn_rate DESC;


#3. AVERAGE MONTHLY CHARGES:

SELECT
	churn,
    ROUND(AVG(MonthlyCharges),2) AS avg_montly_charge
FROM churn_data
GROUP BY churn;


# 4. CHURN BY PAYMENT METHOD:

SELECT 
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS churned_customers,
    ROUND(SUM(churn_flag) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM churn_data
GROUP BY PaymentMethod
ORDER BY churn_rate_percent DESC;

# HIGH RISK CUSTOMER SEGMENTATION:

# FIRST WE NEED TO FIND OVER ALL AVG MONTHLY CHARGE:

SELECT ROUND(AVG(MonthlyCharges),2)
FROM churn_data;

# SECOND BUILD A HIGH RISK CTE:

WITH high_risk_segment AS (
    SELECT *
    FROM churn_data
    WHERE Contract = 'Month-to-month'
      AND tenure <= 12
      AND MonthlyCharges > (SELECT AVG(MonthlyCharges) FROM churn_data)
      AND PaymentMethod = 'Electronic check'
)

SELECT 
    COUNT(*) AS total_high_risk_customers,
    SUM(churn_flag) AS churned_high_risk,
    ROUND(SUM(churn_flag) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM high_risk_segment;















