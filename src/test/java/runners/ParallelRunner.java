package runners;
import com.intuit.karate.junit5.Karate;
import static org.junit.jupiter.api.Assertions.*;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

public class ParallelRunner {
    @Test
    void runParallel() {
        Results results = Runner.path("classpath:features")
                .tags("~@ignore")
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
