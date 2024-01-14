CREATE TABLE "users" (
  "id" bigserial PRIMARY KEY,
  "login" varchar UNIQUE,
  "password" varchar,
  "billing_plan_name" varchar,
  "referer_id" integer,
  "number_of_requests" integer
);

CREATE TABLE "assistants" (
  "id" bigserial PRIMARY KEY,
  "name" varchar,
  "description" varchar
);

CREATE TABLE "chats" (
  "id" bigserial PRIMARY KEY,
  "user_id" integer,
  "assistant_id" integer,
  UNIQUE ("user_id", "assistant_id")
);

CREATE TABLE "messages" (
  "id" bigserial PRIMARY KEY,
  "chat_id" integer,
  "from" integer,
  "is_assistant" boolean,
  "content" varchar,
  "attachment_id" integer,
  "created_at" timestamp
);

CREATE TABLE "billing_plans" (
  "id" bigserial PRIMARY KEY,
  "name" varchar,
  "assistant_id" integer,
  "price" integer,
  "number_of_requests" integer
);

ALTER TABLE "chats" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "chats" ADD FOREIGN KEY ("assistant_id") REFERENCES "assistants" ("id");

ALTER TABLE "chats" ADD UNIQUE ("user_id", "assistant_id");

ALTER TABLE "messages" ADD FOREIGN KEY ("chat_id") REFERENCES "chats" ("id");

ALTER TABLE "billing_plans" ADD FOREIGN KEY ("assistant_id") REFERENCES "assistants" ("id");
