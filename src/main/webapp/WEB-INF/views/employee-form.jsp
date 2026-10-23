
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Form</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f4f7;
            margin: 0;
            padding: 40px;
        }

        .container {
            width: 400px;
            margin: auto;
            padding: 25px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px #ccc;
        }

        h2 {
            text-align: center;
        }

        label {
            display: block;
            margin-top: 15px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background: #087f5b;
            color: white;
            border: none;
            cursor: pointer;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>
        <c:choose>
            <c:when test="${employee.id != null}">
                Edit Employee
            </c:when>
            <c:otherwise>
                Add Employee
            </c:otherwise>
        </c:choose>
    </h2>

    <form action="${pageContext.request.contextPath}${employee.id != null ? '/update' : '/save'}"
          method="post">

        <input type="hidden" name="id" value="${employee.id}">

        <label>Name:</label>
        <input type="text" name="name"
               value="${employee.name}" required>

        <label>Email:</label>
        <input type="email" name="email"
               value="${employee.email}" required>

        <label>Salary:</label>
        <input type="number" name="salary"
               value="${employee.salary}"
               min="0" step="0.01" required>

        <button type="submit">
            <c:choose>
                <c:when test="${employee.id != null}">
                    Update Employee
                </c:when>
                <c:otherwise>
                    Save Employee
                </c:otherwise>
            </c:choose>
        </button>

    </form>

    <a href="${pageContext.request.contextPath}/">
        Back to Employee List
    </a>

</div>

</body>
</html>
