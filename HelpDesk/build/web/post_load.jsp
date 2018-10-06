<%@page import="com.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.User"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.dao.ConnectionProvider"%>
<%@page import="com.dao.PostDao"%>
<%@page import="com.entities.Question"%>
<%
    String op = request.getParameter("op");
    int uid = Integer.parseInt(request.getParameter("uid"));

    Thread.sleep(2000);

    if (op.equals("allpost")) {

%>



<div class="row "  >


    <%                        PostDao pdao = new PostDao(ConnectionProvider.createConnection());

        List<Question> qlist = pdao.getAllQuestion();
        for (Question q : qlist) {

            UserDao udao = new UserDao(ConnectionProvider.createConnection());
            User u = udao.getUserById(q.getUid());


    %>


    <div class=" col-sm-10 ">
        <div class="card my-3  ">
            <div class="card-header bg-info text-white">
                <div class="card-title"><strong><%= u.getName()%></strong> has posted

                    <div class="float-right">
                        <%
                            java.util.Date d = new java.util.Date(q.getDatetime().getTime());


                        %>


                        <%= DateFormat.getDateTimeInstance().format(d)%>
                    </div>
                </div>
            </div>

            <div class="card-body">
                <div class="card-title" style="background-color:aqua;"><%= q.getHeading()%></div>
                <p class="card-text"><%= q.getContent()%></p>


                <%if (q.getCode() != null) {
                        if (q.getCode().equals("")) {
                        } else {

                %>
                <pre><code class="language-<%= q.getCodeLanguage()%>"><%= q.getCode()%></code></pre>
                    <%  }
                        }%>
                            
                            
                            
                        </div>

                        <div class="card-footer bg-info text-white">
                            
                <%
                    LikeDao ldao = new LikeDao(ConnectionProvider.createConnection());
                    if (ldao.checkLiked(q.getQid(), uid)) {
                %>
                                    <button class="btn btn-outline-warning text-white" id="l1<%=q.getQid()%>" onclick="doUnLike('<%= q.getQid()%>')">Liked</button>
                           
                               
                <%

                } else {
                %>
                            
                                    <button class="btn btn-outline-light text-white" id="l2<%=q.getQid()%>" onclick="doLike('<%= q.getQid()%>')">Like</button>
                           
                <%

                    }


                %>
                            
                           <button class="btn btn-outline-danger text-white">Share</button>
                           <button class="btn btn-outline-success text-white" onclick="openAnswerBox('<%= q.getQid()%>')">Give Answers</button>
                           <button class="btn btn-secondary text-white" onclick="openAnswersModal('<%=q.getQid()%>','<%= q.getHeading() %>')">See Answers</button>
                        </div>
                    </div>
                    </div>

    <%                            }
    %>
                    
                 
                    </div>
    
    
<%
} else {
    ;
%>
    
         <div class="row "  >


    <%                        PostDao pdao = new PostDao(ConnectionProvider.createConnection());

        List<Question> qlist = pdao.getAllQuestionByUserId(uid);
        for (Question q : qlist) {

            UserDao udao = new UserDao(ConnectionProvider.createConnection());
            User u = udao.getUserById(q.getUid());


    %>


                        <div class=" col-sm-8 ">
                            <div class="card my-3  ">
                                <div class="card-header bg-info text-white">
                                    <div class="card-title"><strong><%= u.getName()%></strong> has posted

                                        <div class="float-right">
                        <%
                            java.util.Date d = new java.util.Date(q.getDatetime().getTime());


                        %>


                        <%= DateFormat.getDateTimeInstance().format(d)%>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <div class="card-title bg-info"><%= q.getHeading()%></div>
                                    <p class="card-text"><%= q.getContent()%></p>


                <%if (q.getCode() != null) {
                        if (q.getCode().equals("")) {
                        } else {

                %>
                                    <pre><code class="language-<%= q.getCodeLanguage()%>"><%= q.getCode()%></code></pre>
                    <%  }
                        }%>
                            
                            
                            
                        </div>

                        <div class="card-footer bg-info text-white">
                            
                <%
                    LikeDao ldao = new LikeDao(ConnectionProvider.createConnection());
                    if (ldao.checkLiked(q.getQid(), uid)) {
                %>
                                    <button class="btn btn-outline-warning text-white" id="l1<%=q.getQid()%>" onclick="doUnLike('<%= q.getQid()%>')">Liked</button>
                           
                               
                <%

                } else {
                %>
                            
                                    <button class="btn btn-outline-light text-white" id="l2<%=q.getQid()%>" onclick="doLike('<%= q.getQid()%>')">Like</button>
                           
                <%

                    }


                %>
                            
                           <button class="btn btn-outline-danger text-white">Share</button>
                            <button class="btn btn-outline-success text-white">Answers</button>
                        </div>
                    </div>
                    </div>

    <%                            }
    %>
                    
                 
                    </div>
    
    
    
<%
    }


%>

