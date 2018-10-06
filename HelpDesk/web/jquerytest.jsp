<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Hello, world!</title>
        <style>
            #mycol1{
                transition: all 2s cubic-bezier(0.9,-0.22, 0, 1.63);
            }

            .sidebar{
                position:fixed;
                background: black;
                height: 100%;
                width: 200px;
                z-index: 999999999999999999999999;
                transform: translateX(-100%);
                transition: transform 200ms linear;
            }

        </style>

    </head>
    <body>
        <div class="sidebar pt-3">
            <h2 class="text-white">Side Bar<button class="btn btn-outline-light " id="close-sidebar">close</button></h2>
            <ul class="list-group">
                <li class="list-group-item active">
                    First element
                </li>
                <li class="list-group-item">
                    First element
                </li>
                <li class="list-group-item">
                    First element
                </li>

            </ul>

        </div>



        <%@include file="navbar.jsp" %>       
        <div class="container mt-3" >

            <div class="row" id="test">
                <div class="col-sm-6" id="mycol">
                    <button class="btn btn-outline-danger" id="mybtn">Click Me</button>
                    <button class="btn btn-outline-danger" id="mybtn1">Click Me</button>
                    <button class="btn btn-outline-danger" id="mybtn2">Change</button>

                </div>

                <div class="col-sm-6 bg-light" id="mycol1" style="  border:1px solid red;height: 400px;">

                </div>
            </div>
        </div>






        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->




        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                
                
                
                $("#mybtn2").click(function(){
                    
                    var temp=$("#mycol").html();
//                    alert(temp);
                $(".sidebar").html(temp);
                
                val()
                text()
                parent()
                children()
                siblings()
                css()
                animate()
                
                    
                })


//                $("#mycol1").hide();

//                alert("loaded...");
                $("#mybtn").click(function () {
//                    var h1 = "<h1> This is dynamic heading </h1>";
//                    $("#mycol").prepend(h1);
//                    $("#mycol1").slideUp(5000);
//                    $("#mycol1").slideToggle(3000);
//                    $("#mycol1").fadeOut(2000,function(){
////                        document.body.style.backgroundColor="red";
//                    });

//                    $("#mycol1").fadeToggle();
//                    $("#mycol1").css({
//                        'transform': 'translateX(-100%)'
//                    });
                    $(".sidebar").css({
                        transform:'translateX(0%)'
                    });


                });
                
                
                $("#close-sidebar").click(function(){
                    $(".sidebar").css({
                        transform:'translateX(-100%)'
                    })
                })




                $("#mybtn1").click(function () {
//                    var h1 = "<h1> This is dynamic heading </h1>";
//                    $("#mycol").prepend(h1);
//                    $("#mycol1").slideDown(5000);
                    $("#mycol1").fadeIn();
                });


            })

        </script>


    </body>
</html>