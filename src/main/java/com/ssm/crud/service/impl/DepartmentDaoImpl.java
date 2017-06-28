package com.ssm.crud.service.impl;

import com.ssm.crud.dao.DepartmenMapper;
import com.ssm.crud.entity.Department;
import com.ssm.crud.service.DepartmentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.awt.*;
import java.util.*;
import java.util.List;

/**
 * Created by Mr Xu on 2017/6/24.
 */
@Service
public class DepartmentDaoImpl implements DepartmentDao {

    @Autowired
    DepartmenMapper departmenMapper;

    public List<Department> findDept(String deptID) {
        return null;
    }
}
