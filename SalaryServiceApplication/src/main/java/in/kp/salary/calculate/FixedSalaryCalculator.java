package in.kp.salary.calculate;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

@Primary
@Component
public class FixedSalaryCalculator implements SalaryCalculator {

    @Override
    public double calculateSalary(double fixedAmount) {
        return fixedAmount;
    }
}
