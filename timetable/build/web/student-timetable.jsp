<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Timetable Generator</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Saira:wght@500;600;700&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <%@ include file="includes/header.jsp" %>
        
        <!-- Page Header Start -->
        <div class="container-fluid page-header">
            <div class="container text-center py-2">
                <h1 class="display-2 text-white mb-4 animated slideInDown">Generate Timetable</h1>
            </div>
        </div>
        <!-- Page Header End -->

        <!-- About Start -->
        <div class="container-fluid">
            <div class="container py-5">
                <div class="row g-5">
                    <%
                        Database db = new Database();
                        try{
                                    ResultSet rs = db.getStudentById(Integer.parseInt(studentlogin1));
                                    if(rs.next()){
                                    
                        int tid = db.getTimetableByBrSm(rs.getString("branch"),rs.getString("semester"));
                        ResultSet res = db.getTimetableById(tid);
                        if(res.next()){
                        
                         int days = 0;
                         int gap1 = 5;
                         int gap2 = 9;
                        
                        %>
                    <div class="col-lg-12 col-md-12 col-sm-12 wow fadeIn" data-wow-delay=".5s">
                        
                        <table class="table table-bordered">
                            <tr>
                                <th>Class name : </th><td><%=res.getString("class_name")%></td>
                            
                                <th>Branch : </th><td><%=res.getString("branch")%></td>
                            
                                <th>Semester : </th><td><%=res.getString("semester")%></td>
                            
                                <th>Session : </th><td><%=res.getString("session")%></td>
                            </tr>
                        </table>
                       
                    </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 wow fadeIn" data-wow-delay=".5s" id="contentToPrint">
                                <center><h3>Timetable <%=res.getString("class_name")%></h3></center>
                                <table class="table table-bordered">
                                    <tr>
                                        <th>DAY</th>
                                        <%
                                        String time = "10:30:00 AM";
        
                                        SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss a");
                                        Calendar calendar = Calendar.getInstance();
                                        try {
                                            Date date = sdf.parse(time);
                                            calendar.setTime(date);
                                            %>
                                        <td><%=sdf.format(calendar.getTime())%> - <%=db.getEndTime(calendar)%></td>
                                        <%
                                            ++days ;
                                            while (calendar.get(Calendar.HOUR_OF_DAY) != 12 || calendar.get(Calendar.AM_PM) != Calendar.PM) {
                                                calendar.add(Calendar.HOUR_OF_DAY, 1);
//                                                System.out.println(sdf.format(calendar.getTime()));
                                                %>
                                        <td><%=sdf.format(calendar.getTime())%> - <%=db.getEndTime(calendar)%></td>
                                        <%
                                            ++days ;
                                            }
                                        } catch (ParseException e) {
                                            e.printStackTrace();
                                        }
                                        %>
                                        <td>Break</td>
                                        <%
                                        String time1 = "01:45:00 PM";
        
                                        SimpleDateFormat sdf1 = new SimpleDateFormat("hh:mm:ss a");
                                        Calendar calendar1 = Calendar.getInstance();
                                        try {
                                            Date date1 = sdf1.parse(time1);
                                            calendar1.setTime(date1);
                                            %>
                                        <td><%=sdf.format(calendar1.getTime())%> - <%=db.getEndTime(calendar1)%></td>
                                        <%
                                            ++days ;
                                            while (calendar1.get(Calendar.HOUR_OF_DAY) != 14 || calendar1.get(Calendar.AM_PM) != Calendar.PM) {
                                                calendar1.add(Calendar.HOUR_OF_DAY, 1);
//                                                System.out.println(sdf.format(calendar.getTime()));
                                                %>
                                        <td><%=sdf.format(calendar1.getTime())%> - <%=db.getEndTime(calendar1)%></td>
                                        <%
                                            ++days ;
                                            }
                                        } catch (ParseException e) {
                                            e.printStackTrace();
                                        }
                                        %>
                                        <td>Break</td>
                                        <%
                                        String time2 = "03:50:00 PM";
        
                                        SimpleDateFormat sdf2 = new SimpleDateFormat("hh:mm:ss a");
                                        Calendar calendar2 = Calendar.getInstance();
                                        try {
                                            Date date2 = sdf1.parse(time2);
                                            calendar2.setTime(date2);
                                            %>
                                        <td><%=sdf.format(calendar2.getTime())%> - <%=db.getEndTime(calendar)%></td>
                                        <%
                                            ++days ;
                                            while (calendar2.get(Calendar.HOUR_OF_DAY) != 16 || calendar2.get(Calendar.AM_PM) != Calendar.PM) {
                                                calendar2.add(Calendar.HOUR_OF_DAY, 1);
//                                                System.out.println(sdf.format(calendar.getTime()));
                                                %>
                                        <td><%=sdf.format(calendar2.getTime())%> - <%=db.getEndTime(calendar2)%></td>
                                        <%
                                            ++days ;
                                            }
                                        } catch (ParseException e) {
                                            e.printStackTrace();
                                        }
                                        %>
                                        
                                        
                                    </tr>
                                    <tr>
                                        <th>MON</th>
                                        <%
                                           int sub_id = 0;
                                           String[] strArray = new String[5];
                                            ResultSet ress = db.selectAll("select * from subjects where branch = '"+res.getString("branch")+"'and semester = '"+res.getString("semester")+"' and type='Practical' order by type asc limit 1");
                                            while(ress.next()){
                                                 sub_id = ress.getInt("id");
                                                %>
                                                <td colspan="2" align="center"><%=ress.getString("subject")%> <br> </td>
                                                <%
                                                }
                                        %>
                                        <%
                                            //String[] strArray = new String[5];
                                            
                                            ResultSet ress003 = db.selectAll("select * from subjects where branch = '"+res.getString("branch")+"' and semester = '"+res.getString("semester")+"' and type='Theory' order by subject asc limit 1 offset 3");
                                            while(ress003.next()){
                                                 //strArray[0] = ress003.getString("subject");
                                                %>
                                                <td colspan="1" align="center"><%=ress003.getString("subject")%> <br> </td>
                                                <%
                                            }
                                        %>
                                        <td colspan="1"></td>
                                        
                                        <%
                                            //String[] strArray = new String[5];
                                            
                                            ResultSet ress20 = db.selectAll("select * from subjects where branch = '"+res.getString("branch")+"' and semester = '"+res.getString("semester")+"' and type='Theory' order by id desc limit 2");
                                            while(ress20.next()){
                                                 //strArray[0] = ress20.getString("subject");
                                                %>
                                                <td colspan="1" align="center"><%=ress20.getString("subject")%> <br> </td>
                                                <%
                                            }
                                        %>
                                        <td colspan="1"></td>
                                        <%
                                            ResultSet ress11 = db.selectAll("select * from subjects where branch = '"+res.getString("branch")+"' and id != "+sub_id+" and semester = '"+res.getString("semester")+"' and type='Practical' order by type asc limit 1");
                                            while(ress11.next()){
                                                 strArray[1] = ress11.getString("id");
                                                %>
                                                <td colspan="2" align="center"><%=ress11.getString("subject")%> <br> </td>
                                                <%
                                                }
                                        %>
                                    </tr>
                                    <tr>
                                        <th>TUE</th>
                                        <%
                                            //String[] strArray = new String[5];
                                            
                                            ResultSet ress40 = db.selectAll("select * from subjects where branch = '"+res.getString("branch")+"' and semester = '"+res.getString("semester")+"' and type='Theory' order by id asc limit 3");
                                            while(ress40.next()){
                                                 //strArray[0] = ress40.getString("subject");
                                                %>
                                                <td colspan="1" align="center"><%=ress40.getString("subject")%> <br> </td>
                                                <%
                                            }
                                        %>
                                        <td colspan="1"></td>
                                        
                                        <%
                                            //String[] strArray = new String[5];
                                            int sub_id1 = 0;
                                            ResultSet ress1 = db.selectAll("select * from subjects where branch = '"+res.getString("branch")+"'and semester = '"+res.getString("semester")+"' and type='Practical' order by type asc limit 1");
                                            while(ress1.next()){
                                                 //strArray[0] = ress.getString("subject");
                                                 sub_id1 = ress1.getInt("id");
                                                %>
                                                <td colspan="2" align="center"><%=ress1.getString("subject")%> <br> </td>
                                                <%
                                                }
                                        %>
                                        
                                        
                                        <td colspan="1"></td>
                                        <%
                                            //String[] strArray = new String[5];
                                            
                                            ResultSet ress22 = db.selectAll("select * from subjects where branch = '"+res.getString("branch")+"' and id != "+sub_id1+" and semester = '"+res.getString("semester")+"' and type='Practical' order by type asc limit 1");
                                            while(ress22.next()){
                                                 //strArray[0] = ress22.getString("subject");
                                                %>
                                                <td colspan="2" align="center"><%=ress22.getString("subject")%> <br> </td>
                                                <%
                                            }
                                        %>
                                    </tr>
                                    <tr>
                                        <th>WED</th>
                                        <%
                                            //String[] strArray = new String[5];
                                            int sub_id2 = 0;
                                            ResultSet ress2 = db.selectAll("select * from subjects where branch = '"+res.getString("branch")+"' and semester = '"+res.getString("semester")+"' and type='Practical' order by type asc limit 1");
                                            while(ress2.next()){
                                                 //strArray[0] = ress.getString("subject");
                                                 sub_id2 = ress2.getInt("id");
                                                %>
                                                <td colspan="2" align="center"><%=ress2.getString("subject")%> <br> </td>
                                                <%
                                                }
                                        %>
                                        <%
                                            //String[] strArray = new String[5];
                                            
                                            ResultSet ress303 = db.selectAll("select * from subjects where branch = '"+res.getString("branch")+"' and semester = '"+res.getString("semester")+"' and type='Theory' order by subject asc limit 1 offset 2");
                                            while(ress303.next()){
                                                 //strArray[0] = ress303.getString("subject");
                                                %>
                                                <td colspan="1" align="center"><%=ress303.getString("subject")%> <br> </td>
                                                <%
                                            }
                                        %>
                                        <td colspan="1"></td>
                                        
                                        <%
                                            //String[] strArray = new String[5];
                                            
                                            ResultSet ress10 = db.selectAll("select * from subjects where branch = '"+res.getString("branch")+"' and semester = '"+res.getString("semester")+"' and type='Theory' order by id asc,subject asc limit 2");
                                            while(ress10.next()){
                                                 //strArray[0] = ress10.getString("subject");
                                                %>
                                                <td colspan="1" align="center"><%=ress10.getString("subject")%> <br> </td>
                                                <%
                                            }
                                        %>
                                        
                                        <td colspan="1"></td>
                                        <%
                                            //String[] strArray = new String[5];
                                            
                                            ResultSet ress222 = db.selectAll("select * from subjects where branch = '"+res.getString("branch")+"' and id != "+sub_id2+" and semester = '"+res.getString("semester")+"' and type='Practical' order by type desc limit 1");
                                            while(ress222.next()){
                                                 //strArray[0] = ress222.getString("subject");
                                                %>
                                                <td colspan="2" align="center"><%=ress222.getString("subject")%> <br> </td>
                                                <%
                                            }
                                        %>
                                    </tr>
                                    <tr>
                                        <th>THU</th>
                                        <%
                                            //String[] strArray = new String[5];
                                            
                                            ResultSet ress4 = db.selectAll("select * from subjects where branch = '"+res.getString("branch")+"' and semester = '"+res.getString("semester")+"' and type='Theory' order by id desc limit 3");
                                            while(ress4.next()){
                                                 //strArray[0] = ress4.getString("subject");
                                                %>
                                                <td colspan="1" align="center"><%=ress4.getString("subject")%> <br> </td>
                                                <%
                                            }
                                        %>
                                        <td colspan="1"></td>
                                       <%
                                            //String[] strArray = new String[5];
                                            
                                            ResultSet ress44 = db.selectAll("select * from subjects where branch = '"+res.getString("branch")+"' and semester = '"+res.getString("semester")+"' and type='Theory' order by id asc,subject desc limit 2");
                                            while(ress44.next()){
                                                 //strArray[0] = ress44.getString("subject");
                                                %>
                                                <td colspan="1" align="center"><%=ress44.getString("subject")%> <br> </td>
                                                <%
                                            }
                                        %>
                                        <td colspan="1"></td>
                                        <td colspan="2" align="center">CPE</td>
                                    </tr>
                                    <tr>
                                        <th>FRI</th>
                                        <%
                                            //String[] strArray = new String[5];
                                            
                                            ResultSet ress3 = db.selectAll("select * from subjects where branch = '"+res.getString("branch")+"'and semester = '"+res.getString("semester")+"' and type='Practical' order by type asc limit 1");
                                            while(ress3.next()){
                                                 //strArray[0] = ress.getString("subject");
                                                %>
                                                <td colspan="2" align="center"><%=ress3.getString("subject")%> <br> </td>
                                                <%
                                                }
                                        %>
                                        <%
                                            //String[] strArray = new String[5];
                                            
                                            ResultSet ress330 = db.selectAll("select * from subjects where branch = '"+res.getString("branch")+"' and semester = '"+res.getString("semester")+"' and type='Theory' order by subject asc limit 1 offset 1");
                                            while(ress330.next()){
                                                 //strArray[0] = ress330.getString("subject");
                                                %>
                                                <td colspan="1" align="center"><%=ress330.getString("subject")%> <br> </td>
                                                <%
                                            }
                                        %>
                                        <td colspan="1"></td>
                                        
                                        <%
                                            //String[] strArray = new String[5];
                                            
                                            ResultSet ress33 = db.selectAll("select * from subjects where branch = '"+res.getString("branch")+"' and semester = '"+res.getString("semester")+"' and type='Theory' order by id desc,subject desc limit 2 ");
                                            while(ress33.next()){
                                                 //strArray[0] = ress33.getString("subject");
                                                %>
                                                <td colspan="1" align="center"><%=ress33.getString("subject")%> <br> </td>
                                                <%
                                            }
                                        %>
                                        
                                        <td colspan="1"></td>
                                        <%
                                            //String[] strArray = new String[5];
                                            
                                            ResultSet ress333 = db.selectAll("select * from subjects where branch = '"+res.getString("branch")+"' and semester = '"+res.getString("semester")+"' and type='Practical' order by subject asc limit 1");
                                            while(ress333.next()){
                                                 //strArray[0] = ress333.getString("subject");
                                                %>
                                                <td colspan="2" align="center"><%=ress333.getString("subject")%> <br> </td>
                                                <%
                                            }
                                        %>
                                    </tr>
                                    <tr>
                                        <th>SAT</th><td colspan="5" align="center">CPE</td>
                                        <td colspan="1"></td>
                                        <td colspan="1"></td>
                                        <td colspan="2"></td>
                                    </tr>
                                </table>
                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 wow fadeIn" data-wow-delay=".5s">
                                                <center><button type="button" onclick="printContent()" class="btn btn-warning btn-lg" >Print</button></center>
                                            </div>
                             <%
                            }
                       
                             }
                                    }catch(Exception e){
                                    
                                    }
                            %>
                    </form>
                </div>
            </div>
        </div>
        <!-- About End -->

        <%@ include file="includes/footer.jsp" %>
        
        <!-- JavaScript Libraries -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script>
            function printContent() {
                var content = document.getElementById("contentToPrint").innerHTML;
                var originalContent = document.body.innerHTML;
                document.body.innerHTML = content;
                window.print();
                document.body.innerHTML = originalContent;
            }
            </script>
    </body>

</html>