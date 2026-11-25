<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dynamic Online CV Builder</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="page-form">
<div class="container">

    <header class="app-header">
        <h1>Dynamic Online CV Builder</h1>
        <p>Fill in your details to generate a professional CV, or preview a ready-made sample.</p>
        <!-- GET flow -->
        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/CVServlet?action=sample">Preview Sample CV</a>
    </header>

    <!-- POST flow -->
    <form action="${pageContext.request.contextPath}/CVServlet" method="post" class="cv-form" novalidate>
        <fieldset>
            <legend>Personal Information</legend>
            <div class="grid">
                <label>Full Name <span class="req">*</span>
                    <input type="text" name="fullName" required>
                </label>
                <label>Professional Title
                    <input type="text" name="professionalTitle">
                </label>
                <label>Email <span class="req">*</span>
                    <input type="email" name="email" required>
                </label>
                <label>Phone Number
                    <input type="text" name="phone">
                </label>
                <label class="full">LinkedIn / GitHub URL
                    <input type="url" name="profileUrl" placeholder="https://...">
                </label>
                <label class="full">Profile Summary
                    <textarea name="profileSummary" rows="4"></textarea>
                </label>
            </div>
        </fieldset>

        <fieldset>
            <legend>Education</legend>
            <div class="grid">
                <label>Highest Degree <span class="req">*</span>
                    <select name="degree" required>
                        <option value="">-- Select --</option>
                        <option value="Diploma">Diploma</option>
                        <option value="Bachelor's Degree">Bachelor's Degree</option>
                        <option value="Master's Degree">Master's Degree</option>
                        <option value="Doctorate (PhD)">Doctorate (PhD)</option>
                    </select>
                </label>
                <label>Major / Field
                    <input type="text" name="major">
                </label>
                <label>Institution Name
                    <input type="text" name="institution">
                </label>
                <label>Year of Graduation
                    <input type="number" name="graduationYear" min="1950" max="2100">
                </label>
            </div>
        </fieldset>

        <fieldset>
            <legend>Work Experience (Most Recent)</legend>
            <div class="grid">
                <label>Job Title
                    <input type="text" name="jobTitle">
                </label>
                <label>Company Name
                    <input type="text" name="company">
                </label>
                <label class="full">Duration
                    <input type="text" name="duration" placeholder="e.g. Mar 2025 - Aug 2025">
                </label>
                <label class="full">Key Responsibilities / Achievements <small>(one per line)</small>
                    <textarea name="responsibilities" rows="5"></textarea>
                </label>
            </div>
        </fieldset>

        <fieldset>
            <legend>Skills <small>(at least one required)</small></legend>
            <div class="grid">
                <label class="full">Technical Skills <small>(comma-separated)</small>
                    <input type="text" name="technicalSkills" placeholder="Java, Servlet, JSP, MySQL">
                </label>
                <label class="full">Soft Skills <small>(comma-separated)</small>
                    <input type="text" name="softSkills" placeholder="Teamwork, Communication">
                </label>
            </div>
        </fieldset>

        <div class="actions">
            <button type="submit" class="btn btn-primary">Generate CV</button>
            <button type="reset" class="btn btn-secondary">Reset</button>
        </div>
        <p class="note"><span class="req">*</span> Required fields</p>
    </form>
</div>
</body>
</html>