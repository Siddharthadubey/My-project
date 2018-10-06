
<%@page isErrorPage="true" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/custom.css" rel="stylesheet" type="text/css"/>
    <title>Sorry - Something went wrong !!</title>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container mt-3">
            <h1>Error !! </h1>
            <p class="text-muted"><%= exception%></p>
            <img src="img/404.gif" class="img-fluid" style="width: 450px;height: 400px;" />
        </div>



    </body>
</html>
