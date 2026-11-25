package com.cvbuilder.controller;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.cvbuilder.model.CVBean;

public class CVServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("sample".equals(action)) {
            CVBean sample = new CVBean();
            sample.setFullName("Mohamad Annashr Imran Bin Nasrudin");
            sample.setProfessionalTitle("Junior Java Web Developer");
            sample.setEmail("Annashr.kert@example.com");
            sample.setPhone("+60 12-345 6789");
            sample.setProfileUrl("https://www.linkedin.com/in/annashr-imran-sample");
            sample.setProfileSummary("Motivated computer science graduate with hands-on experience "
                    + "building Java EE web applications using Servlets, JSP and MySQL. "
                    + "Passionate about clean MVC design and maintainable code.");
            sample.setDegree("Bachelor of Computer Science (Hons.)");
            sample.setInstitution("Universiti Teknologi MARA (UiTM)");
            sample.setGraduationYear("2026");
            sample.setMajor("Information System Engineering");
            sample.setJobTitle("Software Development Intern");
            sample.setCompany("TechNusa Solutions Sdn. Bhd.");
            sample.setDuration("Mar 2025 - Aug 2025");
            sample.setResponsibilities(
                    "Developed servlet-based modules for an internal HR portal.\n"
                  + "Designed MySQL tables and wrote JDBC data-access classes.\n"
                  + "Reduced page load time by 30% by optimising SQL queries.\n"
                  + "Collaborated with a team of 5 using Git and Agile practices.");
            sample.setTechnicalSkills("Java, Servlet, JSP, JSTL, MySQL, HTML5, CSS3, Git");
            sample.setSoftSkills("Teamwork, Communication, Problem Solving, Time Management");

            request.setAttribute("cvData", sample);
            RequestDispatcher rd = request.getRequestDispatcher("/cvView.jsp");
            rd.forward(request, response);

        } else {
            response.sendRedirect(request.getContextPath() + "/cvForm.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        CVBean cvBean = new CVBean();
        cvBean.setFullName(request.getParameter("fullName"));
        cvBean.setProfessionalTitle(request.getParameter("professionalTitle"));
        cvBean.setEmail(request.getParameter("email"));
        cvBean.setPhone(request.getParameter("phone"));
        cvBean.setProfileUrl(request.getParameter("profileUrl"));
        cvBean.setProfileSummary(request.getParameter("profileSummary"));
        cvBean.setDegree(request.getParameter("degree"));
        cvBean.setInstitution(request.getParameter("institution"));
        cvBean.setGraduationYear(request.getParameter("graduationYear"));
        cvBean.setMajor(request.getParameter("major"));
        cvBean.setJobTitle(request.getParameter("jobTitle"));
        cvBean.setCompany(request.getParameter("company"));
        cvBean.setDuration(request.getParameter("duration"));
        cvBean.setResponsibilities(request.getParameter("responsibilities"));
        cvBean.setTechnicalSkills(request.getParameter("technicalSkills"));
        cvBean.setSoftSkills(request.getParameter("softSkills"));

        RequestDispatcher rd;
        if (cvBean.validate()) {
            request.setAttribute("cvData", cvBean);
            rd = request.getRequestDispatcher("/cvView.jsp");
        } else {
            request.setAttribute("errorMessage",
                    "Your CV could not be generated. Please fix the following:");
            request.setAttribute("errors", cvBean.getErrors());
            rd = request.getRequestDispatcher("/cvError.jsp");
        }
        rd.forward(request, response);
    }
}