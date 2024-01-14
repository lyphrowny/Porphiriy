CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "login" varchar,
  "password" varchar,
  "billing_plan_id" integer,
  "referer_id" integer,
  "number_of_requests" integer
);

CREATE TABLE "assistants" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "description" varchar
);

CREATE TABLE "chats" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "assistant_id" integer
);

CREATE TABLE "messages" (
  "id" integer PRIMARY KEY,
  "chat_id" integer,
  "to" integer,
  "from" integer,
  "content" varchar,
  "attachment_id" integer,
  "created_at" datetime
);

CREATE TABLE "billing_plans" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "assistant_id" integer,
  "price" integer,
  "number_of_requests" integer
);

ALTER TABLE "chats" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "chats" ADD FOREIGN KEY ("assistant_id") REFERENCES "assistants" ("id");

ALTER TABLE "messages" ADD FOREIGN KEY ("chat_id") REFERENCES "chats" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("billing_plan_id") REFERENCES "billing_plans" ("id");

CREATE TABLE "billing_plans_assistants" (
  "billing_plans_assistant_id" integer,
  "assistants_id" integer,
  PRIMARY KEY ("billing_plans_assistant_id", "assistants_id")
);

ALTER TABLE "billing_plans_assistants" ADD FOREIGN KEY ("billing_plans_assistant_id") REFERENCES "billing_plans" ("assistant_id");

ALTER TABLE "billing_plans_assistants" ADD FOREIGN KEY ("assistants_id") REFERENCES "assistants" ("id");

