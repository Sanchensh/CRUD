package com.ssm.crud.service;

import com.ssm.crud.entity.Employee;

import java.util.List;

/**
 * Created by Mr Xu on 2017/6/23.
 */
public interface EmployeeDao {
    List<Employee> findEmployee(String empID,boolean hasDept);
}
