<%@ page import="com.database.PostDatabase" %>
<%@ page import="com.example.Face_Book_Clone.DbConnection" %>
<%@ page import="com.database.Comment" %>
<%@ page import="com.example.Face_Book_Clone.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: decagon
  Date: 08/05/2021
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Comment </title>
  <meta charset="utf-8" />
  <meta
          name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"
  />
  <title>timeline</title>
  <!-- JQuery-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!-- Bootstrap CSS -->
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
          crossorigin="anonymous"
  />
  <script
          src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
          crossorigin="anonymous"
  ></script>
</head>
<body>
<%
  String query = request.getQueryString();
  int postId = Integer.parseInt(query.substring(query.indexOf("=")+1));
  PostDatabase postDatabase = new PostDatabase(DbConnection.getConnection());
  List<Comment> commentList = postDatabase.getComments(postId);
  User user = (User) session.getAttribute("user");
  if(user == null){
    session.setAttribute("Registration Error", "!!!Please Login first");
    response.sendRedirect("index.jsp");
  }
%>
<nav style="background: #3b5998" class="navbar navbar-expand-lg">
  <div class="container-fluid">
    <a class="navbar-brand" href="#" style="color:#fff;"><h1>Facebook</h1></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" style="color: #fff;" href="/home.jsp"><h3>Home</h3></a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<%--    <%User user = (User) session.getAttribute("user");%>--%>
<%--        <%--%>
<%--            if(user != null){%>--%>
<%--        <h4 style="color: #fff">Welcome <%= user.getSurname() %></h4>--%>
<%--    <%}--%>
<%--    %>--%>
<section style="margin: 60px auto; width: 70%; border: 2px solid #3b5998; padding: 15px">
  <%--  <%--%>
  <%--    if(commentList.size() != 0){--%>
  <%--      for (Comment comment:commentList) {%>--%>
  <%--  <p><%=comment.getUsername() %> </p>--%>
  <%--  <h4> <p><%=comment.getTitle() %> </p></h4>--%>
  <%--  <p></p>--%>
  <%--  <p> <p><%=comment.getComment()%> </p></p>--%>
  <%--  <p></p>--%>
  <%--  <hr/>--%>
  <%--  <%}--%>
  <%--  }else{ %>--%>
  <%--  <h1>No Comments !!!!</h1>--%>
  <%--  <%}--%>
  <%--  %>--%>
  <%
    if(commentList.size() != 0){%>
  <img src="./image/<%=commentList.get(0).getPostImage()%>" width="100%" height="60%"/>
  <h3>Post Title: <%=commentList.get(0).getTitle() %></h3>
  <%for (Comment comment:commentList) {%>
  <hr/>
  <h6>Name: <em><%=comment.getUsername()%> </em></h6>
  <p><%=comment.getComment()%> </p>
  <p><em>Edit Comment</em></p>
  <textarea class="edit-comment"
            placeholder="Edit comment here...<%= comment.getUsername() %>">
                </textarea>
  <button onclick="del(<%=postId%>, <%=comment.getUserId()%>)" class="btn btn-primary btn-md mt-3 btn-block"
          <%
            if(comment.getUserId() != user.getId()){%>
          disabled
          <%}%>>
    Delete
  </button>
  <button onclick="edit(<%=postId%>, <%=comment.getUserId()%>)" class="btn btn-primary btn-md mt-3 btn-block"
          <%
            if(comment.getUserId() != user.getId()){%>
          disabled
          <%}%>>
    Edit
  </button>
  <hr/>
  <%}
  }else{ %>
  <h1>No Comments !!!!</h1>
  <%}
  %>
</section>
<script>
  // window.onload = ()=> {
  //   const params = new URLSearchParams(window.location.search);
  //   document.getElementById("input").value =  params.get("post");
  // }
  function del(postId, userId){
    const delCom = confirm("Are you sure you want to delete comment");
    if(delCom){
      $.ajax({
        type: 'POST',
        url: '/DeleteCommentServlet',
        data: {"postId": postId, "userId":userId},
        success: function(data){
          alert(data);
          window.location.reload();
        },
        error: function(){
          alert('error deleting post');
        }
      });
    }
  }
  function edit(postId, userId){
    const editedComment = document.getElementsByClassName("edit-comment");
    for (let i = 0; i < editedComment.length; i++){
      let comment = editedComment[i].value.trim();
      if(comment != ""){
        const editPost = confirm("Are you sure you want to edit comment");
        if(editPost){
          $.ajax({
            type: 'POST',
            url: '/EditCommentServlet',
            data: {"postId": postId, "userId":userId, "editedComment": comment},
            success: function(data){
              alert(data);
              window.location.reload();
            },
            error: function(){
              alert('error editing post');
            }
          });
        }
      }
    }
  }
</script>
</body>
</html>
