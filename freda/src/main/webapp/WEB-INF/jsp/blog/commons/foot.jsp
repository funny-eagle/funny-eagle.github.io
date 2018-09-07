<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 18/2/6
  Time: 上午1:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="text-center">
            &copy; nocoder.org 2016
            <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
            document.write(
                unescape("%3Cspan id='cnzz_stat_icon_1257391581'%3E%3C/span%3E%3Cscript src='" +
                    cnzz_protocol + "s4.cnzz.com/z_stat.php%3Fid%3D1257391581%26show%3Dpic' type='text/javascript'%3E%3C/script%3E")
            );
            </script>
        </p>

    </div>
</footer>
<script src="<%=basePath%>/vendor/jquery/jquery.min.js"></script>
<script src="<%=basePath%>/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/vendor/blog/js/html5shiv.min.js"></script>
<script src="<%=basePath%>/vendor/blog/js/ie-emulation-modes-warning.js"></script>
<script src="<%=basePath%>/vendor/blog/js/ie10-viewport-bug-workaround.js"></script>
<script src="<%=basePath%>/vendor/blog/js/respond.min.js"></script>
<script src="<%=basePath%>/vendor/blog/js/date-format.js"></script>
