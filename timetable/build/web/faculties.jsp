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
                <h1 class="display-2 text-white mb-4 animated slideInDown">Faculties</h1>
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
                                                out.println("<div class='alert alert-success' style='font-size: 15px; color:green'>Notification added successfully!</div>");
                                            }
                                            
                                            if (status.equals("0")) {
                                                out.println("<div class='alert alert-danger' style='font-size: 15px; color:green'>Faculty deleted successfully!</div>");
                                            }
                                            
                                            
                                            if (status.equals("10")) {
                                                out.println("<div class='alert alert-danger' style=''>Password does not match!</div>");
                                            }

                                            if (status.equals("2")) {
                                                out.println("<div class='alert alert-danger' style=''>Emailid already exist!</div>");
                                            }

                                            if (status.equals("11")) {
                                                out.println("<div class='alert alert-success' style=''>Faculty account created successfully!</div>");
                                            }

                                        } catch (Exception e) {
                                        }
                                    %>
                    </center>
                </div>
                <div class="contact-detail position-relative p-5">
                    
                    <div class="row g-5">
                        <div class="col-lg-8 wow fadeIn" data-wow-delay=".5s">
                                    <div class="row py-3 rounded contact-form">
                                        <div class="col-md-12 mb-4">
                                            <table class="table" style="color:#fff">
                                                <tr>
                                                    <th>Name</th><th>Branch</th><th>Email ID</th><th>Mobile No.</th><th>Gender</th><th>Post</th><th>Address</th><th>Action</th>
                                                </tr>
                                                <%
                                                    Database db = new Database();

                                                    try {
                                                        int j = 0;
                                                        ResultSet rs = db.getFaculties();
                                                        while (rs.next()) {
                                                        
                                                %>
                                                <tr>
                                                    <td align="left"><%=rs.getString("name")%></td>
                                                    <td align="left"><%=rs.getString("branch")%></td>
                                                    <td align="left"><%=rs.getString("emailid")%></td>
                                                    <td align="left"><%=rs.getString("mobileno")%></td>
                                                    <td align="left"><%=rs.getString("gender")%></td>
                                                    <td align="left"><%=rs.getString("post")%></td>
                                                    <td align="left"><%=rs.getString("address")%></td>
                                                   
                                                    <td>
                                                        <form class="row login_form" action="includes/WebService.jsp" onsubmit="return confirm('Are you sure?');" method="post" >
                                                            <input type="hidden" name="action" value="delete"/>
                                                            <input type="hidden" name="id" value="<%=rs.getInt("id")%>"/>
                                                            <input type="hidden" name="table" value="faculties"/>
                                                            <a href="faculties-messages.jsp?id=<%=rs.getInt("id")%>" class="btn btn-primary btn-sm"> Messages </a>
                                                            <a href="faculties-subject.jsp?id=<%=rs.getInt("id")%>" class="btn btn-info btn-sm"> Subjects </a>
                                                            <button type="submit" class="btn btn-danger btn-sm" style="width: 100px;"> Delete </button>
                                                        </form>
                                                    </td>
                                                </tr>
                                                <%
                                                j++;
                                            }
                                        } catch (Exception e) {

                                        }
                                    %>
                                            </table>
                                        </div>
                                    </div>
                        </div>
                        <div class="col-lg-4 wow fadeIn" data-wow-delay=".5s">
                                <form action="includes/WebService.jsp" onsubmit="return validate();" method="post">
                                    <div class="row py-3 rounded contact-form">
                                    <input type="hidden" name="action" value="addfaculty"/>
                                    <p style="color:#fff">Faculty Registration</p>
                                    <div class="col-md-6 mb-4">
                                        <input type="text" class="form-control border-0 py-3" name="name" required placeholder="Your name">
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <select class="form-control border-0 py-3" name="branch" required >
                                            <option value="">Select branch</option>
                                            <option value="Computer Engineering">Computer Engineering</option>
                                            <option value="Electonics Engineering">Electronics Engineering</option>
                                            <option value="Electical Engineering">Electrical Engineering</option>
                                            <option value="Mechanical Engineering">Mechanical Engineering</option>
                                            <option value="Chemical Engineering">Chemical Engineering</option>
                                            <option value="Civil Engineering">Civil Engineering</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <input type="email" class="form-control border-0 py-3" name="emailid" required placeholder="Your emailid">
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <input type="text" class="form-control border-0 py-3" name="mobileno" required placeholder="Your mobile no">
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <select class="form-control border-0 py-3" name="gender" required placeholder="Your gender">
                                        <option>Select gender</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                        <option value="Other">Other</option>
                                        </select>
                                    </div>
                                    
                                    <div class="col-md-6 mb-4">
                                        <select class="form-control border-0 py-3" name="post" required placeholder="Your Post">
                                        <option>Select post</option>
                                        <option value="Prof">Prof</option>
                                        <option value="HOD">HOD</option>
                                        </select>
                                    </div>
                                    <div class="col-md-12 mb-4">
                                        <input type="text" class="form-control border-0 py-3" name="address" required placeholder="Your Address">
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <input type="password" class="form-control border-0 py-3" name="password" required placeholder="Your Password">
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <input type="password" class="form-control border-0 py-3" name="confirm_password" required placeholder="Your Confirm Password">
                                    </div>
                                    <div class="text-start">
                                        <button class="btn bg-primary text-white py-3 px-5" type="submit">Submit</button>
                                    </div>
                                    </div>
                                </form>
                        </div>
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