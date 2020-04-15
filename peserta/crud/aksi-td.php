<?php

require __DIR__ . '/../../conf.php';
session_start();

$idTim = $_GET['t'];
$idPeserta = $_GET['p'];
$idTd = $_POST['materi'];
$tempat = $_POST['tempat'];
$waktu = $_POST['waktu'];

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

$cekQuery = mysqli_query($connect, "SELECT * FROM absensi WHERE id_peserta_I == '$idPeserta' AND id_td == '$idTd'");
$itung = mysqli_num_rows($cekQuery);

if($itung > 0) {
    header("location:../absen-td.php?pesan=canceled");
} else {
    $query = mysqli_query($connect, "INSERT INTO absensi (id_absensi, id_tim, id_peserta_I, id_td, tempat_pelaksanaan, waktu_pelaksanaan, isVerified) VALUES ('$baseId', '$idTim', '$idPeserta', '$idTd', '$tempat', '$waktu', 'non-verified')");
    header("location:../absen-td.php?pesan=submited");  
}

?>