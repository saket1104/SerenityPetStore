package com.test.StepDefinitions;

import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.isA;
import static org.junit.Assert.assertThat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.assertj.core.util.Arrays;
import org.jruby.RubyIO.Sysopen;
import org.junit.Assert;

import io.restassured.RestAssured;
import io.restassured.http.Header;
import io.restassured.response.Response;
import net.thucydides.core.util.EnvironmentVariables;
import net.thucydides.core.util.SystemEnvironmentVariables;

public class fetchpetStoreReport {
	EnvironmentVariables variables = SystemEnvironmentVariables.createEnvironmentVariables();
	private String BASE_URI = variables.getProperty("base.uri");

	public void addingNewPetWithPostRequest(String scenario, String endPoint, String ID, String name, String categoryID,
			String categoryName, String pUrls, String tagID, String tagName, String status, int statusCode) {
		if (scenario.contains("AddPet")) {
			Map<String, Object> mainObj = new LinkedHashMap<String, Object>();
			mainObj.put("id", ID);
			mainObj.put("name", name);

			Map<String, Object> category = new LinkedHashMap<String, Object>();
			category.put("id", categoryID);
			category.put("name", categoryName);

			mainObj.put("category", category);

			List<String> photoUrls = new ArrayList<String>();
			photoUrls.add(pUrls);

			mainObj.put("photoUrls", photoUrls);

			Map<String, Object> tags = new LinkedHashMap<String, Object>();
			tags.put("id", tagID);
			tags.put("name", tagName);

			List<Map<String, Object>> tagAl = new ArrayList<Map<String, Object>>();
			tagAl.add(tags);

			mainObj.put("tags", tagAl);

			mainObj.put("status", status);

			System.out.println(mainObj);
			//String body = mainObj.toString();

			Response response = postWithEndPointAndBody(endPoint, mainObj);

			System.out.println(
					"Status code for scenario" + scenario + " is ------>>>>>>>>>> " + response.getStatusCode());
			System.out.println(
					"Body of response for " + scenario + " is------>>>>>>>>>>" + response.body().asPrettyString());
			try {
				assertThat(response.statusCode(), is(statusCode));
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e.getCause());
				System.out.println("Assertion failed add pet due to invalid data in the Post body");
			}
		} else
			System.out.println("This scenario is not of AddPet hence ignoring this particular data from Examples...");
	}

	public void updatingExistingPetWithPutRequest(String scenario, String endPoint, String ID, String name,
			String categoryID, String categoryName, String pUrls, String tagID, String tagName, String status,
			int statusCode) {
		if (scenario.contains("UpdatePet")) {
			Map<String, Object> mainObj = new LinkedHashMap<String, Object>();
			mainObj.put("id", ID);
			mainObj.put("name", name);

			Map<String, Object> category = new LinkedHashMap<String, Object>();
			category.put("id", categoryID);
			category.put("name", categoryName);

			mainObj.put("category", category);

			List<String> photoUrls = new ArrayList<String>();
			photoUrls.add(pUrls);

			mainObj.put("photoUrls", photoUrls);

			Map<String, Object> tags = new LinkedHashMap<String, Object>();
			tags.put("id", tagID);
			tags.put("name", tagName);

			List<Map<String, Object>> tagAl = new ArrayList<Map<String, Object>>();
			tagAl.add(tags);

			mainObj.put("tags", tagAl);

			mainObj.put("status", status);

			System.out.println(mainObj);
			//String body = mainObj.toString();

			Response response = putWithEndPointAndBody(endPoint, mainObj);

			System.out.println(
					"Status code for scenario" + scenario + " is ------>>>>>>>>>> " + response.getStatusCode());
			System.out.println(
					"Body of response for " + scenario + " is------>>>>>>>>>>" + response.body().asPrettyString());
			try {
				assertThat(response.statusCode(), is(statusCode));
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e.getCause());
				System.out.println("Assertion failed add pet due to invalid data in the Post body");
			}
		} else
			System.out
					.println("This scenario is not of UpdatePet hence ignoring this particular data from Examples...");
	}

	public void getPetByStatus(String scenario, String endPoint, String status, int statusCode) {
		HashMap<String, String> params = new HashMap<>();
		params.put("status", status);
		Response response = getRequest(endPoint, params);
		assertThat(response.statusCode(), is(statusCode));
	}

	public void getPetByTags(String endpointByTags, String tags, int statusCode) {

	}

	public void getPetByID(String scenario, String endPoint, String ID, int statusCode) {
		if (scenario.contains("GetPetById")) {
			System.out.println("Scenario------------------------->>>>>>>>>>" + scenario);
			String endPointFinal = endPoint + ID;
			Response response = getRequest(endPointFinal);
			System.out.println(
					"Status code for scenario" + scenario + " is ------>>>>>>>>>> " + response.getStatusCode());
			System.out.println(
					"Body of response for " + scenario + " is------>>>>>>>>>>" + response.body().asPrettyString());
			try {
				assertThat(response.statusCode(), is(statusCode));
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("This failure might be because of incorrect ID which gave no reponse");
			}
		} else
			System.out.println(
					"This given example data set is not for ValidGetPetById hence ignoring this particular data from Examples...");
	}

	public void deletePetByID(String scenario, String endPoint, String ID, int statusCode) {
		if (scenario.contains("DeletePetByID")) {
			System.out.println("Scenario------------------------->>>>>>>>>>" + scenario);
			String endPointFinal = endPoint + ID;
			Response response = deleteRequestWithAuthHeaders(endPointFinal);
			System.out.println(
					"Status code for scenario" + scenario + " is ------>>>>>>>>>> " + response.getStatusCode());
			System.out.println(
					"Body of response for " + scenario + " is------>>>>>>>>>>" + response.body().asPrettyString());
			try {
				assertThat(response.statusCode(), is(statusCode));
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("This failure might be because of incorrect ID which gave no reponse");
			}
		} else
			System.out.println("This given example data set is not for ValidGetPetById");
	}

	public void getPetByIDAndVerifyName(String scenario, String endPoint, String ID, String name, int statusCode) {
		if (scenario.contains("ValidGetPetByIDAndVerifyName")) {
			String endpointFinal = endPoint + ID;
			System.out.println("=======================>>>>>>>>>>>>" + endpointFinal);
			Response response = getRequest(endpointFinal);
			System.out.println(
					"Status code for scenario" + scenario + " is ------>>>>>>>>>> " + response.getStatusCode());
			System.out.println(
					"Body of response for " + scenario + " is------>>>>>>>>>>" + response.body().asPrettyString());

			assertThat(response.statusCode(), is(statusCode));
			try {
				assertThat(response.statusCode(), is(statusCode));
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e.getCause());
				System.out.println("Assertion failed for statusCode or the pet is not present");
			}
			if (!(scenario.contains("InValid"))) {
				try {
					assertThat(response.jsonPath().get("name"), is(name));
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println(e.getCause());
					System.out.println("Assertion failed, please check the results..");
				}
			}
		} else
			System.out
					.println("This is not of UpdatePet scenarios hence ignoring this particular data from Examples...");
	}

	public void postAndUpdatePetUsingIdNameStatus(String scenario, String endPoint, String ID, String name,
			String status, int statusCode) {
		if (scenario.contains("UpdatePet")) {
			String endPointFinal = endPoint + ID;
			HashMap<String, String> params = new HashMap<>();
			params.put("name", name);
			params.put("status", status);

			Response response = postRequestWithDefaultHeadersAndQueryParams(endPointFinal, params);
			System.out.println(
					"Status code for scenario" + scenario + " is ------>>>>>>>>>> " + response.getStatusCode());
			System.out.println(
					"Body of response for " + scenario + " is------>>>>>>>>>>" + response.body().asPrettyString());

			assertThat(response.statusCode(), is(statusCode));

			if (!(scenario.equals("InValidPostUpdatePet"))) {
				try {
					assertThat(response.jsonPath().get("name"), is(name));
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println(e.getCause());
					System.out.println("Assertion failed, please check the results..");
				}
			}
		} else
			System.out
					.println("This is not of UpdatePet scenarios hence ignoring this particular data from Examples...");
	}

	public Response getRequest(String endpoint) {
		return RestAssured.given().get(BASE_URI + endpoint).then().extract().response();
	}

	public Response getRequest(String endpoint, HashMap<String, String> params) {
		try {
			HashMap<String, String> p = new HashMap<>();
			if (params != null) {
				p = params;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Please verify the exeption: " + e.toString());
			return null;
		}
		return RestAssured.given().baseUri(BASE_URI + endpoint).queryParams(params).get().then().extract().response();
	}
	
	public Response getRequestWithHeaders(String endpoint) {
			return RestAssured.given().baseUri(BASE_URI + endpoint).headers(getDefaultHeaders()).get().then().extract().response();
	}
	
	public Response deleteRequestWithAuthHeaders(String endpoint) {
		return RestAssured.given().baseUri(BASE_URI).headers(getDefaultHeaders()).delete(endpoint).then().extract()
				.response();
	}

	public Response postRequestWithDefaultHeadersAndQueryParams(String endpoint, HashMap<String, String> params) {
		try {
			HashMap<String, String> p = new HashMap<>();
			if (params != null) {
				p = params;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Please verify the exeption: " + e.toString());
			return null;
		}
		return RestAssured.given().baseUri(BASE_URI).headers(getDefaultHeaders()).queryParams(params).post(endpoint)
				.then().extract().response();
	}

	public Response postWithEndPointAndBody(String endpoint, Map<String, Object> body) {
		return RestAssured.given().baseUri(BASE_URI).headers(getDefaultHeaders()).body(body).post(endpoint).then()
				.extract().response();
	}

	public Response putWithEndPointAndBody(String endpoint, Map<String, Object> body) {
		return RestAssured.given().baseUri(BASE_URI).headers(getDefaultHeaders()).body(body).put(endpoint).then()
				.extract().response();
	}

	public HashMap<String, String> getDefaultHeaders() {
		try {
			HashMap<String, String> h = new HashMap<>();
			h.put("Content-Type", "application/json");
			h.put("accept", "*/*");
			h.put("access-control-allow-headers", "Content-Type,api_key,Authorization");
			h.put("access-control-allow-methods", "GET,POST,DELETE,PUT");
			h.put("access-control-allow-origin", "*");
			h.put("access-control-expose-headers", "Content-Disposition");

			return h;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	

	public void getInventoryStatus(String endpoint, int statusCode, String statuses) {
		String []s= statuses.split(",");
		Response response = getRequestWithHeaders(endpoint);
		System.out.println("resonse obtained is " + response.getStatusCode());
		System.out.println("body obtained is " + response.getBody().asString());
		
		
		try {
			assertThat(response.statusCode(), is(statusCode));
			assertThat(response.getBody().asString().contains("approved"), is(true));
			assertThat(response.getBody().asString().contains("delivered"), is(true));
			assertThat(response.getBody().asString().contains("placed"), is(true));
			System.out.println("Count Value for approved status: "+response.jsonPath().get("approved"));
			System.out.println("Count Value for delivered status: "+response.jsonPath().get("delivered"));
			System.out.println("Count Value for placed status: "+response.jsonPath().get("placed"));
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getCause());
		}
	}

	public void postOrderWithPostRequest(String scenario, String endPoint, int id, int petId, int quantity,
			String shipDate, String status, boolean complete, int statusCode) {
		if (scenario.contains("PlaceOrder")) {
			HashMap<String, Object> hm = new HashMap<String, Object>();
			hm.put("id", id);
			hm.put("petId", petId);
			hm.put("quantity", quantity);
			hm.put("shipDate", shipDate);
			hm.put("status", status);
			hm.put("complete", complete);
			Response response = postWithEndPointAndBody(endPoint, hm);
			System.out.println(
					"Status code for scenario" + scenario + " is ------>>>>>>>>>> " + response.getStatusCode());
			System.out.println(
					"Body of response for " + scenario + " is------>>>>>>>>>>" + response.body().asPrettyString());
			try {
				assertThat(response.statusCode(), is(statusCode));
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e.getCause());
			}
		} else
			System.out.println(
					"This is not of PlaceOrder scenarios hence ignoring this particular data from Examples...");
	}

	public void getPurchaseOrderByID(String scenario, String endPoint, int id, int petId, int statusCode) {
		if (scenario.contains("GetPurchaseById")) {
			System.out.println("Scenario------------------------->>>>>>>>>>" + scenario);
			String endPointFinal = endPoint + id;

			Response response = getRequest(endPointFinal);
			System.out.println(
					"Status code for scenario" + scenario + " is ------>>>>>>>>>> " + response.getStatusCode());
			System.out.println(
					"Body of response for " + scenario + " is------>>>>>>>>>>" + response.body().asPrettyString());
			try {
				assertThat(response.statusCode(), is(statusCode));
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("This failure might be because of incorrect ID which gave no reponse");
			}
			if (!(scenario.contains("InValid"))) {
				try {
					assertThat(response.jsonPath().get("petId"), is(petId));
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("This failure is due to 404 response asserting some json path value");
				}
			}
		} else
			System.out.println(
					"This given example data set is not for ValidGetPetById hence ignoring this particular data from Examples...");
	}

	public void deletePurchaseOrderByID(String scenario, String endPoint, int id, int statusCode) {
		if (scenario.contains("DeletePurchaseById")) {
			String endPointFinal = endPoint + id;
			Response response = deleteRequestWithAuthHeaders(endPointFinal);
			System.out.println(
					"Status code for scenario" + scenario + " is ------>>>>>>>>>> " + response.getStatusCode());
			System.out.println(
					"Body of response for " + scenario + " is------>>>>>>>>>>" + response.body().asPrettyString());
			try {
				assertThat(response.statusCode(), is(statusCode));
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("This failure might be because of incorrect ID which gave no reponse");
			}
		} else
			System.out.println("Scenario is not of DeletePurchaseByID hence ignoring the Example data..");
	}
	
	// User Coding starts here.
	
	public void createUserWithPostRequest(String scenario, String endPoint, String id, String username, String firstName, String lastName, 
			String email, String password, String phone, String userStatus, int statusCode)
	{
		if(scenario.equals("ValidUserCreationWithPOST"))
		{	
		Map<String, Object> body = new LinkedHashMap<String, Object>();
		body.put("id", id);
		body.put("username", username);
		body.put("firstName", firstName);
		body.put("lastName", lastName);
		body.put("email", email);
		body.put("password", password);
		body.put("phone", phone);
		body.put("userStatus", userStatus);
		System.out.println("endpoint is:---------->>>>>>>>"+endPoint);
		
		/*
		 * Response response = RestAssured .given() .auth() .basic("user1",
		 * "XXXXXXXXXXX") .baseUri(BASE_URI) .headers(getDefaultHeaders()) .body(body)
		 * .post(endPoint) .then().extract().response();
		 */
		Response response = postWithEpBodyAuth(endPoint, body, username, password);
		System.out.println(
				"Status code for scenario" + scenario + " is ------>>>>>>>>>> " + response.getStatusCode());
		System.out.println(
				"Body of response for " + scenario + " is------>>>>>>>>>>" + response.body().asPrettyString());
		try {
			assertThat(response.statusCode(), is(statusCode));
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Check check the assertion and validate if its a bug or script issue");
		}
		}
	}
	
	public void updateUserWithPutRequest(String scenario, String endPoint, String id, String username, String firstName, String lastName, 
			String email, String password, String phone, String userStatus, int statusCode)
	{
		if(scenario.equals("ValidUserUpdationWithPut"))
		{	
		Map<String, Object> body = new LinkedHashMap<String, Object>();
		body.put("id", id);
		body.put("username", username);
		body.put("firstName", firstName);
		body.put("lastName", lastName);
		body.put("email", email);
		body.put("password", password);
		body.put("phone", phone);
		body.put("userStatus", userStatus);
		System.out.println("endpoint is:---------->>>>>>>>"+endPoint);
		String finalEndpoint = endPoint+username;
		
		/*
		 * Response response = RestAssured .given() .auth() .basic("user1",
		 * "XXXXXXXXXXX") .baseUri(BASE_URI) .headers(getDefaultHeaders()) .body(body)
		 * .post(endPoint) .then().extract().response();
		 */
		Response response = putWithEpBodyAuth(finalEndpoint, body, username, password);
		System.out.println(
				"Status code for scenario" + scenario + " is ------>>>>>>>>>> " + response.getStatusCode());
		System.out.println(
				"Body of response for " + scenario + " is------>>>>>>>>>>" + response.body().asPrettyString());
		try {
			assertThat(response.statusCode(), is(statusCode));
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Check check the assertion and validate if its a bug or script issue");
		}
		}
	}
	
	public Response postWithEpBodyAuth(String endPoint, Map<String, Object> body, String username, String password)
	{
		return RestAssured
	    		.given()
	    		.auth()
	    		.basic(username, password)
	    		.baseUri(BASE_URI)
                .headers(getDefaultHeaders())
                .body(body)
                .post(endPoint)
                .then().extract().response();
	}
	
	public Response putWithEpBodyAuth(String endPoint, Map<String, Object> body, String username, String password)
	{
		return RestAssured
	    		.given()
	    		.auth()
	    		.basic(username, password)
	    		.baseUri(BASE_URI)
                .headers(getDefaultHeaders())
                .body(body)
                .put(endPoint)
                .then().extract().response();
	}
	
	public void getUserByUsername(String scenario, String endPoint, String username, int statusCode)
	{
		if(scenario.contains("ValidGETUserWithUserName"))
		{
			String finalEndpoint = endPoint+username;
			/*
			 * Response response = RestAssured .given() .baseUri(BASE_URI)
			 * .get(finalEndpoint) .then() .extract() .response();
			 */
					
			/*
			 * Response response = RestAssured .given()
			 * .get(BASE_URI+finalEndpoint).then().extract().response();
			 */
			 
			System.out.println("finalEndpoint is:---------->>>>>>>>"+finalEndpoint);
			Response response  = getRequest(finalEndpoint);
			
			System.out.println(
					"Status code for scenario" + scenario + " is ------>>>>>>>>>> " + response.getStatusCode());
			System.out.println(
					"Body of response for " + scenario + " is------>>>>>>>>>>" + response.body().asPrettyString());
			try {
				assertThat(response.statusCode(), is(statusCode));
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Verify response and correct the functionality or the script...");
			}		
		}
	}
	
	public void deleteUserByUserName(String scenario, String endPoint, String username, int statusCode)
	{
		if(scenario.contains("ValidDELETEUserWithUserName"))
		{
			String finalEndpoint = endPoint+username;
			Response response= RestAssured
					.given()
					.auth()
					.basic("user1", "XXXXXXXXXXX")
					.baseUri(BASE_URI)
					.headers(getDefaultHeaders())
					.delete(finalEndpoint)
					.then()
					.extract()
					.response();
			System.out.println(
					"Status code for scenario" + scenario + " is ------>>>>>>>>>> " + response.getStatusCode());
			System.out.println(
					"Body of response for " + scenario + " is------>>>>>>>>>>" + response.body().asPrettyString());
			try {
				assertThat(response.statusCode(), is(statusCode));
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Verify response and correct the functionality or the script...");
			}		
		}
	}
	
	public void loginUserWithUsernameAndPassword(String scenario, String endPoint, String username, String password, int statusCode)
	{
		if(scenario.contains("UserLogin"))
		{
			HashMap<String, String> params = new HashMap<>();
			params.put("username", username);
			params.put("password", password);
						
			String ep = BASE_URI+endPoint;
			System.out.println("endopint final =====>>>>>"+ep);
			Response response = RestAssured
					.given()
					.baseUri(BASE_URI+endPoint)
					.queryParams(params)
					.get()
					.then().extract().response();
			
			System.out.println("");
			System.out.println(
					"Status code for scenario" + scenario + " is ------>>>>>>>>>> " + response.getStatusCode());
			System.out.println(
					"Body of response for " + scenario + " is------>>>>>>>>>>" + response.body().asPrettyString());
			try {
				assertThat(response.statusCode(), is(statusCode));
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Verify response and correct the functionality or the script...");
			}
		}	
	}
	
	
	public void logoutUser(String scenario, String endPoint, int statusCode)
	{
		if(scenario.contains("userLogout"))
		{
			Response response  = getRequest(endPoint);
			System.out.println(
					"Status code for scenario" + scenario + " is ------>>>>>>>>>> " + response.getStatusCode());
			System.out.println(
					"Body of response for " + scenario + " is------>>>>>>>>>>" + response.body().asPrettyString());
			try {
				assertThat(response.statusCode(), is(statusCode));
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("Verify response and correct the functionality or the script...");
			}
			
		}
	}
	
	
	

}
