select p.id, concat(first_name, ' ' , last_name) as full_name, age, position, hire_date from players as p
join skills_data as s ON s.id = p.skills_data_id
where p.age < 23 and p.position = 'A' and p.hire_date is null and s.strength > 50
order by salary, age;