package com.example.Face_Book_Clone;

import java.sql.*;

public class RegisterDao {
    private static  Connection connection;

    public  RegisterDao(Connection connection) {
        this.connection = connection;

    }

    public  boolean insert(User user){

        boolean result = false;
        String sql = "insert into user_tb(first_name, lastname, email, password, dod, gender ) values(?,?,?,?,?,?)";
        System.out.println(sql);
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.connection.prepareStatement(sql);
        preparedStatement.setString(1, user.getFirstname());
        preparedStatement.setString(2, user.getLastname());
        preparedStatement.setString(3, user.getEmail());
        preparedStatement.setString(4, user.getPassword());
        preparedStatement.setString(5,user.getDob());
        preparedStatement.setString(6, user.getGender());
        preparedStatement.executeUpdate();
        result = true;

        } catch (SQLException e) {
            e.printStackTrace();

        }
        return result;
    }

    public User logUser(String email, String password){
        User user = null;

        try {
            String query = "select * from user_tb where email=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            ResultSet result = preparedStatement.executeQuery();
            if(result.next()){
                user = new User();
                user.setId(result.getInt("id"));
                user.setFirstname(result.getString("first_name"));
                user.setLastname(result.getString("lastname"));
                user.setEmail(result.getString("email"));
                user.setPassword(result.getString("password"));
                user.setDob(result.getString("dod"));
                user.setGender(result.getString("gender"));
                //decrypt password

               //String decryptPass = PasswordEncryption.decryptPassword(result.getString("password"));


                if(!user.getPassword().equals(password)){
                    return null;
                }
            }
        }catch(Exception e){
        }
        return user;
    }

    public static void main(String[] args) {
       // System.out.println(logUser("adeola@gmail.com","123456"));

    }

}
