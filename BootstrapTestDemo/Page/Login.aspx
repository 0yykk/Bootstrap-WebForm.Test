<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BootstrapTestDemo.Page.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <meta http-equiv="content-type" content="text/html;charset-utf-8"/>
    <title>Login Page</title>
    <script src="../js/bootstrap.min.js"></script>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/Login.css" rel="stylesheet" />
</head>
<body>
   
        <div class="container">

      <form class="form-signin">
        <h2 class="form-signin-heading">Sign in</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" id="inputEmail" class="form-control" name="username" placeholder="Email address" required="" autofocus="">
         <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" name="password" placeholder="Password" required="">
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" onclick="btnSign()">Sign in</button>
      </form>

    </div> <!-- /container -->
  <script>
      function btnSign() {
          $.ajax({
              url: "Login.aspx",
              data: {
                  username: $("#username").val(),
                  password:$("#password").val(),
              },
              type: "Post",
              dataType: "Json",
              success: function (result) {
                  alert("123")
              }
          })
      }

    </script>

</body>
</html>
