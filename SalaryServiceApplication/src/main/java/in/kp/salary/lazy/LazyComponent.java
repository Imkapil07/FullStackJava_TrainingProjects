package in.kp.salary.lazy;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

@Component
@Lazy
public class LazyComponent {

    public LazyComponent() {
        System.out.println("LazyComponent initialized");
    }

    public String getLazyMessage() {
        return "Lazy Initialization Component";
    }
}
