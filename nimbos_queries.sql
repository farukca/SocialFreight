
insert into nimbos_patrons (select id, name, title, email, website, tel, fax, gsm, postcode, address, contact_name, contact_surname,
 city, state, country_id, patron_type, employees, language, status, logo, token, time_zone, district,
  currency,locale, mail_encoding, created_at, updated_at from patrons)
SELECT setval('public.nimbos_patrons_id_seq', (select max(id)+1 from nimbos_patrons), true);

insert into nimbos_users (select id, email, crypted_password, salt, name, surname, patron_id, patron_key, language,
  time_zone, locale, region, user_type, mail_encoding, last_login_at, last_logout_at, last_activity_at, activation_state, activation_token,
  activation_token_expires_at, password_reset_token, password_reset_email_time, password_reset_token_expires_at,
  failed_logins_count, lock_expires_at, role, avatar, branch_id, remember_me_token,
  remember_me_token_expires_at, null, firstuser, user_status, created_at, updated_at from users)
SELECT setval('public.nimbos_users_id_seq', (select max(id)+1 from nimbos_users), true);

insert into nimbos_branches (select id, name, tel, fax, email, postcode, address, district, null, null,
  country_id, status, patron_id, latitude, longitude, gmaps, created_at, updated_at from branches)
SELECT setval('public.nimbos_branches_id_seq', (select max(id)+1 from nimbos_branches), true);

insert into nimbos_countries (select code, name, telcode, latitude, longitude, gmaps, locale, language,
  time_zone, mail_encoding, domain, code3, currency, region, subregion, listable, now(), now() from countries)

insert into nimbos_currencies (select code, name, symbol, multiplier, now(), now() from currencies)

insert into nimbos_listheaders (select id, code, name, i18n_code, description, created_at, updated_at from listheaders)
SELECT setval('public.nimbos_listheaders_id_seq', (select max(id)+1 from nimbos_listheaders), true);

insert into nimbos_listitems (select id, code, name, list_code, i18n_code, listheader_id, created_at, updated_at from listitems)
SELECT setval('public.nimbos_listitems_id_seq', (select max(id)+1 from nimbos_listitems), true);

insert into nimbos_activities (select id, user_id, target_type, target_id, target_name, patron_id, branch_id, created_at, updated_at from activities)
SELECT setval('public.nimbos_activities_id_seq', (select max(id)+1 from nimbos_activities), true);

insert into nimbos_comments (select id, user_id, comment_text, commentable_type, commentable_id, commenter, patron_id, created_at,  updated_at from comments)
SELECT setval('public.nimbos_comments_id_seq', (select max(id)+1 from nimbos_comments), true);

insert into nimbos_posts (select id, user_id, message, target_type, target_id, target_name, post_type, is_private, is_syspost, patron_id, created_at, updated_at from posts)
SELECT setval('public.nimbos_posts_id_seq', (select max(id)+1 from nimbos_posts), true);

insert into nimbos_reminders (select id, title, start_date, start_hour, finish_date, calendar_scope, description, remindfor_type, remindfor_id, user_id, patron_id, trashed, created_at, updated_at from reminders)
SELECT setval('public.nimbos_reminders_id_seq', (select max(id)+1 from nimbos_reminders), true);

insert into nimbos_todolists (select id, name, user_id, todop_type, todop_id, patron_id, tasks_count, trashed, created_at, updated_at from todolists)
SELECT setval('public.nimbos_todolists_id_seq', (select max(id)+1 from nimbos_todolists), true);

insert into nimbos_tasks (select id, todolist_id, user_id, task_text, task_code, i18n_code, cruser_id, status, due_date, closed_date, close_text, system_task, patron_id, created_at, updated_at from tasks)
	SELECT setval('public.nimbos_tasks_id_seq', (select max(id)+1 from nimbos_tasks), true);