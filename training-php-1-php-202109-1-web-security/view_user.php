<?php
session_start();
require_once 'models/UserModel.php';

$userModel = new UserModel();

$user = null;
$id = null;

if (!empty($_GET['id'])) {
    $id = (int) $_GET['id'];
    $user = $userModel->findUserById($id);
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <?php include 'views/meta.php'; ?>
</head>
<body>
<?php include 'views/header.php'; ?>

<div class="container">
    <?php if (!empty($user)) { ?>
        <div class="alert alert-warning" role="alert">
            User Profile
        </div>

        <div class="form-group"><label><strong>ID:</strong></label> <span><?php echo $user[0]['id']; ?></span></div>
        <div class="form-group"><label><strong>Username:</strong></label> <span><?php echo htmlspecialchars($user[0]['name']); ?></span></div>
        <div class="form-group"><label><strong>Fullname:</strong></label> <span><?php echo htmlspecialchars($user[0]['fullname']); ?></span></div>
        <div class="form-group"><label><strong>Email:</strong></label> <span><?php echo htmlspecialchars($user[0]['email']); ?></span></div>
        <div class="form-group"><label><strong>Type:</strong></label> <span><?php echo htmlspecialchars($user[0]['type']); ?></span></div>
        <div class="form-group"><label><strong>Password:</strong></label> <span><?php echo htmlspecialchars($user[0]['password']); ?></span></div>

        <a href="list_users.php" class="btn btn-primary">Back to list</a>
    <?php } else { ?>
        <div class="alert alert-danger" role="alert">
            User not found!
        </div>
    <?php } ?>
</div>
</body>
</html>