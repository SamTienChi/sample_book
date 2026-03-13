package runners;
import com.intuit.karate.junit5.Karate;

public class ListBookRunner {
    @Karate.Test
    Karate runValid(){
        return Karate.run("classpath:features/ListBook/listBook-valid.feature")
                .relativeTo(getClass());
    }

    @Karate.Test
    Karate runInvalid(){
        return Karate.run("classpath:features/ListBook/listBook-Invalid.feature")
                .relativeTo(getClass());
    }

    @Karate.Test
    Karate runAll(){
        return Karate.run("classpath:features/ListBook")
                .relativeTo(getClass());
    }

}
