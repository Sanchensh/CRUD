import com.ssm.crud.dao.DepartmenMapper;
import com.ssm.crud.dao.EmployeeMapper;
import com.ssm.crud.entity.Department;
import com.ssm.crud.entity.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * Created by Mr Xu on 2017/6/24.
 * spring的单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-config.xml"})
public class Junit {

    @Autowired
    DepartmenMapper departmenMapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    public void t(){
//        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//        for (int i = 0 ;i<100;i++){
//            String uid = UUID.randomUUID().toString().substring(0,3) + i ;
//            mapper.insertEmployee(new Employee(0,uid,'女',uid+"@163.com",2));
//        }
    }
}
