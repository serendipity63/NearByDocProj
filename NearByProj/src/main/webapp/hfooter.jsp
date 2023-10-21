<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html >

<head>

  <meta charset="UTF-8">

  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Simple Footer Template with auto current Year</title>

  <!-- Fontawesome for icons -->

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
* {
  margin: 0;

  padding: 0;

  box-sizing: border-box;
}


footer {
	position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    background: #05053f;
    height: 68px;
    width: 100vw;
    color: #fff;
    margin: 0 auto;
    
}

.footer-content {
  display: flex;

  align-items: center;

  justify-content: center;

  flex-direction: column;

  text-align: center;
  
  margin-top:3px;
}

.footer-content h3 {
  font-size: 2.1rem;

  font-weight: 500;

  text-transform: capitalize;

  line-height: 3rem;
}

.footer-content p {
  max-width: 500px;

  margin: 10px auto;

  line-height: 28px;

  font-size: 14px;

  color: #cacdd2;
}

.socials {
  list-style: none;

  display: flex;

  align-items: center;

  justify-content: center;

  margin: 1rem 0 3rem 0;
}

.socials li {
  margin: 0 10px;
}

.socials a {
  text-decoration: none;

  color: #fff;

  padding: 5px;
}

.socials a i {
  font-size: 1.1rem;

  width: 20px;

  transition: color 0.4s ease;
}

.socials a:hover i {
  color: aqua;
}

.footer-bottom {
  background: #000;
    width: 100vw;
    text-align: center;
}

.footer-bottom p {
  float: left;
    font-size: 18px;
    word-spacing: 4px;
    margin-top: -57px;
    margin-left: 20px;
}

.footer-bottom p a {
  color: #ccc;

  font-size: 16px;

  text-decoration: none;
}

.footer-bottom span {
  text-transform: uppercase;
}

.footer-menu {
 	float: right;
    margin-right: 70px;
    margin-top: -61px;}

.footer-menu ul {
  display: flex;
}

.footer-menu ul li {
  padding-right: 10px;

  display: block;
}

.footer-menu ul li a {
  color: #cfd2d6;

  text-decoration: none;
}

.footer-menu ul li a:hover {
  color: #27bcda;
}

@media (max-width: 500px) {
  .footer-bottom p {
    float: none;
  }

  .footer-menu ul {
    display: flex;

    margin-top: 10px;

    margin-bottom: 20px;

    text-align: center;
  }
}

</style>
<script>
const year = document.getElementById("year");

year.textContent = new Date().getFullYear();

</script>
</head>

<body>

  <footer>

    <div class="footer-content">

    

  
      <ul class="socials">

        <li><a href="https://www.facebook.com"><i class="fa fa-facebook"></i></a></li>

        <li><a href="https://www.twitter.com"><i class="fa fa-twitter"></i></a></li>

        <li><a href="https://www.google.com"><i class="fa fa-google-plus"></i></a></li>

        <li><a href="https://www.youtube.com"><i class="fa fa-youtube"></i></a></li>

        

      </ul>

    </div>

    <div class="footer-bottom">

      <p>Copyright &copy <span id="year"></span> <a href="login">@nearbydoc</a> </p>

      <div class="footer-menu">

       

      </div>

    </div>

  </footer>

</body>

</html>