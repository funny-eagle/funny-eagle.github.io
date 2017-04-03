<%--
  Created by IntelliJ IDEA.
  User: jason
  Date: 2017/4/3
  Time: 下午11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<footer id="footer">
    <div class="inner">
        <section>
            <h2>Get in touch</h2>
            <form method="post" action="#">
                <div class="field half first">
                    <input type="text" name="name" id="name" placeholder="Name" />
                </div>
                <div class="field half">
                    <input type="email" name="email" id="email" placeholder="Email" />
                </div>
                <div class="field">
                    <textarea name="message" id="message" placeholder="Message"></textarea>
                </div>
                <ul class="actions">
                    <li><input type="submit" value="Send" class="special" /></li>
                </ul>
            </form>
        </section>
        <section>
            <h2>Follow</h2>
            <ul class="icons">
                <li><a href="#" class="icon style2 fa-twitter"><span class="label">Twitter</span></a></li>
                <li><a href="#" class="icon style2 fa-facebook"><span class="label">Facebook</span></a></li>
                <li><a href="#" class="icon style2 fa-instagram"><span class="label">Instagram</span></a></li>
                <li><a href="#" class="icon style2 fa-dribbble"><span class="label">Dribbble</span></a></li>
                <li><a href="#" class="icon style2 fa-github"><span class="label">GitHub</span></a></li>
                <li><a href="#" class="icon style2 fa-500px"><span class="label">500px</span></a></li>
                <li><a href="#" class="icon style2 fa-phone"><span class="label">Phone</span></a></li>
                <li><a href="#" class="icon style2 fa-envelope-o"><span class="label">Email</span></a></li>
            </ul>
        </section>
        <ul class="copyright">
            <li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
        </ul>
    </div>
</footer>
