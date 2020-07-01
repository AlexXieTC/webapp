/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.56
 * Generated at: 2020-07-01 06:55:25 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.stock;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import database.DBAccess;

public final class signup_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("database.DBAccess");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPではGET、POST、またはHEADのみが許可されます。 JasperはOPTIONSも許可しています。");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=Shift_JIS");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("    <!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <title>ログインページ</title>\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"./css/form.css\">\r\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    <div id=\"back\">\r\n");
      out.write("        <canvas id=\"canvas\" class=\"canvas-back\"></canvas>\r\n");
      out.write("        <div class=\"backRight\">\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"backLeft\">\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("\r\n");
      out.write("      <div id=\"slideBox\">\r\n");
      out.write("        <div class=\"topLayer\">\r\n");
      out.write("          <div class=\"left\">\r\n");
      out.write("            <div class=\"content\">\r\n");
      out.write("              <h2>Sign Up</h2>\r\n");
      out.write("              <form id=\"form-signup\" method=\"post\" >\r\n");
      out.write("                <div class=\"form-element form-stack\">\r\n");
      out.write("                  <label for=\"email\" class=\"form-label\">Email</label>\r\n");
      out.write("                  <input id=\"email\" type=\"email\" name=\"email\">\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"form-element form-stack\">\r\n");
      out.write("                  <label for=\"username-signup\" class=\"form-label\">Username</label>\r\n");
      out.write("                  <input id=\"username-signup\" type=\"text\" name=\"username\">\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"form-element form-stack\">\r\n");
      out.write("                  <label for=\"password-signup\" class=\"form-label\">Password</label>\r\n");
      out.write("                  <input id=\"password-signup\" type=\"password\" name=\"password\">\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"form-element form-checkbox\">\r\n");
      out.write("                  <input id=\"confirm-terms\" type=\"checkbox\" name=\"confirm\" value=\"yes\" class=\"checkbox\">\r\n");
      out.write("                  <label for=\"confirm-terms\">I agree to the <a href=\"#\">Terms of Service</a> and <a href=\"#\">Privacy Policy</a></label>\r\n");
      out.write("                </div>\r\n");
      out.write("                <!-- <div class=\"form-element form-submit\">\r\n");
      out.write("                  <button id=\"signUp\" class=\"signup\" type=\"submit\" name=\"signup\">Sign up</button>\r\n");
      out.write("                  <button id=\"goLeft\" class=\"signup off\">Log In</button>\r\n");
      out.write("                </div> -->\r\n");
      out.write("              </form>\r\n");
      out.write("            </div>\r\n");
      out.write("          </div>\r\n");
      out.write("\r\n");
      out.write("          ");
      out.write("\r\n");
      out.write("          <div class=\"right\">\r\n");
      out.write("            <div class=\"content\">\r\n");
      out.write("              <h2>Sign Up</h2>\r\n");
      out.write("              <form action=\"");
      out.print(request.getContextPath());
      out.write("/signup\" method=\"Post\">\r\n");
      out.write("              <form id=\"form-login\" method=\"post\" onsubmit=\"return false;\">\r\n");
      out.write("\r\n");
      out.write("                <div class=\"form-element form-stack\">\r\n");
      out.write("                  <label for=\"username-login\" class=\"form-label\">Username</label>\r\n");
      out.write("                  <input id=\"username-login\" type=\"text\" name=\"username\" maxlength='20' pattern=\"^[0-9A-Za-z]+$\">\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"form-element form-stack\">\r\n");
      out.write("                  <label for=\"password-login\" class=\"form-label\">Password</label>\r\n");
      out.write("                  <input id=\"password-login\" type=\"password\" name=\"password\" maxlength='20'>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"form-element form-submit\">\r\n");
      out.write("                  <button id=\"logIn\" class=\"login\" type=\"submit\" name=\"login\">Sign Up</button>\r\n");
      out.write("                  <!-- <button id=\"goRight\" class=\"login off\" name=\"signup\">Sign Up</button> -->\r\n");
      out.write("                </div>\r\n");
      out.write("              </form>\r\n");
      out.write("              </form>\r\n");
      out.write("            </div>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("\r\n");
      out.write("      <!--\r\n");
      out.write("\r\n");
      out.write("      Remixed from \"Sliding Login Form\" Codepen by\r\n");
      out.write("      C-Rodg (github.com/C-Rodg)\r\n");
      out.write("      https://codepen.io/crodg/pen/yNKxej\r\n");
      out.write("\r\n");
      out.write("      Remixed from \"Paper.js - Animated Shapes Header\" Codepen by\r\n");
      out.write("      Connor Hubeny (@cooper_hu)\r\n");
      out.write("      https://codepen.io/cooper_hu/pen/ybxoev\r\n");
      out.write("\r\n");
      out.write("      Custom Checkbox based on the blog post by\r\n");
      out.write("      Mik Ted (@inserthtml):\r\n");
      out.write("      https://www.inserthtml.com/2012/06/custom-form-radio-checkbox/\r\n");
      out.write("\r\n");
      out.write("      HTML5 Form Validation based on the blog post by\r\n");
      out.write("      Thoriq Firdaus (@tfirdaus):\r\n");
      out.write("      https://webdesign.tutsplus.com/tutorials/\r\n");
      out.write("      html5-form-validation-with-the-pattern-attribute--cms-25145\r\n");
      out.write("\r\n");
      out.write("      -->\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}