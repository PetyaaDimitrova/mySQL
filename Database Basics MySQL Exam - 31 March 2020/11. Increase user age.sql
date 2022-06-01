delimiter %%
create procedure udp_modify_user (address VARCHAR(30), town VARCHAR(30))
begin
IF(( SELECT a.address from addresses as a where address = a.address) is not null)
then update users as u join addresses as aa ON u.id = aa.user_id
set u.age = u.age + 10
where aa.address = address and aa.town = town;
end if;
END
%%