<?php
session_start();

require_once 'models/UserModel.php';
$userModel = new UserModel();

$params = [];
if (!empty($_GET['keyword'])) {
    $params['keyword'] = $_GET['keyword'];
}

$users = $userModel->getUsers($params);
?>
<!DOCTYPE html>
<html>
<head>
    <title>List Users</title>
    <?php include 'views/meta.php'; ?>
</head>
<body>
<?php include 'views/header.php'; ?>

<div class="container">
    <?php if (!empty($users)) { ?>
        <div class="alert alert-warning" role="alert">
            List of users
        </div>

        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Fullname</th>
                    <th>Email</th>
                    <th>Type</th>
                    <th>Password</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($users as $user) { ?>
                    <tr>
                        <td><?php echo $user['id']; ?></td>
                        <td><?php echo htmlspecialchars($user['name']); ?></td>
                        <td><?php echo htmlspecialchars($user['fullname']); ?></td>
                        <td><?php echo htmlspecialchars($user['email']); ?></td>
                        <td><?php echo htmlspecialchars($user['type']); ?></td>
                        <td><?php echo htmlspecialchars($user['password']); ?></td>
                        <td>
                            <a href="form_user.php?id=<?php echo $user['id']; ?>" title="Update">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                            </a>
                            &nbsp;
                            <a href="view_user.php?id=<?php echo $user['id']; ?>" title="View">
                                <i class="fa fa-eye" aria-hidden="true"></i>
                            </a>
                            &nbsp;
                            <a href="delete_user.php?id=<?php echo $user['id']; ?>" 
                               title="Delete"
                               onclick="return confirm('Bạn có chắc muốn xóa user này không?');">
                                <i class="fa fa-eraser" aria-hidden="true"></i>
                            </a>
                        </td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    <?php } else { ?>
        <div class="alert alert-info" role="alert">
            Chưa có user nào!
        </div>
    <?php } ?>
</div>
</body>
</html>