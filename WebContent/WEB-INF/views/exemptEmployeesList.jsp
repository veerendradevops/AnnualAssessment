
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body class="fixed-left">

        <!-- Begin page -->
        <div id="wrapper">

            <!-- Top Bar Start -->
            <div class="topbar">

                <!-- LOGO -->
                <div class="topbar-left">
                    <a href="index-2.html" class="logo"><img src="assets/images/482449.jpg"></a>                </div>


                <nav class="navbar navbar-custom">
                    

                    <ul class="nav navbar-nav pull-right">



                        <li class="nav-item dropdown notification-list">
                            <a class="nav-link dropdown-toggle arrow-none waves-effect waves-light nav-user" data-toggle="dropdown" href="#" role="button"
                               aria-haspopup="false" aria-expanded="false">
                                <img src="assets/images/users/avatar-1.jpg" alt="user" class="img-circle">                            </a>
                            <div class="dropdown-menu dropdown-menu-right dropdown-arrow profile-dropdown " aria-labelledby="Preview">
                                <!-- item-->
                                <div class="dropdown-item noti-title">
                                    <h5 class="text-overflow"><small>Welcome ! John</small> </h5>
                                </div>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="zmdi zmdi-account-circle"></i> <span>Profile</span>                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="zmdi zmdi-settings"></i> <span>Settings</span>                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="zmdi zmdi-lock-open"></i> <span>Lock Screen</span>                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="zmdi zmdi-power"></i> <span>Logout</span>                                </a>                            </div>
                        </li>
                    </ul>
                </nav>
            </div>
            <!-- Top Bar End -->




            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->
            <div class="content-page">
                <!-- Start content -->
                <div class="content">
                    <div class="container">

                        <div class="row">
							<div class="col-xs-12">
								<div class="page-title-box">
                                    <h4 class="page-title">2016 Payroll and 2017 Payroll</h4>
                                    <ol class="breadcrumb p-0">
                                        <li><a href="#">2016 Payroll and 2017 Payroll</a></li>
                                        <li class="active">Manager/Supervisor</li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
							</div>
						</div>
                        <!-- end row -->


                        <div class="row">
                        
                            <div class="col-xs-12">
                                <div class="card-box table-responsive">
                                         
                                        <h2>Manager/Supervisor</h2>        
                                 <div class="row">

                                        <div class="col-sm-6 col-xs-12 m-t-20">
                                                <div id="horizontal-bar-chart1" class="ct-chart ct-golden-section" style="max-width:400px; height:250px;"></div>
                                        </div>

                                        <div class="col-sm-6 col-xs-12 m-t-20">
                                                <div id="pie-chart-container1" class="flot-chart" style="height: 200px; max-width:400px;">
                                                
                                        </div>

                                    </div>
                                    <!-- end row -->
                                <table id="datatable" class="table table-striped table-bordered">
                                        <thead>
                                            <tr bgcolor="#eee">
    <td colspan="6">&nbsp;</td>
    <td colspan="2" align="center"><strong>Current</strong></td>
    <td>&nbsp;</td>
    <td colspan="2" align="center"><strong>2017</strong></td>
  </tr>
  <tr bgcolor="#F5F5F5">
    <th><a href="#">Emp. Name</a></th>
    <th><a href="#">Emp.</a></th>
    <th><a href="#">Emp. ID</a></th>
    <th><a href="#">Status</a></th>
    <th><a href="#">Completed Step</a></th>
    <th><a href="#">Days Since</a></th>
    <th><a href="#">Hourly Rate</a></th>
    <th><a href="#">Annual Rate</a></th>
    <th><a href="#">% Increase</a></th>
    <th><a href="#">Hourly Rate</a></th>
    <!-- <th><a href="#">Annual Rate</a></th> -->
                                            </tr>
                                        </thead>


                                        <tbody>
                                         <c:if test="${!empty empDetails}">
                                        <c:forEach var="empDetail" items="${empDetails}">
                                            <tr>
    <td><a href="#" style="margin-left:9px;"><c:out value="${ empDetail.emplastName}"></c:out></a></td>
    <td>&nbsp;</td>
    
    <td><a href="/AnnaulAssessmenT/teamMemberPersonalInfo.do?clockNum=+${empDetail.empClockNumber}"><c:out value="${empDetail.empClockNumber}"></c:out></a>  </td>
    <td>Started</td>
    <td>6/3/2016</td>
    <td>52</td>
    <td bgcolor="ffeb9c">$13.61 </td>
    <td bgcolor="ffeb9c">$28,317.90 </td>
    <td bgcolor="b8cce4">0.00%</td>
    <td bgcolor="c6efce">$13.6100 </td>
    <!-- <td bgcolor="c6efce">$28,317.90 </td> -->
  </tr>
  </c:forEach>
  </c:if>
                                            
                                        </tbody>
                                    </table>

                        		</div>
                            </div><!-- end col-->
                        </div>
                        <!-- end row -->
                    </div> <!-- container -->
                </div> <!-- content -->

            </div>
            <!-- End content-page -->


            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->


           

            <footer class="footer text-right">
                2016 © Lisi Aerospace.            </footer>


        </div>
        <!-- END wrapper -->
        
        </div>
        </body>
