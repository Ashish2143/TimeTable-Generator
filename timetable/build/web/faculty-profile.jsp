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
                <h1 class="display-2 text-white mb-4 animated slideInDown">My Profile</h1>
            </div>
        </div>
        <!-- Page Header End -->

        <!-- About Start -->
        <div class="container-fluid">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-6 col-md-12 col-sm-12 wow fadeIn" data-wow-delay=".5s">
                        <center>
                                <%
                                    try {
                                        String status = " ";
                                        status = request.getParameter("status");

                                        if (status.equals("1")) {
                                            out.println("<div class='alert alert-success'>Details Updated successfully!</div>");
                                        }

                                    } catch (Exception e) {
                                    }
                                %>
                                </center>
                        <h3 class="text-primary">Update Profile</h3>
                        <%
                                Database db = new Database();
                                try{
                                    ResultSet res = db.getFacultyById(Integer.parseInt(facultylogin1));
                                    if(res.next()){
                                   
                                %>
                        <form action="includes/WebService.jsp" method="post">
                                    <div class="row p-5 rounded contact-form">
                                    <input type="hidden" name="action" value="updatefaculty"/>
                                    <div class="col-md-6 mb-4">
                                        <input type="text" class="form-control border-0 py-3" value="<%=res.getString("name")%>" name="name" required placeholder="Your name">
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        
                                        <select class="form-control border-0 py-3" name="branch" required >
                                            <option value="<%=res.getString("branch")%>"><%=res.getString("branch")%></option>
                                            <option value="Computer Engineering">Computer Engineering</option>
                                            <option value="Electonics Engineering">Electronics Engineering</option>
                                            <option value="Electical Engineering">Electrical Engineering</option>
                                            <option value="Mechanical Engineering">Mechanical Engineering</option>
                                            <option value="Chemical Engineering">Chemical Engineering</option>
                                            <option value="Civil Engineering">Civil Engineering</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <input type="email" class="form-control border-0 py-3" value="<%=res.getString("emailid")%>" name="emailid" required placeholder="Your emailid">
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <input type="text" class="form-control border-0 py-3" name="mobileno" value="<%=res.getString("mobileno")%>" required placeholder="Your mobile no">
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <select class="form-control border-0 py-3" name="gender" required placeholder="Your gender">
                                            <option value="<%=res.getString("gender")%>"><%=res.getString("gender")%></option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                        <option value="Other">Other</option>
                                        </select>
                                    </div>
                                    
                                    <div class="col-md-6 mb-4">
                                        <select class="form-control border-0 py-3" name="post" required placeholder="Your Post">
                                            <option value="<%=res.getString("post")%>"><%=res.getString("post")%></option>
                                        <option value="Prof">Prof</option>
                                        <option value="HOD">HOD</option>
                                        </select>
                                    </div>
                                    <div class="col-md-12 mb-4">
                                        <input type="text" class="form-control border-0 py-3" name="address" value="<%=res.getString("address")%>" required placeholder="Your Address">
                                    </div>
                                    <div class="text-start">
                                        <button class="btn bg-primary text-white py-3 px-5" type="submit">Update</button>
                                    </div>
                                    </div>
                                </form>
                        <%
                             }
                                    }catch(Exception e){
                                    
                                    }
                            %>
                    </div>
                    <div class="col-lg-6 col-md-12 col-sm-12 wow fadeIn" data-wow-delay=".5s">
                         <form action="includes/WebService.jsp" method="post">
                                <input type="hidden" name="action" value="updatefacultypwd"/>
                                <center>
                                <%
                                    try {
                                        String status = " ";
                                        status = request.getParameter("status");

                                        if (status.equals("33")) {
                                            out.println("<div class='alert alert-danger'>Password does not match!</div>");
                                        }
                                        if (status.equals("22")) {
                                            out.println("<div class='alert alert-danger'>Error Occured!</div>");
                                        }
                                        if (status.equals("11")) {
                                            out.println("<div class='alert alert-success'>Password Updated successfully!</div>");
                                        }

                                    } catch (Exception e) {
                                    }
                                %>
                                </center>
                            <div class="row g-3">
                                <h3 class="text-primary">Change Password</h3>
                                <div class="col-12">

								<div class="form-floating">
									<input type="password" class="form-control" required name="password"
										placeholder="Password"> <label for="password">New Password</label>
								</div>
							</div>
							<div class="col-12">

								<div class="form-floating">
									<input type="password" class="form-control" required name="confpassword"
										placeholder="Password"> <label for="password">Confirm
										Password</label>

								</div>
							</div>
                                <div class="col-12">
                                    <button class="btn btn-primary rounded-pill py-3 px-5" type="submit">Update</button>
                                </div>
                            </div>
                            
                        </form>
                    </div>
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