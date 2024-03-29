-- Get the number of available requests
SELECT u.number_of_requests FROM users as u WHERE u.id = "$1";

-- Get available assistants for a user
SELECT a.name, a.description FROM users as u
  JOIN billing_plans as b ON b.name = u.billing_plan_name
  JOIN assistants as a ON b.assistant_id = a.id
  WHERE u.id = "$1";

-- Get all the chats for a user
SELECT ch.id, a.name, a.description FROM users as u
  JOIN chats as ch ON ch.user_id = u.id
  JOIN assistants as a ON a.id = ch.assistant_id
  WHERE u.id = "$1";

-- Get all the messages for a chat
SELECT * FROM messages as m WHERE m.chat_id = "$1" ORDER BY m.created_at ASC;

-- Get the name of the user and the assistant for a particular chat
SELECT u.login, a.name, a.description FROM chats as ch
  JOIN users as u ON ch.user_id = u.id
  JOIN assistants as a ON ch.assistant_id = a.id
  WHERE ch.id = "$1";
