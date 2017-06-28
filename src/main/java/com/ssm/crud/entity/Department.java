package com.ssm.crud.entity;

/**
 * Created by Mr Xu on 2017/6/23.
 */
public class Department {
    private int deptID;
    private String deptName;
    private Employee employee;

    public int getDeptID() {
        return deptID;
    }

    public void setDeptID(int deptID) {
        this.deptID = deptID;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Department() {
    }

    public Department(int deptID, String deptName) {
        this.deptID = deptID;
        this.deptName = deptName;
    }

    @Override
    public String toString() {
        return "Department{" +
                "deptID=" + deptID +
                ", deptName='" + deptName + '\'' +
                '}';
    }
}
