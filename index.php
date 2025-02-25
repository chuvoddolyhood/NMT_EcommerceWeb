<?php
	session_start();
	include('Process/db/connect.php');
	include_once 'Process/google_login/login_google.php';
?>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>Web bán hàng</title>
		<link rel="stylesheet" href="./Process/assets/css/base.css">
		<link rel="stylesheet" href="./Process/assets/css/slideshow.css">
		<link rel="stylesheet" href="./Process/php/register.php">
		<link rel="stylesheet" href="./Process/google_login/login_data.php">
		<link rel="stylesheet" href="./Process/assets/fonts/fontawesome-free-5.15.4-web/css/all.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
		<script type="text/javascript" src="https://cdn.rawgit.com/igorlino/elevatezoom-plus/1.1.6/src/jquery.ez-plus.js"></script>
	</head>

	<body>
		
		<!-- BEM -->
		<div class="app">
		<?php 

			if(isset($_GET['status']) && $_GET['status']=='logout'){
				unset($_SESSION['login']);
				//Include GP config file
				include_once 'gpConfig.php';

				//Unset token and user data from session
				unset($_SESSION['token']);
				unset($_SESSION['userData']);

				//Reset OAuth access token
				$gClient->revokeToken();

				//Destroy entire session
				session_destroy();
				header('location: index.php');
			}

			include("Client/include/topbar.php");

			if(isset($_GET['quanly'])){
				$quanly = $_GET['quanly'];
			}else{
				$quanly = '';
			}

			if($quanly == 'danhmuc') {
				include("Client/include/home-danhmuc-sp.php");
			}elseif ($quanly == 'chitietsp') {
				include("Client/include/chitietsp.php");
			}elseif ($quanly == 'giohang') {
				include("Client/include/giohang.php");
			}elseif($quanly == 'thongtin'){
				include("Client/include/thongtin_home.php");
			}elseif($quanly == 'game'){
				if(isset($_GET['id'])){
					$id = $_GET['id'];
				}else{
					$id = '';
				}
				if($id == '1'){
					include("Client/game/TicTacToe/index.php");
				}elseif($id == '2'){
					include("Client/game/FlappyBird/index.php");
				}else{
					include("Client/game/game.php");
				}
			}else{
				include("Client/include/home-danhmuc-sp.php");
			}

			if(isset($_SESSION['login'])){
				echo '<script> login() </script>';
			}

		?>
		</div>
		<!-- Modal layout -->
		<!-- Modal--active -->
		<div class="modal">
			<!-- modal__overlay--active -->
			<div class="modal__overlay"></div>

			<div class="modal__body">
				<!-- Register form -->
				<div class="auth-form">
					<div class="auth-form__container">
						<div class="auth-form__header">
							<h3 class="auth-form__heading">Đăng ký</h3>
							<span onclick="switchModal(1)" class="auth-form__switch-btn">Đăng nhập</span>
						</div>

						<div class="auth-form__form">
							<form class="">
								<div class="auth-form__group">
									<input type="text" id="userName" class="auth-form__input" placeholder="Tên tài khoản" required />
									<input type="text" id="userRealName" class="auth-form__input" placeholder="Họ và tên" required />
								</div>
								<div class="auth-form__group">
									<input type="password" id="userPass" class="auth-form__input" placeholder="Mật khẩu" required />
									<input type="password" id="userRePass" class="auth-form__input" placeholder="Nhập lại mật khẩu" required />
								</div>
								<div class="auth-form__group">
									<input type="tel" id="userTel" class="auth-form__input" placeholder="Số điện thoại" required />									
									<input type="date" id="userDOB" class="auth-form__input" placeholder="" required />
								</div>
								<div class="auth-form__group">
									<input type="email" id="userEmail" class="auth-form__input" placeholder="Email" required />
									<input type="text" id="userSex" class="auth-form__input" placeholder="Giới tính" required />
								</div>
							</form>
						</div>

						<div class="auth-form__aside">
							<p class="auth-form__policy-text">
									Bằng việc đăng kí, bạn đã đồng ý với chúng tôi về
								<a href="" class="auth-form__text-link">Điều khoản dịch vụ</a> 
								& 
								<a href="" class="auth-form__text-link">Chính sách bảo mật</a>
							</p>
						</div>
						<div class="auth-form__controls">
							<button onclick="deactiveModal(0)" class="btn btn--normal auth-form__controls-back">TRỞ LẠI</button>
							<button onclick="check_regis_customer()" name="btn-register_customer" class="btn btn--primary">ĐĂNG KÝ</button>
						</div>
					</div>

					<div class="auth-form__socials">
						<a href="" class="auth-form__socials--facebook btn btn--size-s btn--with-icon">
							<i class="auth-form__socials-icon fab fa-facebook-square"></i>
							<span class="auth-form__social-title">
								Kết nối với Facebook
							</span>
						</a>
						<?php echo $link_login_google; ?>
						<!-- <a href="" class="auth-form__socials--google btn btn--size-s btn--with-icon">
							<i class=" auth-form__socials-icon fab fa-google"></i>
							<span class="auth-form__social-title">
								Kết nối với Google
							</span>
						</a> -->
					</div>
				</div>

				<!-- Login form -->
				<div class="auth-form">
					<div class="auth-form__container">
						<div class="auth-form__header">
							<h3 class="auth-form__heading">Đăng nhập</h3>
							<span onclick="switchModal(0)" class="auth-form__switch-btn">Đăng ký</span>
						</div>
						<form action="Process/php/login.php" method="POST">
							<div class="auth-form__form">
								<div class="auth-form__group">
									<input type="text" name="username_client" class="auth-form__input" placeholder="Tài khoản của bạn" required>
								</div>
								<div class="auth-form__group">
									<input type="password" name="password_client" class="auth-form__input" placeholder="Mật khẩu của bạn" required>
								</div>
							</div>

							<div class="auth-form__aside">
								<div class="auth-form__help">
									<a onclick="switchModal(2)" class="auth-form__help-link auth-form__help-forgot">
										Quên mật khẩu
									</a>
									<span class="auth-form__help-separate"></span>
									<a href="" class="auth-form__help-link">
										Cần trợ giúp?
									</a>
								</div>
							</div>

							<div class="auth-form__controls">
								<button onclick="deactiveModal(2)" class="btn btn--normal auth-form__controls-back">TRỞ LẠI</button>
								<button type="submit" name="btn_user_login" class="btn btn--primary">ĐĂNG NHẬP</button>
							</div>
						</form>
					</div>
					<div class="auth-form__socials">
						<a href="" class="auth-form__socials--facebook btn btn--size-s btn--with-icon">
							<i class="auth-form__socials-icon fab fa-facebook-square"></i>
							<span class="auth-form__social-title">
								Kết nối với Facebook
							</span>
						</a>
						<?php echo $link_login_google; ?>
						<!-- <a href="" class="auth-form__socials--google btn btn--size-s btn--with-icon">
							<i class=" auth-form__socials-icon fab fa-google"></i>
							<span class="auth-form__social-title">
								Kết nối với Google
							</span>
						</a> -->
					</div>
				</div>
				<div class="auth-form">
					<div class="auth-form__container">
						<div class="auth-form__header">
							<h3 class="auth-form__heading">Quên mật khẩu</h3>
							<span onclick="switchModal(1)" class="auth-form__switch-btn">Đăng nhập</span>
						</div>
						<form action="Process/php/forgot_pass.php" method="POST">
							<div class="auth-form__form">
								<div class="auth-form__group">
									<input type="text" name="username_client" class="auth-form__input" placeholder="Tài khoản của bạn" required>
								</div>
								<div class="auth-form__group">
									<input type="tel" name="tel_client" class="auth-form__input" placeholder="Nhập số điện thoại của bạn" required>
								</div>
								<div class="auth-form__group">
									<input type="email" name="email_client" class="auth-form__input" placeholder="Nhập email của bạn" required>
								</div>
							</div>

							<div class="auth-form__aside">
								<div class="auth-form__help">
									<a class="auth-form__help-link">
										Cần trợ giúp?
									</a>
								</div>
							</div>

							<div class="auth-form__controls">
								<button onclick="deactiveModal(1)" class="btn btn--normal auth-form__controls-back">TRỞ LẠI</button>
								<button type="submit" name="btn_forgot_password" class="btn btn--primary">LẤY LẠI MẬT KHẨU</button>
							</div>
						</form>
					</div>
					<div class="auth-form__socials">
						<a href="" class="auth-form__socials--facebook btn btn--size-s btn--with-icon">
							<i class="auth-form__socials-icon fab fa-facebook-square"></i>
							<span class="auth-form__social-title">
								Kết nối với Facebook
							</span>
						</a>
						<?php echo $link_login_google; ?>
						<!-- <a href="" class="auth-form__socials--google btn btn--size-s btn--with-icon">
							<i class=" auth-form__socials-icon fab fa-google"></i>
							<span class="auth-form__social-title">
								Kết nối với Google
							</span>
						</a> -->
					</div>
				</div>
				<div class="auth-form">
					<div class="auth-form__container">
						<div class="auth-form__header">
							<h3 class="auth-form__heading">Bổ sung thông tin đăng nhập</h3>
							<span onclick="switchModal(1)" class="auth-form__switch-btn">Đăng nhập</span>
						</div>
						<!-- <form action="Process/google_login/login_data" method="POST"> -->
							<div class="auth-form__form">
								<div class="auth-form__group">
									<input type="text" id="id_google" class="auth-form__input" placeholder="" value="<?php echo $gpUserData['oauth_uid'] ?>" required>
								</div>
								<div class="auth-form__group">
									<input type="text" id="username_google" class="auth-form__input" placeholder="Tài khoản của bạn" required>
								</div>
								<div class="auth-form__group">
									<input type="tel" id="usertel_google" class="auth-form__input" placeholder="Nhập số điện thoại của bạn" required>
								</div>
							</div>
							<div class="auth-form__aside">
								<div class="auth-form__help">
									<a class="auth-form__help-link">
										Cần trợ giúp?
									</a>
								</div>
							</div>

							<div class="auth-form__controls">
								<button onclick="check_regis_google()" name="btn_forgot_password" class="btn btn--primary">HOÀN TẤT BỔ SUNG</button>
							</div>
						<!-- </form> -->
					</div>
				</div>
			</div>
		</div>

		<?php 
			if(isset($_GET['status']) && $_GET['status']=='login'){
				if($_SESSION['login']!=null){
					echo "<script> 
							alert('Hãy đăng xuất trước khi thực hiện chức năng này!') 
							window.location='index.php';
						</script>";
					header('location: ./index.php');
				}else{
					echo '<script> activeModal(1) </script>';
				}
			}elseif(isset($_GET['status']) && $_GET['status']=='register'){
				if($_SESSION['login']!=null){
					echo "<script> 
							alert('Hãy đăng xuất trước khi thực hiện chức năng này!') 
							window.location='index.php';
						</script>";
				}else{
					echo '<script> activeModal(0) </script>';
				}
			}elseif(isset($_GET['status']) && $_GET['status']=='forgot_password'){
				if($_SESSION['login']!=null){
					echo "<script> 
							alert('Hãy đăng xuất trước khi thực hiện chức năng này!') 
							window.location='index.php';
						</script>";
				}else{
					echo '<script> activeModal(2) </script>';
				}
			}

			include("Client/include/footbar.php");

			if($gClient->getAccessToken() && !isset($_SESSION['login'])) {
				echo "<script> activeModal(3) </script>";
			}
		?>
	</body>
		<script src="Process/javascript/main.js"></script>
		<script src="Process/javascript/change_info.js"></script>
		<script src="Process/javascript/check_register.js"></script>
</html>