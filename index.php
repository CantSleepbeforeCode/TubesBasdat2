<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dilopad</title>
    <link rel="stylesheet" href="assets/css/mycss.css">
</head>
<body>
    <?php 
        require __DIR__ . '/conf.php';

        if(isset($_GET['pesan'])){
            if($_GET['pesan'] == "gagal"){
                echo '<script type="text/javascript"> 
                        alert("Akun tidak ditemukan atau password salah, ulangi.");
                        document.getElementById("email").value = ""; 
                        document.getElementById("password").value = ""; 
                        </script>';
            }else if($_GET['pesan'] == "logout"){
                echo '<script type="text/javascript"> 
                        alert("Anda Berhasil Keluar");
                        document.getElementById("email").value = ""; 
                        document.getElementById("password").value = ""; 
                        </script>';
            }else if($_GET['pesan'] == "belum_login"){
                echo '<script type="text/javascript"> 
                        alert("Kamu tidak punya akses kesana, Login dulu!");
                        document.getElementById("email").value = ""; 
                        document.getElementById("password").value = ""; 
                        </script>';
            }
        }
    ?>
    <div class="wrapper">
        <div class="container">
            <h1>Dilopad</h1>
            
            <form action="login.php" method="POST" class="form">
                <input id="email" name="email" type="email" placeholder="Email">
                <input id="password" name="password" type="password" placeholder="Password">
                <button name="login" type="submit" id="login-button">Masuk</button>
            </form>
        </div>
        
        <ul class="bg-bubbles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
</body>
</html>