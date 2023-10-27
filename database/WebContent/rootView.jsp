<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Root page</title>

<style>
.datainit{
    margin-top: 66px;
    font-weight: 700;
    color: #fff !important;
    line-height: 1.25;
    -ms-flex-pack: center;
    justify-content: center;
    padding: 0.469rem 0.75rem;
    border: none;
    background: green;
    width: 21%;
    max-width: 450px;
    height: 42px;
    cursor: pointer;
    font-size: 1.3125rem;
    margin-top: 0.5rem;
    margin-bottom: -0.5rem;
    text-transform: none;
    text-align: center;
    align-items: center;
    -ms-flex-pack: center;
    border-radius: 1.5rem;
    margin: 36px;

}

.logout{

    border-radius: 1.5rem;
    font-family: BrandonText, Arial, sans-serif;
    font-weight: 700;
    color: white !important;
    line-height: 1.25;
    -ms-flex-pack: center;
    justify-content: center;
    padding: 0.469rem 0.75rem;
    border: none;
    background: indianred;
    display: inline-block;
    width: 10%;
    max-width: 450px;
    height: 35px;
    cursor: pointer;
    font-size: 1.3125rem;
    text-transform: none;
}

</style>
</head>
<body>

<div align = "center">
	
	<form action = "initialize">
		<input class="datainit" type = "submit" value = "Initialize the Database"/>
	</form>
	<a class="logout" href="login.jsp"target ="_self" > Logout</a><br><br> 

<h1>List all users</h1>

    <div align="center">
        <table border="1" cellpadding="6">
            <caption><h2>List of Users</h2></caption>
            <tr>
                <th>User Name</th>
                <th>First name</th>
                <th>Last name</th>
                <th>Password</th>
                <th>User Role</th>
            </tr>
            <c:forEach var="users" items="${listUser}">
                <tr style="text-align:center">
                    <td><c:out value="${users.userName}" /></td>
                    <td><c:out value="${users.firstName}" /></td>
                    <td><c:out value="${users.lastName}" /></td>
                    <td><c:out value="${users.password}" /></td>
                    <td><c:out value="${users.userRole}" /></td>
            </c:forEach>
        </table>
	</div>
	</div>

</body>
</html>