package in.kp.salary.service;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

@Service
@Scope("prototype")
public class SalaryService {

    public String getServiceId() {
        return this.toString();
    }
}