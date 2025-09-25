
<%--<%@page import="database.sendSMS"%>--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.InputStream"%>
<%
    Database db = new Database();
    String action = request.getParameter("action");
    System.out.println(action);
    switch (action) {
        case "loginuser":
            String uusername = request.getParameter("uname");
            String upassword = request.getParameter("pass");
            String usertype=request.getParameter("usertype"); 
            if(usertype.equals("student")){
                int resuser=db.checkStudentLogin(uusername, upassword);
                if(resuser>0){
                    session.setAttribute("studentlogin",resuser);
                    response.sendRedirect("../student-timetable.jsp");
                }else{
                    response.sendRedirect("../student-register.jsp?status=10");
                }
            }else if(usertype.equals("admin")){
                int resuser=db.checkAdminLogin(uusername, upassword);
                if(resuser>0){
                    session.setAttribute("adminlogin",resuser);
                    response.sendRedirect("../timetables.jsp");
                }else{
                    response.sendRedirect("../admin-login.jsp?status=0");
                }
            }else if(usertype.equals("faculty")){
                int resuser = db.checkFacultyLogin(uusername, upassword);
                if (resuser > 0) {
                    session.setAttribute("facultylogin", resuser);
                    response.sendRedirect("../faculty-message.jsp");
                } else {
                    response.sendRedirect("../faculty-login.jsp?status=0");
                }
            }
            
            break;
        case "changestatus":
            String csusertype=request.getParameter("usertype");
            String csid=request.getParameter("id");
            String csstatus=request.getParameter("status");
            if(csusertype.equals("student")){
                db.update_delete("update students set status="+csstatus+" where id="+csid);
                response.sendRedirect("../students.jsp?status=2");
            }else{
                
            }
            break;
        case "replymessage":
            String mesgid=request.getParameter("id");
            String ffid=request.getParameter("fid");
            String reply=request.getParameter("reply");
            db.update_delete("update messages set reply='"+reply+"' where id="+mesgid);
            response.sendRedirect("../faculties-messages.jsp?status=2&id="+ffid);
           
            break;
        case "updateadminpwd":
            String cznewpass=request.getParameter("password");
            String czconfpass=request.getParameter("confpassword");
            if(cznewpass.equals(czconfpass)){
                int userpro=db.update_delete("update admin set password='"+cznewpass+"'");
                if(userpro>0){
                    response.sendRedirect("../profile.jsp?status=11");
                }else{
                    response.sendRedirect("../profile.jsp?status=22");
                }
            }else{
                response.sendRedirect("../profile.jsp?status=33");
            }
            break;
        case "updatestudentpwd":
            int userid=(Integer)session.getAttribute("studentlogin");
            String snewpass=request.getParameter("password");
            String sconfpass=request.getParameter("confpassword");
            if(snewpass.equals(sconfpass)){
                int userpro=db.update_delete("update students set password='"+snewpass+"' where id="+userid);
                if(userpro>0){
                    response.sendRedirect("../student-profile.jsp?status=11");
                }else{
                    response.sendRedirect("../student-profile.jsp?status=22");
                }
            }else{
                response.sendRedirect("../student-profile.jsp?status=33");
            }
            break;
        case "updatefacultypwd":
            int fuserid=(Integer)session.getAttribute("facultylogin");
            String fsnewpass=request.getParameter("password");
            String fsconfpass=request.getParameter("confpassword");
            if(fsnewpass.equals(fsconfpass)){
                int userpro=db.update_delete("update faculties set password='"+fsnewpass+"' where id="+fuserid);
                if(userpro>0){
                    response.sendRedirect("../faculty-profile.jsp?status=11");
                }else{
                    response.sendRedirect("../faculty-profile.jsp?status=22");
                }
            }else{
                response.sendRedirect("../faculty-profile.jsp?status=33");
            }
            break;
        case "updatestudent":
            String uname = request.getParameter("name");
            String uenrollno = request.getParameter("enrollno");
            String udob = request.getParameter("dob");
            String ubranch = request.getParameter("branch");
            String usemester = request.getParameter("semester");
            String uaddress = request.getParameter("address");
            String usemail = request.getParameter("emailid");
            String umobileno = request.getParameter("mobileno");
            int ufid=(Integer)session.getAttribute("studentlogin");
                int ures2=db.update_delete("update students set name='"+uname+"',enrollno='"+uenrollno+"',dob='"+udob+"',branch='"+ubranch+"',semester='"+usemester+"',address='"+uaddress+"',emailid='"+usemail+"',mobileno='"+umobileno+"' where id="+ufid);
                if(ures2>0){
                    response.sendRedirect("../student-profile.jsp?status=1");
                }
                else{
                    response.sendRedirect("../student-profile.jsp?status=0");
                }
            break;
        case "gentc":
            String genrollno = request.getParameter("enrollno");
            int resgen = db.checkEnrollno(genrollno);
                if (resgen > 0) {
                    response.sendRedirect("../home.jsp?status=1");
                } else {
                    response.sendRedirect("../home.jsp?status=0");
                }
            
            break;
        case "updatefaculty":
            String funame = request.getParameter("name");
            String fubranch = request.getParameter("branch");
            String fugender = request.getParameter("gender");
            String fupost = request.getParameter("post");
            String fuaddress = request.getParameter("address");
            String fusemail = request.getParameter("emailid");
            String fumobileno = request.getParameter("mobileno");
            int fufid=(Integer)session.getAttribute("facultylogin");
                int fures2=db.update_delete("update faculties set name='"+funame+"',branch='"+fubranch+"',gender='"+fugender+"',post='"+fupost+"',address='"+fuaddress+"',emailid='"+fusemail+"',mobileno='"+fumobileno+"' where id="+fufid);
                if(fures2>0){
                    response.sendRedirect("../faculty-profile.jsp?status=1");
                }
                else{
                    response.sendRedirect("../faculty-profile.jsp?status=0");
                }
            break;
        case "addcontact":
            String mname = request.getParameter("name");
            String email = request.getParameter("email");
            String message = request.getParameter("message");
                int res2 = db.update_delete("insert into contact (name,email,message) value('" + mname + "','" + email + "','" + message + "')");
                if (res2 > 0) {
                    response.sendRedirect("../contact.jsp?status=1");
                }
            break;
        case "addfacsubjects":
            String faculty_id = request.getParameter("faculty_id");
            String subject_ids[]=request.getParameterValues("subject_id");
//            System.out.println(subject_ids);
            db.update_delete("delete from faculty_subjects where faculty_id=" + faculty_id);
            
            for (int i = 0; i < subject_ids.length; i++) {
                int subid = Integer.parseInt(subject_ids[i]);       
                db.update_delete("insert into faculty_subjects (faculty_id,subject_id) value(" + faculty_id + "," + subid + ")");
             }
            response.sendRedirect("../faculties-subject.jsp?status=1&id="+faculty_id);
                
            break;
        case "addstudent":
            String sname = request.getParameter("name");
            String enrollno = request.getParameter("enrollno");
            String dob = request.getParameter("dob");
            String branch = request.getParameter("branch");
            String semester = request.getParameter("semester");
            String address = request.getParameter("address");
            String semail = request.getParameter("emailid");
            String smobileno = request.getParameter("mobileno");
            String password = request.getParameter("password");
            String confirm_password = request.getParameter("confirm_password");
            if(password.equals(confirm_password)){
                if(!db.checkEmailExistStudent(semail, enrollno)){
                    int sres2 = db.update_delete("insert into students (name, enrollno, dob, branch, semester, address, emailid, mobileno,password,status) value('" + sname + "','" + enrollno + "','" + dob + "','" + branch + "','" + semester + "','" + address + "','" + semail + "','" + smobileno + "','" + password + "',0)");
                    if (sres2 > 0) {
                        response.sendRedirect("../student-register.jsp?status=1");
                    }
                }else{
                    response.sendRedirect("../student-register.jsp?status=2");
                }
            }else{
                response.sendRedirect("../student-register.jsp?status=10");
            }
            break;
        case "addfaculty":
            String fname = request.getParameter("name");
            String fbranch = request.getParameter("branch");
            String faddress = request.getParameter("address");
            String femail = request.getParameter("emailid");
            String fmobileno = request.getParameter("mobileno");
            String fgender = request.getParameter("gender");
            String fpost = request.getParameter("post");
            String fpassword = request.getParameter("password");
            String fconfirm_password = request.getParameter("confirm_password");
            if(fpassword.equals(fconfirm_password)){
                if(!db.checkEmailExistFaculty(femail)){
                    int sres2 = db.update_delete("insert into faculties (name, branch, address, emailid, mobileno,gender,post,password) value('" + fname + "','" + fbranch + "','" + faddress + "','" + femail + "','" + fmobileno + "','" + fgender + "','" + fpost + "','" + fpassword + "')");
                    if (sres2 > 0) {
                        response.sendRedirect("../faculties.jsp?status=11");
                    }
                }else{
                    response.sendRedirect("../faculties.jsp?status=2");
                }
            }else{
                response.sendRedirect("../faculties.jsp?status=10");
            }
            break;
        case "addnews":
            String title=request.getParameter("title");
            String description=request.getParameter("description");
            boolean res=db.addNews(title,description);
            if(res){
                    response.sendRedirect("../notifications.jsp?status=1");
            }
            break;
        case "addsubject":
            String sbranch=request.getParameter("branch");
            String ssemester=request.getParameter("semester");
            String subject=request.getParameter("subject");
            String hours=request.getParameter("type");
            int ssres2 = db.update_delete("insert into subjects (branch, semester, subject,type) value('" + sbranch + "','" + ssemester + "','" + subject + "','" + hours + "')");
            if(ssres2 == 1){
                    response.sendRedirect("../subjects.jsp?status=1");
            }
            break;
        case "addtimetable":
            String classname=request.getParameter("classname");
            String tsbranch=request.getParameter("branch");
            String tssemester=request.getParameter("semester");
            String tsession=request.getParameter("session");
            int tssres2 = db.update_delete("insert into timetable (class_name, branch, semester, session) value('" + classname + "','" + tsbranch + "','" + tssemester + "','" + tsession + "')");
            if(tssres2 == 1){
                    response.sendRedirect("../timetables.jsp?status=1");
            }
            break;
        case "addmessage":
            String amessage=request.getParameter("message");
            int fid=(Integer)session.getAttribute("facultylogin");
            boolean mres=db.addMessage(amessage,fid);
            if(mres){
                    response.sendRedirect("../faculty-message.jsp?status=1");
            }
            break;
        case "addholiday":
            String date=request.getParameter("date");
            String reason=request.getParameter("reason");
            boolean rres=db.addHoliday(date,reason);
            if(rres){
                    response.sendRedirect("../holidays.jsp?status=1");
            }
            break;
        case "delete":
            String table = request.getParameter("table");
            String did = request.getParameter("id");
            boolean dreds = db.delete(table, Integer.parseInt(did));
            if (dreds) {
                if (table.equals("students")) {
                    response.sendRedirect("../students.jsp?status=0");
                } else if (table.equals("contact")) {
                    response.sendRedirect("../contacts.jsp?status=0");
                } else if (table.equals("news")) {
                    response.sendRedirect("../notifications.jsp?status=0");
                } else if (table.equals("faculties")) {
                    response.sendRedirect("../faculties.jsp?status=0");
                } else if (table.equals("holidays")) {
                    response.sendRedirect("../holidays.jsp?status=0");
                }else if (table.equals("messages")) {
                    response.sendRedirect("../faculty-message.jsp?status=0");
                }else if (table.equals("subjects")) {
                    response.sendRedirect("../subjects.jsp?status=0");
                }else if (table.equals("timetable")) {
                    response.sendRedirect("../timetables.jsp?status=0");
                }
            } else {
                response.sendRedirect("../?status=0");
            }
            break;
        
        case "resendotp":
            String mobileno = request.getParameter("mobile");
            String noo = db.getRandomNumberString();
            String msg = "Your One Time Password (OTP) is " + noo + " for new citizen account.";
            session.setAttribute("otpsession", noo);
            System.out.println(noo);
            out.println(1);
            break;
    }
    db.closeDb();
%>
