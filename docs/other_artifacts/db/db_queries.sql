-- Get all the users (and their number), that registered via a referral link of a particular user
SELECT u.id, COUNT(u.id) FROM users as u WHERE u.invited_by = "$1";

-- Get all the messages for a chat
SELECT * FROM messages as m WHERE m.chat_id = "$1" ORDER BY m.created_at DESC;

-- Get all the chats for a particular user
SELECT id FROM chats as ch WHERE ch.user_login = "$1";
