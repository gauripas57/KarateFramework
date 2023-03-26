package features;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
	
	@Karate.Test
	Karate getApiTest() {
		return Karate.run("getapi").relativeTo(getClass());
	}

	@Karate.Test
	Karate postApiTest() {
		return Karate.run("randomemailapi").relativeTo(getClass());
	}
	@Karate.Test
	Karate putApiTest() {
		return Karate.run("getandupdate").relativeTo(getClass());
	}
	@Karate.Test
	Karate deleteApiTest() {
		return Karate.run("deleteapi").relativeTo(getClass());
	}
}
