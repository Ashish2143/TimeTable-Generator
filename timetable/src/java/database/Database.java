/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
package database;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
public class Database
{
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    public Database() throws SQLException
    {
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/timetable","root","root");
            System.out.println("connetion success.....");
            
        }
        catch (ClassNotFoundException e)
        {
            System.out.println("exception : "+e);
        }
    }
    
    public void closeDb() throws SQLException{
        con.close();
    }
    
     public int checkAdminLogin(String uname,String pwd)
    {
        try {
            pst=con.prepareStatement("select * from admin where username=? and password=?");
            pst.setString(1, uname); //this replaces the 1st  "?" in the query for username
            pst.setString(2, pwd);    //this replaces the 2st  "?" in the query for password
            //executes the prepared statement
            rs=pst.executeQuery();
            if(rs.next()){
                return rs.getInt("id");
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
    }
     
      public int checkFacultyLogin(String uname,String pwd)
    {
        try {
            pst=con.prepareStatement("select * from faculties where emailid=? and password=?");
            pst.setString(1, uname); //this replaces the 1st  "?" in the query for username
            pst.setString(2, pwd);    //this replaces the 2st  "?" in the query for password
            //executes the prepared statement
            rs=pst.executeQuery();
            if(rs.next()){
                return rs.getInt("id");
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
    }
      
      public boolean checkEmailExistStudent(String email,String enrollno)
    {
        try {
            pst=con.prepareStatement("select * from students where emailid='"+email+"' and enrollno='"+enrollno+"'");
            rs=pst.executeQuery();
            if(rs.next())
            {
                return true;
            }else{
                return false;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
        }
        return false;
    }
      
       public boolean checkEmailExistFaculty(String email)
    {
        try {
            pst=con.prepareStatement("select * from faculties where emailid='"+email+"' ");
            rs=pst.executeQuery();
            if(rs.next())
            {
                return true;
            }else{
                return false;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
        }
        return false;
    }
      
     public int checkStudentLogin(String uname,String pwd)
    {
        try {
            pst=con.prepareStatement("select * from students where emailid=? and password=?");
            pst.setString(1, uname); //this replaces the 1st  "?" in the query for username
            pst.setString(2, pwd);    //this replaces the 2st  "?" in the query for password
            //executes the prepared statement
            rs=pst.executeQuery();
            if(rs.next()){
                return rs.getInt("id");
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
    }
     
     public Boolean addHoliday(String title,String descr)
    {
        try {
            pst=con.prepareStatement("insert into holidays (date,reason) values(?,?)");
            pst.setString(1, title);
            pst.setString(2, descr);
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
     
     public Boolean addNews(String title,String descr)
    {
        try {
            pst=con.prepareStatement("insert into news (title,description) values(?,?)");
            pst.setString(1, title);
            pst.setString(2, descr);
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
     
     public Boolean addMessage(String descr,int fid)
    {
        try {
            pst=con.prepareStatement("insert into messages (message,faculty_id) values(?,?)");
            pst.setString(1, descr);
            pst.setInt(2, fid);
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    public ResultSet getNews()
    {
        try {
            pst=con.prepareStatement("select * from news order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getSubjects()
    {
        try {
            pst=con.prepareStatement("select * from subjects order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getTimetables()
    {
        try {
            pst=con.prepareStatement("select * from timetable order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getTimetableById(int id)
    {
        try {
            pst=con.prepareStatement("select * from timetable where id = "+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getTimetableByBr(String br)
    {
        try {
            pst=con.prepareStatement("select * from timetable where branch = '"+br+"'");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public int getTimetableByBrSm(String br,String sem)
    {
        try {
            pst=con.prepareStatement("select * from timetable where branch = '"+br+"' and semester = '"+sem+"' limit 1");
            rs=pst.executeQuery();
            if(rs.next()){
                return rs.getInt("id");
            }else{
                return 0;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
    }
    
    public int checkEnrollno(String uname)
    {
        try {
            pst=con.prepareStatement("select * from students where enrollno='"+uname+"'");
            rs=pst.executeQuery();
            if(rs.next())
            {
                return 1;
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
        }
        return 0;
    }
    
    public ResultSet getContacts()
    {
        try {
            pst=con.prepareStatement("select * from contact order by id desc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
  
    public ResultSet getStudents()
    {
        
        try {
            pst=con.prepareStatement("select * from students order by id asc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getFaculties()
    {
        
        try {
            pst=con.prepareStatement("select * from faculties order by id asc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getFacultiesByBranch(String br)
    {
        
        try {
            pst=con.prepareStatement("select * from faculties where branch = '"+br+"'order by id asc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    // Method to get the end time
    public String getEndTime(Calendar calendar) {
        Calendar endCalendar = (Calendar) calendar.clone();
        endCalendar.add(Calendar.HOUR_OF_DAY, 1);
        SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss a");
        return sdf.format(endCalendar.getTime());
    }
    
    public ResultSet getSubjectByBranch(String br,String sem)
    {
        
        try {
            pst=con.prepareStatement("select * from subjects where branch = '"+br+"'and semester = '"+sem+"' order by id asc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getSubjectByBr(String br)
    {
        
        try {
            pst=con.prepareStatement("select * from subjects where branch = '"+br+"' order by id asc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getHolidays()
    {
        
        try {
            pst=con.prepareStatement("select * from holidays order by id asc");
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
     
      public ResultSet selectAll(String query)
    {
        try {
            pst=con.prepareStatement(query);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getStudentById(int id)
    {
        try {
            pst=con.prepareStatement("select * from students where id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getFacultyById(int id)
    {
        try {
            pst=con.prepareStatement("select * from faculties where id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getMessages(int id)
    {
        try {
            pst=con.prepareStatement("select * from messages where faculty_id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public ResultSet getFacultyMessages(int id)
    {
        try {
            pst=con.prepareStatement("select * from messages where faculty_id="+id);
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return null;
        }
    }
    
    public boolean delete(String tab,int id){
        try {
            pst=con.prepareStatement("delete from "+tab+" where id="+id);
            //executes the prepared statement
            int n=pst.executeUpdate();
            System.out.println(n);
            if(n==1)
            {
                return true;
            }else{
                return false;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
        
    }
    
    public static String getRandomNumberString() {
        // It will generate 6 digit random Number.
        // from 0 to 999999
        Random rnd = new Random();
        int number = rnd.nextInt(999999);

        // this will convert any number sequence into 6 character.
        return String.format("%06d", number);
    }
     
     public int update_delete(String sql){
        try {
            pst=con.prepareStatement(sql);
            //executes the prepared statement
            int n=pst.executeUpdate();
            if(n==1)
            {
                return 1;
            }else{
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 2;
        }
    }
     
    public boolean updateStatus(int id,int status,String tab){
        try {
            pst=con.prepareStatement("update "+tab+" set status="+status+" where id="+id);
            //executes the prepared statement
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }else{
                return false;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
}

