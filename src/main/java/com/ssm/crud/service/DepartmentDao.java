package com.ssm.crud.service;

import com.ssm.crud.entity.Department;

import java.util.List;


/**
 * Created by Mr Xu on 2017/6/24.
 */
public interface DepartmentDao {
    List<Department> findDept(String deptID);
}
