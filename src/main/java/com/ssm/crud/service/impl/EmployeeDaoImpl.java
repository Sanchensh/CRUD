package com.ssm.crud.service.impl;

import com.ssm.crud.dao.EmployeeMapper;
import com.ssm.crud.entity.Employee;
import com.ssm.crud.service.EmployeeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Mr Xu on 2017/6/23.
 */
@Service
public class EmployeeDaoImpl implements EmployeeDao {

    @Autowired
    EmployeeMapper employeeMapper;

    public List<Employee> findEmployee(String empID, boolean hasDept) {
        if (empID.trim().length() == 0 && hasDept)
            return employeeMapper.findEmpAndDept(empID);
        else if (empID.trim().length() == 0 && !hasDept)
            return employeeMapper.findEmployee(empID);
        else if (empID.trim().length() != 0 && hasDept)
            return employeeMapper.findEmpAndDept(empID);
        else
            return employeeMapper.findEmployee(empID);
    }
}
