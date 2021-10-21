package model.bean.employee;

public class EmployeeEducation {
    private int educationId;
    private String educationName;

    public EmployeeEducation(int educationId, String educationName) {
        this.educationId = educationId;
        this.educationName = educationName;
    }

    public EmployeeEducation( ) {

    }

    public int getEducationId() {
        return educationId;
    }

    public void setEducationId(int educationId) {
        this.educationId = educationId;
    }

    public String getEducationName() {
        return educationName;
    }

    public void setEducationName(String educationName) {
        this.educationName = educationName;
    }
}
