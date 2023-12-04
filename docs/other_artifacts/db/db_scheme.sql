CREATE TYPE "billing_plan_enum" AS ENUM (
  'basic',
  'standard',
  'premium'
);

CREATE TABLE "users" (
  "login" varchar PRIMARY KEY,
  "password" varchar,
  "billing_plan" billing_plan_enum,
  "invited_by" varchar
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
  "attachment_id" integer,
  "created_at" time
);

ALTER TABLE "chats" ADD FOREIGN KEY ("user_login") REFERENCES "users" ("login");

ALTER TABLE "chats" ADD FOREIGN KEY ("assistant_name") REFERENCES "assistants" ("name");

ALTER TABLE "messages" ADD FOREIGN KEY ("chat_id") REFERENCES "chats" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("invited_by") REFERENCES "users" ("login");
