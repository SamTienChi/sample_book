package helpers;
import com.github.javafaker.Faker;

    public class RandomData {
        static Faker faker = new Faker();

        public static int randomId() { return faker.randomInt(); }

        public static String randomName() {
            return faker.name().fullName();
        }

        public static String randomSubEmail() {
            return faker.internet().emailAddress();
        }

        public static String randomEmail() {
            return faker.name().username() + "@gmail.com";
        }

    }

