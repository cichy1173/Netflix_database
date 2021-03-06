CREATE TABLE film (id_Film int4 NOT NULL, title varchar(100) NOT NULL, how_long int4 NOT NULL, poster varchar(100) NOT NULL, production_year date NOT NULL, path_to_file varchar(100) NOT NULL UNIQUE, age_categoryid int4 NOT NULL, about varchar(500) NOT NULL, add_time timestamp NOT NULL, PRIMARY KEY (id_Film));

CREATE TABLE genre (id_genre int4 NOT NULL, genre_name varchar(80) NOT NULL, PRIMARY KEY (id_genre));
CREATE TABLE genre_film (genreid int4 NOT NULL, Filmid int4 NOT NULL, id_genreFilm int4 NOT NULL, PRIMARY KEY (genreid, Filmid, id_genreFilm));
CREATE TABLE age_category (id_age_category int4 NOT NULL, name varchar(80) NOT NULL, PRIMARY KEY (id_age_category));
CREATE TABLE country (id_country int4 NOT NULL, country_name varchar(80) NOT NULL, PRIMARY KEY (id_country));
CREATE TABLE film_country (Filmid int4 NOT NULL, countryid int4 NOT NULL, id_filmCountry int4 NOT NULL, PRIMARY KEY (Filmid, countryid, id_filmCountry));
CREATE TABLE serie (id_serie int4 NOT NULL, title varchar(100) NOT NULL, poster varchar(100) NOT NULL, production_year int4 NOT NULL, age_category int4 NOT NULL, season_number int4 NOT NULL, adding_date date NOT NULL, PRIMARY KEY (id_serie));
CREATE TABLE serie_genre (serieid int4 NOT NULL, genreid int4 NOT NULL, id_serieGenre int4 NOT NULL, PRIMARY KEY (serieid, genreid, id_serieGenre));
CREATE TABLE serie_productionCountry (serieid int4 NOT NULL, countryid int4 NOT NULL, id_serie_productionCountry int4 NOT NULL, PRIMARY KEY (serieid, countryid, id_serie_productionCountry));
CREATE TABLE episode (id_episode int4 NOT NULL, episode_title varchar(100) NOT NULL, season int4 NOT NULL, about varchar(500) NOT NULL, path varchar(100) NOT NULL UNIQUE, number_of_episode int4 NOT NULL, serieid int4 NOT NULL, how_long int4 NOT NULL, PRIMARY KEY (id_episode));
CREATE TABLE actor (id_actor int4 NOT NULL, name varchar(100) NOT NULL, lastname varchar(100) NOT NULL, photo_path varchar(100) NOT NULL UNIQUE, PRIMARY KEY (id_actor));
CREATE TABLE actor_Film (actorid int4 NOT NULL, Filmid int4 NOT NULL, id_actorFilm int4 NOT NULL, PRIMARY KEY (actorid, Filmid, id_actorFilm));
CREATE TABLE actor_serie (actorid int4 NOT NULL, serieid int4 NOT NULL, id_actorSerie int4 NOT NULL, PRIMARY KEY (actorid, serieid, id_actorSerie));
CREATE TABLE "user" (id_user int4 NOT NULL, nick varchar(50) NOT NULL UNIQUE, hash_passwd varchar(255) NOT NULL, salt varchar(255) NOT NULL, "e-mail" varchar(150) NOT NULL UNIQUE, age date NOT NULL, countryid int4 NOT NULL, phone_number varchar(12), PRIMARY KEY (id_user));
CREATE TABLE credit_card (id_credit_card int4 NOT NULL, card_number varchar(16) NOT NULL, cvc varchar(3) NOT NULL, expiration_date varchar(5) NOT NULL, owner_name varchar(255) NOT NULL, owner_lastname varchar(255) NOT NULL, PRIMARY KEY (id_credit_card));
CREATE TABLE user_profiles (id_user_profile int8 NOT NULL, nickname varchar(45) NOT NULL, profile_photosid int4 NOT NULL, Uzytkownikid int4 NOT NULL, is_adult bytea NOT NULL, Languagesid int4 NOT NULL, FIlm_Wanted_to_watchid int4, Series_wanted_to_watchid int4, PRIMARY KEY (id_user_profile));
CREATE TABLE profile_photos (id_profile_photos int4 NOT NULL, photo varchar(100) NOT NULL, PRIMARY KEY (id_profile_photos));
CREATE TABLE profile_is_watching (id_session int4 NOT NULL, User_profilesid int8 NOT NULL, Episode_serieid int4, Filmid int4, "date" timestamp NOT NULL, PRIMARY KEY (id_session));
CREATE TABLE languages (id_languages int4 NOT NULL, language varchar(50) NOT NULL, PRIMARY KEY (id_languages));
CREATE TABLE payment_plans (id_payment_plans int4 NOT NULL, name varchar(45) NOT NULL, price int4 NOT NULL, PRIMARY KEY (id_payment_plans));
CREATE TABLE gift_card (id_gift_card int4 NOT NULL, code varchar(15) NOT NULL, PRIMARY KEY (id_gift_card));
CREATE TABLE payment (id_payment int4 NOT NULL, payment_date timestamp NOT NULL, payment_methodid int4 NOT NULL, payment_plansid int4 NOT NULL, PRIMARY KEY (id_payment));
CREATE TABLE payment_method (id_payment_method int4 NOT NULL, credit_cardid int4 NOT NULL, gift_cardid int4, PRIMARY KEY (id_payment_method));
CREATE TABLE user_payment_method (Userid int4 NOT NULL, payment_methodid int4 NOT NULL, id_userPaymentMethod int4 NOT NULL, PRIMARY KEY (Userid, payment_methodid, id_userPaymentMethod));
CREATE TABLE device (id_device int4 NOT NULL, device_name varchar(255) NOT NULL, ip_address varchar(20) NOT NULL, device_typeid int4 NOT NULL, Regionid int4 NOT NULL, PRIMARY KEY (id_device));
CREATE TABLE device_user (Deviceid int4 NOT NULL, userid int4 NOT NULL, id_device_user int4 NOT NULL, last_used timestamp NOT NULL, PRIMARY KEY (Deviceid, userid, id_device_user));
CREATE TABLE device_type (id_device_type int4 NOT NULL, device_type_name varchar(255) NOT NULL, PRIMARY KEY (id_device_type));
CREATE TABLE Region (id_region int4 NOT NULL, name varchar(255) NOT NULL, countryid int4 NOT NULL, PRIMARY KEY (id_region));
CREATE TABLE fIlm_Wanted_to_watch (id_FIlm_wanted_to_watch SERIAL NOT NULL, PRIMARY KEY (id_FIlm_wanted_to_watch));
CREATE TABLE series_wanted_to_watch (id_series_wanted_to_watch SERIAL NOT NULL, PRIMARY KEY (id_series_wanted_to_watch));
CREATE TABLE film_FIlm_Wanted_to_watch (Filmid int4 NOT NULL, FIlm_Wanted_to_watchid int4 NOT NULL, id_FilmFilmWantedtoWatch int4 NOT NULL, PRIMARY KEY (Filmid, FIlm_Wanted_to_watchid, id_FilmFilmWantedtoWatch));
CREATE TABLE serie_series_wanted_to_watch (Serieid int4 NOT NULL, Series_wanted_to_watchid int4 NOT NULL, id_SerieSeriesWantedtoWatch int4 NOT NULL, PRIMARY KEY (Serieid, Series_wanted_to_watchid, id_SerieSeriesWantedtoWatch));
CREATE TABLE watching_history (id_watchingHistory int4 NOT NULL, profile_is_watchingid_session int4 NOT NULL, stop_watching_moment varchar(50) NOT NULL, PRIMARY KEY (id_watchingHistory));
ALTER TABLE genre_film ADD CONSTRAINT FKgenre_film71472 FOREIGN KEY (genreid) REFERENCES genre (id_genre) ON UPDATE Cascade ON DELETE No action;
ALTER TABLE genre_film ADD CONSTRAINT FKgenre_film139093 FOREIGN KEY (Filmid) REFERENCES film (id_Film) ON UPDATE Cascade ON DELETE Set default;
ALTER TABLE film ADD CONSTRAINT FKfilm23698 FOREIGN KEY (age_categoryid) REFERENCES age_category (id_age_category) ON UPDATE Cascade ON DELETE Set default;
ALTER TABLE film_country ADD CONSTRAINT FKfilm_count414041 FOREIGN KEY (Filmid) REFERENCES film (id_Film) ON UPDATE Cascade ON DELETE No action;
ALTER TABLE film_country ADD CONSTRAINT FKfilm_count669570 FOREIGN KEY (countryid) REFERENCES country (id_country) ON UPDATE Cascade ON DELETE No action;
ALTER TABLE serie ADD CONSTRAINT FKserie922359 FOREIGN KEY (age_category) REFERENCES age_category (id_age_category) ON UPDATE Cascade ON DELETE Set null;
ALTER TABLE serie_genre ADD CONSTRAINT FKserie_genr558468 FOREIGN KEY (serieid) REFERENCES serie (id_serie) ON UPDATE No action ON DELETE No action;
ALTER TABLE serie_genre ADD CONSTRAINT FKserie_genr703857 FOREIGN KEY (genreid) REFERENCES genre (id_genre) ON UPDATE Cascade ON DELETE No action;
ALTER TABLE serie_productionCountry ADD CONSTRAINT FKserie_prod318377 FOREIGN KEY (serieid) REFERENCES serie (id_serie) ON UPDATE Cascade ON DELETE No action;
ALTER TABLE serie_productionCountry ADD CONSTRAINT FKserie_prod379201 FOREIGN KEY (countryid) REFERENCES country (id_country) ON UPDATE Cascade ON DELETE No action;
ALTER TABLE episode ADD CONSTRAINT FKepisode293403 FOREIGN KEY (serieid) REFERENCES serie (id_serie) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE actor_Film ADD CONSTRAINT FKactor_Film524896 FOREIGN KEY (actorid) REFERENCES actor (id_actor) ON UPDATE Cascade ON DELETE No action;
ALTER TABLE actor_Film ADD CONSTRAINT FKactor_Film474332 FOREIGN KEY (Filmid) REFERENCES film (id_Film) ON UPDATE Cascade ON DELETE No action;
ALTER TABLE actor_serie ADD CONSTRAINT FKactor_seri794137 FOREIGN KEY (actorid) REFERENCES actor (id_actor) ON UPDATE Cascade ON DELETE No action;
ALTER TABLE actor_serie ADD CONSTRAINT FKactor_seri428205 FOREIGN KEY (serieid) REFERENCES serie (id_serie) ON UPDATE Cascade ON DELETE No action;
ALTER TABLE "user" ADD CONSTRAINT FKuser271711 FOREIGN KEY (countryid) REFERENCES country (id_country) ON UPDATE Cascade ON DELETE No action;
ALTER TABLE user_profiles ADD CONSTRAINT FKuser_profi110750 FOREIGN KEY (profile_photosid) REFERENCES profile_photos (id_profile_photos) ON UPDATE No action ON DELETE Set default;
ALTER TABLE user_profiles ADD CONSTRAINT FKuser_profi985153 FOREIGN KEY (Uzytkownikid) REFERENCES "user" (id_user);
ALTER TABLE profile_is_watching ADD CONSTRAINT FKprofile_is79705 FOREIGN KEY (User_profilesid) REFERENCES user_profiles (id_user_profile) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE profile_is_watching ADD CONSTRAINT FKprofile_is443338 FOREIGN KEY (Filmid) REFERENCES film (id_Film) ON UPDATE No action ON DELETE No action;
ALTER TABLE profile_is_watching ADD CONSTRAINT FKprofile_is993269 FOREIGN KEY (Episode_serieid) REFERENCES episode (id_episode) ON UPDATE No action ON DELETE No action;
ALTER TABLE user_profiles ADD CONSTRAINT FKuser_profi624622 FOREIGN KEY (Languagesid) REFERENCES languages (id_languages) ON UPDATE No action ON DELETE Set default;
ALTER TABLE payment_method ADD CONSTRAINT FKpayment_me53348 FOREIGN KEY (credit_cardid) REFERENCES credit_card (id_credit_card) ON UPDATE Cascade ON DELETE Set default;
ALTER TABLE payment_method ADD CONSTRAINT FKpayment_me658051 FOREIGN KEY (gift_cardid) REFERENCES gift_card (id_gift_card) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE payment ADD CONSTRAINT FKpayment199132 FOREIGN KEY (payment_methodid) REFERENCES payment_method (id_payment_method) ON UPDATE Cascade ON DELETE No action;
ALTER TABLE payment ADD CONSTRAINT FKpayment7431 FOREIGN KEY (payment_plansid) REFERENCES payment_plans (id_payment_plans) ON UPDATE Cascade ON DELETE No action;
ALTER TABLE user_payment_method ADD CONSTRAINT FKuser_payme781594 FOREIGN KEY (Userid) REFERENCES "user" (id_user) ON UPDATE Cascade ON DELETE No action;
ALTER TABLE user_payment_method ADD CONSTRAINT FKuser_payme381628 FOREIGN KEY (payment_methodid) REFERENCES payment_method (id_payment_method) ON UPDATE Cascade ON DELETE No action;
ALTER TABLE device_user ADD CONSTRAINT FKdevice_use333048 FOREIGN KEY (Deviceid) REFERENCES device (id_device) ON UPDATE Cascade ON DELETE No action;
ALTER TABLE device_user ADD CONSTRAINT FKdevice_use421854 FOREIGN KEY (userid) REFERENCES "user" (id_user) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE device ADD CONSTRAINT FKdevice918743 FOREIGN KEY (device_typeid) REFERENCES device_type (id_device_type) ON UPDATE Cascade ON DELETE No action;
ALTER TABLE Region ADD CONSTRAINT FKRegion257814 FOREIGN KEY (countryid) REFERENCES country (id_country) ON UPDATE Cascade ON DELETE No action;
ALTER TABLE device ADD CONSTRAINT FKdevice920182 FOREIGN KEY (Regionid) REFERENCES Region (id_region) ON UPDATE Cascade ON DELETE No action;
ALTER TABLE user_profiles ADD CONSTRAINT FKuser_profi295817 FOREIGN KEY (FIlm_Wanted_to_watchid) REFERENCES fIlm_Wanted_to_watch (id_FIlm_wanted_to_watch) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE user_profiles ADD CONSTRAINT FKuser_profi532880 FOREIGN KEY (Series_wanted_to_watchid) REFERENCES series_wanted_to_watch (id_series_wanted_to_watch) ON UPDATE Cascade ON DELETE Set null;
ALTER TABLE film_FIlm_Wanted_to_watch ADD CONSTRAINT FKfilm_FIlm_791760 FOREIGN KEY (Filmid) REFERENCES film (id_Film) ON UPDATE Cascade ON DELETE No action;
ALTER TABLE film_FIlm_Wanted_to_watch ADD CONSTRAINT FKfilm_FIlm_844480 FOREIGN KEY (FIlm_Wanted_to_watchid) REFERENCES fIlm_Wanted_to_watch (id_FIlm_wanted_to_watch) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE serie_series_wanted_to_watch ADD CONSTRAINT FKserie_seri134189 FOREIGN KEY (Serieid) REFERENCES serie (id_serie) ON UPDATE No action ON DELETE No action;
ALTER TABLE serie_series_wanted_to_watch ADD CONSTRAINT FKserie_seri73619 FOREIGN KEY (Series_wanted_to_watchid) REFERENCES series_wanted_to_watch (id_series_wanted_to_watch) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE watching_history ADD CONSTRAINT FKwatching_h70704 FOREIGN KEY (profile_is_watchingid_session) REFERENCES profile_is_watching (id_session) ON UPDATE Cascade ON DELETE No action;
