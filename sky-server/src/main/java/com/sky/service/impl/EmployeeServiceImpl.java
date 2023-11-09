package com.sky.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sky.constant.MessageConstant;
import com.sky.constant.StatusConstant;
import com.sky.dto.EmployeeDTO;
import com.sky.dto.EmployeeLoginDTO;
import com.sky.dto.EmployeePageQueryDTO;
import com.sky.entity.Employee;
import com.sky.exception.AccountLockedException;
import com.sky.exception.AccountNotFoundException;
import com.sky.exception.PasswordErrorException;
import com.sky.mapper.EmployeeMapper;
import com.sky.result.PageResult;
import com.sky.service.EmployeeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.List;

@Service
@Slf4j
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    /**
     * 员工登录
     *
     * @param
     */
    public Employee login(EmployeeLoginDTO employeeLoginDTO) {
        String username = employeeLoginDTO.getUsername();
        String password = employeeLoginDTO.getPassword();

        //1、根据用户名查询数据库中的数据
        Employee employee = employeeMapper.getByUsername(username);

        //2、处理各种异常情况（用户名不存在、密码不对、账号被锁定）
        if (employee == null) {
            //账号不存在
            throw new AccountNotFoundException(MessageConstant.ACCOUNT_NOT_FOUND);
        }

        //密码比对
        // 密码加密
        password = DigestUtils.md5DigestAsHex(password.getBytes());
        log.info("我是password", password);
        if (!password.equals(employee.getPassword())) {
            //密码错误
            throw new PasswordErrorException(MessageConstant.PASSWORD_ERROR);
        }

        if (employee.getStatus() == StatusConstant.DISABLE) {
            //账号被锁定
            throw new AccountLockedException(MessageConstant.ACCOUNT_LOCKED);
        }

        //3、返回实体对象
        return employee;
    }

    /**
     * 新增员工
     */
    public void addEmployee(EmployeeDTO employeeDTO) {
        // 前端提交的参数转换成实体
        Employee employee = new Employee();
        BeanUtils.copyProperties(employeeDTO, employee);
        employee.setStatus(StatusConstant.ENABLE);
        Employee employee1 = employeeMapper.getByUsername(employee.getUsername());
        if (employee1 != null) {
            throw new RuntimeException("用户名已存在");
        }
        // 密码加密
        employee.setPassword(DigestUtils.md5DigestAsHex(employee.getPassword().getBytes()));
        employeeMapper.addEmployee(employee);
    }

    /**
     * 分页查询
     */
    public PageResult pageQuery(EmployeePageQueryDTO EmployeePageQueryDTO) {
        // 开始分页查询
        PageHelper.startPage(EmployeePageQueryDTO.getPage(), EmployeePageQueryDTO.getPageSize());
        // 查询
        long total;
        List<Employee> list;
        try (Page<Employee> page = employeeMapper.pageQuery(EmployeePageQueryDTO)) {
            total = page.getTotal();
            list = page.getResult();
        }
        return new PageResult(total, list);
    }

    public void disableEmployee(long id, Integer status) {
        Employee employee = Employee.builder()
                .status(status)
                .id(id)
                .build();
        employeeMapper.disableEmployee(employee);
    }

    @Override
    public Employee getEmployeeOne(long id) {
        Employee employee = employeeMapper.getEmployeeOne(id);
        employee.setPassword("******");
        return employee;
    }

    @Override
    public void updateEmployee(EmployeeDTO employeeDTO) {
        Employee employee = new Employee();
        BeanUtils.copyProperties(employeeDTO, employee);
        employeeMapper.disableEmployee(employee);
    }

}
