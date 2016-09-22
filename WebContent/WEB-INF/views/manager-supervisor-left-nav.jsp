<%@page import="com.itextpdf.text.log.SysoCounter"%>
<%@ page import="com.lisi.annaulAssessment.controller.LoginController" %>
 <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
 
       
        <p></p><p></p><p></p><p></p><p></p><p></p>      
       
       
       <!-- BEGIN SIDEBAR -->
            <div class="page-sidebar-wrapper">
                
                <div class="page-sidebar navbar-collapse collapse">
                  
                    <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
                        <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
                        <li class="sidebar-toggler-wrapper hide">
                            <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                            <div class="sidebar-toggler"> </div>
                            <!-- END SIDEBAR TOGGLER BUTTON -->
                        </li>
                         <li class="active"><a href="#"><strong>Dashboard for Managers</strong></a></li>
                        <%--  <li><a href="/AnnaulAssessmenT/exemptEmployee.do?clockNum=<%=LoginController.getLoginClockNumber()%>" class="waves-effect l-20"><span class="menu-arrow"></span>  <span>Exempt Employees</span></a></li>
                         <li><a href="/AnnaulAssessmenT/team-members-information.do?clockNum=<%=LoginController.getLoginClockNumber()%>"
                          class="waves-effect l-20"><span class="menu-arrow"></span>  <span>Non-Exempt Employees</span></a></li> --%>
					
					<%
					
					String employeeform=(String)session.getAttribute("employeeForm");
					
                        		 System.out.println("enable or disable");
                        		 System.out.println(employeeform);
                        		 System.out.println(String.valueOf(employeeform));
                        		 System.out.println("testa");
                        		 if(String.valueOf(employeeform).equalsIgnoreCase("null") ||
                        				 String.valueOf(employeeform.trim()).isEmpty()){
                        			 System.out.println("if");
                        			 
                        			 %>
                        			 <%
                        			 
                        		 }else{
                        			 System.out.println("else");
                        		 
					%>

						<li class="active"><a href="/AnnaulAssessmenT/employeeForm.do">Employee Form</a></li>
						<%
                        		 }
						%>

<!-- <li class="active"><a href="salary-review.html">Salary Review</a></li>    -->                   
                    </ul>
                    <!-- END SIDEBAR MENU -->
                    <!-- END SIDEBAR MENU -->
                </div>
                <!-- END SIDEBAR -->
            </div>
            <!-- END SIDEBAR -->
            
            
