package runners;
import com.intuit.karate.junit5.Karate;

public class ClientRunner {
    @Karate.Test
    Karate runTest() {
        return Karate.run("classpath:features")
                .relativeTo(getClass())
                .tags("~@api");
    }
}
