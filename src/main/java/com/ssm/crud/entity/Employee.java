package com.ssm.crud.entity;

/**
 * Created by Mr Xu on 2017/6/23.
 */
public class Employee {
    private int empID;
    private String empName;
    private char gender;
    private String email;
    private int dID;
    private Department department;

    public int getEmpID() {
        return empID;
    }

    public void setEmpID(int empID) {
        this.empID = empID;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public char getGender() {
        return gender;
    }

    public void setGender(char gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getdID() {
        return dID;
    }

    public void setdID(int dID) {
        this.dID = dID;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }



    public Employee() {
    }

    public Employee(int empID, String empName, char gender, String email, int dID) {
        this.empID = empID;
        this.empName = empName;
        this.gender = gender;
        this.email = email;
        this.dID = dID;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "empID=" + empID +
                ", empName='" + empName + '\'' +
                ", gender=" + gender +
                ", email='" + email + '\'' +
                ", dID=" + dID +
                ", department=" + department +
                '}';
    }
}
