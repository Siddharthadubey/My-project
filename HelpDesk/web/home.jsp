<%@page import="com.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.dao.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.Question"%>
<%@page import="com.dao.ConnectionProvider"%>
<%@page import="com.dao.PostDao"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.entities.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tlds/mytags" prefix="mytags" %>
<%@page  errorPage="error.jsp" %>

<%

    User user = (User) session.getAttribute("current-user");
    System.out.println(user);
    if (user == null) {
        Map<String, String> msg = new HashMap();
        msg.put("message", "You are not logged in !! Please login to access home page");
        msg.put("type", "error");
        session.setAttribute("msg", msg);
        response.sendRedirect("welcome-to-technical-forum");

    }

%>


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
        <link href="css/prism.css" rel="stylesheet" type="text/css"/>
        <link href="css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link href="css/navstyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/homecss.css" rel="stylesheet" type="text/css"/>
        <title><%= user.getName()%> || Technical Forum</title>
        <link rel="icon" type="image/jpeg" href="">
           </head>
              <style>
            .alert{
                border-radius: 0px;
            }

            /*            #drop{
                            position: relative;
                            left: -50px;
                        }*/
            .loader {
                border-top: 16px solid blue;
                border-right: 16px solid green;
                border-bottom: 16px solid red;
                border-left: 16px solid pink;
                border-radius: 50%;
                width: 120px;
                height: 120px;
                animation: spin 800ms linear infinite;
            }

            @keyframes spin {
                0% { transform: rotate(0deg); }
                100% { transform: rotate(360deg); }
            }

        </style> 
    </head>




    <body onload="loadAllQuestions()">



        <%@include file="navbar.jsp" %>

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


















































        <div class="container mt-5">

            <div class="row">
                <div class="col-md-2" >
                    <ul class="list-group mt-3">
                        <li class="list-group-item active"><a href="#!" class="text-white">All Categories</a></li>
                        <li class="list-group-item "><a href="#!" class="text-black" >Technical</a></li>
                        <li class="list-group-item "><a href="#!" class="text-black" >Non-Technical</a></li>

                    </ul>
                </div>


                <div class="col-md-10">


                    <div class="col-md-10 sg-layout__box sg-hide-for-small-only mt-5 pb-3">
                        <div class="sg-content-box sg-content-box--spaced js-above-feed-ask-question">
                            <div class="sg-content-box__title">
                                <div class="sg-actions-list">
                                    <div class="sg-actions-list__hole">
                                        <div class="sg-avatar sg-avatar--normal sg-avatar--spaced">
                                            <img class="sg-avatar__image" src="" alt="HelpDesk" title="HelpDesk"></div>
                                    </div>
                                    <div class="sg-actions-list__hole">
                                        <ul class="sg-breadcrumb-list">

                                            <li class="sg-breadcrumb-list__element" >
                                                <span class="sg-text sg-text--small sg-text--gray sg-text--emphasised"> <strong>The HelpDesk . Answerer</strong></span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="sg-content-box__content sg-content-box__content--spaced-bottom-large">
                                <h1 class="sg-header-primary" style="font-weight:500; font-family: 'verdana', cursive;">What do you need to know?</h1>
                            </div>
                            <div class="sg-content-box__content sg-content-box__content--spaced-bottom-xlarge">
                                <button class="sg-button-primary sg-button-primary--alt"  data-target="#do-post-modal" data-toggle="modal">Ask your question</button>
                            </div>
                        </div>
                    </div>



                    
                    
                    
                    
                    
                    
                    
                    
                    
                    <div class="loader mx-auto mt-5" style=" display: compact" id="loader">

                    </div>

                    <div class="col-md-12" id="post-container">


                    </div>


                </div>

                <!--
                <div class="col-sm-2">
                </div>
                -->


            </div>
        </div>



        <%@include file="modals.jsp" %>

        <!-- Answers Modal -->
        <div class="modal fade" id="answers-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title" id="modal-title">Answers</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="text-white">&times;</span>
                        </button>
                    </div>

                    <form action="LoginServlet" method="post">


                        <div class="modal-body">
                            <div class="container-fluid" id="answer-container">


                            </div>
                        </div>
                        <div class="modal-footer bg-primary">
                            <button type="button" class="btn btn-outline-light" data-dismiss="modal">Close</button>
                        </div>

                    </form>



                </div>
            </div>
        </div>










        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>


        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

        <script src="js/bootstrap.min.js" type="text/javascript"></script>

        <script src="js/prism.js" type="text/javascript"></script>

        <script src="js/sweetalert.min.js" type="text/javascript"></script>



        <script>


        function openAnswersModal(pid, heading)
        {
//                                alert(heading);

            $("#answers-modal").modal('show');
            $("#modal-title").text(heading);

        }


        function openAnswerBox(pid)
        {

            swal({
                title: "Give your answer",
                text: "your answer must be a single paragraph",
                type: "input",
                showCancelButton: true,
                closeOnConfirm: false,
                animation: "slide-from-top",
                inputPlaceholder: "write your answer here",
                showLoaderOnConfirm: true
            },
                    function (inputValue) {
                        if (inputValue === false)
                            return false;

                        if (inputValue === "") {
                            swal.showInputError("You need to write something!");
                            return false
                        }
                        setTimeout(function () {
//                                                swal("Nice!", "You wrote: " + inputValue, "success");\
                            $.ajax({
                                url: "AnswerServlet",
                                type: 'POST',
                                data: {postId: pid, data: inputValue, op: 'addanswer'},
                                success: function (data, textStatus, jqXHR) {

                                    if (data.trim() === "error")
                                    {
                                        swal("Error!!", "try again", "error");

                                    } else
                                    {
                                        swal("Good job!", "done", "success")
                                    }

                                }, error: function (jqXHR, textStatus, errorThrown) {
                                    swal("Error!!", "try again", "error");

                                }
                            });
                        }, 0);

                    });
        }

        function loadAllQuestionByuser()
        {
            $("#loader").show();
            $.ajax({
                url: "post_load.jsp",
                type: 'POST',
                data: {uid:<%= user.getUid()%>, op: "all"},
                success: function (data, textStatus, jqXHR) {
                    $("#post-container").html(data);
                    $("#loader").hide();
                }
            });
        }

        function loadAllQuestions() {

            $("#loader").show();
            $.ajax({
                url: "post_load.jsp",
                type: 'POST',
                data: {uid:<%= user.getUid()%>, op: "allpost"},
                success: function (data, textStatus, jqXHR) {
                    $("#post-container").html(data);
                    $("#loader").hide();
                }
            });
        }



        function doLike(pid)
        {
//                alert(pid);

            $.ajax({
                url: "LikeServlet",
                type: 'POST',
                data: {postId: pid, likeOp: 'dolike'},
                success: function (data, textStatus, jqXHR) {
//                                            alert("Success");
//                                              alert(data);
                    var button = "#l2" + pid;
                    $(button).text("Liked");



                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("Error");
                }
            });

        }



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

        <script>
            $(document).ready(function () {

                $("#test-btn").click(function () {
                    swal("Good job!", "You clicked the button!", "error");


                });

            }

            );
        </script>


    </body>
</html>
