<%@page import="com.entities.User"%>
<% User user1 = (User) session.getAttribute("current-user"); %>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top nav-colored" style="margin:0px;padding:0px;">
    <a class="navbar-brand" href="welcome-to-technical-forum">HelpDesk</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">




        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="welcome-to-technical-forum">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">New Feed</a>
            </li>


            <% if (user1 == null) {

            %>

            <li class="nav-item">
                <a class="nav-link" href="#">See Posts</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="contactus.jsp">Contact Us</a>
            </li>



            <%            } else { %>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Options
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown" >
                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#do-post-modal">Post Your Question</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#" onclick="loadAllQuestionByuser()">See your Questions</a>
                    <div class="dropdown-divider"></div>
                    
                    
                    <a class="dropdown-item" href="#" onclick="loadAllQuestions()">See All Questions</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Delete Question</a>
                </div>
            </li>


            <li class="nav-item">
                <a class="nav-link" href="contactus.jsp">Contact Us</a>
            </li>


            <% }%>

            <li class="nav-item">
                <a class="nav-link " id="clock-digital" href="#">Disabled</a>
            </li>




        </ul>



        <form class="form-inline my-2 my-lg-0" style="margin-right: 25px;">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" id="searchbutton">Search</button>
        </form>



        <% if (user1 == null) {
        %>

        <ul class="navbar-nav float-right">
            <li class="nav-item active">
                <button type="submit" id="nextbtnForLogin" data-toggle="modal" data-target="#login-modal">Login</button>
            </li> &nbsp;
            &nbsp;

            <li class="nav-item">
                <button type="submit" id="nextbtn" onclick="window.location.href = 'page.jsp'"> Signup</button>
            </li>
        </ul>


        <%
        } else {%>

        <ul class="navbar-nav float-right">



            <li class="nav-item active dropdown">
                <a class="nav-link" href="#" data-toggle="dropdown" data-target="#drop" ><%= user1.getName()%> <span class="sr-only">Login</span></a>

                <div class="dropdown-menu dropdown-menu-right"  id="drop" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="#">See Profile</a>
                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#profile-update-modal">Update Profile Pic</a>
                    <a class="dropdown-item" href="#">Edit Profile</a>
                    <a class="dropdown-item" href="#">Logout</a>
                </div>


            </li>



            <li class="nav-item">
                <a class="nav-link" href="LogoutServlet">Logout</a>
            </li>
        </ul>



    </div>

    <% }%>

</div>
</nav>