import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Main {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/orders";
        String username = "root";
        String password = "****";

        Connection connection = null;

        try {

            connection = DriverManager.getConnection(url, username, password);

            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select `id`, `product_name`, DATE_FORMAT(`order_date`, \"%Y-%m-%d\") from orders");

            while (resultSet.next()) {
                System.out.println(resultSet.getInt(1) + ", " +
                        resultSet.getString(2) + ", " +
                        resultSet.getString(3));
            }

            connection.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
}