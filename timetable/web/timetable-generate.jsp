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
                    <form action="timetable.jsp" method="get">
                        <input type="hidden" value="<%=request.getParameter("id")%>" name="tid" />
                        <div class="row">
                    <%
                        Database db = new Database();
                        ResultSet res = db.getTimetableById(Integer.parseInt(request.getParameter("id")));
                        if(res.next()){
                        %>
                    <div class="col-lg-4 col-md-12 col-sm-12 wow fadeIn" data-wow-delay=".5s">
                        
                        <table class="table table-bordered">
                            <tr>
                                <th>Class name : </th><td><%=res.getString("class_name")%></td>
                            </tr>
                            <tr>
                                <th>Branch : </th><td><%=res.getString("branch")%></td>
                            </tr>
                            <tr>
                                <th>Semester : </th><td><%=res.getString("semester")%></td>
                            </tr>
                            <tr>
                                <th>Session : </th><td><%=res.getString("session")%></td>
                            </tr>
                        </table>
                       
                    </div>
                            <div class="col-lg-4 col-md-12 col-sm-12 wow fadeIn" data-wow-delay=".5s">
                                <h3>Faculties</h3>
                                <table class="table table-bordered">
                                                <tr>
                                                    <th>Name</th><th>Mobile No</th>
                                                </tr>
                                                <%
                                                      String branch  = res.getString("branch");
                                                    try {
                                                        int j = 0;
                                                        ResultSet rs = db.getFacultiesByBranch(branch);
                                                        while (rs.next()) {
                                                        
                                                %>
                                                <tr>
                                                 <!--   <td align="left">
                                                        <input type="checkbox" name="faculty_id" value="<%=rs.getString("id")%>"/>
                                                    </td>-->
                                                    <td align="left"><%=rs.getString("name")%></td>
                                                    <td align="left"><%=rs.getString("mobileno")%></td>
                                                   
                                                </tr>
                                                <%
                                                j++;
                                            }
                                        } catch (Exception e) {

                                        }
                                    %>
                                            </table>
                            </div>
                             <div class="col-lg-4 col-md-12 col-sm-12 wow fadeIn" data-wow-delay=".5s">
                                <h3>Subjects</h3>
                                <table class="table table-bordered">
                                                <tr>
                                                    <th>Subject</th><th>Type</th>
                                                </tr>
                                                <%
                                                    try {
                                                        int j = 0;
                                                        ResultSet rs = db.getSubjectByBranch(branch,res.getString("semester"));
                                                        while (rs.next()) {
                                                        
                                                %>
                                                <tr>
                                                    <td align="left"><%=rs.getString("subject")%></td>
                                                   <td align="left"><%=rs.getString("type")%></td>
                                                </tr>
                                                <%
                                                j++;
                                            }
                                        } catch (Exception e) {

                                        }
                                    %>
                                            </table>
                            </div>
                                            <div class="col-lg-12 col-md-12 col-sm-12 wow fadeIn" data-wow-delay=".5s">
                                                <center><button type="submit" class="btn btn-success btn-lg" >Generate Timetable</button></center>
                                            </div>
                             <%
                            }
                        %>
                        </div>
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
    </body>

</html>