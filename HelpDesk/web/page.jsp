<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/navstyle.css" rel="stylesheet" type="text/css"/>
        <title>Hello, world!</title>
        <style>
            .divider{
                width: 100%;
                height: 1px;
                background: #999797;
            }
            .red-text{
                color:red;
            }
           
        </style>
        <script>
            function validate()
            {
                var name = document.forms.register.username.value;
                if (name == "")
                {
//                 alert("Name is required !!!");
                    document.getElementById("namemessage").innerHTML = "Name is Required !!";
                    return false;
                } else if (name.length > 10)
                {
                    document.getElementById("namemessage").innerHTML = "Name must be less than 10 characters **";
                    return false;
                }
                var email = document.forms.register.email.value;
                var e = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                if (e.test(email) == false)
                {
                    document.getElementById("emailmessage").innerHTML = "Invalid Email try to enter abc@gmail.com format **";

                    return false;
                }

                var phone1 = document.forms.register.phone.value;
                var e1 = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;

                if (phone1 == "")
                {
                    document.getElementById("phonemessage").innerHTML = "Phone number can not be empty !! **";
                    return false;
                } else if (e1.test(phone1) == false)
                {
                    document.getElementById("phonemessage").innerHTML = "Invalid number it must be of 10 character !! **";

                    return false;
                }






                return true;
            }

        </script>


    </head>
    <body>
        <%@include file="navbar.jsp" %>       
        <div class="container" style="margin-top:100px;" >

            <div class="row">
                <div class="col-sm-6 offset-sm-3" >
                    <h1 class="text-white">Fill this form</h1>
                    <div class="divider"></div>
                    <br>


                    <form action="RegisterServlet" name="register" method="post" onsubmit="return validate()">

                        <div class="form-group">
                            <input type="text" name="username" class="form-control" placeholder="Enter Name " />
                            <small id="namemessage" class="form-text  red-text"></small>
                        </div>
                        <div class="form-group">
                            <input type="password" name="password" class="form-control" placeholder="Enter New Password " />
                        </div>
                        <div class="form-group">
                            <input  type="email" name="email" class="form-control" placeholder="Enter your email " />
                            <small id="emailmessage" class="form-text  red-text"></small>

                        </div>
                        <div class="form-group">
                            <textarea  required name="about" class="form-control" placeholder="Enter about yourself"></textarea>
                        </div>

                        <div>
                            <button type="reset" class="btn btn-outline-dark">Reset</button>
                            <button type="submit" class="btn btn-outline-success">Submit</button>
                        </div>


                    </form>



                </div>
            </div>
        </div>



        <%@include file="modals.jsp" %>


        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>