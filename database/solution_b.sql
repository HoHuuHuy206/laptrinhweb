-- 1. Liệt kê các hóa đơn của khách hàng: mã user, tên user, mã hóa đơn
SELECT u.user_id, u.user_name, o.order_id 
FROM users u 
JOIN orders o ON u.user_id = o.user_id;

-- 2. Liệt kê số lượng các hóa đơn của khách hàng: mã user, tên user, số đơn hàng
SELECT u.user_id, u.user_name, COUNT(o.order_id) AS so_don_hang 
FROM users u 
LEFT JOIN orders o ON u.user_id = o.user_id 
GROUP BY u.user_id, u.user_name;

-- 3. Liệt kê thông tin hóa đơn: mã đơn hàng, số sản phẩm
SELECT o.order_id, COUNT(od.product_id) AS so_san_pham 
FROM orders o 
JOIN order_details od ON o.order_id = od.order_id 
GROUP BY o.order_id;

-- 4. Liệt kê thông tin mua hàng: mã user, tên user, mã đơn hàng, tên sản phẩm. Gôm nhóm theo đơn hàng.
SELECT u.user_id, u.user_name, o.order_id, p.product_name 
FROM users u 
JOIN orders o ON u.user_id = o.user_id 
JOIN order_details od ON o.order_id = od.order_id 
JOIN products p ON od.product_id = p.product_id 
ORDER BY o.order_id;

-- 5. Liệt kê 7 người dùng có số lượng đơn hàng nhiều nhất
SELECT u.user_id, u.user_name, COUNT(o.order_id) AS so_luong_don_hang 
FROM users u 
JOIN orders o ON u.user_id = o.user_id 
GROUP BY u.user_id, u.user_name 
ORDER BY so_luong_don_hang DESC 
LIMIT 7;

-- 6. Liệt kê 7 người dùng mua sản phẩm có tên: Samsung hoặc Apple
SELECT u.user_id, u.user_name, o.order_id, p.product_name 
FROM users u 
JOIN orders o ON u.user_id = o.user_id 
JOIN order_details od ON o.order_id = od.order_id 
JOIN products p ON od.product_id = p.product_id 
WHERE p.product_name LIKE '%Samsung%' OR p.product_name LIKE '%Apple%' 
LIMIT 7;

-- 7. Danh sách mua hàng của user bao gồm giá tiền tổng của mỗi đơn hàng
SELECT u.user_id, u.user_name, o.order_id, SUM(p.product_price) AS tong_tien 
FROM users u 
JOIN orders o ON u.user_id = o.user_id 
JOIN order_details od ON o.order_id = od.order_id 
JOIN products p ON od.product_id = p.product_id 
GROUP BY u.user_id, u.user_name, o.order_id;

-- 8. Mỗi user chỉ chọn ra 1 đơn hàng có giá tiền lớn nhất
WITH OrderTotals AS (
    SELECT u.user_id, u.user_name, o.order_id, SUM(p.product_price) AS tong_tien 
    FROM users u 
    JOIN orders o ON u.user_id = o.user_id 
    JOIN order_details od ON o.order_id = od.order_id 
    JOIN products p ON od.product_id = p.product_id 
    GROUP BY u.user_id, u.user_name, o.order_id
), 
RankedOrders AS (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY tong_tien DESC) as rn 
    FROM OrderTotals
)
SELECT user_id, user_name, order_id, tong_tien 
FROM RankedOrders 
WHERE rn = 1;

-- 9. Mỗi user chỉ chọn ra 1 đơn hàng có giá tiền nhỏ nhất, kèm số lượng sản phẩm
WITH OrderStats AS (
    SELECT u.user_id, u.user_name, o.order_id, SUM(p.product_price) AS tong_tien, COUNT(od.product_id) AS so_san_pham 
    FROM users u 
    JOIN orders o ON u.user_id = o.user_id 
    JOIN order_details od ON o.order_id = od.order_id 
    JOIN products p ON od.product_id = p.product_id 
    GROUP BY u.user_id, u.user_name, o.order_id
), 
RankedOrders AS (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY tong_tien ASC) as rn 
    FROM OrderStats
)
SELECT user_id, user_name, order_id, tong_tien, so_san_pham 
FROM RankedOrders 
WHERE rn = 1;

-- 10. Mỗi user chỉ chọn ra 1 đơn hàng có số sản phẩm nhiều nhất
WITH OrderStats AS (
    SELECT u.user_id, u.user_name, o.order_id, SUM(p.product_price) AS tong_tien, COUNT(od.product_id) AS so_san_pham 
    FROM users u 
    JOIN orders o ON u.user_id = o.user_id 
    JOIN order_details od ON o.order_id = od.order_id 
    JOIN products p ON od.product_id = p.product_id 
    GROUP BY u.user_id, u.user_name, o.order_id
), 
RankedOrders AS (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY so_san_pham DESC) as rn 
    FROM OrderStats
)
SELECT user_id, user_name, order_id, tong_tien, so_san_pham 
FROM RankedOrders 
WHERE rn = 1;