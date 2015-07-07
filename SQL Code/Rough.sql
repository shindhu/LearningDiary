DROP TABLE USERS;
SET SCHEMA APP;
CREATE TABLE USERS (ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
					USERNAME VARCHAR(50) NOT NULL UNIQUE,
					PASSWORD VARCHAR(20) NOT NULL,
					EMAIL VARCHAR (50) NOT NULL,
					SECURITY_QUESTION VARCHAR(200) NOT NULL,
					SEC_QUES_ANSWER VARCHAR(100) NOT NULL );
INSERT INTO USERS (USERNAME, PASSWORD, EMAIL, SECURITY_QUESTION, SEC_QUES_ANSWER) VALUES ('admin','admin','admin@learningdiary.com', 'What''s your pet name?', 'janu'); --1
INSERT INTO USERS (USERNAME, PASSWORD, EMAIL, SECURITY_QUESTION, SEC_QUES_ANSWER) VALUES ('shindhu','abc','shindhu@learningdiary.com','My favorite color', 'black'); --2
INSERT INTO USERS (USERNAME, PASSWORD, EMAIL, SECURITY_QUESTION, SEC_QUES_ANSWER) VALUES ('john','abc','john@learningdiary.com', 'what''s my home town ?','trichy'); --3
SELECT * FROM USERS;
--INSERT INTO USERS (USERNAME, PASSWORD, EMAIL) VALUES ('sam','abc','sam@learningdiary.com'); --4
--INSERT INTO USERS (USERNAME, PASSWORD, EMAIL) VALUES ('norman','abc','norman@learningdiary.com'); --5
--INSERT INTO USERS (USERNAME, PASSWORD, EMAIL) VALUES ('marc','abc','marc@learningdiary.com'); --6

select password from users  where sec_ques_answer = lower('JANU');




DROP TABLE CATEGORY;
SET SCHEMA APP;
CREATE TABLE CATEGORY ( ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	USER_ID INT NOT NULL,
	NAME VARCHAR(50) NOT NULL,
	PRIMARY KEY(ID));
INSERT INTO CATEGORY (USER_ID, NAME) values (2,'Autobiography & Biography');-- 1
INSERT INTO CATEGORY (USER_ID, NAME) values (2,'Business & Money');--2
INSERT INTO CATEGORY (USER_ID, NAME) values (2,'Computer & Programming');--3
INSERT INTO CATEGORY (USER_ID, NAME) values (3,'Reference');--4
INSERT INTO CATEGORY (USER_ID, NAME) values (3,'Stories');--5
INSERT INTO CATEGORY (USER_ID, NAME) VALUES (3,'Other');--6

SELECT * FROM CATEGORY;

select id, name from category where user_id = 3;


DROP TABLE BOOKS;
SET SCHEMA APP;
CREATE TABLE BOOKS ( ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	USER_ID INT NOT NULL,
	CATEGORY_ID INT NOT NULL, 
	CONSTRAINT CATEGORY_ID_REF FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY(ID),
	IMAGE VARCHAR(1000),
	NAME VARCHAR(500) NOT NULL,
	BOOK_FORMAT VARCHAR(1000),
	NOTES VARCHAR(32672 ));
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 1, 'http://upload.wikimedia.org/wikipedia/en/3/3a/Wings_of_Fire_by_A_P_J_Abdul_Kalam_Book_Cover.jpg','Wings of Fire','HardCover','When the student is ready, the teacher will appear - How true!');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 2, 'http://d.gr-assets.com/books/1348842650l/3142407.jpg','The Name Is Rajinikanth','HardCover','Super Star in kollywood, devotte of Babaji & Ragavendra');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(3, 3, 'http://upload.wikimedia.org/wikipedia/en/e/e4/Steve_Jobs_by_Walter_Isaacson.jpg','Steve Jobs','HardCover',' American entrepreneur, marketer, and inventor, who was the cofounder, chairman, and CEO of Apple Inc. ');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(3, 3, 'https://s3-eu-west-1.amazonaws.com/userlike-cdn-blog/in-the-plex.jpg','In The Plex','MP3 & CD',' How Google Thinks, Works, and Shapes Our Lives. The key to Google’s success in all these businesses, Levy reveals, is its engineering mind-set and adoption of such Internet values as speed, openness, experimentation, and risk taking.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(4, 4, 'http://d.gr-assets.com/books/1411331352l/23164924.jpg','Reagan','Kindle','Reagan shut down the age of liberalism, Brands shows, and ushered in the age of Reagan, whose defining principles are still powerfully felt today.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(4, 4, 'http://ecx.images-amazon.com/images/I/51YWeAneftL._SY344_BO1,204,203,200_.jpg','The President and the Apprentice','HardCover','Eisenhower and Nixon, 1952-1961');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(5, 5, 'http://ecx.images-amazon.com/images/I/51MxjDM80-L._SY344_BO1,204,203,200_.jpg','The Autobiography of Benjamin Franklin','HardCover','Covering his life up to his prewar stay in London as representative of the Pennsylvania Assembly, this charming self-portrait recalls Franklins boyhood, his determination to achieve high moral standards, his work as a printer, experiments with electricity, political career, experiences during the French and Indian War, and more.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(5, 5, 'http://ecx.images-amazon.com/images/I/51O5LjozmAL._SY344_BO1,204,203,200_.jpg','The Autobiography of Malcolm X: As Told to Alex Haley','Paperback','With its first great victory in the landmark Supreme Court decision Brown v. Board of Education in 1954, the civil rights movement gained the powerful momentum it needed to sweep forward into its crucial decade, the 1960s. ');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(6, 6, 'http://img1.imagesbn.com/p/9780316548182_p0_v2_s260x420.JPG','Long Walk to Freedom: The Autobiography of Nelson Mandela','Paperback','Nelson Mandela is one of the great moral and political leaders of our time: an international hero whose lifelong dedication to the fight against racial oppression in South Africa won him the Nobel Peace Prize and the presidency of his country');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(6, 6, 'http://mlk-kpp01.stanford.edu/sitepages/files/autobiographyCover.gif','The Autobiography of Martin Luther King, Jr.','Paperback','Using Stanford Universitys voluminous collection of archival material, including previously unpublished writings, interviews, recordings, and correspondence, King scholar Clayborne Carson has constructed a remarkable first-person account of Dr. Kings extraordinary life.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(6, 6, 'http://ecx.images-amazon.com/images/I/51blLOwsoGL._SY344_BO1,204,203,200_.jpg','Gandhi An Autobiography: The Story of My Experiments With Truth','Paperback','He recounts the story of his life and how he developed his concept of active nonviolent resistance, which propelled the Indian struggle for independence and countless other nonviolent struggles of the twentieth century.');
SELECT * FROM BOOKS;

SELECT * FROM BOOKS WHERE USER_ID = 2;

select category.id, category.name, count(books.category_id) as bookcounts
from category left outer join books on category.id = books.category_id 
group by category.id,category.name;

select * from category
left join books on category.id = books.category_id;

select * from category
left outer join books on category.id = books.category_id
where category.user_id = 2;

select category.id, category.name, count(books.id) from category
left outer join books on category.id = books.category_id
where category.user_id = 5
group by category.id, category.name;



