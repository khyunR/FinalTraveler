SELECT * from t_member;
SELECT * from t_authority;
SELECT * from t_post_notice;
SELECT * from t_post_location;
SELECT * from t_reservation;

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
	where username = "")
	and auth = 'ROLE_ADMIN';
;

insert into t_authority (mb_uid, auth) values (1, "ROLE_ADMIN");
insert into t_authority (mb_uid, auth) values (1, "ROLE_MEMBER");

SELECT
	username "username"
FROM
	t_member
WHERE
	name = "" AND email = "";

DELETE FROM t_member where uid = 2;


DELETE FROM t_member;
delete from t_authority;

