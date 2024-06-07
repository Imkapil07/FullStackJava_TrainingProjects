package in.kp.salary.calculate;

import org.springframework.stereotype.Component;

@Component
public class HourlySalaryCalculator implements SalaryCalculator {

    @Override
    public double calculateSalary(double hoursWorked) {
        return hoursWorked * 20; 
    }
}
