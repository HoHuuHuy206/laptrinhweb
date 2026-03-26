<?php
session_start();

require_once 'models/UserModel.php';
$userModel = new UserModel();

if (!empty($_POST['submit'])) {
    $name = trim($_POST['username']);
    $password = trim($_POST['password']);

    if (empty($name) || empty($password)) {
        $_SESSION['message'] = 'Vui lòng nhập đầy đủ tài khoản và mật khẩu!';
    } else {
        $user = $userModel->auth($name, $password);

        if (!empty($user)) {
            // Login successful
            $_SESSION['id'] = $user[0]['id'];
            $_SESSION['message'] = 'Login successful';
            header('Location: list_users.php');
            exit();
        } else {
            // Login failed
            $_SESSION['message'] = 'Login failed';
        }
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <?php include 'views/meta.php'; ?>
</head>
<body>
<?php include 'views/header.php'; ?>

<div class="container">
    <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Login</div>
            </div>

            <div style="padding-top:30px" class="panel-body">
                <form method="post" class="form-horizontal" role="form">

                    <div class="margin-bottom-25 input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="login-username" type="text" class="form-control" name="username" placeholder="Enter username">
                    </div>

                    <div class="margin-bottom-25 input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="login-password" type="password" class="form-control" name="password" placeholder="Enter password">
                    </div>

                    <div class="margin-bottom-25 input-group">
                        <div class="col-sm-12 controls">
                            <button type="submit" name="submit" value="submit" class="btn btn-primary">Login</button>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-12 control">
                            Don't have an account?
                            <a href="form_user.php">Sign Up Here</a>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>