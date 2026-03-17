package runners;

import com.intuit.karate.junit5.Karate;

public class OrderFlowRunner {
    @Karate.Test
    Karate runValid() {
        return Karate.run("classpath:features/Workflow/order-workflow.feature").relativeTo(getClass());
    }


}
