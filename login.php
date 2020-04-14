<?php 
    require __DIR__ . '/conf.php';
    session_start();

    $email = $_POST['email'];
    $password = md5($_POST['password']);

    $dataPeserta = mysqli_query($connect, "SELECT id_peserta FROM peserta WHERE email_peserta = '$email'");
    $fetchPeserta = mysqli_fetch_row($dataPeserta);
    $cekPeserta = mysqli_num_rows($dataPeserta);

    if($cekPeserta > 0) {
        $dataFinal = mysqli_query($connect, "SELECT * FROM user WHERE id = ".'$fetchPeserta[0]'." AND pass = ".'$password');
        $fetchFinal = mysqli_fetch_row($dataFinal);

        $_SESSION['username'] = $fetchFinal['id'];
        $_SESSION['status'] = $fetchFinal['hak_akses'];
        header("location:peserta/index.php");
    } else {
        $dataMentor = mysqli_query($connect, "SELECT id_mentor FROM mentor WHERE email_mentor = '$email'");
        $fetchMentor = mysqli_fetch_row($dataMentor);
        $cekMentor = mysqli_num_rows($dataMentor);

        if($cekMentor > 0) {
            $dataFinal = mysqli_query($connect, "SELECT * FROM user WHERE id = '$fetchMentor[0]' AND pass = '$password'");
            $fetchFinal = mysqli_fetch_assoc($dataFinal);
            $cekfinal = mysqli_num_rows($dataFinal);

            if($cekfinal > 0) {
                $_SESSION["id"] = $fetchFinal['id'];
                $_SESSION["status"] = $fetchFinal['hak_akses'];
                header("location:mentor/index.php");
            } else {
                header("location:index.php?pesan=gagal");
            }
        } else {
            header("location:index.php?pesan=gagal");
        }
    }
?>