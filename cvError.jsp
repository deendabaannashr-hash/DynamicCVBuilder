<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Validation Error - CV Builder</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="page-form">

<%-- ===== Pop-up: shown automatically when there are validation errors ===== --%>
<c:if test="${not empty errors}">
<div class="modal-overlay" id="errorModal" role="dialog" aria-modal="true" aria-labelledby="modalTitle">
    <div class="modal">
        <h2 id="modalTitle">Please complete the required fields</h2>
        <p>The following need to be fixed before your CV can be generated:</p>

        <ul class="modal-list">
            <c:forEach var="err" items="${errors}">
                <li><c:out value="${err}"/></li>
            </c:forEach>
        </ul>

        <div class="actions">
            <button type="button" class="btn btn-primary" onclick="history.back()">Go Back &amp; Fill In</button>
            <button type="button" class="btn btn-secondary" onclick="closeModal()">Close</button>
        </div>
    </div>
</div>
</c:if>

<%-- ===== Normal error page behind the pop-up ===== --%>
<div class="container">
    <div class="error-box">
        <h1>Oops! Something is missing</h1>
        <p><c:out value="${empty errorMessage ? 'Please check your input.' : errorMessage}"/></p>

        <ul class="error-list">
            <c:forEach var="err" items="${errors}">
                <li><c:out value="${err}"/></li>
            </c:forEach>
        </ul>

        <div class="actions">
            <a class="btn btn-secondary" href="javascript:history.back()">&larr; Go Back &amp; Edit</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/cvForm.jsp">Start a New Form</a>
        </div>
    </div>
</div>

<script>
    function closeModal() {
        var m = document.getElementById("errorModal");
        if (m) { m.classList.add("hidden"); }
    }
    // Close with the Escape key
    document.addEventListener("keydown", function (e) {
        if (e.key === "Escape") { closeModal(); }
    });
</script>

</body>
</html>