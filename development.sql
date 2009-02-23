BEGIN TRANSACTION;
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
INSERT INTO "schema_migrations" VALUES('1');
INSERT INTO "schema_migrations" VALUES('2');
INSERT INTO "schema_migrations" VALUES('3');
INSERT INTO "schema_migrations" VALUES('4');
INSERT INTO "schema_migrations" VALUES('20080818225044');
INSERT INTO "schema_migrations" VALUES('20080924090821');
INSERT INTO "schema_migrations" VALUES('20080925125738');
INSERT INTO "schema_migrations" VALUES('20080927081812');
INSERT INTO "schema_migrations" VALUES('20080927085709');
INSERT INTO "schema_migrations" VALUES('20081213032512');
INSERT INTO "schema_migrations" VALUES('20090110114924');
INSERT INTO "schema_migrations" VALUES('20090112130236');
INSERT INTO "schema_migrations" VALUES('20090116114316');
INSERT INTO "schema_migrations" VALUES('20090117000723');
INSERT INTO "schema_migrations" VALUES('20090118133831');
INSERT INTO "schema_migrations" VALUES('20090118172133');
INSERT INTO "schema_migrations" VALUES('20090121074651');
INSERT INTO "schema_migrations" VALUES('20090121094249');
INSERT INTO "schema_migrations" VALUES('20090121102228');
INSERT INTO "schema_migrations" VALUES('20090121212823');
INSERT INTO "schema_migrations" VALUES('20090123065229');
INSERT INTO "schema_migrations" VALUES('20090124042242');
CREATE TABLE "snippets" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "slug" varchar(255) NOT NULL, "description" varchar(255) NOT NULL, "content" text, "value" integer, "public" boolean DEFAULT 't', "created_at" datetime, "updated_at" datetime);
INSERT INTO "snippets" VALUES(100,'proposals_form_text','Proposal: form text','If you had five minutes to talk to Portland what would you say? What if you only got 20 slides and they rotated automatically after 15 seconds? Launch a web site? Teach a hack? Talk about recent learnings, successes, failures? Fill out the form below to submit your talk. We are looking for talks that will inspire and teach, not recruiting or product pitches.',NULL,'t','2009-02-15 22:07:26','2009-02-15 22:07:26');
INSERT INTO "snippets" VALUES(103,'proposals_not_accepted_error','Proposals: error shown when not accepting proposals','Sorry, we are no longer accepting submissions.',NULL,'t','2009-02-15 22:07:26','2009-02-15 22:07:26');
INSERT INTO "snippets" VALUES(104,'login_openid_text','OpenID login: form text','Login with your OpenID account (<a onclick=''window.open(this.href);return false;'' href=''http://openid.net/what/''>what is OpenID?</a>) so you can create proposals and come back later to edit them. If you need an OpenID account, you can <a onclick=''window.open(this.href);return false;'' href=''http://openid.net/get/''>get a free account</a> in about a minute.',NULL,'t','2009-02-15 22:07:26','2009-02-15 22:07:26');
INSERT INTO "snippets" VALUES(105,'proposals_openid_text','Proposals: OpenID text','<b>Optional:</b> To be able to edit your proposal later, please login first with an OpenID account (<a onclick=''window.open(this.href);return false;'' href=''http://openid.net/what/''>what is OpenID?</a>) so you can create proposals and come back later to edit them. If you need an OpenID account, you can <a onclick=''window.open(this.href);return false;'' href=''http://openid.net/get/''>get a free account</a> in about a minute.',NULL,'t','2009-02-15 22:07:26','2009-02-15 22:07:26');
INSERT INTO "snippets" VALUES(106,'tracks_index_intro','An introduction for the tracks index.','<p>In order to create a conference that promotes cross-pollination as well as providing space for in-depth discussion, we‚Äôve split the tracks into the following five areas:</p>',NULL,'t','2009-02-15 22:07:26','2009-02-15 22:07:26');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('tracks',2044733104);
INSERT INTO "sqlite_sequence" VALUES('comments',1079951143);
INSERT INTO "sqlite_sequence" VALUES('snippets',106);
INSERT INTO "sqlite_sequence" VALUES('proposals',1775154332);
INSERT INTO "sqlite_sequence" VALUES('session_types',2112683474);
INSERT INTO "sqlite_sequence" VALUES('users',1830235194);
INSERT INTO "sqlite_sequence" VALUES('open_id_authentication_associations',1);
INSERT INTO "sqlite_sequence" VALUES('open_id_authentication_nonces',2);
CREATE TABLE "open_id_authentication_associations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "issued" integer, "lifetime" integer, "handle" varchar(255), "assoc_type" varchar(255), "server_url" blob, "secret" blob);
INSERT INTO "open_id_authentication_associations" VALUES(1,1234735667,1209600,'{HMAC-SHA1}{4998923b}{4WZkfQ==}','HMAC-SHA1','https://myvidoop.com/openid','⁄>Á!KYûñ0˙2˚Ì‡P≠z∏÷');
CREATE TABLE "open_id_authentication_nonces" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "timestamp" integer NOT NULL, "server_url" varchar(255), "salt" varchar(255) NOT NULL);
INSERT INTO "open_id_authentication_nonces" VALUES(1,1234735677,'https://myvidoop.com/openid','jveGo8');
INSERT INTO "open_id_authentication_nonces" VALUES(2,1234735841,'https://myvidoop.com/openid','CqU9Ma');
CREATE TABLE "events" ("id" integer NOT NULL, "title" varchar(255), "deadline" datetime, "open_text" text, "closed_text" text, "created_at" datetime, "updated_at" datetime);
INSERT INTO "events" VALUES(2009,'Current Event','02/15/2010','Current Event is the premier event for all things shiny. We''re now accepting proposals, submit yours today!
','Current Event is the premier event for all things shiny. We''re no-longer accepting proposals, better luck next time.
','2009-02-15 22:07:26','2009-02-15 22:07:26');
INSERT INTO "events" VALUES(1975,'Old Event','02/15/2007','Old Event is the premier event for all things antiquated. We''re now accepting proposals, submit yours today!
','Old Event is the premier event for all things antiquated. We''re no-longer accepting proposals, better luck next time.
','2009-02-15 22:07:26','2009-02-15 22:07:26');
CREATE TABLE "comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "email" varchar(255), "message" text, "proposal_id" integer, "created_at" datetime, "updated_at" datetime);
INSERT INTO "comments" VALUES(261373840,NULL,'the_man@cia.gov','Please get in touch. We are here to help.',1775154332,'2009-02-15 22:07:26','2009-02-15 22:07:26');
INSERT INTO "comments" VALUES(286459336,NULL,'big_brother@fbi.gov','Pay no attention, everything is under control.',1775154332,'2009-02-15 22:07:26','2009-02-15 22:07:26');
INSERT INTO "comments" VALUES(1079951143,NULL,'i@hate.you','I find aardvarks morally offensive.',1693244076,'2009-02-15 22:07:26','2009-02-15 22:07:26');
CREATE TABLE "tracks" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "description" varchar(255), "color" varchar(255), "event_id" integer, "created_at" datetime, "updated_at" datetime, "excerpt" text);
INSERT INTO "tracks" VALUES(350318746,'Culture','Beyond the technology, what have you learned from open source? Do you participate in user groups or open-space events? Are open source groups inclusive or exclusive in the right ways? Let''s talk about how open source ideas affect things beyond our software, from group organization to creative projects to how we share knowledge.
* Understanding wiki culture
* What makes an open source project thrive?
* Open source in government
','#0aafdb',2009,'2009-02-15 22:07:26','2009-02-15 22:07:26','Beyond the technology, what have you learned from open source? Do you participate in user groups or open-space events?');
INSERT INTO "tracks" VALUES(864124565,'Chemistry','What''s underneath the hood in that database or operating system? How can Ruby run on Java, or Python on .NET? What are the interesting computational puzzles you''re exploring? This is where we get down to the real nitty-gritty of how our technology works.
Possible topics:
* Performance-tuning for PostgreSQL
* Why RubySpec?
* Open Source Linux Audio / Multimedia Distributions (JAD, Studio64, dyne:bolic)
* Multimedia, DRM, "Free as in Freedom", Codecs, etc. (might make more sense under "Culture")
* The Math Behind Search Engines
* Open Source Tools for Real-Time Audio Performance ("grace", ChucK)
* The Many Faces of Open Source Virtualization: VirtualBox, Xen, QEMU/KQemu, KVM, "chroot jails", Open VMware Tools, Open Source VMware Perl Toolkits, etc.
','#71cc00',2009,'2009-02-15 22:07:26','2009-02-15 22:07:26','What''s underneath the hood in that database or operating system?');
INSERT INTO "tracks" VALUES(1390920828,'Business','How do you run an open source business? Is it just the software, or how you operate as well? We want to hear what you know about building and growing a business in the f/oss world.
* Open source business models that work
* Picking the right license for the job
* Selling the philosophy to your customers
* The difference between sales and marketing, and why there really isn''t one. :)
* "Selling for geeks"
','#1bbb67',2009,'2009-02-15 22:07:26','2009-02-15 22:07:26','How do you run an open source business?');
INSERT INTO "tracks" VALUES(1838743749,'Hacks','Do you tinker with your hardware, warranty restrictions or not? Where are you pushing the boundaries of out-of-the-box technology? Has your electronics hobby taken over your life? Show us the interesting, innovative things you''re working on, outside of the pre-packaged options.
* Creating an arduino clone
* Open source rocketry
* "Circuit bending?"','#b937fb',2009,'2009-02-15 22:07:26','2009-02-15 22:07:26','Do you tinker with your hardware, warranty restrictions or not? Where are you pushing the boundaries of out-of-the-box technology?');
INSERT INTO "tracks" VALUES(2044733104,'Cooking','How do you make useful, functional software? What languages and tools do you employ? Tell us your recipes for creating software that gets the job done, from the beginner to the advanced level.
Possible topics:
* Using C libraries in Ruby/Python/Perl
* Getting up and running on Android
* Agile methodologies at work
* Behavior-driven development
','#f58b00',2009,'2009-02-15 22:07:26','2009-02-15 22:07:26','How do you make useful, functional software? What languages and tools do you employ?');
CREATE TABLE "proposals_users" ("proposal_id" integer, "user_id" integer, "created_at" datetime, "updated_at" datetime);
INSERT INTO "proposals_users" VALUES(629394551,1402298589,'2009-02-15 22:07:26','2009-02-15 22:07:26');
INSERT INTO "proposals_users" VALUES(1693244076,1830235192,'2009-02-15 22:07:26','2009-02-15 22:07:26');
INSERT INTO "proposals_users" VALUES(1775154332,894972291,'2009-02-15 22:07:26','2009-02-15 22:07:26');
CREATE TABLE "proposals" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "presenter" varchar(255), "affiliation" varchar(255), "email" varchar(255), "website" varchar(255), "biography" varchar(255), "title" varchar(255), "description" varchar(255), "agreement" boolean DEFAULT 't', "created_at" datetime, "updated_at" datetime, "event_id" integer, "submitted_at" datetime, "note_to_organizers" text, "excerpt" text(400), "track_id" integer, "session_type_id" integer);
INSERT INTO "proposals" VALUES(629394551,NULL,'Quentin','QuentinCO','quentin@quentinco.co.uk','http://quentinco.co.uk/~quentin/','Quentin is.','My favorite widgets.','Widgets rock.

"Widget" is frequently used in texts and speech, especially in the context of economics, to indicate a hypothetical "any-product." Companies in such texts will frequently be given names such as "ABC Widgets" or "Acme Widget Corp." to indicate that the particular business of the hypothetical company is not relevant to the topic of discussion.

The term appeared in the 1985 Rodney Dangerfield feature film comedy Back to School, in a college economics classroom scene in which the professor uses the term to describe a hypothetical company whose product is irrelevant to the discussion.
','t','2009-02-15 22:07:26','2009-02-15 22:07:26',2009,'02/15/2009',NULL,'A widget is a placeholder name for an object or, more specifically, a mechanical or other manufactured device. It is an abstract unit of production.
',864124565,1464200786);
INSERT INTO "proposals" VALUES(1693244076,NULL,'Aaron','Aaron''s Aardvarks','aaron@aardvarks.au','http://aardvarks.au/','Aaron has Aardvarks.','My favorite Aardvarks.','Aardvarks are awesome.

It is sometimes called "antbear", "anteater", "Cape anteater" (after the Cape of Good Hope), "earth hog" or "earth pig". The name comes from the Afrikaans/Dutch for "earth pig" (aarde earth, varken pig), because early settlers from Europe thought it resembled a domesticated pig. However, the aardvark is not closely related to the pig; rather, it is the sole recent representative of the obscure mammalian order Tubulidentata, in which it is usually considered to form a single variable species of the genus Orycteropus, coextensive with the family Orycteropodidae. Nor is the aardvark closely related to the South American anteater, despite sharing some characteristics and a superficial resemblance.[3] The closest living relatives of the aardvark are the elephant shrews, along with the sirenians, hyraxes, tenrecs, and elephants.

One of the most distinctive characteristics of the Tubulidentata is (as the name implies) their teeth. Instead of having a pulp cavity, each tooth has a cluster of thin, upright, parallel tubes of vasodentin (a modified form of dentine), with individual pulp canals, held together by cementum. The teeth have no enamel coating and are worn away and regrow continuously. The aardvark is born with conventional incisors and canines at the front of the jaw, which fall out and are not replaced.

Genetically speaking, the aardvark is a living fossil, as its chromosomes are highly conserved, reflecting much of the early eutherian arrangement before the divergence of the major modern taxa.
','t','2009-02-15 22:07:26','2009-02-15 22:07:26',2009,'02/15/2009',NULL,'The Aardvark (Orycteropus afer) (afer: from Africa) is a medium-sized, burrowing, nocturnal mammal native to Africa.
',2044733104,1464200786);
INSERT INTO "proposals" VALUES(1775154332,NULL,'Clio',NULL,'clio@i_want_to_believe.com',NULL,'They walk amongst us.','Chupacabras and you','"I see it - coming here - hell-wind - titan blur - black wings - Yog-Sothoth save me - the three-lobed burning eye ..."

It is associated more recently with sightings of an allegedly unknown animal in Puerto Rico (where these sightings were first reported), Mexico, and the United States, especially in the latter''s Latin American communities.[1] The name comes from the animal''s reported habit of attacking and drinking the blood of livestock, especially goats. Physical descriptions of the creature vary. Eyewitness sightings have been claimed as early as 1990 in Puerto Rico, and have since been reported as far north as Maine, and as far south as Chile. It is supposedly a heavy creature, the size of a small bear, with a row of spines reaching from the neck to the base of the tail. Biologists and wildlife management officials view the Chupacabra as a contemporary legend.

The first reported attacks occurred in March 1995 in Puerto Rico.[3] In this attack, eight sheep were discovered dead, each with three puncture wounds in the chest area and completely drained of blood.[3] In 1975, similar killings in the small town of Moca, were attributed to El Vampiro de Moca (The Vampire of Moca).[4] Initially it was suspected that the killings were committed by a Satanic cult; later more killings were reported around the island, and many farms reported loss of animal life. Each of the animals had their bodies bled dry through a series of small circular incisions.

Puerto Rican comedian and entrepreneur Silverio P√©rez is credited with coining the term "chupacabras" soon after the first incidents were reported in the press.[5] Shortly after the first reported incidents in Puerto Rico, other animal deaths were reported in other countries, such as the Dominican Republic, Argentina, Bolivia, Chile, Colombia, Honduras, El Salvador, Nicaragua, Panama, Peru, Brazil, the United States, and Mexico.[3]
','t','2009-02-15 22:07:26','2009-02-15 22:07:26',1975,'02/15/2008',NULL,'The Chupacabra, also called el Chupacabras (pronunciation: /t Éupa''kab…æas/, from the Spanish words chupar, meaning "to suck", and cabra, meaning "goat"; literally "goat sucker") is a legendary cryptid rumored to inhabit parts of the Americas.
',2044733104,2112683474);
CREATE TABLE "tags" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255));
CREATE TABLE "taggings" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "tag_id" integer, "taggable_id" integer, "tagger_id" integer, "tagger_type" varchar(255), "taggable_type" varchar(255), "context" varchar(255), "created_at" datetime);
CREATE TABLE "session_types" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "description" text, "duration" integer, "event_id" integer, "created_at" datetime, "updated_at" datetime);
INSERT INTO "session_types" VALUES(1464200786,'Long-Form - 1 hour, 45 minutes','We''re especially interested in seeing interactive approaches: tutorials, guided discussions, or other hands-on explorations.',105,2009,'2009-02-15 22:07:26','2009-02-15 22:07:26');
INSERT INTO "session_types" VALUES(2112683474,'Short-Form - 45 minutes','A set of lightning talks, a one-or-more person presentation, a panel, or something else covering specific, concise material.',45,2009,'2009-02-15 22:07:26','2009-02-15 22:07:26');
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "login" varchar(255), "email" varchar(255), "crypted_password" varchar(40), "salt" varchar(40), "admin" boolean DEFAULT 'f', "created_at" datetime, "updated_at" datetime, "remember_token" varchar(255), "remember_token_expires_at" datetime, "using_openid" boolean DEFAULT 'f', "affiliation" varchar(128), "biography" text(2048), "website" varchar(1024), "complete_profile" boolean, "photo_file_name" varchar(255), "photo_content_type" varchar(255), "photo_file_size" integer, "first_name" varchar(255), "last_name" varchar(255));
INSERT INTO "users" VALUES(388040831,'gustavus','gustavus@purvis.edu','00742970dc9e6319f8019fd54864d3ea740f04b1','7e3041ebc2fc05a40c60028e2c4901a81035d3cd','f','2009-02-10 22:07:27','2009-02-15 22:07:27',NULL,NULL,'f','House of Vasa','Gustav II Adolf, (9 December 1594 ‚Äì 6 November 1632 (O.S.)[1] or Gustav II Adolphus, widely known in English by the Latinized name Gustavus Adolphus and variously in historical writings sometimes as simply just Gustavus, or Gustavus the Great, or Gustav Adolf the Great, (Swedish: Gustav Adolf den store, from the special distinction passed by the Swedish Parliament in 1634), was founder of the Swedish Empire (or Stormaktstiden ‚Äì "the era of great power") at the beginning of what is widely regarded as the Golden Age of Sweden.
',NULL,'t',NULL,NULL,NULL,'Gustavus','Purvis');
INSERT INTO "users" VALUES(894972291,'clio','clio@example.com','00742970dc9e6319f8019fd54864d3ea740f04b1','7e3041ebc2fc05a40c60028e2c4901a81035d3cd','f','2009-02-10 22:07:27','2009-02-15 22:07:27',NULL,NULL,'f','Vadem Corporation','I''m Clio.

Vadem Clio refers to a Handheld PC that runs Windows CE H/PC Pro 3.0 (WinCE Core OS 2.11). It was released in 1999. Data Evolution Corporation currently owns the rights to the Clio.

The Clio is a convertible tablet computer, designed by Vadem Corporation, which runs Microsoft‚Äôs Windows CE operating system and features the award-winning[citation needed] SwingTop pivoting arm. The 180-degree screen rotation gives users the ability to change configurations as conditions and work functions dictate. Users can choose notebook, tablet or presentation modes with keyboard, touchscreen or handwriting input.
',NULL,'t',NULL,NULL,NULL,'Vadem','Clio');
INSERT INTO "users" VALUES(1402298589,'quentin','quentin@example.com','00742970dc9e6319f8019fd54864d3ea740f04b1','7e3041ebc2fc05a40c60028e2c4901a81035d3cd','f','2009-02-10 22:07:27','2009-02-15 22:07:27',NULL,NULL,'f','Grindhouse, Inc.','I''m Quentin.

Quentin Jerome Tarantino (born March 27, 1963) is an American film director, screenwriter, producer and actor. He rose to fame in the early 1990s as an independent filmmaker whose films used nonlinear storylines and aestheticization of violence. His films include Reservoir Dogs (1992), Pulp Fiction (1994), Jackie Brown (1997), Kill Bill (Vol. 1 2003, Vol. 2 2004) and Death Proof (2007). His films have earned him Academy, BAFTA and Palme d''Or Awards and he has been nominated for Emmy and Grammy Awards. In 2007, Total Film named him the 12th greatest director of all-time.
','http://reservoir.dogs/','t',NULL,NULL,NULL,'Quentin','Tarantino');
INSERT INTO "users" VALUES(1709463084,'incognito',NULL,'00742970dc9e6319f8019fd54864d3ea740f04b1','7e3041ebc2fc05a40c60028e2c4901a81035d3cd','f','2009-02-14 22:07:27','2009-02-15 22:07:27',NULL,NULL,'f',NULL,NULL,NULL,'f',NULL,NULL,NULL,NULL,NULL);
INSERT INTO "users" VALUES(1830235192,'aaron','aaron@example.com','00742970dc9e6319f8019fd54864d3ea740f04b1','7e3041ebc2fc05a40c60028e2c4901a81035d3cd','t','2009-02-14 22:07:27','2009-02-15 22:07:27',NULL,NULL,'f','House of Israel','I''m Aaron.

In the Bible, Aaron (◊ê◊î◊®◊ü), or Aaron the Levite (◊ê◊î◊®◊ü ◊î◊ú◊ï◊ô), was the brother of Moses. He was the great-grandson of Levi (Exodus 6:16-20)[1] and represented the priestly functions of his tribe, becoming the first High Priest of the Hebrews. While Moses was receiving his education at the Egyptian royal court and during his exile among the Midianites, Aaron and his sister remained with their kinsmen in the eastern border-land of Egypt (Goshen). He there gained a name for eloquent and persuasive speech; so that when the time came for the demand upon the Pharaoh to release Israel from captivity, Aaron became his brother‚Äôs "nabi", or spokesman, to his own people (Exodus 4:16)[2] and, after their unwillingness to hear, to the Pharaoh himself (Exodus 7:9).[3] He is said to have flourished about 1200 BC (traditionally 1597 BC).
',NULL,'t',NULL,NULL,NULL,'Aaron','Levite');
INSERT INTO "users" VALUES(1830235193,'admin','admin','d5512d11d161de8e4bf8c4eb71e71843b751df54','4517a8f56322860621bde5765bac77908719ab5d','t','2009-02-15 22:07:29','2009-02-15 22:10:21',NULL,NULL,'f',NULL,'I am all-powerful.',NULL,NULL,NULL,NULL,NULL,'Super','User');
INSERT INTO "users" VALUES(1830235194,'http://ifup.org/','',NULL,NULL,'t','2009-02-15 22:07:50','2009-02-15 22:10:14',NULL,NULL,'t','','','','f',NULL,NULL,NULL,'','');
CREATE INDEX "index_proposals_on_event_id" ON "proposals" ("event_id");
CREATE INDEX "index_taggings_on_tag_id" ON "taggings" ("tag_id");
CREATE INDEX "index_taggings_on_taggable_id_and_taggable_type_and_context" ON "taggings" ("taggable_id", "taggable_type", "context");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE UNIQUE INDEX "index_snippets_on_slug" ON "snippets" ("slug");
CREATE UNIQUE INDEX "index_events_on_id" ON "events" ("id");
COMMIT;
