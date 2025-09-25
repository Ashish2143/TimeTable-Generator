<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<%
    String uri = request.getRequestURI();
    String pageName = uri.substring(uri.lastIndexOf("/") + 1);
    String adminlogin1 = String.valueOf(session.getAttribute("adminlogin"));
    String facultylogin1 = String.valueOf(session.getAttribute("facultylogin"));
    String studentlogin1 = String.valueOf(session.getAttribute("studentlogin"));
    
%>
<!-- Spinner Start -->
        <div id="spinner" class="show position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->

        <!-- Topbar Start -->
        <div class="container-fluid bg-dark py-2 d-none d-md-flex">
            <div class="container">
                <div class="d-flex justify-content-between topbar">
                    <div class="top-info">
                        <small class="me-3 text-white-50"><a href="#"><i class="fas fa-map-marker-alt me-2 text-secondary"></i></a>Government Polytechnic,Deurwada road,Arvi</small>
                        <small class="me-3 text-white-50"><a href="#"><i class="fas fa-envelope me-2 text-secondary"></i></a>office.gparvi@dtemaharashtra.gov.in</small>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->

        <!-- Navbar Start -->
        <div class="container-fluid bg-primary">
            <div class="container">
                <nav class="navbar navbar-dark navbar-expand-lg py-0">
                    <a href="#" class="navbar-brand">
                        <h1 class="text-white fw-bold d-block">Time<span class="text-secondary">Table</span> </h1>
                    </a>
                    <button type="button" class="navbar-toggler me-0" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-transparent" id="navbarCollapse">
                        <%
                        if(adminlogin1 != "null"){
                        %>
                        <div class="navbar-nav ms-auto mx-xl-auto p-0">
                            <a href="timetables.jsp" class="nav-item nav-link active text-secondary">Timetables</a>
                            <a href="subjects.jsp" class="nav-item nav-link">Subjects</a>
                            <a href="students.jsp" class="nav-item nav-link">Students</a>
                            <a href="notifications.jsp" class="nav-item nav-link">Notifications</a>
                            <a href="faculties.jsp" class="nav-item nav-link">Faculties</a>
                            <a href="holidays.jsp" class="nav-item nav-link">Holidays</a>
                            <a href="contacts.jsp" class="nav-item nav-link">Contacts</a>
                            <a href="profile.jsp" class="nav-item nav-link">My Profile</a>
                            <a href="logout.jsp" class="nav-item nav-link">Logout</a>
                        </div>
                        <%
                            }else if(facultylogin1 != "null"){
                        %>
                        <div class="navbar-nav ms-auto mx-xl-auto p-0">
                            <a href="faculty-message.jsp" class="nav-item nav-link active text-secondary">Message</a>
                            <a href="faculty-timetable.jsp" class="nav-item nav-link">Timetable</a>
                            <a href="faculty-holidays.jsp" class="nav-item nav-link">Holidays</a>
                            <a href="faculty-profile.jsp" class="nav-item nav-link">My Profile</a>
                            <a href="logout.jsp" class="nav-item nav-link">Logout</a>
                        </div>
                        <%
                            }else if(studentlogin1 != "null"){
                        %>
                        <div class="navbar-nav ms-auto mx-xl-auto p-0">
                            <a href="student-timetable.jsp" class="nav-item nav-link">Timetable</a>
                            <a href="student-holidays.jsp" class="nav-item nav-link">Holidays</a>
                            <a href="student-profile.jsp" class="nav-item nav-link">My Profile</a>
                            <a href="logout.jsp" class="nav-item nav-link">Logout</a>
                        </div>
                        <%
                            }else{
                        %>
                            <div class="navbar-nav ms-auto mx-xl-auto p-0">
                                <a href="index.jsp" class="nav-item nav-link active text-secondary">Home</a>
                                <a href="about.jsp" class="nav-item nav-link">About</a>
                                <a href="faq.jsp" class="nav-item nav-link">FAQ</a>
                                <a href="contact.jsp" class="nav-item nav-link">Contact</a>
                                <a href="notification.jsp" class="nav-item nav-link">Notification</a>
                                <a href="admin-login.jsp" class="nav-item nav-link">Admin Login</a>
                            </div>
                        <%
                        }
                        %>
                    </div>
                    <div class="d-none d-xl-flex flex-shirink-0">
                        <div id="phone-tada" class="d-flex align-items-center justify-content-center me-4">
                            <a href="" class="position-relative animated tada infinite">
                                <i class="fa fa-phone-alt text-white fa-2x"></i>
                                <div class="position-absolute" style="top: -7px; left: 20px;">
                                    <span><i class="fa fa-comment-dots text-secondary"></i></span>
                                </div>
                            </a>
                        </div>
                        <div class="d-flex flex-column pe-4">
                            <span class="text-white-50">Have any questions?</span>
                            <span class="text-secondary">Call: + 07157-222680</span>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->
        