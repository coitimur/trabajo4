
DROP TABLE IF EXISTS webshop.phones_images;
DROP TABLE IF EXISTS webshop.phones;
DROP TABLE IF EXISTS webshop.users;

DROP SEQUENCE  IF EXISTS webshop.sqphoneimages;
DROP SEQUENCE IF EXISTS webshop.sqphones;
DROP SEQUENCE IF EXISTS webshop.squsers;
 
CREATE SCHEMA webshop;

 CREATE SEQUENCE webshop.sqphoneimages
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
  
 CREATE SEQUENCE webshop.sqphones
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
 
CREATE SEQUENCE webshop.squsers
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;



CREATE TABLE webshop.phones (
    id integer NOT NULL DEFAULT nextval('webshop.squsers'::regclass),
    additionalFeatures character varying(288),
    android_os character varying(110),
    android_ui character varying(100),
    availability character varying(57),
    battery_standbyTime character varying(90),
    battery_talkTime character varying(70),
    battery_type character varying(91),
    camera_features character varying(50),
    camera_features_primary character varying(140),
    connectivity_bluetooth character varying(130),
    connectivity_cell character varying(178),
    connectivity_gps character varying(40),
    connectivity_infrared character varying(50),
    connectivity_wifi character varying(120),
    description character varying(1246),
    display_screenResolution character varying(160),
    display_screenSize character varying(100),
    display_touchScreen character varying(90),
    hardware_accelerometer character varying(90),
    hardware_audioJack character varying(90),
    hardware_cpu character varying(90),
    hardware_fmRadio character varying(90),
    hardware_physicalKeyboard character varying(90),
    hardware_usb character varying(90),
    identifier character varying(90),
    images character varying(90),
    name character varying(90),
    sizeAndWeight_dimensions character varying(50),
    sizeAndWeight_weight character varying(50),
    storage_flash character varying(60),
    storage_ram character varying(50),
	CONSTRAINT phones_pkey PRIMARY KEY (id)
);

CREATE TABLE webshop.phones_images (
    id integer NOT NULL DEFAULT nextval('webshop.sqphoneimages'::regclass),
	id_phone integer,
    img character varying(288),
	CONSTRAINT phonesimages_pkey PRIMARY KEY (id),
	CONSTRAINT phones_phonesimages_fk FOREIGN KEY (id_phone)
      REFERENCES webshop.phones (id)
);


CREATE TABLE webshop.users
(
  id integer NOT NULL DEFAULT nextval('webshop.squsers'::regclass),
  description character varying(450),
  email character varying(150),
  local_email  character varying(150),
  local_password character varying(255),
  facebook_id character varying(150),
  facebook_token character varying(350),
  facebook_email character varying(150),
  facebook_name character varying(150),
  twitter_id character varying(150),
  twitter_token character varying(150),
  twitter_displayname character varying(150),
  twitter_username character varying(150),
  google_id character varying(150),
  google_token character varying(150),
  google_email character varying(150),
  google_name character varying(150),
  id_user integer,
  CONSTRAINT users_pkey PRIMARY KEY (id),
  CONSTRAINT users_users_fk FOREIGN KEY (id_user)
      REFERENCES webshop.users (id)
);

INSERT INTO webshop.phones(additionalFeatures,android_os,android_ui,availability,battery_standbyTime,battery_talkTime,battery_type,camera_features,camera_features_primary,connectivity_bluetooth,connectivity_cell,connectivity_gps,connectivity_infrared,connectivity_wifi,description,display_screenResolution,display_screenSize,display_touchScreen,hardware_accelerometer,hardware_audioJack,hardware_cpu,hardware_fmRadio,hardware_physicalKeyboard,hardware_usb,identifier,images,name,sizeAndWeight_dimensions,sizeAndWeight_weight,storage_flash,storage_ram) VALUES ('Adobe Flash Player 10, Quadband GSM Worldphone, Advance Business Security, Complex Password Secure, Review & Edit Documents with Quick Office, Personal 3G Mobile Hotspot for up to 5 WiFi enabled Devices, Advanced Social Networking brings all social content into a single homescreen widget','Android 2.2',NULL,'Verizon','330 hours','7 hours','Lithium Ion (Li-Ion) (1400 mAH)','Video','5.0 megapixels','Bluetooth 2.1','800/1900 CDMA EVDO Rev. A with dual diversity antenna, 850/900/1800/1900MHz GSM, GPRS Class 12, EDGE Class 12, 850/1900/2100 WCDMA (category 9/10), HSDPA 10.2mbps, HSUPA 1.8 mbps','True','False','802.11 b/g/n','Access your work directory, email or calendar with DROID Pro by Motorola., an Android-for-business smartphone with corporate-level security. It features both a QWERTY keyboard and touchscreen, a speedy 1 GHz processor and Adobe® Flash® Player 10.','HVGA (480 x 320)','3.1 inches','True','True','3.5mm','1 GHz TI OMAP','False','True','USB 2.0','droid-pro-by-motorola','img/phones/droid-pro-by-motorola.1.jpg','DROID™ Pro by Motorola','11.7 mm (d)','134.0 grams','2048MB','512MB');


INSERT INTO webshop.phones(additionalFeatures,android_os,android_ui,availability,battery_standbyTime,battery_talkTime,battery_type,camera_features,camera_features_primary,connectivity_bluetooth,connectivity_cell,connectivity_gps,connectivity_infrared,connectivity_wifi,description,display_screenResolution,display_screenSize,display_touchScreen,hardware_accelerometer,hardware_audioJack,hardware_cpu,hardware_fmRadio,hardware_physicalKeyboard,hardware_usb,identifier,images,name,sizeAndWeight_dimensions,sizeAndWeight_weight,storage_flash,storage_ram) VALUES ('Gorilla Glass display, Dedicated Camera Key, Ring Silence Switch, Swype keyboard.','Android 2.2',NULL,'Dell Stage,T-Mobile','400 hours','7 hours','Lithium Ion (Li-Ion) (1400 mAH)','Video','8.0 megapixels','Bluetooth 2.1','850/1900/2100 3G; 850/900/1800/1900 GSM/GPRS/EDGE 900/1700/2100 3G; 850/900/1800/1900 GSM/GPRS/EDGE','True','False','802.11 b/g/n','The Venue is the perfect one-touch, Smart Phone providing instant access to everything you love. All of Venue''s features make it perfect for on-the-go students, mobile professionals, and active social communicators who love style and performance. Elegantly designed, the Venue offers a vibrant, curved glass display that’s perfect for viewing all types of content. The Venue’s slender form factor feels great in your hand and also slips easily into your pocket.  A mobile entertainment powerhouse that lets you download the latest tunes from Amazon MP3 or books from Kindle, watch video, or stream your favorite radio stations.  All on the go, anytime, anywhere.','WVGA (800 x 480)','4.1 inches','True','True','3.5mm','1 Ghz processor','False','False','USB 2.0','dell-venue','img/phones/dell-venue.5.jpg','Dell Venue','12.9 mm (d)','164.0 grams','1000MB','512MB');

INSERT INTO webshop.phones(additionalFeatures,android_os,android_ui,availability,battery_standbyTime,battery_talkTime,battery_type,camera_features,camera_features_primary,connectivity_bluetooth,connectivity_cell,connectivity_gps,connectivity_infrared,connectivity_wifi,description,display_screenResolution,display_screenSize,display_touchScreen,hardware_accelerometer,hardware_audioJack,hardware_cpu,hardware_fmRadio,hardware_physicalKeyboard,hardware_usb,identifier,images,name,sizeAndWeight_dimensions,sizeAndWeight_weight,storage_flash,storage_ram) VALUES ('Adobe Flash Player 10, Quadband GSM Worldphone, Advance Business Security, Complex Password Secure, Review & Edit Documents with Quick Office, Personal 3G Mobile Hotspot for up to 5 WiFi enabled Devices, Advanced Social Networking brings all social content into a single homescreen widget','Android 2.2',NULL,'Verizon','230 hours','8 hours','Lithium Ion (Li-Ion) (1400 mAH)','Video','5.0 megapixels','Bluetooth 2.1','WCDMA 850/1900/2100, CDMA 800/1900, GSM 850/900/1800/1900, HSDPA 10.2 Mbps (Category 9/10), CDMA EV-DO Release A, EDGE Class 12, GPRS Class 12, HSUPA 1.8 Mbps','True','False','802.11 b/g/n','With Quad Band GSM, the DROID 2 Global can send email and make and receive calls from more than 200 countries. It features an improved QWERTY keyboard, super-fast 1.2 GHz processor and enhanced security for all your business needs.','FWVGA (854 x 480)','3.7 inches','True','True','3.5mm','1.2 GHz TI OMAP','False','True','USB 2.0','droid-2-global-by-motorola','img/phones/droid-2-global-by-motorola.2.jpg','DROID™ 2 Global by Motorola','13.7 mm (d)','169.0 grams','8192MB','512MB');

INSERT INTO webshop.phones(additionalFeatures,android_os,android_ui,availability,battery_standbyTime,battery_talkTime,battery_type,camera_features,camera_features_primary,connectivity_bluetooth,connectivity_cell,connectivity_gps,connectivity_infrared,connectivity_wifi,description,display_screenResolution,display_screenSize,display_touchScreen,hardware_accelerometer,hardware_audioJack,hardware_cpu,hardware_fmRadio,hardware_physicalKeyboard,hardware_usb,identifier,images,name,sizeAndWeight_dimensions,sizeAndWeight_weight,storage_flash,storage_ram) VALUES ('Adobe Flash Player 10, Quadband GSM Worldphone, Advance Business Security, Complex Password Secure, Review & Edit Documents with Quick Office, Personal 3G Mobile Hotspot for up to 5 WiFi enabled Devices, Advanced Social Networking brings all social content into a single homescreen widget','Android 2.2',NULL,'Verizon','330 hours','7 hours','Lithium Ion (Li-Ion) (1400 mAH)','Video','5.0 megapixels','Bluetooth 2.1','800/1900 CDMA EVDO Rev. A with dual diversity antenna, 850/900/1800/1900MHz GSM, GPRS Class 12, EDGE Class 12, 850/1900/2100 WCDMA (category 9/10), HSDPA 10.2mbps, HSUPA 1.8 mbps','True','False','802.11 b/g/n','Access your work directory, email or calendar with DROID Pro by Motorola., an Android-for-business smartphone with corporate-level security. It features both a QWERTY keyboard and touchscreen, a speedy 1 GHz processor and Adobe® Flash® Player 10.','HVGA (480 x 320)','3.1 inches','True','True','3.5mm','1 GHz TI OMAP','False','True','USB 2.0','droid-pro-by-motorola','img/phones/droid-pro-by-motorola.1.jpg','DROID™ Pro by Motorola','11.7 mm (d)','134.0 grams','2048MB','512MB');


INSERT INTO webshop.phones(additionalFeatures,android_os,android_ui,availability,battery_standbyTime,battery_talkTime,battery_type,camera_features,camera_features_primary,connectivity_bluetooth,connectivity_cell,connectivity_gps,connectivity_infrared,connectivity_wifi,description,display_screenResolution,display_screenSize,display_touchScreen,hardware_accelerometer,hardware_audioJack,hardware_cpu,hardware_fmRadio,hardware_physicalKeyboard,hardware_usb,identifier,images,name,sizeAndWeight_dimensions,sizeAndWeight_weight,storage_flash,storage_ram) VALUES ('Accessibility features: Tactile QWERTY keyboard, four-direction keypad, start and end call buttons, dedicated number keys, camera button, TalkBack screen reader','Android 2.1',NULL,'LG Home,Cellular South','500 hours','8 hours','Lithium Ion (Li-Ion) (1500 mAH)','Video','3.0 megapixels','Bluetooth 2.1','1.9 GHz CDMA PCS, 800 MHz CDMA, EVDO Rev. A, 1xRTT','True','False','802.11 b/g','Android plus QWERTY is a powerful duo. LG Axis melds a speedy UI with the limitless micro-entertainment of 80,000+ apps including voice-activated Google. Feel the tactile vibration on its tempered glass touchscreen. Take the fuzziness out of your fun with a 3.2MP camera that does 360° panoramics. And customize your home screens with shortcuts to your apps, favorites, and widgets. It''s the centerpiece of your life.','WVGA (800 x 480)','3.2 inches','True','True',NULL,'600 MHz Qualcomm MSM7627','False','True','USB 2.0','lg-axis','img/phones/lg-axis.2.jpg','LG Axis','16.0 mm (d)','158.0 grams','126MB','256MB');




INSERT INTO webshop.phones(additionalFeatures,android_os,android_ui,availability,battery_standbyTime,battery_talkTime,battery_type,camera_features,camera_features_primary,connectivity_bluetooth,connectivity_cell,connectivity_gps,connectivity_infrared,connectivity_wifi,description,display_screenResolution,display_screenSize,display_touchScreen,hardware_accelerometer,hardware_audioJack,hardware_cpu,hardware_fmRadio,hardware_physicalKeyboard,hardware_usb,identifier,images,name,sizeAndWeight_dimensions,sizeAndWeight_weight,storage_flash,storage_ram) VALUES (NULL,'Android 2.2',NULL,'MOTOBLUR,AT&T','400 hours','5 hours','Lithium Ion (Li-Ion) (1930 mAH)',NULL,NULL,'Bluetooth 2.1','WCDMA 850/1900/2100, GSM 850/900/1800/1900, HSDPA 14Mbps (Category 10) Edge Class 12, GPRS Class 12, eCompass, AGPS','True','False','802.11 a/b/g/n','MOTOROLA ATRIX 4G gives you dual-core processing power and the revolutionary webtop application. With webtop and a compatible Motorola docking station, sold separately, you can surf the Internet with a full Firefox browser, create and edit docs, or access multimedia on a large screen almost anywhere.','QHD (960 x 540)','4.0 inches','True','True','3.5mm','1 GHz Dual Core','False','False','USB 2.0','motorola-atrix-4g','img/phones/motorola-atrix-4g.3.jpg','MOTOROLA ATRIX™ 4G','10.95 mm (d)','135.0 grams',NULL,NULL);



INSERT INTO webshop.phones(additionalFeatures,android_os,android_ui,availability,battery_standbyTime,battery_talkTime,battery_type,camera_features,camera_features_primary,connectivity_bluetooth,connectivity_cell,connectivity_gps,connectivity_infrared,connectivity_wifi,description,display_screenResolution,display_screenSize,display_touchScreen,hardware_accelerometer,hardware_audioJack,hardware_cpu,hardware_fmRadio,hardware_physicalKeyboard,hardware_usb,identifier,images,name,sizeAndWeight_dimensions,sizeAndWeight_weight,storage_flash,storage_ram) VALUES ('Adobe® Flash® Lite® 3, DNLA, CrystalTalk™ PLUS technology','Android 2.1',NULL,'MOTOBLUR™,AT&T','216 hours','6 hours','Lithium Ion (Li-Ion) (1540 mAH)','Video','3.0 megapixels','Bluetooth 2.1','WCDMA 850/1900, GSM 850/900/1800/1900, HSDPA 7.2 Mbps (Category 7/8), EDGE Class 12, GPRS Class 12, HSUPA 2.0 Mbps','True','False','802.11 b/g/n','MOTOROLA BRAVO™ with MOTOBLUR™ with its large 3.7-inch touchscreen and web-browsing capabilities is sure to make an impression.  And it keeps your life updated and secure through MOTOBLUR.','WVGA (800 x 480)','3.7 inches','True','True','3.5mm','800 Mhz','True','False','USB 2.0','motorola-bravo-with-motoblur','img/phones/motorola-bravo-with-motoblur.2.jpg','MOTOROLA BRAVO™ with MOTOBLUR™','13.3 mm (d)','130.0 grams',NULL,NULL);

INSERT INTO webshop.phones(additionalFeatures,android_os,android_ui,availability,battery_standbyTime,battery_talkTime,battery_type,camera_features,camera_features_primary,connectivity_bluetooth,connectivity_cell,connectivity_gps,connectivity_infrared,connectivity_wifi,description,display_screenResolution,display_screenSize,display_touchScreen,hardware_accelerometer,hardware_audioJack,hardware_cpu,hardware_fmRadio,hardware_physicalKeyboard,hardware_usb,identifier,images,name,sizeAndWeight_dimensions,sizeAndWeight_weight,storage_flash,storage_ram) VALUES ('MOTOBLUR-enabled; battery manager; seven home screens; customize by moving or resizing widgets; Android HTML WebKit w/Flash Lite; BACKTRACK™ navigation pad behind screen','Android 2.1',NULL,'MOTOBLUR,Telus','267 hours','5 hours','Lithium Ion (Li-Ion) (1170 mAH)','Video','3.0 megapixels','Bluetooth 2.0','WCDMA 1700/2100, GSM 850/900/1800/1900, HSDPA 3.6 Mbps (Category 5/6), EDGE Class 12, GPRS Class 12','True','False','802.11 b/g','Motorola CHARM fits easily in your pocket or palm. Includes MOTOBLUR so you can sync and merge your contacts, emails, messages and posts with continuous updates and back-ups.','QVGA (320 x 240)','2.8 inches','True','True','3.5mm','600 MHz','False','True','USB 2.0','motorola-charm-with-motoblur','img/phones/motorola-charm-with-motoblur.2.jpg','Motorola CHARM™ with MOTOBLUR™','11.4 mm (d)','110.0 grams','150MB','512MB');

INSERT INTO webshop.phones_images VALUES (1, 1, 'img/phones/droid-pro-by-motorola.1.jpg');
INSERT INTO webshop.phones_images VALUES (2, 1, 'img/phones/droid-pro-by-motorola.0.jpg');
INSERT INTO webshop.phones_images VALUES (3, 2, 'img/phones/dell-venue.0.jpg');
INSERT INTO webshop.phones_images VALUES (4, 2, 'img/phones/dell-venue.1.jpg');
INSERT INTO webshop.phones_images VALUES (5, 2, 'img/phones/dell-venue.2.jpg');
INSERT INTO webshop.phones_images VALUES (6, 2, 'img/phones/dell-venue.3.jpg');
INSERT INTO webshop.phones_images VALUES (7, 2, 'img/phones/dell-venue.4.jpg');
INSERT INTO webshop.phones_images VALUES (8, 2, 'img/phones/dell-venue.5.jpg');
INSERT INTO webshop.phones_images VALUES (9, 3, 'img/phones/dell-venue.0.jpg');
INSERT INTO webshop.phones_images VALUES (10, 3, 'img/phones/droid-2-global-by-motorola.0.jpg');
INSERT INTO webshop.phones_images VALUES (11, 3, 'img/phones/droid-2-global-by-motorola.1.jpg');
INSERT INTO webshop.phones_images VALUES (12, 3, 'img/phones/droid-2-global-by-motorola.2.jpg');
INSERT INTO webshop.phones_images VALUES (15, 5, 'img/phones/lg-axis.0.jpg');
INSERT INTO webshop.phones_images VALUES (16, 5, 'img/phones/lg-axis.1.jpg');
INSERT INTO webshop.phones_images VALUES (17, 5, 'img/phones/lg-axis.2.jpg');
INSERT INTO webshop.phones_images VALUES (18, 6, 'img/phones/motorola-atrix-4g.0.jpg');
INSERT INTO webshop.phones_images VALUES (19, 6, 'img/phones/motorola-atrix-4g.1.jpg');
INSERT INTO webshop.phones_images VALUES (20, 6, 'img/phones/motorola-atrix-4g.2.jpg');
INSERT INTO webshop.phones_images VALUES (21, 6, 'img/phones/motorola-atrix-4g.3.jpg');
INSERT INTO webshop.phones_images VALUES (22, 7, 'img/phones/motorola-bravo-with-motoblur.0.jpg');
INSERT INTO webshop.phones_images VALUES (23, 7, 'img/phones/motorola-bravo-with-motoblur.1.jpg');
INSERT INTO webshop.phones_images VALUES (24, 7, 'img/phones/motorola-bravo-with-motoblur.2.jpg');
