select count(*) from covid_info

select * from covid_info;

---checking the timeframe of the data 
SELECT
   MIN ("date announced")
FROM
   covid_info;

SELECT
   MAX ("date announced")
FROM
   covid_info;
   
SELECT distinct "date announced" as date_reported, count (*) as no_of_records from covid_info
group by date_reported
order by date_reported

--checkig the age distribution, is there a good sample?
SELECT distinct ("age bracket") from covid_info

---majority of gender data is missing 
SELECT distinct gender, count (*) as no_of_records from covid_info
group by gender

-- confirming which state AP, A&P belong to
SELECT distinct ("detected state") as state, "state code" as state_code from covid_info
order by state

--version control (cleaning)
create table covid as select * from covid_info

--updating table for consistency 
update covid set "detected state" = 'Andhra Pradesh'
where covid."state code" = 'AP'

-- viewing changes to the table 
SELECT distinct ("detected state") as state, "state code" as state_code from covid
order by state

SELECT 
   table_name, 
   column_name, 
   data_type 
FROM 
   information_schema.columns
WHERE 
   table_name = 'covid';
   
SELECT distinct "current status" from covid

update covid 
set "current status" = 
case 
     when "current status" = 'Migrated_Other'
	 then 'Others'
	 else "current status"
	 end;

update covid
set "current status" = 
case
  when "current status" IS NULL THEN
    'Others'
  else "current status"
	 end;
