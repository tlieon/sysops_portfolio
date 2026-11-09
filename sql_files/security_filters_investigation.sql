-- =======================================================================
-- SEC_INVESTIGATION: Login Anomalies and Endpoint Auditing
-- Purpose: Investigating authentication bypass logs and parsing departments
-- =======================================================================

-- Task 1: Retrieve after-hours failed login attempts (After 18:00)
-- Objective: Identify malicious brute-force signatures outside standard windows
SELECT * FROM log_in_attempts 
WHERE login_time > '18:00:00' AND success = 0;

-- Task 2: Review login attempts for specific suspect dates (2022-05-08 and 2022-05-09)
SELECT * FROM log_in_attempts 
WHERE login_date = '2022-05-08' OR login_date = '2022-05-09';

-- Task 3: Filter out traffic originating from safe zones (Mexico)
-- Using wildcards to account for variations in data formatting (MEX vs MEXICO)
SELECT * FROM log_in_attempts 
WHERE country NOT LIKE 'MEX%';

-- Task 4: Extract Marketing accounts located within East Building zones
-- Isolating endpoints scheduled for localized policy enforcement updates
SELECT * FROM employees 
WHERE department = 'Marketing' AND office LIKE 'East%';

-- Task 5: Audit Sales and Finance units for bulk credential rotation
SELECT * FROM employees 
WHERE department = 'Sales' OR department = 'Finance';

-- Task 6: Exclude pre-patched Information Technology endpoints
SELECT * FROM employees 
WHERE department != 'Information Technology';
