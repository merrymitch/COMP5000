package services;

import models.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLdb {
    String url = "jdbc:mysql://localhost:3306/library_catalog";
    String username = "root";
    String password = "12345678";
    Connection connection = null;
    static MySQLdb instance = null;

    public MySQLdb() {
        try {
            connection = DriverManager.getConnection(url, username, password);
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
    }

    public static synchronized MySQLdb getInstance() {
        if(instance == null) {
            instance = new MySQLdb();
        }
        return instance;
    }

    public UserModel doLogin(String username, String password) throws SQLException {
        UserModel userModel = null;
        String qLogin = "SELECT user_id, fname, lname FROM users WHERE username = '"+ username +"' AND password = '"+ password +"'";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(qLogin);
        if(resultSet.next()) {
            int user_id = Integer.parseInt(resultSet.getString("user_id"));
            String fname = resultSet.getString("fname");
            String lname = resultSet.getString("lname");
            userModel = new UserModel(user_id, fname, lname, username, password);
        }
        resultSet.close();
        statement.close();
        return userModel;
    }

    public boolean checkUsername(String username) throws SQLException {
        String qCheckUsername = "SELECT * FROM users WHERE username = '"+ username +"'";
        try {
            Statement statement = connection.prepareStatement(qCheckUsername);
            ResultSet resultSet = statement.executeQuery(qCheckUsername);
            while (resultSet.next()) {
                return true;
            }
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return true;
        }
    }

    public int generateUserID() throws SQLException {
        int numUsers = 0;
        String qCount = "SELECT COUNT(*) AS Count FROM users";
        PreparedStatement preparedStatement = connection.prepareStatement(qCount);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next()) {
            numUsers = resultSet.getInt("Count");
        }
        resultSet.close();
        preparedStatement.close();
        return numUsers;
    }

    public boolean doSignUp(UserModel userModel) throws SQLException {
        boolean result = false;
        String qDoSignUp = "INSERT INTO users VALUES(?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(qDoSignUp);
        preparedStatement.setInt(1, userModel.getUser_id());
        preparedStatement.setString(2, userModel.getFname());
        preparedStatement.setString(3, userModel.getLname());
        preparedStatement.setString(4, userModel.getUsername());
        preparedStatement.setString(5, userModel.getPassword());
        int rows_update = preparedStatement.executeUpdate();
        if(rows_update > 0) {
            result = true;
        }
        preparedStatement.close();
        return result;
    }

    public List<TopicModel> getBookTopics() throws SQLException {
        List<TopicModel> topics = new ArrayList<TopicModel>();
        String qGetTopics = "SELECT DISTINCT T.topic_id, T.topic_name FROM books B, topics T WHERE B.topic_id = T.topic_id";
        PreparedStatement preparedStatement = connection.prepareStatement(qGetTopics);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next()) {
            TopicModel tm = new TopicModel(resultSet.getInt("topic_id"), resultSet.getString("topic_name"));
            topics.add(tm);
        }
        resultSet.close();
        preparedStatement.close();
        return topics;
    }

    public List<CatalogModel> getCatalog(int topic_id) throws SQLException {
        String qGetBooks = null;
        List<CatalogModel> list = new ArrayList<>();
        if(topic_id == 999) {
            qGetBooks = "SELECT B.book_id, B.book_name, A.author_name, B.is_available FROM books B, topics T, authors A WHERE B.topic_id = T.topic_id AND B.author_id = A.author_id";
        } else {
            qGetBooks = "SELECT B.book_id, B.book_name, A.author_name, B.is_available FROM books B, topics T, authors A WHERE B.topic_id = T.topic_id AND B.author_id = A.author_id AND T.topic_id = '"+topic_id+"'";
        }
        PreparedStatement preparedStatement = connection.prepareStatement(qGetBooks);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next()) {
            int book_id = resultSet.getInt("book_id");
            String book_name = resultSet.getString("book_name");
            String author_name = resultSet.getString("author_name");
            int is_available = resultSet.getInt("is_available");
            CatalogModel catalogModel = new CatalogModel(book_id, book_name, author_name, is_available);
            list.add(catalogModel);
        }
        resultSet.close();
        preparedStatement.close();
        return list;
    }

    public boolean isAvailable(int book_id) throws SQLException {
        boolean result = false;
        int is_available = -1;
        int available = 1;
        String qCount = "SELECT B.is_available FROM books B WHERE B.book_id = '"+ book_id +"'";
        PreparedStatement preparedStatement = connection.prepareStatement(qCount);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next()) {
            is_available = resultSet.getInt("is_available");
        }
        if (is_available == available) {
            result = true;
        } else {
            result = false;
        }
        resultSet.close();
        preparedStatement.close();
        return result;
    }

    public boolean doReserve(int user_id, int book_id) throws SQLException {
        boolean result = false;
        String qDoReserve = "INSERT INTO reservations VALUES(?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(qDoReserve);
        preparedStatement.setInt(1, user_id);
        preparedStatement.setInt(2, book_id);
        int rows_update = preparedStatement.executeUpdate();
        if(rows_update > 0) {
            result = true;
        }
        preparedStatement.close();
        return result;
    }

    public List<UserBooksModel> getReservations(int user_id) throws SQLException {
        List<UserBooksModel> userReservations = new ArrayList<UserBooksModel>();
        String qGetTopics = "SELECT DISTINCT B.book_name, A.author_name FROM books B, authors A, users U, reservations R WHERE B.author_id = A.author_id AND B.book_id = R.book_id AND R.user_id = '"+user_id+"'";
        PreparedStatement preparedStatement = connection.prepareStatement(qGetTopics);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next()) {
            UserBooksModel ubm = new UserBooksModel(resultSet.getString("book_name"), resultSet.getString("author_name"));
            userReservations.add(ubm);
        }
        resultSet.close();
        preparedStatement.close();
        return userReservations;
    }
}