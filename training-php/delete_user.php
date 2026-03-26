<?php
require_once 'models/UserModel.php';

$userModel = new UserModel();

if (!empty($_GET['id'])) {
    $id = (int) $_GET['id']; // Ép kiểu số cho an toàn
    $userModel->deleteUserById($id);

    session_start();
    $_SESSION['message'] = "Xóa user thành công!";
} else {
    session_start();
    $_SESSION['message'] = "Không tìm thấy ID user để xóa!";
}

header('Location: list_users.php');
exit();
?>