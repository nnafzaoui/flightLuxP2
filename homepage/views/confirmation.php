<?php 
require_once("../controller/session_handler.php");
require_once("../model/functions.php");


if(!(isset($_SESSION['id']) && isset($_GET['id']))){
    header("Location: ../views/index.php");
    exit;
}
open_connetion();
$flight = new Flight($connection);
$flight->create_from_id((int) $_GET['id']);
include("../layout/header.php");

?>
<head>
<link rel="stylesheet" href="assets/css/confirmation.css">
</head>
     
    <!-- end navbar  -->
    <section class="container">
    <?php echo message();?>
        <div class="login-box">
            <h2>Booking Confirmation</h2>
            <form action="../controller/reserve_process.php" method="POST" id="user">
              <div class="user-box">
                <h5>Reservation for : <?php echo $_SESSION['firstname']. ' '.$_SESSION['lastname']?></h5>
              </div>
            
              <div class="user-box">
                  <h5>Date : <?php echo $flight->get_data()['date_flight']?><h5>
              </div>
              <div class='user-box'>
              
                  <h5>Flight : <?php echo $flight->get_data()['plane_name']?></h4>
                  <h5>Departure : <?php echo $flight->get_data()['depart']?></h5>
                  <h5>Arrival : <?php echo $flight->get_data()['distination']?></h5>
                
              </div>
              <div> <p class="user-box">Total Price: <span class="text-primary"><?php echo $flight->get_data()['price']?></span></p></div>

              <form action="../controller/reserve_process.php" method="POST">
                        <input type="hidden" name="idUser" value="<?php echo $_SESSION['id'];?>">
                        <input type="hidden" name="idFlight" value="<?php echo (int) $_GET['id'];?>">
                        <input type="hidden" name="firstname" value="<?php echo $_SESSION['firstname'];?>">
                        <input type="hidden" name="lastname" value="<?php echo $_SESSION['lastname'];?>">
                        <input type="hidden" name="passport" value="<?php echo $_SESSION['passport'];?>">
                        <button type="submit" class="btn btn-primary" name="reserve">Confirm this reservation</button>
              </form>

              <div class="blank"></div>
                   
            </form>
          </div>

    </section>
    <!-- start footer  -->
	<footer>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm">
                <img src="assets/logo.png" width="100" alt="logo">
					<h3>About us</h3>
					<p> Dolores deleniti esse sit fuga sunt fugit numquam, unde soluta quae autem natus quam asperiores minima consequuntur repellendus similique? Eligendi, facere quod!</p>

				</div>
				<div class="col-sm">
					<label for="comment">Comment:</label>
					<textarea class="form-control" rows="5" id="comment"></textarea>
					<input type="submit" class="btn btn-info" value="Send Your Message" style="margin-top: 10px;">
				</div>
				<div class="col-sm">
					<div class="mu-footer-widget">
						<h4>Business Offers</h4>
						<ul class="list-group">
							<a href="" class="listOffers">Business trip</a><br>
							<a href="" class="listOffers">Beyond Business</a><br>
							<a href="" class="listOffers">Meetings and conferences</a>
						</ul>
						
						
					  </div>
				</div>
				<div class="col-sm-2">
					<h3>Follow us</h3>
					<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Numquam, et cumque iure cum sint accusantium praesentium recusandae </p>
					<div class="row justify-content-around">
						<i class="fa fa-whatsapp" aria-hidden="true"></i>
						<i class="fa fa-linkedin" aria-hidden="true"></i>
						<i class="fa fa-twitter" aria-hidden="true"></i>
						<i class="fa fa-facebook" aria-hidden="true"></i>
						<i class="fa fa-instagram" aria-hidden="true"></i>
					</div>
				</div>
			</div>
			
		</div>
		<div class="col" style="margin-top: 40px;background-color: gainsboro;">
			<p>Copyright-2020 ©  By : You<span style="color:blue">code</span> Safi</p>
		</div>
	</footer>
	<!-- end footer  -->
	<script src="js/script.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<?php close_connection(); ?>
</body>
</html>