<?php

require __DIR__ . '/../../conf.php';
session_start();

$idTim = $_GET['t'];
if(isset($_POST['anggota1'])) {
    $idPeserta1 = $_POST['anggota1'];
} else {
    $idPeserta1 = "NULL";
}
if(isset($_POST['anggota2'])) {
    $idPeserta2 = $_POST['anggota2'];
} else {
    $idPeserta2 = "NULL";
}

if(isset($_POST['anggota3'])) {
    $idPeserta3 = $_POST['anggota3'];
} else {
    $idPeserta3 = "NULL";
}
$idMentoring = $_POST['materi'];
$tempat = $_POST['tempat'];
$waktu = $_POST['waktu'];

if(!isset($_POST['anggota1']) && !isset($_POST['anggota2']) && !isset($_POST['anggota3'])) {
    header("location:../absen-mentoring.php?pesan=noPerson");
} else {
    $queryGetId = mysqli_query($connect, "SELECT id_absensi FROM absensi ORDER BY id_absensi DESC LIMIT 1");
    $fetch = mysqli_fetch_assoc($queryGetId);

    $lastId = $fetch['id_absensi'][-2].$fetch['id_absensi'][-1];
    $numLastId = (int)$lastId+1;
    $baseId = "A00";

    if($numLastId < 10) {
        $baseId = $baseId."0".$numLastId;
    } else {
        $baseId = $baseId.$numLastId;
    }

    $cekQuery = mysqli_query($connect, "SELECT * FROM absensi WHERE id_tim = '$idTim' AND id_mentoring = '$idMentoring'");
    $itung = mysqli_num_rows($cekQuery);

    if($itung > 0) {
        header("location:../absen-mentoring.php?pesan=canceled");
    } else {
        $text = "";
        if($idPeserta1 == "NULL") {
            $text = "INSERT INTO absensi (id_absensi, id_tim, id_peserta_I, id_peserta_II, id_peserta_III, id_mentoring, tempat_pelaksanaan, waktu_pelaksanaan, isVerified) VALUES ('$baseId', '$idTim', NULL, '$idPeserta2', '$idPeserta3', '$idMentoring', '$tempat', '$waktu', 'non-verified')";
        }

        if($idPeserta2 == "NULL") {
            $text = "INSERT INTO absensi (id_absensi, id_tim, id_peserta_I, id_peserta_II, id_peserta_III, id_mentoring, tempat_pelaksanaan, waktu_pelaksanaan, isVerified) VALUES ('$baseId', '$idTim', '$idPeserta1', NULL, '$idPeserta3', '$idMentoring', '$tempat', '$waktu', 'non-verified')";
        }

        if($idPeserta3 == "NULL") {
            $text = "INSERT INTO absensi (id_absensi, id_tim, id_peserta_I, id_peserta_II, id_peserta_III, id_mentoring, tempat_pelaksanaan, waktu_pelaksanaan, isVerified) VALUES ('$baseId', '$idTim', '$idPeserta1', '$idPeserta2', NULL, '$idMentoring', '$tempat', '$waktu', 'non-verified')";
        }

        if($idPeserta1 == "NULL" && $idPeserta2 == "NULL") {
            $text = "INSERT INTO absensi (id_absensi, id_tim, id_peserta_I, id_peserta_II, id_peserta_III, id_mentoring, tempat_pelaksanaan, waktu_pelaksanaan, isVerified) VALUES ('$baseId', '$idTim', NULL, NULL, '$idPeserta3', '$idMentoring', '$tempat', '$waktu', 'non-verified')";
        }

        if($idPeserta1 == "NULL" && $idPeserta3 == "NULL") {
            $text = "INSERT INTO absensi (id_absensi, id_tim, id_peserta_I, id_peserta_II, id_peserta_III, id_mentoring, tempat_pelaksanaan, waktu_pelaksanaan, isVerified) VALUES ('$baseId', '$idTim', NULL, '$idPeserta2', NULL, '$idMentoring', '$tempat', '$waktu', 'non-verified')";
        }

        if($idPeserta2 == "NULL" && $idPeserta3 == "NULL") {
            $baseId.$idTim.$idPeserta1.$idMentoring.$tempat.$waktu;
            $text = "INSERT INTO absensi (id_absensi, id_tim, id_peserta_I, id_peserta_II, id_peserta_III, id_mentoring, tempat_pelaksanaan, waktu_pelaksanaan, isVerified) VALUES ('$baseId', '$idTim', '$idPeserta1', NULL, NULL, '$idMentoring', '$tempat', '$waktu', 'non-verified')";
        } 
        
        if($idPeserta1 != "NULL" && $idPeserta2 != "NULL" && $idPeserta3 != "NULL") {
            $text = "INSERT INTO absensi (id_absensi, id_tim, id_peserta_I, id_peserta_II, id_peserta_III, id_mentoring, tempat_pelaksanaan, waktu_pelaksanaan, isVerified) VALUES ('$baseId', '$idTim', '$idPeserta1', '$idPeserta2', '$idPeserta3', '$idMentoring', '$tempat', '$waktu', 'non-verified')";
        }

        $query = mysqli_query($connect, $text);
        header("location:../absen-mentoring.php?pesan=submited");  
    }
}

?>