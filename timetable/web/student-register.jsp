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
                <h1 class="display-2 text-white mb-4 animated slideInDown">Student</h1>
            </div>
        </div>
        <!-- Page Header End -->

        <!-- Contact Start -->
        <div class="container-fluid">
            <div class="container py-5">
                <div class="text-center mx-auto pb-5 wow fadeIn" data-wow-delay=".3s" style="max-width: 600px;">
                    <h1 class="mb-3">Student please register or login here</h1>
                    <center>
                        <%
                                        try {
                                            String status = " ";
                                            status = request.getParameter("status");

                                            if (status.equals("0")) {
                                                out.println("<div class='alert alert-danger'>Username/Password Invalid!</div>");
                                            }
                                            
                                            if (status.equals("10")) {
                                                out.println("<div class='alert alert-danger' style=''>Password does not match!</div>");
                                            }

                                            if (status.equals("2")) {
                                                out.println("<div class='alert alert-danger' style=''>Emailid or enrollment no. already exist!</div>");
                                            }

                                            if (status.equals("1")) {
                                                out.println("<div class='alert alert-success' style=''>Your account created successfully! Admin will verify your account details!</div>");
                                            }

                                        } catch (Exception e) {
                                        }
                                    %>
                    </center>
                </div>
                <div class="contact-detail position-relative p-5">
                    
                    <div class="row g-5">
                        <div class="col-lg-6 wow fadeIn" data-wow-delay=".5s">
                                <form action="includes/WebService.jsp" onsubmit="return validate();" method="post">
                                    <div class="row p-5 rounded contact-form">
                                    <input type="hidden" name="action" value="addstudent"/>
                                    <p style="color:#fff">Student Registration</p>
                                    <div class="col-md-6 mb-4">
                                        <input type="text" class="form-control border-0 py-3" name="name" required placeholder="Your name">
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <input type="text" class="form-control border-0 py-3" name="enrollno" required placeholder="Your enrollment">
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <input type="date" class="form-control border-0 py-3" name="dob" required placeholder="Your DOB">
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
                                        <input type="text" class="form-control border-0 py-3" name="semester" required placeholder="Your Semister">
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <input type="text" class="form-control border-0 py-3" name="address" required placeholder="Your address">
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <input type="email" class="form-control border-0 py-3" name="emailid" required placeholder="Your emailid">
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <input type="text" class="form-control border-0 py-3" name="mobileno" required placeholder="Your mobile no">
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
                        <div class="col-lg-6 wow fadeIn" data-wow-delay=".5s">
                            <div class="p-5 rounded contact-form">
                                <form action="includes/WebService.jsp" method="post" >
                                    <input type="hidden" name="action" value="loginuser"/>
                                    <input type="hidden" name="usertype" value="student"/>
                                    <p style="color:#fff">Student Login</p>
                                    <div class="mb-4">
                                        <input type="text" class="form-control border-0 py-3" name="uname" required placeholder="Your Username">
                                    </div>
                                    <div class="mb-4">
                                        <input type="password" class="form-control border-0 py-3" name="pass" required placeholder="Your Password">
                                    </div>
                                    <div class="text-start">
                                        <button class="btn bg-primary text-white py-3 px-5" type="submit">Login</button>
                                    </div>
                                </form>
                            </div>
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