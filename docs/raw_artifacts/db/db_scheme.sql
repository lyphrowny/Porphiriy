CREATE TYPE "billing_plan_enum" AS ENUM (
  'beginner',
  'starter',
  'advanced'
);

CREATE TABLE "users" (
  "login" varchar PRIMARY KEY,
  "password" varchar,
  "billing_plan" billing_plan_enum,
  "referer" varchar
);

CREATE TABLE "assistants" (
  "name" varchar PRIMARY KEY,
  "description" varchar
);

CREATE TABLE "chats" (
  "id" integer PRIMARY KEY,
  "user_login" varchar,
  "assistant_name" varchar
);

CREATE TABLE "messages" (
  "id" integer PRIMARY KEY,
  "chat_id" integer,
  "to" varchar,
  "from" varchar,
  "content" varchar,
  "attachment_id" integer
);

ALTER TABLE "chats" ADD FOREIGN KEY ("user_login") REFERENCES "users" ("login");

ALTER TABLE "chats" ADD FOREIGN KEY ("assistant_name") REFERENCES "assistants" ("name");

ALTER TABLE "messages" ADD FOREIGN KEY ("chat_id") REFERENCES "chats" ("id");
