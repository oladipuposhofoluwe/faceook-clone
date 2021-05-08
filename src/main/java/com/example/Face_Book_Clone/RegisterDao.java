package com.example.Face_Book_Clone;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RegisterDao {
    private static Connection connection;

    public RegisterDao(Connection connection) {
        this.connection = connection;

    }

    public boolean insert(User user) {

        boolean result = false;
        String sql = "insert into user_tb(first_name, lastname, email, password, dod, gender ) values(?,?,?,?,?,?)";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.connection.prepareStatement(sql);
            preparedStatement.setString(1, user.getFirstname());
            preparedStatement.setString(2, user.getLastname());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getPassword());
            preparedStatement.setString(5, user.getDob());
            preparedStatement.setString(6, user.getGender());
            preparedStatement.executeUpdate();
            result = true;

        } catch (SQLException e) {
            e.printStackTrace();

        }
        return result;
    }

    public User logUser(String email, String password) {
        User user = null;

        try {
            String query = "select * from user_tb where email=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            ResultSet result = preparedStatement.executeQuery();

            if (result.next()) {
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

                if (!user.getPassword().equals(password)) {
                    return null;
                }
            }
        } catch (Exception e) {
        }
        return user;
    }


    public static List<User> getAllUsers(String email) throws SQLException {
        List<User> listOfUsers = new ArrayList<>();
            User user = null;

        try {
            String slQuery = "SELECT * FROM user_tb  where email=email";
           // PreparedStatement preparedStatement = connection.prepareStatement(slQuery);
            Connection connection = DbConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(slQuery);
            ResultSet resultSet = preparedStatement.executeQuery();

            user = new User();
            if (resultSet.next()) {
                user.setFirstname(resultSet.getString("first_name"));
                user.setLastname(resultSet.getString("lastname"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setDob(resultSet.getString("dod"));
                user.setGender(resultSet.getString("gender"));
//                if (user.equals(email)){
//                }
                listOfUsers.add(user);

            }

        } catch (Exception e) {

        }
        return listOfUsers;
    }

    public static void main(String[] args) throws SQLException {
        System.out.println(getAllUsers("oladipupo.shofoluwe@yahoo.com"));
    }
}
