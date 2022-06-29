package Spotify;

import com.intuit.karate.junit5.Karate;

public class ApiRunner {

    @Karate.Test
    Karate testAll() {
        return Karate.run("Api").relativeTo(getClass());
    }
}
