package com.database;


import com.example.Face_Book_Clone.DbConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PostDatabase {
    private   Connection dbConnection;

    public   PostDatabase(Connection connection) {
        this.dbConnection = connection;
    }

    public boolean createPost(int userId, Post post){
        boolean result = false;
        try{
            String query = "insert into posts(title,body,image_name,user_id) " +
                    "values (?,?,?,?)";

            PreparedStatement preparedStatement = this.dbConnection.prepareStatement(query);
            preparedStatement.setString(1, post.getTitle());
            preparedStatement.setString(2, post.getBody());
            preparedStatement.setString(3, post.getImageName());
            preparedStatement.setInt(4, userId);

            preparedStatement.executeUpdate();
            result = true;
        }catch (Exception e){
            e.printStackTrace();
        }

        return result;
    }

    /**
     * Method returns lists of all posts
     * @return list
     * */
    public  List<Post> getPosts(){
        List<Post> posts = new ArrayList<>();
        try{
            String query = "select p.id, p.title, p.body, p.image_name, u.surname from posts p"
                    +"  join user_tb u on p.user_id=u.id order by p.user_id DESC";
            PreparedStatement preparedStatement = this.dbConnection.prepareStatement(query);
            ResultSet result = preparedStatement.executeQuery();
            System.out.println(result);
            while(result.next()){
                Post post = new Post();
                post.setId(result.getInt("id"));
                post.setTitle(result.getString("title"));
                post.setBody(result.getString("body"));
                post.setImageName(result.getString("image_name"));
                post.setName(result.getString("surname"));
                posts.add(post);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return posts;
    }

    /**
     * Method returns a post by id
     * @return list
     * */
    public  Post getPostById(int postId){
        Post post = null;

        try{
            String query = "select * from posts where id="+postId;
            PreparedStatement preparedStatement = this.dbConnection.prepareStatement(query);
            ResultSet result = preparedStatement.executeQuery();

            if(result.next()){
                post = new Post();

                post.setId(result.getInt("id"));
                post.setTitle(result.getString("title"));
                post.setBody(result.getString("body"));
                post.setImageName(result.getString("image"));

                return post;
            }
        }catch (Exception e){
        }

        return post;
    }

    public boolean updatePost(int postId, Post newPost){
        boolean success = false;

        try {
            //String query = "update posts set title=newPost.getTitle(), body=newPost.getBody() where id=posjjtId";
            String query = "update posts set title=?, body=? where id=?";
            PreparedStatement prepared = this.dbConnection.prepareStatement(query);

            prepared.setString(1, newPost.getTitle());
            prepared.setString(2, newPost.getBody());
            prepared.setInt(3, postId);

            int result = prepared.executeUpdate();

            if(result > 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    public static boolean deletePost(int postId){
        Connection con = DbConnection.getConnection();
        boolean success =  false;
        System.out.println("I am entering the delete");
        try {
            String query = "delete from posts where id="+postId;
            PreparedStatement prepared = con.prepareStatement(query);
            int result = prepared.executeUpdate();
            System.out.println("I have a result" +
                    ""+result);

            if(result > 0) {
                success = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    public static void main(String[] args) {
//      System.out.println(getComments(7));
        System.out.print(deletePost(3));
    }

    public boolean createComment(int userId, int postId, String comment){
        boolean result = false;
        try{
            String query = "insert into comment(post_id,user_id,comment) " +
                    "values (?,?,?)";

            PreparedStatement preparedStatement = this.dbConnection.prepareStatement(query);
            preparedStatement.setInt(1, postId);
            preparedStatement.setInt(2, userId);
            preparedStatement.setString(3, comment);

            preparedStatement.executeUpdate();
            result = true;
        }catch (Exception e){
            e.printStackTrace();
        }

        return result;
    }

    public List<Comment> getComments(int postId){
        List<Comment> comments = new ArrayList();
        try{
            Comment comment = null;
            String query = "select u.surname, p.title, p.image_name, c.comment from comment c"
                    +"  join posts p on c.post_id=p.id join user u on u.id=c.user_id" +
                    " where post_id="+postId;
//            PreparedStatement preparedStatement = this.dbConnection.prepareStatement(query);
            PreparedStatement preparedStatement = this.dbConnection.prepareStatement(query);
            ResultSet resultSet =  preparedStatement.executeQuery();
            comment = new Comment();
            while (resultSet.next()){
                comment.setUsername(resultSet.getString("surname"));
                comment.setTitle(resultSet.getString("title"));
                comment.setPostImage(resultSet.getString("image_name"));
                comment.setComment(resultSet.getString("comment"));
                System.out.println(comment.getUsername());
                System.out.println(comment.getComment());
                System.out.println(comment.getPostImage());
                System.out.println(comment.getTitle());
                comments.add(comment);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return comments;
    }


}