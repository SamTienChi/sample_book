package runners;
import com.intuit.karate.junit5.Karate;

class RegisterRunner {
    @Karate.Test
    Karate runValid() {
        return Karate.run("classpath:features/Register/register-valid.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate runInvalid() {
        return Karate.run("classpath:features/Register/register-invalid.feature");
    }

    @Karate.Test
    Karate runAll() {
        return Karate.run("classpath:features/Register");
    }
}