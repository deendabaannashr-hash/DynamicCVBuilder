<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${cvData.fullName}"/> - CV</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="page-view">

<div class="toolbar no-print">
    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/cvForm.jsp">&larr; Back to Form</a>
    <button type="button" class="btn btn-primary" onclick="window.print()">Print / Save as PDF</button>
</div>

<c:choose>
<c:when test="${empty cvData}">
    <div class="cv-paper">
        <p>No CV data found. Please <a href="${pageContext.request.contextPath}/cvForm.jsp">fill in the form</a>.</p>
    </div>
</c:when>
<c:otherwise>
<div class="cv-paper">

    <header class="cv-header">
        <h1><c:out value="${cvData.fullName}"/></h1>
        <c:if test="${not empty cvData.professionalTitle}">
            <h2><c:out value="${cvData.professionalTitle}"/></h2>
        </c:if>
        <p class="contact">
            <span><c:out value="${cvData.email}"/></span>
            <c:if test="${not empty cvData.phone}"><span><c:out value="${cvData.phone}"/></span></c:if>
            <c:if test="${not empty cvData.profileUrl}"><span><c:out value="${cvData.profileUrl}"/></span></c:if>
        </p>
    </header>

    <c:if test="${not empty cvData.profileSummary}">
        <section class="cv-section">
            <h3>Profile</h3>
            <p><c:out value="${cvData.profileSummary}"/></p>
        </section>
    </c:if>

    <section class="cv-section">
        <h3>Education</h3>
        <div class="entry">
            <div class="entry-head">
                <strong><c:out value="${cvData.degree}"/><c:if test="${not empty cvData.major}">, <c:out value="${cvData.major}"/></c:if></strong>
                <c:if test="${not empty cvData.graduationYear}"><span class="date"><c:out value="${cvData.graduationYear}"/></span></c:if>
            </div>
            <c:if test="${not empty cvData.institution}">
                <div class="sub"><c:out value="${cvData.institution}"/></div>
            </c:if>
        </div>
    </section>

    <c:if test="${not empty cvData.jobTitle or not empty cvData.company}">
        <section class="cv-section">
            <h3>Work Experience</h3>
            <div class="entry">
                <div class="entry-head">
                    <strong><c:out value="${cvData.jobTitle}"/></strong>
                    <c:if test="${not empty cvData.duration}"><span class="date"><c:out value="${cvData.duration}"/></span></c:if>
                </div>
                <c:if test="${not empty cvData.company}">
                    <div class="sub"><c:out value="${cvData.company}"/></div>
                </c:if>
                <ul>
                    <c:forEach var="item" items="${cvData.responsibilityList}">
                        <li><c:out value="${item}"/></li>
                    </c:forEach>
                </ul>
            </div>
        </section>
    </c:if>

    <section class="cv-section">
        <h3>Skills</h3>
        <c:if test="${not empty cvData.technicalSkillList}">
            <div class="skill-row">
                <span class="skill-label">Technical</span>
                <c:forEach var="s" items="${cvData.technicalSkillList}">
                    <span class="chip"><c:out value="${s}"/></span>
                </c:forEach>
            </div>
        </c:if>
        <c:if test="${not empty cvData.softSkillList}">
            <div class="skill-row">
                <span class="skill-label">Soft</span>
                <c:forEach var="s" items="${cvData.softSkillList}">
                    <span class="chip"><c:out value="${s}"/></span>
                </c:forEach>
            </div>
        </c:if>
    </section>

</div>
</c:otherwise>
</c:choose>

</body>
</html>