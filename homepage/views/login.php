<?php
require_once("../controller/session_handler.php");
include("../layout/header.php");
?>

<style>
	@import "compass/css3";
	*, *:before, *:after {
		box-sizing: border-box;
	}
	html {
		overflow-y: scroll;
	}
	body {
		
		font-family: 'Titillium Web', sans-serif;
	}
	a {
		text-decoration: none;
		color: #1E90FF;
		transition: 0.5s ease;
	}
	a:hover {
		color: #17a2b8;
	}
	.form {
		background: rgba(19, 35, 47, .9);
		padding: 40px;
		max-width: 600px;
		margin: 40px auto;
		border-radius: 4px;
		box-shadow: 0 4px 10px 4px rgba(19, 35, 47, .3);
	}
	.tab-group {
		list-style: none;
		padding: 0;
		margin: 0 0 40px 0;
	}
	.tab-group:after {
		content: "";
		display: table;
		clear: both;
	}
	.tab-group li a {
		display: block;
		text-decoration: none;
		padding: 15px;
		background: rgba(160, 179, 176, .25);
		color: #a0b3b0;
		font-size: 15px;
		float: left;
		width: 50%;
		text-align: center;
		cursor: pointer;
		transition: 0.5s ease;
	}
	.tab-group li a:hover {
		background: #17a2b8;
		color: #fff;
	}
	.tab-group .active a {
		background: #1E90FF;
		color: #fff;
	}
	.tab-content > div:last-child {
		display: none;
	}
	h1 {
		text-align: center;
		color: #fff;
		font-weight: 100;
		margin: 0 0 40px;
	}
	label {
		position: absolute;
		transform: translateY(6px);
		left: 13px;
		color: rgba(255, 255, 255, .5);
		transition: all 0.25s ease;
		-webkit-backface-visibility: hidden;
		pointer-events: none;
		font-size: 15px;
	}
	label .req {
		margin: 2px;
		color: #1E90FF;
	}
	label.active {
		transform: translateY(50px);
		left: 2px;
		font-size: 14px;
	}
	label.active .req {
		opacity: 0;
	}
	label.highlight {
		color: #fff;
	}
	input, textarea {
		font-size: 15px;
		display: block;
		width: 100%;
		
		padding: 10px 10px;
		background: none;
		background-image: none;
		border: 1px solid #a0b3b0;
		color: #fff;
		border-radius: 0;
		transition: border-color 0.25s ease, box-shadow 0.25s ease;
	}
	input:focus, textarea:focus {
		outline: 0;
		border-color: #1E90FF;
	}
	textarea {
		border: 2px solid #a0b3b0;
		resize: vertical;
	}
	.field-wrap {
		position: relative;
		margin-bottom: 40px;
	}
	.top-row:after {
		content: "";
		display: table;
		clear: both;
	}
	.top-row > div {
		float: left;
		width: 48%;
		margin-right: 4%;
	}
	.top-row > div:last-child {
		margin: 0;
	}
	.button {
		border: 0;
		outline: none;
		border-radius: 0;
		padding: 15px 0;
		font-size: 1rem;
		font-weight: 600;
		text-transform: uppercase;
		letter-spacing: 0.1em;
		background: #1E90FF;
		color: #fff;
		transition: all 0.5s ease;
		-webkit-appearance: none;
	}
	.button:hover, .button:focus {
		background: #17a2b8;
	}
	.button-block {
		display: block;
		width: 100%;
	}
	.forgot {
		margin-top: -20px;
		text-align: right;
	}
	
</style>
<div class="form">
<?php echo message();?>
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          <h1>Sign Up</h1>
          
          <form  action="../controller/login_process.php<?php echo isset($_GET['id']) ? '?id='.$_GET['id'] : '' ?>"
        method="POST" class="needs-validation mt-4" novalidate>
          
          <div class="top-row">
            <div class="field-wrap">
              <label for="fname">
                First Name<span class="req">*</span>
              </label>
              <input name="fname" id="fname" type="text" required autocomplete="off" />
            </div>
        
            <div class="field-wrap">
              <label for="lname">
                Last Name<span class="req">*</span>
              </label>
              <input name="lname" id="lname" type="text"required autocomplete="off"/>
            </div>
		  </div>
		  
		  <div class="field-wrap">
              <label style="margin-top: -35px;" for="bday">
                Birthday
              </label>
              <input style="margin-top: 35px;" type="date"  id="bday" name="bday" >
            </div>
			
			<div class="field-wrap">
            <label for="nation">
			Nationality<span class="req">*</span>
            </label>
			<input type="text"  id="nation"  name="nation" required autocomplete="off"/>
		  	</div>

			  <div class="field-wrap">
              <label for="passport">
                Passport Number<span class="req">*</span>
              </label>
              <input id="passport" name="passport" type="text"required autocomplete="off"/>
			</div>
			
			<div class="field-wrap">
			  <label for="idcard">
				  ID Card:<span class="req">*</span>
			</label>
              <input type="text"  id="idcard" name="idcard" required>
            </div>

          <div class="field-wrap">
            <label for="email">
              Email Address<span class="req">*</span>
            </label>
            <input id="email" name="email" type="email"required autocomplete="off"/>
		  </div>
		  
          <div class="field-wrap">
            <label>
              Phone Number<span class="req">*</span>
            </label for="phone">
            <input  id="phone" name="phone" type="number"required autocomplete="off"/>
		  </div>

          <div class="field-wrap">
            <label  for="pwd">
              Set A Password<span class="req">*</span>
            </label>
            <input id="pwd" name="pswd" type="password"required autocomplete="off"/>
          </div>
          
          <button type="submit" name="singin" class="button button-block"/>Get Started</button>
          
          </form>

        </div>
        
        <div id="login">   
          <h1>Welcome Back!</h1>
          
          <form action="../controller/login_process.php<?php echo isset($_GET['id']) ? '?id='.$_GET['id'] : ''; ?>"
        method="POST" class="needs-validation mt-4" novalidate>
        
            <div class="field-wrap">
            <label for="lgemail">
              Email Address<span class="req">*</span>
            </label>
            <input type="email" id="lgemail" name="lgemail" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label for="lgpwd">
              Password<span class="req">*</span>
            </label>
            <input id="lgpwd" name="lgpswd" type="password"required autocomplete="off"/>
          </div>
          
          
          <button name="login" class="button button-block">Log In</button>
          
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->
</body>
<script>
		$('.form').find('input, textarea').on('keyup blur focus', function (e) {
	
	var $this = $(this),
		label = $this.prev('label');

		if (e.type === 'keyup') {
				if ($this.val() === '') {
			label.removeClass('active highlight');
			} else {
			label.addClass('active highlight');
			}
		} else if (e.type === 'blur') {
			if( $this.val() === '' ) {
				label.removeClass('active highlight'); 
				} else {
				label.removeClass('highlight');   
				}   
		} else if (e.type === 'focus') {
		
		if( $this.val() === '' ) {
				label.removeClass('highlight'); 
				} 
		else if( $this.val() !== '' ) {
				label.addClass('highlight');
				}
		}

	});

	$('.tab a').on('click', function (e) {
	
	e.preventDefault();
	
	$(this).parent().addClass('active');
	$(this).parent().siblings().removeClass('active');
	
	target = $(this).attr('href');

	$('.tab-content > div').not(target).hide();
	
	$(target).fadeIn(600);
	
	});
</script>
</html>
