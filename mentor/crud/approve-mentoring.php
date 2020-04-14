<?php
    require __DIR__ . '/../../conf.php';

    $id = $_GET['id'];

    $result = mysqli_query($connect, "UPDATE absensi SET isVerified = 'verified' WHERE id_absensi='$id'");
    header("location:../ver-mentoring.php?pesan=verified");
?>