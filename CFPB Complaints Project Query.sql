#### CFPB COMPLAIN DATABASE ANALYSIS ####

-- DQL, Aggregate Functions, Converting Data Types --
-- Data Source = https://console.cloud.google.com/marketplace/product/cfpb/complaint-database --

-- Let's take a look at the data we're working with --

SELECT *
FROM `bigquery-public-data.cfpb_complaints.complaint_database`
LIMIT 1000
 
 
-- Total complaints per year --
-- Shows customer complaint trend over the years --

SELECT EXTRACT(YEAR FROM date_received) AS year, count(*) AS total
FROM `bigquery-public-data.cfpb_complaints.complaint_database`
GROUP BY year
ORDER BY 1,2


-- Complaint Filling Methods --
-- Shows how customers filling their complaint changed over the years-- 

SELECT EXTRACT(YEAR FROM date_received) AS year, submitted_via, count(*) AS total
FROM `bigquery-public-data.cfpb_complaints.complaint_database`
GROUP BY year, submitted_via
ORDER BY year, submitted_via DESC  


-- Total Complaint in California (CA) --

SELECT count(*)
FROM `bigquery-public-data.cfpb_complaints.complaint_database`
WHERE state = "CA"

-- Company Response--
-- Shows how Company responses the issues in 2021-- 

SELECT *
FROM 
(SELECT EXTRACT(YEAR FROM date_received) AS year, company_response_to_consumer AS company_response, COUNT(company_response_to_consumer) AS total
FROM `bigquery-public-data.cfpb_complaints.complaint_database`
GROUP BY company_response_to_consumer, year)
WHERE year = 2021 AND company_response != 'null'
ORDER BY total


-- Companies with most complains in 2021 --

SELECT company_name, SUM(total) AS total
FROM 
(
SELECT*
FROM 
(SELECT EXTRACT(YEAR FROM date_received) AS year, company_name,  COUNT(*) AS total
FROM `bigquery-public-data.cfpb_complaints.complaint_database`
GROUP BY  year, company_name
ORDER BY  total DESC) 
WHERE year = 2021
)
GROUP BY company_name
ORDER BY total DESC 
LIMIT 10


-- Equifax complaint categories --
-- We knew that Equifax, inc. got most complaint from its customers in 2021, let's check the kinds off complaint adressed to Equifax --

SELECT *
FROM 
(SELECT year, issue, COUNT(*) AS total
FROM 
(SELECT EXTRACT(YEAR FROM date_received) AS year, company_name, issue
FROM `bigquery-public-data.cfpb_complaints.complaint_database`
WHERE company_name = "EQUIFAX, INC.")
GROUP BY year, issue)
WHERE year=2021
ORDER BY total DESC

