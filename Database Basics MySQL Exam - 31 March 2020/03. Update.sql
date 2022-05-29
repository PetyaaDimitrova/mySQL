update addresses
set country = (
CASE 
when country LIKE 'B%' THEN 'Blocked'  
when country LIKE 'T%' THEN 'Test'  
when country LIKE 'P%' THEN 'In Progress' 
else country
END );