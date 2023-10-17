CREATE TABLE patient (
  pidnum  VARCHAR(200) PRIMARY KEY,
  pemail  varchar(200),
  ppassword  varchar(200),
  pname  varchar(200),
  ptel  varchar(200),
  proadaddress varchar(200),
  ppostcode VARCHAR(200),
  pdetailaddress VARCHAR(200)
);


CREATE TABLE family (
  fidnum varchar(200) PRIMARY KEY,
  fname varchar(200),
  ftel varchar(200),
  pidnum varchar(200) REFERENCES patient(pidnum),
  faddress varchar(200)
);


CREATE TABLE hospital (
  hname varchar(200),
  comnum varchar(200) PRIMARY KEY,
  htel  varchar(200),
  department   varchar(200),
  hpassword   varchar(200),
  lunch  varchar(200),
  clinic  varchar(200),
  hroad varchar(200),
  hdong VARCHAR(200),
  hdetail varchar(200),
  hpostcode varchar(200),
  hurl VARCHAR(200),
  hgrade DECIMAL(2,1),
  hreviewcnt INT(8) DEFAULT 0,
  lat DECIMAL(9,6),
  lon DECIMAL(9,6)
);

CREATE TABLE reservation (
  id INT(8) PRIMARY KEY AUTO_INCREMENT,
  pidnum varchar(200) REFERENCES patient(pidnum),
  comnum varchar(200) REFERENCES hospital(comnum),
  resdate varchar(200),
  restime varchar(200),
  `comment` varchar(200),
  `status` VARCHAR(200),
  doccomment varchar(200),
  fidnum VARCHAR(200) REFERENCES family(fidnum) ON DELETE CASCADE
);


CREATE TABLE review (
  pidnum varchar(200) REFERENCES patient(pidnum),
  comnum varchar(200) REFERENCES hospital(comnum),
  content varchar(200),
  star varchar(200),
  birth TIMESTAMP NOT NULL DEFAULT NOW()
);


DROP TABLE review;
DROP TABLE reservation;
DROP TABLE hospital;
DROP TABLE family;
DROP TABLE patient;


DELETE 
FROM hospital;

-- 병원 테스트 데이터 입력
INSERT INTO hospital ( hname,  comnum,     htel,   department, hpassword, lunch,     clinic,            hroad,                                hdong,              hdetail, hpostcode, hurl, hgrade, lat, lon)
              VALUES ('kosta', '12345', '02123456',  '외과', '12',   '12001300', '09001800', '서울 금천구 가산디지털1로 70', '서울특별시 금천구 가산동 319',      '101',  '08590' ,  'image' , 0.233333, 37.47226015848, 126.88588356963);


INSERT INTO hospital ( hname,  comnum,     htel,   department, hpassword, lunch,     clinic,            hroad,                                hdong,              hdetail, hpostcode, hurl, hgrade,  lat, lon)
              VALUES ('COCOosta', '213498', '02123456',  '외과', '12',   '12001300', '09001800', '서울 금천구 가산디지털1로 70', '서울 금천구 가산동 319',      '101',  '08590' ,  'image' , 0.233333, 126.88588356963,  37.47226015848);
              
INSERT INTO hospital ( hname,  comnum,     htel,   department, hpassword, lunch,     clinic,            hroad,                                hdong,              hdetail, hpostcode, hurl, hgrade,  lat, lon)
              VALUES ('kkkkosta', '22558800', '02123456',  '외과', '12',   '12001300', '09001800', '서울 금천구 가산디지털1로 70', '서울특별시 금천구 가산동 319',      '101',  '08590' ,  'image' , 0.233333,  37.47226015848, 126.88588356963);
              
INSERT INTO family ()
				VALUES ();
              
-- 예약 테스트 데이터 입력
INSERT INTO reservation (      pidnum,      comnum,     resdate,   restime,   `comment`,       `status`, doccomment)
                 VALUES ( '9605021182418' , '12345',  '20231012',    '1200',      '목이아파요',    '1',     '꾀병');
                 

INSERT INTO reservation (      pidnum,      comnum,     resdate,   restime,   `comment`,       `status`, doccomment)
                 VALUES ( '9605021182418' , '12345',  '20231011',    '1200',      '목이아파요',    '2',     '꾀병');


INSERT INTO reservation (      pidnum,      comnum,     resdate,   restime,   `comment`,       `status`, doccomment)
                 VALUES ( '9605021182418' , '67890',  '20231010',    '1200',      '목이아파요',    '3',     '꾀병');
                 
                 
INSERT INTO reservation (      pidnum,      comnum,     resdate,   restime,   `comment`,       `status`, doccomment)
                 VALUES ( '9605021182418' , '67890',  '20231009',    '1200',      '목이아파요',    '4',     '꾀병');



-- 가족 테스트 데이터 입력
INSERT INTO family (fidnum, fname, ftel, pidnum, faddress)
            VALUES ();

UPDATE reservation SET resdate = '20231010' WHERE comnum = '67890';

DELETE FROM hospital WHERE hname = 'kosta';

SELECT * 
FROM patient;


SELECT * 
FROM hospital;

SELECT * 
FROM reservation;

select *
FROM review;

SELECT h.hname
     , h.hroad
     , h.clinic
     , h.htel
     , p.pname
     , r.resdate
     , r.restime
     , h.department
     , r.`comment`
     , p.pidnum
FROM hospital h
   , patient p
   , reservation r
WHERE 1=1
AND p.pidnum = r.pidnum
AND h.comnum = r.comnum
AND p.pidnum = '9605021182418';


SELECT f.fname
     , f.ftel
     , f.faddress
FROM patient p
   , family f
WHERE 1=1
AND p.pidnum = f.pidnum
AND p.pidnu =  '9605021182418';


SELECT f.fname AS name
     , f.ftel AS tel
     , f.faddress AS address 
FROM patient p
   , family f
WHERE 1=1
AND p.pidnum = f.pidnum
AND p.pidnum = '';



SELECT fname AS NAME 
FROM family f
    , reservation r
WHERE 1=1
AND r.fidnum = '9212302182418';

--
SELECT fname AS NAME 
	  FROM family f
	     , reservation r
	 WHERE 1=1
	   AND r.fidnum = '9605021182418';
	  


-- 가족이 예약한 경우
SELECT h.hname
     , h.hroad
     , h.clinic
     , h.htel
     , f.fname
     , r.resdate
     , r.restime
     , h.department
     , r.`comment`
FROM hospital h
   , reservation r
   , family f
WHERE 1=1
AND f.fidnum = r.pidnum
AND h.comnum = r.comnum
AND f.fidnum = '9605021182418'
AND r.id = 1;





SELECT *
FROM  reservation r
WHERE 1=1
AND r.id = 1;




SELECT h.hname as hname
	      , h.hroad as address
	      , h.clinic as time
	      , h.htel as tel
	      , f.fname as pname
	      , r.resdate as resdate
	      , r.restime as restime
	      , h.department as department
	      , r.comment as comment
	   FROM hospital h
	      , reservation r
	      , family f
	  WHERE 1=1
	    AND f.fidnum = r.fidnum
	    AND h.comnum = r.comnum
	    AND f.pidnum = '9605021182418'
	    AND r.id = 1;
	    
	    
	    
	    
	    
	    SELECT h.hname as name
     	 , SUBSTRING(r.birth,1, 10) as date
     	 , h.department as department
     	 , r.star as star
     	 , r.content as content 
	  FROM patient p
   	  , review r
   	  , hospital h
 	 WHERE 1=1
 	   AND p.pidnum = r.pidnum
 	   AND r.comnum = h.comnum
 	   AND p.pidnum = '9605021182418'
	  ORDER BY r.birth DESC;


SELECT * FROM review;
