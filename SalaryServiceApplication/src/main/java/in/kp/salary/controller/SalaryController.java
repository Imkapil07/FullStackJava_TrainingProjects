package in.kp.salary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import in.kp.salary.lazy.LazyComponent;
import in.kp.salary.model.Employee;
import in.kp.salary.service.SalaryService;

@RestController
public class SalaryController {

    @Autowired
    private Employee employee;

    @Autowired
    private SalaryService salaryService;

    @Autowired
    private LazyComponent lazyComponent;

    @GetMapping("/salary/{amount}")
    public String getSalary(@PathVariable double amount) {
        return "Employee salary: " + employee.getSalary(amount);
    }

    @GetMapping("/service")
    public String getService() {
        return "SalaryService instance: " + salaryService.getServiceId();
    }

    @GetMapping("/lazy")
    public String getLazy() {
        return lazyComponent.getLazyMessage();
    }
}