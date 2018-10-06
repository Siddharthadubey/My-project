
<%@page import="com.entities.User"%>
<!-- Modal -->
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            
            
            
            <div class="modal-header text-white" style="background-color: #3feee6;">
                <h5 class="modal-title" id="exampleModalLabel">Login Here</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" class="text-white">&times;</span>
                </button>
            </div>

            <form action="LoginServlet" method="post">


                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="modal-title mb-2">Fill all details correctly </div>

                                <div class="form-group">
                                    <input placeholder="Enter your email" type="email" name="useremail" class="form-control" required />
                                </div>

                                <div class="form-group">
                                    <input placeholder="Enter your password" type="password" name="password" class="form-control" required />
                                </div>

                            </div>

                        </div>

                    </div>
                </div>
                <div class="modal-footer" style="background-color: #3feee6;">
                    <button type="button" class="btn btn-outline-light" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-outline-light">Login</button>
                </div>

            </form>



        </div>
    </div>
</div>


<%
    User user2 = (User) session.getAttribute("current-user");
    if (user2 != null) {
%>

<!--profile update modal-->

<div class="modal fade" id="profile-update-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header  text-white" style="background-color: sandybrown">
                <h5 class="modal-title" id="exampleModalLabel"> <h1>Welcome : <%= user2.getName()%></h1></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" class="text-white">&times;</span>
                </button>
            </div>


            <form action="ProfileUpdateServlet" method="post" enctype="multipart/form-data">

                <div class="modal-body">
                    <div class="container">
                        <img src="img/<%= user2.getProfilePic()%>" class="img-thumbnail circle img-fluid mx-auto d-block" style="width:200px;height: 200px;border-radius: 50%; ">

                        <div class="row">
                            <div class="col-sm-12">
                                <table class="table table-bordered table-hover mt-2 " style="background-color: azure">
                                    <tr><td> <h1> You are <%= user2.getName()%> </h1></td></tr>
                                    <tr><td>Name : </td><td>   <input  type="text" name="name" value="<%= user2.getName()%>" class="form-control "  /> </td></tr>
                                    <tr><td>Email : </td><td>   <input disabled type="email" name="email" value="<%= user2.getEmail()%>" class="form-control "  /> </td></tr>
                                    <tr><td>Password : </td><td>   <input  type="text" name="password" value="<%= user2.getPassword()%>" class="form-control "  /> </td></tr>
                                    <tr><td>About you : </td><td>   <textarea name="about" class="form-control"><%= user2.getAbout()%></textarea> </td></tr>
                                    <tr><td>Select new profile pic : </td><td><input type="file" name="pic"  </td></tr>

                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button class="btn btn-outline-danger" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-outline-success">Save</button>
                </div>


            </form>            




        </div>
    </div>
</div>


<!--post question modal-->

<div class="modal fade" id="do-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-white" style="background-color: sandybrown">
                <h5 class="modal-title" id="exampleModalLabel">Write here</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" class="text-white">&times;</span>
                </button>
            </div>

            <form action="PostOperation" method="post">
                <input type="hidden" value="add" name="operation"/>
            
            <div class="modal-body">
                <div class="container">
                    <div class="row" style="background-color:  azure">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <select name="lang" class="form-control">
                                    <option value="none">Select your question Catagory</option>
                                    <option value="java">Technical</option>
                                    <option value="python">Non-Technical</option>
                                    <option value="c">Others</option>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <input type="text" name="heading"  class="form-control" placeholder="Enter the question heading" />
                            </div>
                            <div class="form-group">
                                
                                <textarea class="form-control" name="content" required placeholder="Enter your question"></textarea>
                            </div>
                            
                            <div class="form-group">
                                
                                <textarea class="form-control" name="code"  placeholder="Anything else about question:)"></textarea>
                            </div>
                          
                            
                        </div>
                    </div>
                </div>

            </div>

            <div class="modal-footer">
                <button class="btn btn-outline-danger" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-outline-success">Save</button>
            </div>
            
        </form>
            
            

        </div>
    </div>
</div>







<% }%>

