package in.kp.salary.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import in.kp.salary.calculate.SalaryCalculator;

@Component
public class Employee {

    private final SalaryCalculator salaryCalculator;

    @Autowired
    public Employee(@Qualifier("hourlySalaryCalculator") SalaryCalculator salaryCalculator) {
        this.salaryCalculator = salaryCalculator;
    }

    public double getSalary(double amount) {
        return salaryCalculator.calculateSalary(amount);
    }
}