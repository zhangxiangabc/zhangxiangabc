import java.sql.*;

public class Db {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url  = "jdbc:mysql://localhost:3306/bookstore";
        String sql="select name from category";
        Connection conn = DriverManager.getConnection(url,"root","123456");
        Statement stat = conn.createStatement();
        ResultSet rs = stat.executeQuery(sql);
        while(rs.next()){
            String id=rs.getString("id");
            String name=rs.getString("name");
            System.out.println(id+"   "+name);
        }
    }
}
