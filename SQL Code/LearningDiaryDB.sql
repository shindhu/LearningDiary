-- Table Users
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

select password from users  where sec_ques_answer = lower('JANU');


-- Table Category
DROP TABLE CATEGORY;
SET SCHEMA APP;
CREATE TABLE CATEGORY ( ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	USER_ID INT NOT NULL,
	NAME VARCHAR(50) NOT NULL,
	PRIMARY KEY(ID));
INSERT INTO CATEGORY (USER_ID, NAME) values (2,'Autobiography & Biography');-- 1
INSERT INTO CATEGORY (USER_ID, NAME) values (2,'Business & Money');--2
INSERT INTO CATEGORY (USER_ID, NAME) values (2,'Computer & Programming');--3
INSERT INTO CATEGORY (USER_ID, NAME) values (2,'Reference');--4
INSERT INTO CATEGORY (USER_ID, NAME) values (2,'Stories');--5
INSERT INTO CATEGORY (USER_ID, NAME) VALUES (2,'Other');--6
SELECT * FROM CATEGORY;

select * from category where name like lower('%B%') ;


select id, name from category where user_id = 3;

update category set name='baaaaack' where id=9;

-- Table Books
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
	
-- 1 Autobiography Books
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 1, 'http://upload.wikimedia.org/wikipedia/en/3/3a/Wings_of_Fire_by_A_P_J_Abdul_Kalam_Book_Cover.jpg','Wings of Fire','HardCover','When the student is ready, the teacher will appear - How true!');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 1, 'http://d.gr-assets.com/books/1348842650l/3142407.jpg','The Name Is Rajinikanth','HardCover','Super Star in kollywood, devotte of Babaji & Ragavendra');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 1, 'http://upload.wikimedia.org/wikipedia/en/e/e4/Steve_Jobs_by_Walter_Isaacson.jpg','Steve Jobs','HardCover',' American entrepreneur, marketer, and inventor, who was the cofounder, chairman, and CEO of Apple Inc. ');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 1, 'https://s3-eu-west-1.amazonaws.com/userlike-cdn-blog/in-the-plex.jpg','In The Plex','MP3 & CD',' How Google Thinks, Works, and Shapes Our Lives. The key to Google’s success in all these businesses, Levy reveals, is its engineering mind-set and adoption of such Internet values as speed, openness, experimentation, and risk taking.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 1, 'http://d.gr-assets.com/books/1411331352l/23164924.jpg','Reagan','Kindle','Reagan shut down the age of liberalism, Brands shows, and ushered in the age of Reagan, whose defining principles are still powerfully felt today.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 1, 'http://ecx.images-amazon.com/images/I/51YWeAneftL._SY344_BO1,204,203,200_.jpg','The President and the Apprentice','HardCover','Eisenhower and Nixon, 1952-1961');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 1, 'http://ecx.images-amazon.com/images/I/51MxjDM80-L._SY344_BO1,204,203,200_.jpg','The Autobiography of Benjamin Franklin','HardCover','Covering his life up to his prewar stay in London as representative of the Pennsylvania Assembly, this charming self-portrait recalls Franklins boyhood, his determination to achieve high moral standards, his work as a printer, experiments with electricity, political career, experiences during the French and Indian War, and more.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 1, 'http://ecx.images-amazon.com/images/I/51O5LjozmAL._SY344_BO1,204,203,200_.jpg','The Autobiography of Malcolm X: As Told to Alex Haley','Paperback','With its first great victory in the landmark Supreme Court decision Brown v. Board of Education in 1954, the civil rights movement gained the powerful momentum it needed to sweep forward into its crucial decade, the 1960s. ');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 1, 'http://img1.imagesbn.com/p/9780316548182_p0_v2_s260x420.JPG','Long Walk to Freedom: The Autobiography of Nelson Mandela','Paperback','Nelson Mandela is one of the great moral and political leaders of our time: an international hero whose lifelong dedication to the fight against racial oppression in South Africa won him the Nobel Peace Prize and the presidency of his country');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 1, 'http://mlk-kpp01.stanford.edu/sitepages/files/autobiographyCover.gif','The Autobiography of Martin Luther King, Jr.','Paperback','Using Stanford Universitys voluminous collection of archival material, including previously unpublished writings, interviews, recordings, and correspondence, King scholar Clayborne Carson has constructed a remarkable first-person account of Dr. Kings extraordinary life.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 1, 'http://ecx.images-amazon.com/images/I/51blLOwsoGL._SY344_BO1,204,203,200_.jpg','Gandhi An Autobiography: The Story of My Experiments With Truth','Paperback','He recounts the story of his life and how he developed his concept of active nonviolent resistance, which propelled the Indian struggle for independence and countless other nonviolent struggles of the twentieth century.');



-- 2 Business & Money
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 2,'http://ecx.images-amazon.com/images/I/51RTUeTmznL._SY344_BO1,204,203,200_.jpg','The Transition from Sales and Operations Planning to Integrated Business Planning','Kindle','This book paints a really good picture of how to evolve the IBP process to concentrate on strategy deployment and financial integration. <br> Enterprise Sales and Operations Planning is the precursor to The Transition from Sales and Operations Planning to Integrated Business Planning.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID,  IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 2,'http://ecx.images-amazon.com/images/I/51yQ1EGKqAL._SY344_BO1,204,203,200_.jpg','Ratio Analysis Fundamentals','Kindle','How 17 Financial Ratios Can Allow You to Analyse Any Business on the Planet.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID,  IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 2,'http://ecx.images-amazon.com/images/I/51KkNz-xnFL.jpg','The Little Book of Money','Kindle','the very best insights from some of the hottest names in the industry in one essential guide to the ins and outs of the investment world.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID,  IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 2,'http://ecx.images-amazon.com/images/I/51qhWqPSpzL.jpg','Financial Statements','Kindle','A Step-by-Step Guide to Understanding and Creating Financial Reports.  The books uniquely visual approach, you will be able to see exactly how each transaction affects the three key financial statement of the enterprise.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID,  IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 2,'http://ecx.images-amazon.com/images/I/51mMwnMiKOL._SY344_BO1,204,203,200_.jpg','Financial Intelligence','Kindle','A Managers Guide to Knowing What the Numbers Really Mean. Gives nonfinancial managers the confidence to understand the nuance beyond the numbers—to help bring everyday work to a new level.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID,  IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 2,'http://ecx.images-amazon.com/images/I/41x%2Bfv%2BdVDL._SX258_BO1,204,203,200_.jpg','Fundamentals of Investing in Oil and Gas','kindle','A detailed explanation on the Upstream and DownStream Sector of the industry. ');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID,  IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 2,'http://ecx.images-amazon.com/images/I/514BYPaoW1L._SY344_BO1,204,203,200_.jpg','Financial Shenanigans','Kindle','Financial statement analysis in an easy-to-digest format with lots of war stories. Guaranteed to help investors in their quest to avoid ticking time bombs in their portfolios.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 2, 'http://ecx.images-amazon.com/images/I/5113wZDGuCL._SX258_BO1,204,203,200_.jpg','Buying Real Estate Without Cash OR Credit','HardCover','3 Biggest marketing mistakes most beginning investors make. The 3 most important terms deal acquisition stratergies');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 2, 'http://img1.imagesbn.com/p/9780446691840_p0_v1_s260x420.JPG','The ABCs of Real Estate Investing','HardCover','The secrets of finding hidden profits most investors miss');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 2,'http://d.gr-assets.com/books/1387728067l/19736170.jpg','The Business Book(Big Ideas Simply Explained)','kindle','Packed with innovative graphics and simple explanations of business concepts, from managing risk and alternative business models to effective leadership and thinking outside the box, The Business Book covers every facet of business management. 
				Big ideas make great business thinkers and leaders. From Adam Smith and Andrew Carnegie to Bill Gates and Warren Buffett, The Business Book is perfect for college students, would-be entrepreneurs, or anyone interested in how business works.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 2, 'http://ecx.images-amazon.com/images/I/51TXJ-YCNpL._SY344_BO1,204,203,200_.jpg','Dale Carnagie Lifetime Plan For Success','HardCover','How to Win Friends & Influence People and How to Stop Worrying & Start Living');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 2, 'http://d.gr-assets.com/books/1298263222l/9793361.jpg','The Decision Book: 50 Models for Strategic Thinking ','Kindle','A short, sharp guide to tackling life’s biggest challenges: understanding ourselves and making the right choices.');


-- 3 Computer & Programming
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 3, 'http://ecx.images-amazon.com/images/I/51PNFtMQBaL._SX258_BO1,204,203,200_.jpg','Murachs Java Servlets and JSP','HardCover','Easy book to learn java servlets and jsp for Beginners');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 3,'http://www.headfirstlabs.com/Images/hfjava_cover.gif','Head First Java 2nd Edition','HardCover','Book has explained in simple terms');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 3,'http://ecx.images-amazon.com/images/I/415rs6vVwoL._SY344_BO1,204,203,200_.jpg','The Java Tutorial 5th Edition','HardCover','Book revised for java 7 platform standard Edition and generics, Java Web Start, and applets have also been updated.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 3,'http://ecx.images-amazon.com/images/I/51nEd4mzgfL._SX258_BO1,204,203,200_.jpg','OCA/OCP Java SE 7 Programmer I & II Study Guide (Exams 1Z0-803 & 1Z0-804)','HardCover','Challenging exercises, a certification summary, a two-minute drill, and a self-test to reinforce the topics presented.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 3,'http://it-ebooks.info/images/ebooks/5/oca_java_se_7_programmer_i_certification_guide.jpg','OCA Java SE 7 Programmer I Certification Guide: Prepare for the 1ZO-803 exam','iBooks','Covers all exam topics, Hands-on coding exercises, How to avoid built-in traps and pitfalls');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 3,'http://sourceforge.net/p/hfdp-cpp/screenshot/78955.jpg','Head First Design Patterns','iBooks','shows you the tried-and-true, road-tested patterns used by developers to create functional, elegant, reusable, and flexible software. ');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 3,'http://ecx.images-amazon.com/images/I/51poMjBx7PL._SY344_BO1,204,203,200_.jpg','Effective Java (2nd Edition)','iBooks','78 indispensable programmer’s rules of thumb: working, best-practice solutions for the programming challenges');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 3,'http://ecx.images-amazon.com/images/I/51XfhCxhfIL._SY344_BO1,204,203,200_.jpg','Java 7 Pocket Guide','iBooks','Programming examples, tables, figures, and lists, as well as supplemental information about topics including the Java Scripting API, third-party tools, and the basics of the Unified Modeling Language (UML).');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 3,'http://www.informit.com/ShowCover.aspx?isbn=0805353402','Object-oriented-analysis-and-design-with-applications','HardCover','Pragmatic advice on a variety of issues-including classification, implementation strategies, and cost-effective project management.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 3,'http://dl.ebook-dl.com/Picture/PicPage/Head_First_HTML_and_CSS_Elisabeth_Robson_Eric_Freeman(www.ebook-dl.com)_Page_01.jpg','Head First HTML and CSS','HardCover','A visually-rich format designed for the way your brain works. Using the latest research in neurobiology, cognitive science, and learning theory, this book will load HTML and CSS into your brain in a way that sticks.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 3,'http://ecx.images-amazon.com/images/I/51XvTMMO5RL.jpg','Head First jQuery','HardCover','Amazing JavaScript library by learning how to navigate HTML documents while handling events, effects, callbacks, and animations.');


-- 4 Reference
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 4,'http://img6a.flixcart.com/img/608/9780981475608.jpg','Speakers Edge','HardCover','Secrets and Stratergies for Connecting with Any Audience');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 4,'http://d.gr-assets.com/books/1410191571l/21856367.jpg','The Innovators','Kindle','How a Group of Hackers, Geniuses, and Geeks Created the Digital Revolution. Revealing story of the people who created the computer and the Internet.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 4,'http://ecx.images-amazon.com/images/I/51ZQqp9g80L._SY344_BO1,204,203,200_.jpg','Narrative of the Life of Frederick Douglass','Paperback','Former slave, impassioned abolitionist, brilliant writer, newspaper editor and eloquent orator whose speeches fired the abolitionist cause, Frederick Douglass (1818–1895) led an astounding life. ');


-- 5 Stories
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 5,'http://d.gr-assets.com/books/1357361164l/9864913.jpg','Jaya: An Illustrated Retelling of the Mahabharata','Kindle','High above the sky stands Swarga, paradise, abode of the gods. Still above is Vaikuntha, heaven, abode of God.The doorkeepers of Vaikuntha are the twins, Jaya and Vijaya, both whose names mean ‘victory’. One keeps you in Swarga; the other raises you into Vaikuntha. In Vaikuntha there is bliss forever, in Swarga there is pleasure for only as long as you deserve.
			Mahabharata version of the Shakuntalam and the Ramayana, and the dating of the war based on astronomical data. With clarity and simplicity, the tales in this elegant volume reveal the eternal relevance of the Mahabharata, the complex and disturbing meditation on the human condition that has shaped Indian thought for over 3000 years.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 5,'http://ecx.images-amazon.com/images/I/51jx4ub88QL._SX258_BO1,204,203,200_.jpg','7 Secrets of the Goddess','Kindle','Lakshmi massages Vishnu’s feet. Is this male domination? Kali stands on Shiva’s chest. Is this female domination? Shiva is half a woman. Is this gender quality? Why then is Shakti never half a man? Taken literally, stories, symbols and rituals of Hindu mythology have much to say about gender relationships. Taken symbolically, they reveal many more things about humanity and nature. Which is the correct reading? The fourth title in the bestselling ‘7 Secrets’ series focuses on the Goddess, and respected mythologist Devdutt Pattanaik tries to unravel the secrets locked within her stories, symbols and rituals.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 5,'http://d.gr-assets.com/books/1342687810l/12677794.jpg','7 Secrets of Shiva','kindle','Smeared with ash, draped in animal hide, he sits atop the snow-capped mountain, skull in hand, withdrawn, with dogs for company, destroying the world with his, indifference. He is God who the Goddess shall awaken. His name is Shiva. Locked in his stories, symbols and rituals are the secrets of our ancestors. This book attempts to unlock seven');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 5,'http://devdutt.com/w/wp-content/uploads/2011/10/Vishnu_Cover_New.jpg','7 Secrets of Vishnu','Kindle','It is significant that the stories of Vishnu rose to prominence after the rise of Buddhism. Prior to that, Hinduism was the religion of the elite-based complex rituals known as yagna and esoteric speculations captured in texts known as the Aranyakas and the Upanishads. Bestselling author Devdutt Pattanaik offers insights into the stories and pictures of Vishnu.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 5,'http://upload.wikimedia.org/wikipedia/en/8/88/WhoMovedMyCheeseCover.jpg','Who Moved My Cheese','HardCover','An amazing way to DEAL with Change in your Work and in your Life');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 5,'http://www.indiannewsandtimes.com/wp-content/uploads/2013/05/ComCollection_books3.jpg','Amar Chitra Katha Complete Collection','HardCover','Stories will take you back to your roots and acquaint you with men, women, events and occurrences which have shaped India over the years.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 5,'http://ecx.images-amazon.com/images/I/51rPmXVVwfL._SY344_BO1,204,203,200_.jpg','Mahabharata: A Modern Retelling','Kindle','Mahabharata tells the story of a royal dynasty, descended from gods, whose feud over their kingdom results in a devastating war.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 5,'http://2.bp.blogspot.com/_giqzvNZmzG4/Sa91VPvoWMI/AAAAAAAAAHo/1IeOMvmvj34/s200/9780140298666.jpg','The Ramayana','Kindle','Ramayana tells the tragic and magical story of Rama, the prince of Ayodhya, an incarnation of Lord Visnu, born to rid the earth of the terrible demon Ravana. Exiled for fourteen years because of his stepmother’s fit of jealousy on the eve of his coronation, Rama enters the forests of Dandaka with his beautiful wife Sita and devoted brother Laksmana. Sita is abducted from the forest by Ravana who takes her to his isolated kingdom on the far side of the southern ocean. The two brothers set out to rescue her and, along the way, make an alliance with a dispossessed monkey, king Sugriva. At the end of a bloody war Ravana is killed and Sita, reunited with her husband, and victorious Rama returns to Ayodhya to claim the throne that is rightfully his.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 5,'http://www.penguin.com.au/jpg-large/9780140447903.jpg','The Bhagavad Gita','Kindle','Conversation between Arjuna the warrior and his charioteer Krishna, the manifestation of God.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 5,'http://ecx.images-amazon.com/images/I/61qDIVyHk2L._SX258_BO1,204,203,200_.jpg','Indian Childrens Favorite Stories','Kindle','Retold for an international audience, the beautifully illustrated stories will give children of all ages a glimpse into the fables and folklore of India including tales of how the Lord Krishna escapes the evil Kamsas repeated attempts to kill him, and how the elephant keepers daughter, Rani, humbles an unwise and unjust king by emptying his storehouses of rice.');


-- 6 Other
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 6,'http://pxhst.co/avaxhome/b7/2e/002d2eb7_medium.jpeg','Harvard Business School Confidential: Secrets of Success','Kindle','Harvard Business School is the iconic business school. An admission ticket to HBS is a hot commodity and an HBS degree is highly respected in the business world.  This book, written by an HBS grad and seasoned businesswoman, tells you why. It is a distillation of the most valuable and pragmatic but yet easiest to learn concepts taught at HBS.');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 6,'http://www.gannett-cdn.com/-mm-/f9c56189b2707e4e79d9308ecb44a51270534ead/c=0-13-288-398&r=537&c=0-0-534-712/local/-/media/2015/02/13/USATODAY/USATODAY/635594341739927965-Wright-Brothers---Cover-ARt.jpg','The Wright Brothers','Kindle','Far more than a couple of unschooled Dayton bicycle mechanics who happened to hit on success, they were men of exceptional courage and determination, and of far-ranging intellectual interests and ceaseless curiosity, much of which they attributed to their upbringing. ');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 6,'http://d.gr-assets.com/books/1413166411l/18143977.jpg','All the Light We Cannot See: A Novel','Kindle','When she is six, Marie-Laure goes blind and her father builds a perfect miniature of their neighborhood so she can memorize it by touch and navigate her way home. When she is twelve, the Nazis occupy Paris and father and daughter flee to the walled citadel of Saint-Malo, where Marie-Laure’s reclusive great-uncle lives in a tall house by the sea. '); 
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 6,'http://d.gr-assets.com/books/1421709869l/22557272.jpg','The Girl on the Train: A Novel','Kindle','she sees something shocking. It’s only a minute until the train moves on, but it’s enough. Now everything’s changed. Unable to keep it to herself, Rachel offers what she knows to the police, and becomes inextricably entwined in what happens next, as well as in the lives of everyone involved. Has she done more harm than good?');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 6,'http://ecx.images-amazon.com/images/I/51OiLCU-zyL._SY344_BO1,204,203,200_.jpg','What Alice Forgot','Kindle','Ultimately, Alice must discover whether forgetting is a blessing or a curse, and whether it’s possible to start over…');
INSERT INTO BOOKS(USER_ID, CATEGORY_ID, IMAGE, NAME, BOOK_FORMAT, NOTES) VALUES(2, 6,'http://ecx.images-amazon.com/images/I/51QuJvdTXfL._SY344_BO1,204,203,200_.jpg','Pinkalicious: Cherry Blossom','Kindle','Pinkalicious experiences a traditional Japanese cherry blossom celebration and learns to fly a kite with the help of a new friend.');
SELECT * FROM BOOKS;

-- get books by user_id
select * from books where user_id =2;
select name from books;

select * from books where book_format like '%Kindle%';

-- like syntax
select * from books where name like '%what%' ;


-- prints the category name by category_id in books table
select category.id, category.name from category
left outer join books on category.id = books.category_id
where books.category_id = 6
group by category.id, category.name;

set schema app;

-- prints number of books in each category for each user
select category.id, category.name, count(books.id) as bookcounts 
from category left outer join books on category.id = books.category_id
where category.user_id = 3
group by category.id, category.name;

-- to display the category name and count of books in each category and shows count as 0 if there is no book in oone of the category
select category.id, category.name, count(books.category_id) as bookcounts
from category left outer join books on category.id = books.category_id 
group by category.id,category.name;

-- print book count for each user
select users.id, users.username, users.password, users.email, count(books.user_id) as bookscount 
from users left outer join books on users.id = books.user_id 
group by users.id, users.username, users.password, users.email;


select id, category_id, image, name, book_format, notes from books where user_id=11 order by name asc ;

-- prints categories id, name and bookcounts in each categroy
select category.id, category.name, count(books.category_id) as bookcounts
from category left outer join books on category.id = books.category_id 
group by category.id,category.name;

-- same as printing select * from books
select * from category
left join books on category.id = books.category_id;

-- prints user_id = 2 books
select * from category
left outer join books on category.id = books.category_id
where category.user_id = 2;

-- prints number of books in each category for each user
select category.id, category.name, count(books.id) as bookcounts from category
left outer join books on category.id = books.category_id
where category.user_id = 3
group by category.id, category.name;

-- get books by book id
select * from books where id=4;
select book_format from books;

-- get books by keyword
select id, name, notes 
from books
where name like '%Financ%' or notes like'%Financ%';
set schema app;

-- prints all the name and notes in lowercase
select lower(name), lower(notes) from books;

select * from books where name like '%st%' or  notes like '%se%';

-- to display the category name and count of books in each category
select category.id,category.name, count(books.name) as bookcounts
from category, books
where category.id = books.category_id
group by category.id,category.name;

-- to display the category name and count of books in each category and shows count as 0 if there is no book in oone of the category
select category.id, category.name, count(books.category_id) as bookcounts
from category left outer join books on category.id = books.category_id 
group by category.id,category.name;

-- order books in asc by name and id of the book
select * from books order by name asc;
select * from books order by id asc;

-- update book
update books set name='ghjijk' where id=56;

-- books in alphabetical order according to category_id
select * from books where category_id=2 order by name asc;


delete from category, books
where books.category_id = 14;

