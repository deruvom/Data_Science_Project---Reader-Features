drop table if exists stories;
create table stories (id integer, user_id integer, teaser text, title text, cover text, category_one text, category_two text);
.separator ","
.headers "on"
.import ./stories.csv stories

drop table if exists reading;
create table reading (is_app_event integer, visitor_id text, id text, visit_id text, tracking_time datetime, created_at datetime,story_id integer, user_id integer);
.separator ","
.headers "on"
.import  ./reading.csv reading

drop table if exists visits;
create table visits (visitor_id text, user_id integer, country text, timezone text, location_accuracy integer);
.separator ","
.headers "on"
.import  ./visits.csv visits
