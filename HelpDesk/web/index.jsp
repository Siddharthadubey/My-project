<%@page import="com.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user != null) {
        response.sendRedirect("home.jsp");
    }

%>


<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
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
        <title>Welcome!! </title>
        <style>
            .alert{
                border-radius: 0px;
            }
        </style>
    </head>
    <body>
        <header>

            <%@include  file="navbar.jsp"%>
        </header>


        <%
            Map<String, String> p = (Map) session.getAttribute("msg");
            if (p != null) {

                String message = p.get("message");
                String type = p.get("type");
                String temp = "danger";
                if (type.equals("success")) {
                    temp = "success";
                }
        %>

        <div class="alert alert-<%= temp%> alert-dismissible mb-0">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong><%= message%></strong> 
        </div>

        <%
                session.removeAttribute("msg");
            }

        %>


      



        <%@include file="modals.jsp" %>

        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

        <script src="js/bootstrap.min.js" type="text/javascript"></script>

        <script>

<script>


            function getDateTime()
{
            var date = new Date();
            $("#clock-digital").html(date.toLocaleTimeString());
        }
        
        $(document).ready(function () {


            $(".t").height(window.innerHeight - 50);
            $('.carousel').carousel({
            interval: 500,
                    ride: true
        });
        
        //===========================================
        setInterval(getDateTime, 1000);
        
        
        
        
        })
        </script>




    </body>
</html>
