package runners;

import com.intuit.karate.junit5.Karate;

public class OrderFlowRunner {
    @Karate.Test
    Karate runOrderDelete() {
        return Karate.run("classpath:features/Workflow/order-delete-workflow.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate runOrderCreate() {
        return Karate.run("classpath:features/Workflow/order-create-workflow.feature").relativeTo(getClass());
    }

}
