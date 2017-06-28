package com.ssm.crud.dao;

import com.ssm.crud.entity.Department;
import com.ssm.crud.entity.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Mr Xu on 2017/6/24.
 */
public interface DepartmenMapper {
    List<Department> findDept(@Param("deptID")String deptID);//查询部门信息，可以根据id查询，也可以查询所有
    boolean insertDept(Department department);
    boolean updateDept(Department department);
    boolean deleteDept(@Param("deptID")String deptID);
    List<Employee> findEmpByDeptID(@Param("dID")String dID);//根据不们ID查询所有该部门的成员
}
