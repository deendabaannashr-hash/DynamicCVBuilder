package com.cvbuilder.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class CVBean implements Serializable {

    private static final long serialVersionUID = 1L;

    private String fullName;
    private String professionalTitle;
    private String email;
    private String phone;
    private String profileUrl;
    private String profileSummary;

    private String degree;
    private String institution;
    private String graduationYear;
    private String major;

    private String jobTitle;
    private String company;
    private String duration;
    private String responsibilities;

    private String technicalSkills;
    private String softSkills;

    private List<String> errors = new ArrayList<String>();

    public CVBean() {
        fullName = ""; professionalTitle = ""; email = ""; phone = "";
        profileUrl = ""; profileSummary = ""; degree = ""; institution = "";
        graduationYear = ""; major = ""; jobTitle = ""; company = "";
        duration = ""; responsibilities = ""; technicalSkills = ""; softSkills = "";
    }

    public boolean validate() {
        errors.clear();

        if (isBlank(fullName)) {
            errors.add("Full Name is required.");
        }
        if (isBlank(email)) {
            errors.add("Email is required.");
        } else if (!email.matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")) {
            errors.add("Email format is invalid (example: name@example.com).");
        }
        if (isBlank(degree)) {
            errors.add("Highest Degree is required.");
        }
        if (getTechnicalSkillList().isEmpty() && getSoftSkillList().isEmpty()) {
            errors.add("Please enter at least one skill (technical or soft).");
        }
        // Optional fields: only checked when filled in
        if (!isBlank(phone) && !phone.matches("^[+]?[0-9\\s\\-()]{7,20}$")) {
            errors.add("Phone Number format is invalid.");
        }
        if (!isBlank(graduationYear) && !graduationYear.matches("^(19|20)\\d{2}$")) {
            errors.add("Year of Graduation must be a 4-digit year (e.g. 2026).");
        }
        if (!isBlank(profileUrl) && !profileUrl.matches("^(https?://).+")) {
            errors.add("LinkedIn/GitHub URL must start with http:// or https://");
        }
        return errors.isEmpty();
    }

    private boolean isBlank(String s) {
        return s == null || s.trim().isEmpty();
    }

    private List<String> splitBy(String text, String regex) {
        List<String> result = new ArrayList<String>();
        if (text != null) {
            for (String part : text.split(regex)) {
                if (!part.trim().isEmpty()) {
                    result.add(part.trim());
                }
            }
        }
        return result;
    }

    private String clean(String s) {
        return s == null ? "" : s.trim();
    }

    public List<String> getTechnicalSkillList() { return splitBy(technicalSkills, ","); }
    public List<String> getSoftSkillList()      { return splitBy(softSkills, ","); }
    public List<String> getResponsibilityList() { return splitBy(responsibilities, "\\r?\\n"); }
    public List<String> getErrors()             { return errors; }

    public String getFullName() { return fullName; }
    public void setFullName(String v) { this.fullName = clean(v); }

    public String getProfessionalTitle() { return professionalTitle; }
    public void setProfessionalTitle(String v) { this.professionalTitle = clean(v); }

    public String getEmail() { return email; }
    public void setEmail(String v) { this.email = clean(v); }

    public String getPhone() { return phone; }
    public void setPhone(String v) { this.phone = clean(v); }

    public String getProfileUrl() { return profileUrl; }
    public void setProfileUrl(String v) { this.profileUrl = clean(v); }

    public String getProfileSummary() { return profileSummary; }
    public void setProfileSummary(String v) { this.profileSummary = clean(v); }

    public String getDegree() { return degree; }
    public void setDegree(String v) { this.degree = clean(v); }

    public String getInstitution() { return institution; }
    public void setInstitution(String v) { this.institution = clean(v); }

    public String getGraduationYear() { return graduationYear; }
    public void setGraduationYear(String v) { this.graduationYear = clean(v); }

    public String getMajor() { return major; }
    public void setMajor(String v) { this.major = clean(v); }

    public String getJobTitle() { return jobTitle; }
    public void setJobTitle(String v) { this.jobTitle = clean(v); }

    public String getCompany() { return company; }
    public void setCompany(String v) { this.company = clean(v); }

    public String getDuration() { return duration; }
    public void setDuration(String v) { this.duration = clean(v); }

    public String getResponsibilities() { return responsibilities; }
    public void setResponsibilities(String v) { this.responsibilities = clean(v); }

    public String getTechnicalSkills() { return technicalSkills; }
    public void setTechnicalSkills(String v) { this.technicalSkills = clean(v); }

    public String getSoftSkills() { return softSkills; }
    public void setSoftSkills(String v) { this.softSkills = clean(v); }
}