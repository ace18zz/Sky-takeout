package com.sky.mapper;

import com.github.pagehelper.Page;
import com.sky.annotation.AutoFill;
import com.sky.dto.EmployeePageQueryDTO;
import com.sky.entity.Employee;
import com.sky.enumeration.OperationType;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface EmployeeMapper {

    /**
     * 根据用户名查询员工
     */
    @Select("select * from employee where username = #{username}")
    Employee getByUsername(String username);

    /**
     * 新增员工
     */
    @Insert("insert into employee (name, username, password, phone, sex, id_number,update_user,create_user,status, create_time, update_time)"
            + "values" +
            "(#{name}, #{username}, #{password}, #{phone}, #{sex}, #{idNumber},#{updateUser},#{createUser},#{status}, #{createTime}, #{updateTime})")
    @AutoFill(value = OperationType.INSERT)
    void addEmployee(Employee employee);

    /**
     * 列表分页
     */
    Page<Employee> pageQuery(EmployeePageQueryDTO employeePageQueryDTO);

    @AutoFill(value = OperationType.UPDATE)
    void disableEmployee(Employee employee);

    @Select("select * from employee where id = #{id}")
    Employee getEmployeeOne(long id);

}
