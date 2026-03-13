package runners;
import com.intuit.karate.junit5.Karate;

public class SingleBookRunner {
    @Karate.Test
    Karate runValid(){
        return Karate.run("classpath:features/SingleBook/singleBook-valid.feature")
                .relativeTo(getClass());
    }

    @Karate.Test
    Karate runInvalid(){
        return Karate.run("classpath:features/SingleBook/singleBook-Invalid.feature")
                .relativeTo(getClass());
    }

    @Karate.Test
    Karate runAll(){
        return Karate.run("classpath:features/SingleBook")
                .relativeTo(getClass());
    }

}
