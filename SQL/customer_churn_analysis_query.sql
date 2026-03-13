create database churn

use churn

show tables

select * from churn

--check null values
select * from churn
where totalcharges is null;

select * from churn 
where customerid is null
or
gender is null;

--check dublicates
select customerid, count(*) from churn
group by customerid
order by count(*) > 1;

--total customers
select count(*) from churn

--churn customers
select churn, count(*) from churn
group by churn;

--churn rate
select count(case when churn='yes' then 1 end)*100.0 / count(*) as churn_rate from churn

--churn by contract
select contract, count(*) as total_customers from churn
where churn = 'yes'
group by contract;

--churn by payment method
select paymentmethod, count(*) from churn
where churn = 'yes'
group by paymentmethod
order by count(*) desc;

--average monthly charges of churn customers
select avg(monthlycharges) from churn
where churn = 'yes'

select avg(monthlycharges) from churn
where churn = 'no'
