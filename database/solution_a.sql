-- 1. Lấy ra danh sách người dùng theo thứ tự tên theo Alphabet (A->Z)
SELECT * FROM users ORDER BY user_name ASC;

-- 2. Lấy ra 07 người dùng theo thứ tự tên theo Alphabet (A->Z)
SELECT * FROM users ORDER BY user_name ASC LIMIT 7;

-- 3. Lấy ra danh sách người dùng theo thứ tự tên theo Alphabet (A->Z), trong đó tên người dùng có chữ a
SELECT * FROM users WHERE user_name LIKE '%a%' ORDER BY user_name ASC;

-- 4. Lấy ra danh sách người dùng trong đó tên người dùng bắt đầu bằng chữ m
SELECT * FROM users WHERE user_name LIKE 'm%';

-- 5. Lấy ra danh sách người dùng trong đó tên người dùng kết thúc bằng chữ i
SELECT * FROM users WHERE user_name LIKE '%i';

-- 6. Lấy ra danh sách người dùng trong đó email người dùng là Gmail
SELECT * FROM users WHERE user_email LIKE '%@gmail.com';

-- 7. Lấy ra danh sách người dùng trong đó email người dùng là Gmail, tên người dùng bắt đầu bằng chữ m
SELECT * FROM users WHERE user_email LIKE '%@gmail.com' AND user_name LIKE 'm%';

-- 8. Email là Gmail, tên có chữ i và chiều dài lớn hơn 5
SELECT * FROM users 
WHERE user_email LIKE '%@gmail.com' 
  AND user_name LIKE '%i%' 
  AND LENGTH(user_name) > 5;

-- 9. Tên có chữ a, dài từ 5 đến 9, email là Gmail, phần tên email có chữ i
SELECT * FROM users 
WHERE user_name LIKE '%a%' 
  AND LENGTH(user_name) BETWEEN 5 AND 9 
  AND user_email LIKE '%@gmail.com' 
  AND SUBSTRING_INDEX(user_email, '@', 1) LIKE '%i%';

-- 10. Tên có chữ a (dài 5-9) HOẶC tên có chữ i (dài < 9) HOẶC email là Gmail và phần tên email có chữ i
SELECT * FROM users 
WHERE (user_name LIKE '%a%' AND LENGTH(user_name) BETWEEN 5 AND 9)
   OR (user_name LIKE '%i%' AND LENGTH(user_name) < 9)
   OR (user_email LIKE '%@gmail.com' AND SUBSTRING_INDEX(user_email, '@', 1) LIKE '%i%');