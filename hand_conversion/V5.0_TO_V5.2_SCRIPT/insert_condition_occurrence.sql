-- 
-- insert_condition_occurrence.sql
--
--  This is the insert for condition_occurrence generated by synpuf_etl.sql.  
--  Some values were hardcoded based on release notes and discussions with Claire & Erica. 
--
insert into cdm_synpuf_v667.dbo.condition_occurrence with (tablock) ( 
condition_occurrence_id, 
person_id, 
condition_concept_id, 
condition_start_date, 
condition_end_date, 
condition_type_concept_id, 
stop_reason, 
provider_id, 
visit_occurrence_id, 
condition_source_value, 
condition_source_concept_id, 
condition_status_source_value, 
condition_status_concept_id, 
condition_end_datetime, 
condition_start_datetime
)
select condition_occurrence_id, 
person_id, 
condition_concept_id, 
condition_start_date, 
condition_end_date, 
condition_type_concept_id, 
stop_reason, 
provider_id, 
visit_occurrence_id, 
condition_source_value, 
condition_source_concept_id, 
condition_source_value,      -- condition_status_source_value
case when 
     condition_type_concept_id = 38000210
     then 4203942 else 0 
     end,           -- condition_status_concept_id
NULL,               -- condition_end_datetime 
condition_start_date -- condition_start_datetime - cast as date to remove time component
from cdm_synpuf_v665.dbo.condition_occurrence;
