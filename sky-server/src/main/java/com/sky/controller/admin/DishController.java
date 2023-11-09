package com.sky.controller.admin;


import com.sky.dto.DishDTO;
import com.sky.dto.DishPageQueryDTO;
import com.sky.result.PageResult;
import com.sky.result.Result;
import com.sky.service.DishService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/admin/dish")
@Api(tags = "菜品相关接口")
@Slf4j
public class DishController {

    @Autowired
    private DishService dishService;

    @PostMapping("/save")
    @ApiOperation("新增菜品")
    public Result save(@RequestBody DishDTO dishDTO) {
        log.info("新增菜品：{}", dishDTO);
        dishService.saveWithFlavor(dishDTO);
        return Result.success("新增菜品成功");
    }

    @GetMapping("/list")
    @ApiOperation("菜品列表")
    public Result<PageResult> list(DishPageQueryDTO dishPageQueryDTO) {
        PageResult dishList = dishService.list(dishPageQueryDTO);
        return Result.success(dishList);
    }

    /**
     * 批量删除菜品
     */
    @DeleteMapping("/batchDelete")
    @ApiOperation("批量删除菜品")
    public Result batchDelete(@RequestBody Long[] ids) {
        log.info("批量删除菜品：{}", ids);
        dishService.batchDelete(ids);
        return Result.success("批量删除菜品成功");
    }

}
