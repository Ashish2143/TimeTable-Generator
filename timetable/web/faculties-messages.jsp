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
                <h1 class="display-2 text-white mb-4 animated slideInDown">Messages</h1>
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
                                                out.println("<div class='alert alert-success' style='font-size: 15px; color:green'>Message replied successfully!</div>");
                                            }
                                            

                                        } catch (Exception e) {
                                        }
                                         Database db = new Database();
                                         ResultSet fes= db.getFacultyById(Integer.parseInt(request.getParameter("id")));
                                         fes.next();
                                    %>
                    </center>
                </div>
                <div class="contact-detail position-relative p-5">
                    
                    <div class="row g-5">
                        <div class="col-lg-12 wow fadeIn" data-wow-delay=".5s">
                                    <div class="row p-5 rounded contact-form">
                                        <p style="color:#fff">Messages from <%=fes.getString("name")%></p>
                                        <div class="col-md-12 mb-4">
                                            <table class="table" style="color:#fff">
                                                <tr>
                                                    <th>Message</th><th>Reply</th><th>Action</th>
                                                </tr>
                                                <%
                                                   

                                                    try {
                                                        int j = 0;
                                                        ResultSet rs = db.getFacultyMessages(Integer.parseInt(request.getParameter("id")));
                                                        while (rs.next()) {
                                                %>
                                                <form action="includes/WebService.jsp" onsubmit="return confirm('Are you sure?');" method="post" >
                                                <tr>
                                                    
                                                    <td align="left"><%=rs.getString("message")%></td>
                                                    <td align="left">
                                                        
                                                        <textarea class="form-control" name="reply"><%=rs.getString("reply")%></textarea>
                                                        <input type="hidden" name="action" value="replymessage"/>
                                                            <input type="hidden" name="id" value="<%=rs.getInt("id")%>"/>
                                                            <input type="hidden" name="fid" value="<%=request.getParameter("id")%>"/>
                                                    </td>
                                                    <td>
                                                        <button type="submit" class="btn btn-success btn-sm" style="width: 100px;">Send Reply</button>
                                                    </td>
                                                            
                                                </tr>
                                                
                                                        </form>
                                                 
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