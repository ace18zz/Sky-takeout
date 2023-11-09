package com.sky.service;

import com.sky.dto.EmployeeDTO;
import com.sky.dto.EmployeeLoginDTO;
import com.sky.dto.EmployeePageQueryDTO;
import com.sky.entity.Employee;
import com.sky.result.PageResult;

public interface EmployeeService {

    /**
     * 员工登录
     *
     * @param employeeLoginDTO
     * @return
     */
    Employee login(EmployeeLoginDTO employeeLoginDTO);

    void addEmployee(EmployeeDTO employeeDTO);

    PageResult pageQuery(EmployeePageQueryDTO EmployeePageQueryDTO);

    /**
     * 启用or禁用员工
     *
     * @param id
     * @param status
     */
    void disableEmployee(long id, Integer status);

    Employee getEmployeeOne(long id);

    void updateEmployee(EmployeeDTO employeeDTO);
}
