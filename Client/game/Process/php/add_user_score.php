<?php
    include("../../../../Process/db/connect.php");

    if(isset($_GET['add']) == 'score'){
        $user_Name = $_GET['userName'];
        $game_Name = $_GET['gameName'];
        $user_Score = $_GET['userScore'];

        $getdate = time();
        $today = date("d-m-Y h:i:s", $getdate);
        // echo $user_Name;
        
        $sql_get_game_id = mysqli_query($con, "select MaGame from game where TenGame= '$game_Name'");
        $row_get_game_id = mysqli_fetch_array($sql_get_game_id);

        $sql_get_user_info = mysqli_query($con, "select * from khachhang where TaiKhoanKH= '$user_Name'");
        $row_get_user_info = mysqli_fetch_array($sql_get_user_info);
        
        $user_CurTurn = $row_get_user_info['LuotChoi'];
        $user_NewTurn = $user_CurTurn - 1;

        if($user_NewTurn >= 0){
            $game_ID = $row_get_game_id['MaGame'];
            $user_ID = $row_get_user_info['MSKH'];
            $user_Token = $row_get_user_info['BeUToken'];
            
            $sql = "INSERT INTO diemgame(MaGame, MSKH, Diem, NgayChoi) VALUES('$game_ID', '$user_ID', '$user_Score', '$today')";

            $user_Token = $user_Score + $user_Token;

            $sql_Update_Token = "UPDATE khachhang set BeUToken='$user_Token' where TaiKhoanKH='$user_Name'";

            $sql_Update_UserTurn = "UPDATE khachhang set LuotChoi='$user_NewTurn' where TaiKhoanKH='$user_Name'";

            // echo $sql;
            
            $sql_insert = mysqli_query($con, $sql);
            $sql_update = mysqli_query($con, $sql_Update_Token);
            $sql_update_turn = mysqli_query($con, $sql_Update_UserTurn);

            if($sql_insert && $sql_update && $sql_update_turn){
                echo 'true';
            }else{
                echo 'false';
            }
        }else{
            echo 'lackofTurn';
        }
    }
?>