package com.jjm.jjmoa.model;

public class PublishDTO {
    private long publish_idx;
    private int jobcategory_idx;
    private String publish_name;
    private String content;
    private String career;
    private String education;
    private String salary;
    private String location;
    private String language_skill;
    private String employment_type;
    private String working_hours;
    private String start_date;
    private String end_date;
    private String url;
    private String regdate;
    private String publish_source;
    
    // 테이블 이외
    private String jobcategory_name;
    private int scrap_count;
    private boolean isScrap;
    
    public long getPublish_idx() {
		return publish_idx;
	}

	public void setPublish_idx(long publish_idx) {
		this.publish_idx = publish_idx;
	}

	public boolean getIsScrap() {
		return isScrap;
	}
    
	public void setIsScrap(boolean isScrap) {
		this.isScrap = isScrap;
	}

    public String getPublish_source() {
		return publish_source;
	}

	public void setPublish_source(String publish_source) {
		this.publish_source = publish_source;
	}

    public long getJobcategory_idx() {
        return jobcategory_idx;
    }

    public void setJobcategory_idx(int jobcategory_idx) {
        this.jobcategory_idx = jobcategory_idx;
    }

    public String getPublish_name() {
        return publish_name;
    }

    public void setPublish_name(String publish_name) {
        this.publish_name = publish_name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCareer() {
        return career;
    }

    public void setCareer(String career) {
        this.career = career;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getLanguage_skill() {
        return language_skill;
    }

    public void setLanguage_skill(String language_skill) {
        this.language_skill = language_skill;
    }

    public String getEmployment_type() {
        return employment_type;
    }

    public void setEmployment_type(String employment_type) {
        this.employment_type = employment_type;
    }

    public String getWorking_hours() {
        return working_hours;
    }

    public void setWorking_hours(String working_hours) {
        this.working_hours = working_hours;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }
    
    public String getJobcategory_name() {
        return jobcategory_name;
    }

    public void setJobcategory_name(String jobcategory_name) {
        this.jobcategory_name = jobcategory_name;
    }

	public int getScrap_count() {
		return scrap_count;
	}

	public void setScrap_count(int scrap_count) {
		this.scrap_count = scrap_count;
	}
    
}
