<img src="https://www.consumerfinance.gov/static/img/logo_161x34@2x.fff273f43f0a.png" width="250" align="right">

# Basic SQL Project Summary

In this project, I'm gonna practice querying data using basic SQL skills such as **DQL, Aggregate Functions, and Converting Data Types**. I got the data from CFPB public complaint database available at <a href="https://console.cloud.google.com/marketplace/product/cfpb/complaint-database">Here</a>.

Consumer Financial Protection Bureau (CFPB) is the United States government agency responsible for consumer protection in the financial sector. 
The dataset contains  collection of complaints about consumer financial products and services that CFPB sent to companies for response.

If you use Bigquerry like me, on the left of the console page are the Tables with their fields. The right is where we will be writing our queries. The bottom is where we will see the results.  

## Let get started!

### Checking the dataset

SELECT all the data FROM the complaint_database table.

### Solution

<details>

<summary> <code> SQL Solution </code> </summary>

```sql
SELECT *
FROM `bigquery-public-data.cfpb_complaints.complaint_database`
LIMIT 1000;
```

</details>

## Challenge

Let's pull the data of total complaints per year since 2011

### Step 1 

SELECT the date_received as year FROM the complaint_database table.

### Solution

<details>

<summary> <code> SQL Solution </code> </summary>

```sql
SELECT EXTRACT(YEAR FROM date_received) AS year
FROM `bigquery-public-data.cfpb_complaints.complaint_database`;
```

</details>

### Step 2

SELECT the year, and total count of complaints FROM the complaint_database table.

### Solution

<details>

<summary> <code> SQL Solution </code> </summary>

```sql
SELECT EXTRACT(YEAR FROM date_received) AS year, count(*) AS total
FROM `bigquery-public-data.cfpb_complaints.complaint_database`
GROUP BY year;
```

</details>

## Step 3

SELECT the total count FROM the complain_database table HAVING the total complaint greater than 200000.

### Solution

<details>

<summary> <code> SQL Solution </code> </summary>

```sql
SELECT EXTRACT(YEAR FROM date_received) AS year, count(*) AS total
FROM `bigquery-public-data.cfpb_complaints.complaint_database`
GROUP BY year
HAVING total > 200000;
```

</details>

## More Challenges!! 

Now that we have some basic query examples.  I'll explore the datasets with other commands to find different insights.

1. Find the submitted_via count per the year to show how customers filling their complaint changed over the years
2. Find the total complaint in the state of California (CA).
3. Find the company_response_to_customer in 2021 to show how Company response the issues in 2021
4. Make a list of 10 Companies with the highest number of Complaints in 2021.
5. After finding the company with the highest complaints in 2021 (challenge 3 result), let's breakdown the issue into categories and count each issue.

### You can check the query and the result of challenges above in this repository. Enjoy!
