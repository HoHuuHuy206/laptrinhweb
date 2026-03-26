<?php

require_once 'BaseModel.php';

class UserModel extends BaseModel {

    public function findUserById($id) {
        $id = (int)$id;
        $sql = 'SELECT * FROM users WHERE id = ' . $id;
        return $this->select($sql);
    }

    public function findUser($keyword) {
        $keyword = mysqli_real_escape_string(self::$_connection, $keyword);
        $sql = 'SELECT * FROM users 
                WHERE name LIKE "%' . $keyword . '%" 
                OR email LIKE "%' . $keyword . '%"';
        return $this->select($sql);
    }

    public function auth($userName, $password) {
        $userName = mysqli_real_escape_string(self::$_connection, $userName);
        $password = mysqli_real_escape_string(self::$_connection, $password);

        $sql = 'SELECT * FROM users 
                WHERE name = "' . $userName . '" 
                AND password = "' . $password . '"';

        return $this->select($sql);
    }

    public function deleteUserById($id) {
        $id = (int)$id;
        $sql = 'DELETE FROM users WHERE id = ' . $id;
        return $this->delete($sql);
    }

    public function updateUser($input) {
        $id = (int)$input['id'];
        $name = mysqli_real_escape_string(self::$_connection, $input['name']);
        $fullname = mysqli_real_escape_string(self::$_connection, $input['fullname']);
        $email = mysqli_real_escape_string(self::$_connection, $input['email']);
        $type = mysqli_real_escape_string(self::$_connection, $input['type']);
        $password = mysqli_real_escape_string(self::$_connection, $input['password']);

        $sql = 'UPDATE users SET 
                    name = "' . $name . '",
                    fullname = "' . $fullname . '",
                    email = "' . $email . '",
                    type = "' . $type . '",
                    password = "' . $password . '"
                WHERE id = ' . $id;

        return $this->update($sql);
    }

    public function insertUser($input) {
        $name = mysqli_real_escape_string(self::$_connection, $input['name']);
        $fullname = mysqli_real_escape_string(self::$_connection, $input['fullname']);
        $email = mysqli_real_escape_string(self::$_connection, $input['email']);
        $type = mysqli_real_escape_string(self::$_connection, $input['type']);
        $password = mysqli_real_escape_string(self::$_connection, $input['password']);

        $sql = "INSERT INTO users (name, fullname, email, type, password) VALUES (
                    '" . $name . "',
                    '" . $fullname . "',
                    '" . $email . "',
                    '" . $type . "',
                    '" . $password . "'
                )";

        return $this->insert($sql);
    }

    public function getUsers($params = []) {
        if (!empty($params['keyword'])) {
            $keyword = mysqli_real_escape_string(self::$_connection, $params['keyword']);
            $sql = 'SELECT * FROM users 
                    WHERE name LIKE "%' . $keyword . '%" 
                    OR email LIKE "%' . $keyword . '%"';
            return $this->select($sql);
        } else {
            $sql = 'SELECT * FROM users';
            return $this->select($sql);
        }
    }
}
?>