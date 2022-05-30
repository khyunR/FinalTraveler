# 테이블 값 리셋용 데이터 삭제 쿼리
delete from t_member;
delete from t_authority;
delete from t_post_location;
delete from t_post_notice;
delete from t_reservation;

# 더미회원 추가
# 관리자: 아이디 admin1, 비밀번호 1234
# 일반회원: 아이디 member1, 비밀번호 1234
insert into t_member (username, password, name, email, mobile) values ("admin1", "$2a$10$ocf8N6LWzFVqfETlxpzu2e02TuybtkVh5u/Fo2Kq3xqmDOKzJLL6C", "관리자1", "admin@admin.com", "000-0000-0000");
insert into t_member (username, password, name, email, mobile) values ("member1", "$2a$10$Gq2h1jsVAltQfTGJZp1S3.2f3pi.UHqUAzLmU8tHyVssun2MwoObi", "멤버1", "member@member.com", "000-0000-0000");

# 더미회원 권한 설정
insert into t_authority (mb_uid, auth) values (
	(select uid from t_member where username="admin1"), "ROLE_ADMIN"
);
insert into t_authority (mb_uid, auth) values (
	(select uid from t_member where username="admin1"), "ROLE_MEMBER"
);
insert into t_authority (mb_uid, auth) values (
	(select uid from t_member where username="member1"), "ROLE_MEMBER"
);

# 공지사항 더미
INSERT INTO t_post_notice (uid, mb_uid, subject, content) VALUES ('1', '1', '첫번째 공지사항입니다', '첫번째 공지사항 내용입니다.');
INSERT INTO t_post_notice (uid, mb_uid, subject, content) VALUES ('2', '1', '두번째 공지사항입니다', '두번째 공지사항 내용입니다.');
INSERT INTO t_post_notice (uid, mb_uid, subject, content) VALUES ('3', '1', '세번째 공지사항입니다', '세번째 공지사항 내용입니다.');
INSERT INTO t_post_notice (uid, mb_uid, subject, content, viewCnt) VALUES ('5', '1', '웹에디터 테스트', '<p>웹에디터 테스트<br /><em>기울임 테스트<br /><s>취소선 테스트</s></em><br /><span class=\"marker\">마커테스트</span></p> <ol><li>순서있는 목록</li><li>목록2</li></ol><ul><li>순서 없는 목록</li><li>목록2</li></ul>style default<br /><kbd>style keyboard phrase</kbd><p><img alt=\"\" src=\"/ckUpload/01098d47-a853-4de8-be86-b3a13d05a24b_dafuq loop.gif\" style=\"height:406px; width:480px\" /><br /><img alt=\"\" src=\"/ckUpload/23c3e97e-3932-462b-b4d9-3c5ca4d68200_facial thumbs up.jpg\" style=\"height:672px; width:385px\" /><br />&nbsp;</p><p>쉬프트엔터</p><p><strong>STRONG </strong><br />not&nbsp;STRONG</p><h1>ㄴㅇㄻㅈㅇ</h1>', '0');

# 추천 여행지 더미
INSERT INTO t_post_location (mb_uid, subject, locationName, locationAddr, content) VALUES ('1', '첫번째 추천 여행지: 남산타워', '남산타워', '서울 용산구 남산공원길 105 (용산동2가 산1-3)', '‘남산서울타워’는 효율적인 방송전파 송수신과 한국의 전통미를 살린 관광 전망시설의 기능을 겸비한 국내 최초의 종합전파 탑으로 방송문화와 관광산업의 미래를 위해 건립되었습니다. 세계 유명한 종합 탑들이 그 나라 또는 그 도시의 상징적인 존재가 된 것처럼 \'남산서울타워\' 역시 지난 40여 년간 대한민국의 대표적인 관광지이자 서울의 상징물 역할을 해왔습니다. ‘남산서울타워’는 서울 시내 전 지역에서 바라보이는 탑의 높이와 독특한 구조, 형태 등으로 인하여 시민의 관심과 사랑의 대상이 되었고, 내외국인들이 즐겨 찾는 제1의 관광 명소로서의 위치를 확고히 하고 있습니다. 최근에는 한류 바람을 몰고 온 각종 예능, 드라마의 촬영지로 이름이 높아지면서 내외국인 관광객들이 발길이 끊이지 않는 곳입니다.');
INSERT INTO t_post_location (mb_uid, subject, locationName, locationAddr, content) VALUES ('1', '두번째 추천 여행지: 올림픽 공원', '올림픽 공원', '서울 송파구 올림픽로 424 (방이동 88-3)', '올림픽 공원의 전체면적은 43만 8000평으로 서울특별시가 1,823억 원의 사업비를 들여 1984년 4월에 착공해 1986년 4월에 완공하였습니다. 원래는 1986년 서울아시아경기대회와 1988년 서울올림픽대회를 목적으로 건설되었으나, 지금은 체육·문화예술·역사·교육·휴식 등 다양한 용도를 갖춘 종합공원으로 이용되고 있습니다. 3개 테마공원으로 구분되는데, 첫째는 산책·조깅 코스, 건강지압로, 인라인스케이팅, 레포츠 킥보딩, 엑스게임경기장으로 이루어진 건강올림픽공원이고, 둘째는 몽촌역사관, 몽촌토성, 평화의 성지, 조각작품공원, 올림픽미술관으로 이루어진 볼거리 올림픽공원, 셋째는 호돌이 관광열차, 음악분수, 웨딩사진 찍기, 이벤트 광장 등으로 구성된 재미있는 올림픽공원입니다.');
INSERT INTO t_post_location (mb_uid, subject, locationName, locationAddr, content) VALUES ('1', '세번째 추천 여행지: 서울숲', '서울숲', '서울 성동구 뚝섬로 273 (성수동1가 685-20)', '서울숲은 문화예술공원, 체험학습원, 생태숲, 습지생태원 네 가지의 특색 있는 공간들로 구성되어 있으며, 한강과 맞닿아 있어 다양한 문화여가공간을 제공합니다. 또한 서울숲공원은 조성부터 프로그램 운영까지 시민의 참여로 이루어진 최초의 공원입니다.');


