<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonSearch.aspx.cs" Inherits="BootstrapTestDemo.Page.PersonSearch" %>

<!DOCTYPE html>


    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>PersonSearch</title>

    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/PersonSearch.css" rel="stylesheet">

    <link rel="stylesheet" href="../css/bootstrap-table.css">
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <script src="/js/ie-emulation-modes-warning.js"></script>
     <script src="../js/jquery-3.4.1.min.js"></script>
     <script src="../js/bootstrap-table.min.js"></script>
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">BootstrapTestDemo</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse" aria-expanded="false" style="height: 1px;">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Help</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <%--<div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="#">Reports</a></li>
            <li><a href="#">Analytics</a></li>
            <li><a href="#">Export</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item</a></li>
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
            <li><a href="">More navigation</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
          </ul>
        </div>--%>
        <div class="col-sm-12 col-md-12 main">
          <h1 class="page-header">PersonData</h1>

          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
          </div>

          <h2 class="sub-header">Search Result</h2>
          <div class="table-responsive">
              <table id="persontable"<%-- class="table table-striped"--%>>
                  <button class="btn btn-primary" type="button">
                    Messages <span class="badge">4</span>
                    </button>
              </table>
              <div id="toolbar" class="btn-group">
                <button id="btn_add" type="button" class="btn btn-success" onclick="javascript:window.location.href='PersonAdd.aspx'">
                      <span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>Add
               
                  </button>
                <button id="btn_edit" type="button" class="btn btn-info">
                      <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>Eidt
               
                  </button>
                <button id="btn_delete" type="button" class="btn btn-warning">
                      <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>delete
                 
                  </button>
                  <%--<asp:Button id="btn_delete1" type="button" class="btn btn-warning" Text="Delete" runat="server" ></asp:Button>--%> 
                    </div>
          </div>
        </div>
      </div>
    </div>

<script>
    $('#persontable').bootstrapTable({
        url: "PersonTable.ashx",
        cache: false,
        method: "post",
        toolbar: "#toolbar",
        showRefresh: true,
        sortStable: true,
        contentType: "application/x-www-form-urlencoded",
        pagination: true,
        sidePagination: "server",
        pageNumber: 1,
        pageSize: 10,
        search: true,
        clickToSelect: true,
        queryParamsType: "",
        queryParams: function (params) {
            return {
                pageSize: params.pageSize,
                pageNumber: params.pageNumber,
                sortName: params.sortName,
                sortOrder: params.sortOrder,
                searchText: params.searchText
            };
        },
        formatLoadingMessage: function () {
            return "Please Wait...";
        },
        formatNoMatches: function () {
            return "No Data";
        },
        columns: [{
                field: "select",
                title: "All",
                checkbox:true,
            }, {
                field: 'Id_P',
                title: 'ID',
                sortable:true
            }, {
                field: 'FirstName',
                title: 'FirstName'
            }, {
                field: 'LastName',
                title: 'LastName'
            }, {
                field: 'City',
                title: 'StateName'
            }, {
                field: 'Address',
                title: 'Address'
            }, {
                field: 'Up_PersonId',
                title: 'Assign To'
            }]

    });

    $('#btn_delete').click(function (e) {

    })
</script>
  

</body>
