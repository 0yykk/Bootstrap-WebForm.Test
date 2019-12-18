<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonAdd.aspx.cs" Inherits="BootstrapTestDemo.Page.PersonAdd" %>

<!DOCTYPE html>

<html lang="zh-CN"><head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Add Person</title>

    
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    
    <link href="../css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <link href="../css/jumbotron-narrow.css" rel="stylesheet">
    <script src="../js/jquery-3.4.1.min.js"></script>

    <script src="../js/ie-emulation-modes-warning.js"></script>


  </head>

  <body>

    <div class="container">
      <div class="header clearfix">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation" class="active"><a href="PersonSearch.aspx">Home</a></li>
            <li role="presentation"><a href="#">About</a></li>
            <li role="presentation"><a href="#">Contact</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">Add Person</h3>
      </div>

      <div class="jumbotron">
        <h1>Person Add</h1>
        <p class="lead">You can input the new person's data on here</p>
        
      </div>

      <div class="row marketing">
          <div>
        <div class="col-lg-6">
          <h4>PersonID</h4>
          <div class="input-group">
        <span class="input-group-addon" id="basic-addon1"></span>
        <input type="text" class="form-control" id="PersonId" name="PersonId" placeholder="PersonID" aria-describedby="basic-addon1">
        </div>

          <h4>FirstName</h4>
          <div class="input-group">
        <span class="input-group-addon" id="basic-addon2"></span>
        <input type="text" class="form-control" name="FirstName" placeholder="FirstName" aria-describedby="basic-addon1">
        </div>
          <h4>LastName</h4>
          <div class="input-group">
        <span class="input-group-addon" id="basic-addon3"></span>
        <input type="text" class="form-control" name="LastName" placeholder="LastName" aria-describedby="basic-addon1">
        </div>
        </div>

        <div class="col-lg-6">
          <h4>StateName</h4>
          <div class="input-group">
        <span class="input-group-addon" id="basic-addon4"></span>
        <input type="text" class="form-control" name="StateName" placeholder="StateName" aria-describedby="basic-addon1">
        </div>
          <h4>Address</h4>
          <div class="input-group">
        <span class="input-group-addon" id="basic-addon5"></span>
        <input type="text" class="form-control" name="Address" placeholder="Address" aria-describedby="basic-addon1">
        </div>
          <h4>Assign To</h4>
          <div class="input-group">
        <span class="input-group-addon" id="basic-addon6"></span>
        <input type="text" class="form-control" name="AssignTo" placeholder="Assign To" aria-describedby="basic-addon1">
          </div>
           
        </div>
          </div>
          <div class="col-md-6 col-md-offset-5">&nbsp&nbsp</div>
          <div class="col-md-6 col-md-offset-5">
              <p><a class="btn btn-lg btn-success" onclick="btnSave();">Save</a></p>
          </div>
      </div>
        

      <footer class="footer">
        <p>© 2019 PandaRG,Company, Inc.</p>
      </footer>

    </div> 
      <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../js/ie10-viewport-bug-workaround.js"></script>
    <script>
        function btnSave() {
            debugger;
            $.ajax({
              url: "PersonAdd.aspx",
              data: {
                  "PersonId": $("#PersonId").val(),
                  FirstName: $("#FirstName").val(),
                  LastName: $('#LastName').val(),
                  StateName: $('#StateName').val(),
                  Address: $('#Address').val(),
                  AssignTo: $('#AssignTo').val()
              },
              type: "GET",
              dataType: "Json",
              success: function (result) {
                   var Request = GetRequest();
                  var key = Request["result"];
                  if (key == 1) {
                      alert("Insrt successful");
                  }
                  else
                      alert("update successful");
                  }
              })
        }
        
        function GetRequest() {
            var url = location.search; 
            var theRequest = new Object();
            if (url.indexOf("?") != -1) {
            var str = url.substr(1);
            strs = str.split("&");
            for (var i = 0; i < strs.length; i++) {
            theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
            }
                }
            return theRequest;
                }
    </script>

</body></html>
