<?php
session_start();
require_once 'models/UserModel.php';

$userModel = new UserModel();

$user = null;
$_id = null;

if (!empty($_GET['id'])) {
    $_id = (int) $_GET['id'];
    $user = $userModel->findUserById($_id);
}

if (!empty($_POST['submit'])) {
    $name = trim($_POST['name']);
    $fullname = trim($_POST['fullname']);
    $email = trim($_POST['email']);
    $type = trim($_POST['type']);
    $password = trim($_POST['password']);

    if (empty($name) || empty($fullname) || empty($email) || empty($type) || empty($password)) {
        $_SESSION['message'] = "Vui lòng nhập đầy đủ thông tin!";
    } else {
        if (!empty($_POST['id'])) {
            $userModel->updateUser($_POST);
            $_SESSION['message'] = "Cập nhật user thành công!";
        } else {
            $userModel->insertUser($_POST);
            $_SESSION['message'] = "Thêm user thành công!";
        }

        header('Location: list_users.php');
        exit();
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>User form</title>
    <?php include 'views/meta.php'; ?>
</head>
<body>
<?php include 'views/header.php'; ?>

<div class="container">
    <?php if ($user || !isset($_GET['id'])) { ?>
        <div class="alert alert-warning" role="alert">
            <?php echo !empty($_GET['id']) ? 'Update User' : 'Add New User'; ?>
        </div>

        <form method="POST">
            <input type="hidden" name="id" value="<?php echo $_id; ?>">

            <div class="form-group">
                <label>Name (Username)</label>
                <input class="form-control" name="name" placeholder="Username"
                    value="<?php echo !empty($user[0]['name']) ? htmlspecialchars($user[0]['name']) : ''; ?>">
            </div>

            <div class="form-group">
                <label>Fullname</label>
                <input class="form-control" name="fullname" placeholder="Fullname"
                    value="<?php echo !empty($user[0]['fullname']) ? htmlspecialchars($user[0]['fullname']) : ''; ?>">
            </div>

            <div class="form-group">
                <label>Email</label>
                <input class="form-control" name="email" placeholder="Email"
                    value="<?php echo !empty($user[0]['email']) ? htmlspecialchars($user[0]['email']) : ''; ?>">
            </div>

            <div class="form-group">
                <label>Type</label>
                <input class="form-control" name="type" placeholder="Type (admin/user)"
                    value="<?php echo !empty($user[0]['type']) ? htmlspecialchars($user[0]['type']) : ''; ?>">
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="text" name="password" class="form-control" placeholder="Password"
                    value="<?php echo !empty($user[0]['password']) ? htmlspecialchars($user[0]['password']) : ''; ?>">
            </div>

            <button type="submit" name="submit" value="submit" class="btn btn-primary">Submit</button>
        </form>
    <?php } else { ?>
        <div class="alert alert-danger" role="alert">
            User not found!
        </div>
    <?php } ?>
</div>
</body>
</html>