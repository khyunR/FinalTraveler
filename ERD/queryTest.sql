SELECT * FROM t_member;
SELECT * FROM t_authority;

select
	username, auth
from
	(select tm.username username, ta.auth auth
	from t_member tm inner join t_authority ta
	where tm.uid = ta.mb_uid) tm_ta
where
	username = "admin1";

delete from t_authority
where mb_uid = 
	(select uid
	from t_member 
	where username = "admin1")
	and auth = 'ROLE_ADMIN';
;

insert into t_authority (mb_uid, auth) values (1, "ROLE_ADMIN");
insert into t_authority (mb_uid, auth) values (1, "ROLE_MEMBER");

DELETE FROM t_member;
delete from t_authority;

