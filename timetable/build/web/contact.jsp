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
                <h1 class="display-2 text-white mb-4 animated slideInDown">Contact Us</h1>
            </div>
        </div>
        <!-- Page Header End -->

        <!-- Contact Start -->
        <div class="container-fluid">
            <div class="container py-5">
                <div class="text-center mx-auto pb-5 wow fadeIn" data-wow-delay=".3s" style="max-width: 600px;">
                    <h5 class="text-primary">Get In Touch</h5>
                    <h1 class="mb-3">Contact for any query</h1>
                    <center>
                                <%
                                    try {
                                        String status = " ";
                                        status = request.getParameter("status");

                                        if (status.equals("0")) {
                                            out.println("<div class='alert alert-danger'>Internal server error!</div>");
                                        }
                                        if (status.equals("1")) {
                                            out.println("<div class='alert alert-success'>Contact form submitted successfully!</div>");
                                        }

                                    } catch (Exception e) {
                                    }
                                %>
                                </center>
                </div>
                <div class="contact-detail position-relative p-5">
                    
                    <div class="row g-5">
                        <div class="col-lg-6 wow fadeIn" data-wow-delay=".3s">
                            <div class="p-5 h-100 rounded contact-map">
                                <iframe class="rounded w-100 h-100" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3721.043414570878!2d78.27603397525994!3d21.150670480529396!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bd4142122409909%3A0x36a626cf8fd26a02!2sGovernment%20Polytechnic%20%2C%20Arvi!5e0!3m2!1sen!2sin!4v1705605311772!5m2!1sen!2sin" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>
                        </div>
                        <div class="col-lg-6 wow fadeIn" data-wow-delay=".5s">
                            <div class="p-5 rounded contact-form">
                                <form action="includes/WebService.jsp" method="post">
                                    <input type="hidden" name="action" value="addcontact"/>
                                    <p style="color:#fff">Fill below form fields for contact.</p>
                                    <div class="mb-4">
                                        <input type="text" class="form-control border-0 py-3" name="name" required placeholder="Your Name">
                                    </div>
                                    <div class="mb-4">
                                        <input type="email" class="form-control border-0 py-3" name="email" required placeholder="Your Email">
                                    </div>
                                    <div class="mb-4">
                                        <textarea class="w-100 form-control border-0 py-3" rows="6" name="message" required cols="10" placeholder="Message"></textarea>
                                    </div>
                                    <div class="text-start">
                                        <button class="btn bg-primary text-white py-3 px-5" type="submit">Send Message</button>
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