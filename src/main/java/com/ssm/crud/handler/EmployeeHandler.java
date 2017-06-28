package com.ssm.crud.handler;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.crud.entity.Employee;
import com.ssm.crud.entity.Msg;
import com.ssm.crud.service.EmployeeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 处理员工crud请求
 * Created by Mr Xu on 2017/6/23.
 */
@Controller
public class EmployeeHandler {

    @Autowired
    EmployeeDao employeeDao;

    /**
     * 查询员工数据
     * Model包含了分页的所有数据
     *不使用json
     * @return
     */
    @RequestMapping("/")
    public String getEmps(@RequestParam(value = "start", defaultValue = "1") Integer start,
                          Model model) {
        //查询所有数据，不是分页查询
        //引入pageHelper插件，实现分页
        //在查询之前调用,传入页码，以及每个页面的大小
        PageHelper.startPage(start, 5);
        //startPage后面紧跟的查询就是分页查询
        List<Employee> list = employeeDao.findEmployee("", true);
        //使用PageInfo包装查询后的结果，比如上一页，下一页，首页，尾页，只需要将pageInfo交给页面即可
        //  封装了详细的分页信息，包括有我们查询出来的数据,连续传入几页
        PageInfo pageInfo = new PageInfo(list, 5);
        //包含了页面分页的详细信息
        model.addAttribute("pageInfo", pageInfo);
        return "listNoJson";
    }

    @RequestMapping("/emps")
    @ResponseBody
    public Msg json(@RequestParam(value = "start", defaultValue = "1") Integer start){
        PageHelper.startPage(start, 5);
        List<Employee> list = employeeDao.findEmployee("", true);
        PageInfo pageInfo = new PageInfo(list, 5);
        return Msg.success().add("pageInfo",pageInfo);
    }
}
