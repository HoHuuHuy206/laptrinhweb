<?php
require_once __DIR__ . '/../configs/database.php';

abstract class BaseModel {
    // Database connection
    protected static $_connection;

    public function __construct() {
        if (!isset(self::$_connection)) {
            self::$_connection = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME, DB_PORT);

            // Kiểm tra kết nối
            if (self::$_connection->connect_error) {
                die("Kết nối database thất bại: " . self::$_connection->connect_error);
            }

            // Set UTF-8
            self::$_connection->set_charset("utf8");
        }
    }

    /**
     * Query in database
     * @param string $sql
     * @return mixed
     */
    protected function query($sql) {
        $result = self::$_connection->query($sql);

        if (!$result) {
            die("Lỗi SQL: " . self::$_connection->error . "<br>Câu lệnh: " . $sql);
        }

        return $result;
    }

    /**
     * Select statement
     * @param string $sql
     * @return array
     */
    protected function select($sql) {
        $result = $this->query($sql);
        $rows = [];

        if (!empty($result)) {
            while ($row = $result->fetch_assoc()) {
                $rows[] = $row;
            }
        }

        return $rows;
    }

    /**
     * Delete statement
     * @param string $sql
     * @return mixed
     */
    protected function delete($sql) {
        return $this->query($sql);
    }

    /**
     * Update statement
     * @param string $sql
     * @return mixed
     */
    protected function update($sql) {
        return $this->query($sql);
    }

    /**
     * Insert statement
     * @param string $sql
     * @return mixed
     */
    protected function insert($sql) {
        return $this->query($sql);
    }
}
?>