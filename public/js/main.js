function validate() {
    let pass = document.getElementById("pass").value;
    let repass = document.getElementById("repass").value;

    if (pass !== repass) {
        alert("Mật khẩu không khớp!");
        return false;
    } else {
        alert("Đăng ký thành công!");
    }
}