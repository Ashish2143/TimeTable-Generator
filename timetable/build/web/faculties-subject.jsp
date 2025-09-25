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
                <h1 class="display-2 text-white mb-4 animated slideInDown">Subjects</h1>
            </div>
        </div>
        <!-- Page Header End -->

        <!-- Contact Start -->
        <div class="container-fluid">
            <div class="container py-5">
                <div class="text-center mx-auto pb-5 wow fadeIn" data-wow-delay=".3s" style="max-width: 600px;">
                    <center>
                        <%
                                        try {
                                            String status = " ";
                                            status = request.getParameter("status");

                                            if (status.equals("1")) {
                                                out.println("<div class='alert alert-success' style='font-size: 15px; color:green'>Subjects updated successfully!</div>");
                                            }
                                            

                                        } catch (Exception e) {
                                        }
                                         Database db = new Database();
                                         
                                    %>
                    </center>
                </div>
                <div class="contact-detail position-relative p-5">
                    
                    <div class="row g-5">
                        <%
                        ResultSet fes= db.getFacultyById(Integer.parseInt(request.getParameter("id")));
                                         if(fes.next()){
                        %>
                        <div class="col-lg-12 wow fadeIn" data-wow-delay=".5s">
                                    <div class="row p-5 rounded contact-form">
                                        <p style="color:#fff">Select Subjects for <%=fes.getString("name")%></p>
                                        <div class="col-md-12 mb-4">
                                            <form action="includes/WebService.jsp" onsubmit="return confirm('Are you sure?');" method="post" >
                                                <input type="hidden" name="action" value="addfacsubjects"/>
                                                <input type="hidden" name="faculty_id" value="<%=request.getParameter("id")%>"/>
                                            <table class="table" style="color:#fff">
                                                <tr>
                                                    <th>Branch</th><th>Semester</th><th>Subject</th><th>Select</th>
                                                </tr>
                                                <%
                                                   

                                                    try {
                                                        int j = 0;
                                                        ResultSet rs = db.getSubjectByBr(fes.getString("branch"));
                                                        while (rs.next()) {
                                                        
                                                        ResultSet subres =  db.selectAll("select * from faculty_subjects where faculty_id="+request.getParameter("id")+" and subject_id="+rs.getInt("id"));
                                                %>
                                                
                                                <tr>
                                                    
                                                    <td align="left"><%=rs.getString("branch")%></td>
                                                    <td align="left">
                                                        <%=rs.getString("semester")%>
                                                    </td>
                                                    <td align="left">
                                                        <%=rs.getString("subject")%>
                                                    </td>
                                                    <td>
                                                        <input type="checkbox" value="<%=rs.getInt("id")%>" <% if(subres.next()){ out.println("checked"); } %> name="subject_id"/>
                                                    </td>
                                                            
                                                </tr>
                                                
                                                        
                                                 
                                                <%
                                                j++;
                                            }
                                        } catch (Exception e) {

                                        }
                                    %>
                                            </table>
                                            <center><button type="submit" name="submit" class="btn btn-success btn-lg">Update</button></center>
                                            </form>
                                        </div>
                                    </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div> 
        </div>
        <!-- Contact End -->
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
    </body>

</html>