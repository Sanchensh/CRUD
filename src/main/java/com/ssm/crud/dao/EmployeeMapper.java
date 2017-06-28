package com.ssm.crud.dao;

import com.ssm.crud.entity.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Mr Xu on 2017/6/23.
 */
public interface EmployeeMapper {
    List<Employee> findEmployee(@Param("empID") String empID);//不带部门信息
    List<Employee> findEmpAndDept(@Param("empID") String empID);//带部门信息
    boolean insertEmployee(Employee employee);
    boolean updateEmployee(Employee employee);
    boolean deleteEmployee(@Param("empID") String empID);
}
