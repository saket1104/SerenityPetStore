package com.test.StepDefinitions;

import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.isA;
import static org.junit.Assert.assertThat;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.github.bonigarcia.wdm.WebDriverManager;
import io.restassured.RestAssured;
import io.restassured.response.Response;

public class petStoreStepDef extends fetchpetStoreReport {

	@Given("Verify {} to add new pet addition at {} with {}, {}, {}, {}, {}, {}, {}, {} gives {}")
	public void addingNewPet(String scenario, String endPoint, String ID, String name, String categoryID,
			String categoryName, String pUrls, String tagID, String tagName, String status, int statusCode) {
		addingNewPetWithPostRequest(scenario, endPoint, ID, name, categoryID, categoryName, pUrls, tagID, tagName,
				status, statusCode);
	}

	@Given("Verify {} to update a pet addition at {} with {}, {}, {}, {}, {}, {}, {}, {} gives {}")
	public void updatingNewPet(String scenario, String endPoint, String ID, String name, String categoryID,
			String categoryName, String pUrls, String tagID, String tagName, String status, int statusCode) {
		updatingExistingPetWithPutRequest(scenario, endPoint, ID, name, categoryID, categoryName, pUrls, tagID, tagName,
				status, statusCode);
	}

	@Given("Verify pet store {} with endpoint {} having status {} gives statusCode as {}")
	public void Verify_pet_store_with_endpoint_having_status_gives_statusCode_(String scenario, String endPoint,
			String status, int statusCode) {
		getPetByStatus(scenario, endPoint, status, statusCode);
	}

	@Given("Verify the pet store with endpoint {} having tags {} gives statusCode as {}")
	public void Verify_the_pet_store_with_endpoint_having_tags_gives_statusCode_as(String endpointByTags, String tags,
			int statusCode) {
		getPetByTags(endpointByTags, tags, statusCode);// incomplete
	}

	@Given("Verify get Pet {} with endpoint {} having ID {} gives statusCode as {}")
	public void Verify_the_pet_store_with_endpoint_having_ID_gives_statusCode_as(String scenario, String endPoint,
			String ID, int statusCode) {
		getPetByID(scenario, endPoint, ID, statusCode);
	}

	@Given("Verify delete Pet {} with endpoint {} having ID {} gives statusCode as {}")
	public void Verify_delete_pet_store_with_endpoint_having_ID_gives_statusCode_as(String scenario, String endPoint,
			String ID, int statusCode) {
		deletePetByID(scenario, endPoint, ID, statusCode);
	}

	@Given("Updating pet {} using post request at {} using {} and {} and {} returns {}")
	public void updatePetByID_With_Post_Request(String scenario, String endPoint, String ID, String name, String status,
			int statusCode) {
		postAndUpdatePetUsingIdNameStatus(scenario, endPoint, ID, name, status, statusCode);
	}

	@And("Verify that get request for {} at {} of {} returns name as {} and status code as {}")
	public void Verify_that_get_request_for_of_returns_name_as(String scenario, String endPoint, String ID, String name,
			int statusCode) {
		getPetByIDAndVerifyName(scenario, endPoint, ID, name, statusCode);
	}

	@Given("Get request on store api at {} and gives status code as {} and returns inventories by statuses {}")
	public void The_pet_store_API_is_available_for_endpoint(String endPoint, int statusCode, String statuses) {
		getInventoryStatus(endPoint, statusCode,statuses );

	}

	@Given("Place an order for {} using post request at {} with {},{},{},{},{},{} gives {}")
	public void place_order_with_post_request(String scenario, String endPoint, int id, int petId, int quantity,
			String shipDate, String status, boolean complete, int statusCode) {
		postOrderWithPostRequest(scenario, endPoint, id, petId, quantity, shipDate, status, complete, statusCode);
	}

	@Given("Verify the purchase order {} at {} by {} and assert that petId obtained is equal to {} and gives {}")
	public void Verify_the_purchase_order_by_id(String scenario, String endPoint, int id, int petId, int statusCode) {
		getPurchaseOrderByID(scenario, endPoint, id, petId, statusCode);
	}

	@Given("Delete the purchase order {} at {} by {} and verify status code obtained is {}")
	public void delete_the_purchase_order_by(String scenario, String endPoint, int id, int statusCode) {
		deletePurchaseOrderByID(scenario, endPoint, id, statusCode);
	}
	
	// User StepDefs below
	
	@Given("User is created as {} at {} with {},{},{},{},{},{},{},{} and validate status code as {}")
	public void create_user_with_post_request(String scenario, String endPoint, String id, String username, String firstName, 
			String lastName, String email, String password, String phone, String userStatus, int statusCode)
	{
		createUserWithPostRequest(scenario, endPoint, id, username, firstName, lastName, email, password, phone, userStatus, statusCode);
	}
	
	@Given("User is updated as {} at {} with {},{},{},{},{},{},{},{} and validate status code as {}")
	public void update_user_with_post_request(String scenario, String endPoint, String id, String username, String firstName, 
			String lastName, String email, String password, String phone, String userStatus, int statusCode)
	{
		updateUserWithPutRequest(scenario, endPoint, id, username, firstName, lastName, email, password, phone, userStatus, statusCode);
	}
	
	@Given("Get the user with GET request as {} at {} with {} gives the status code as {}")
	public void get_the_user_by_username(String scenario, String endPoint, String username, int statusCode)
	{
		getUserByUsername(scenario,endPoint,username,statusCode);
	}
	
	@Given("Delete the user with {} at {} using {} and validate the status code as {}")
	public void delete_user_by_Username(String scenario, String endPoint, String username, int statusCode)
	{
		deleteUserByUserName(scenario, endPoint, username, statusCode);
	}
		
	@Given("user logs into for {} into the system at {} using {} and {} and verify {}")
	public void user_login_into_system(String scenario, String endPoint, String username, String password , int statusCode)
	{
		loginUserWithUsernameAndPassword( scenario,  endPoint,  username,  password, statusCode);
	}
	
	@Given("user logout from the system in {} using GET request at {} giving {}")
	public void logout_user_from_system(String scenario, String endPoint, int statusCode)
	{
		logoutUser( scenario, endPoint, statusCode);
	}
	
}
