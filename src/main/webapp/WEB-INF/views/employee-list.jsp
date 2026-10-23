
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Management</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f4f7;
            padding: 30px;
        }

        .container {
            max-width: 900px;
            margin: auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
        }

        h2 {
            text-align: center;
        }

        .add-btn {
            display: inline-block;
            padding: 10px 15px;
            background: #087f5b;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background: #e9ecef;
        }

        .edit-btn {
            background: #1971c2;
            color: white;
            padding: 7px 10px;
            text-decoration: none;
            border-radius: 4px;
        }

        .delete-btn {
            background: #e03131;
            color: white;
            padding: 7px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .message {
            color: #087f5b;
            margin-bottom: 15px;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>Employee Management System</h2>

    <c:if test="${not empty message}">
        <p class="message">${message}</p>
    </c:if>

    <a class="add-btn"
       href="${pageContext.request.contextPath}/add">
        + Add Employee
    </a>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Salary</th>
                <th>Actions</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="emp" items="${employees}">
                <tr>
                    <td><c:out value="${emp.id}"/></td>
                    <td><c:out value="${emp.name}"/></td>
                    <td><c:out value="${emp.email}"/></td>
                    <td><c:out value="${emp.salary}"/></td>

                    <td>
                        <a class="edit-btn"
                           href="${pageContext.request.contextPath}/edit/${emp.id}">
                            Edit
                        </a>

                        <form action="${pageContext.request.contextPath}/delete"
                              method="post"
                              style="display:inline;"
                              onsubmit="return confirm('Delete this employee?');">

                            <input type="hidden" name="id"
                                   value="${emp.id}">

                            <button type="submit" class="delete-btn">
                                Delete
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty employees}">
                <tr>
                    <td colspan="5" style="text-align:center;">
                        No employees found. Please add an employee.
                    </td>
                </tr>
            </c:if>
        </tbody>
    </table>

</div>

</body>
</html>
