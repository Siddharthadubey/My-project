<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/custom.css" rel="stylesheet" type="text/css"/>
        <link href="css/navstyle.css" rel="stylesheet" type="text/css"/>

        <link href="css/homecss.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>

        <%@include file="navbar.jsp"%>

        <div class="container">

            <div class="row">
                <div class="col-md-6" style="border:1px solid red;">
                </div>

                <div class="col-md-6" style="border:1px solid red;">
                </div>
            </div>
        </div>








        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

        <script src="js/bootstrap.min.js" type="text/javascript"></script>

        <script src="js/prism.js" type="text/javascript"></script>

        <script src="js/sweetalert.min.js" type="text/javascript"></script>





        <script>
            function getDateTime()
            {
                var date = new Date();
                $("#clock-digital").html(date.toLocaleTimeString());

            }
        </script>
    </body>
</html>
