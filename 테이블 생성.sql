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


-- 예약 테이블 
-- 환자 삭제시 환자 관련 같이  삭제 10/18
ALTER TABLE reservation
ADD CONSTRAINT fk_pidnum
FOREIGN KEY (pidnum)
REFERENCES patient(pidnum)
ON DELETE CASCADE;

-- 병원 삭제시 병원 관련  같이 삭제 10/18
ALTER TABLE reservation
ADD CONSTRAINT fk_comnum
FOREIGN KEY (comnum)
REFERENCES hospital(comnum)
ON DELETE CASCADE;




CREATE TABLE review (
  pidnum varchar(200) REFERENCES patient(pidnum),
  comnum varchar(200) REFERENCES hospital(comnum),
  content varchar(200),
  star varchar(200),
  birth TIMESTAMP NOT NULL DEFAULT NOW()
);

-- 리뷰 테이블 id 추가 
ALTER TABLE review
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;


DROP TABLE review;
DROP TABLE reservation;
DROP TABLE hospital;
DROP TABLE family;
DROP TABLE patient;