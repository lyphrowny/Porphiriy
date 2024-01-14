-- Get the number of available requests
SELECT u.number_of_requests FROM users as u WHERE u.id = "$1";

-- Get available assistants for a user
SELECT a.id FROM users as u
  LEFT JOIN billing_plans as b ON b.id = u.billing_plan_id
  LEFT JOIN assistants as a ON b.assistant_id = a.id
  WHERE u.id = "$1";

-- Get the name of the user and the assistant for a particular chat
SELECT u.login, a.name, a.description FROM chats as ch
  LEFT JOIN users as u ON ch.user_id = u.id
  LEFT JOIN assistants as a ON ch.assistant_id = a.id
  WHERE ch.id = "$1";

-- Get all the messages for a chat
SELECT * FROM messages as m WHERE m.chat_id = "$1" ORDER BY m.created_at DESC;

-- Get all the chats for a particular user
SELECT ch.id FROM chats as ch WHERE ch.user_id = "$1";
