#SerenityPetStore



**PetStore API Testing Using Serenity - Cucumber -  RestAssured**



#Overview:

SerenityPetStore project is basically an automation project setup with Serenity Cucumber Framework which is using Rest Assured to test the API pet store sample hosted at https://petstore3.swagger.io.	But beore going further about the Framework and API testing, we need to make the server up and running. 


**Pre-Requisite- Run the server before running the automation framework:**

- Clone the project from **https://github.com/swagger-api/swagger-petstore** and import as maven project in Eclise/Intellij
- Open command prompt at the project location. 
- To Run this project with Maven, run the command **mvn package jetty:run**
- Once the command is up & running, launch **http://localhost:8080/** on your browser which will run the server you should be able to view the swagger.	
- The steps to launch this project and other details are also mentioned in the **README.md** file of the same project, swagger pet-Store. 

#Test Approach

#1. Requirement Analysis

Firstly, We need to make sure that we understand the requirement in order to have 100% Test Coverage. In order to do so, run the server and go through the APIs and the requests that are needed to make and the reponses that needs to be validated and asserted. 

#2. Test Suite Creation 

** Once the requirements are analyzed,**

1. We need to recognise scenarios that we want to test and identify the relevant automation candidate test cases. 
2. Create test cases to cover Happy path testing to ensure that functionality is working
3. Create Positive testing test cases covering the expected results identified in the requirement analysis phase.
4. And lastly, creating negative test cases whose test data gives error in the application.   

** We have created different test suites by grouping our test cases/scenarios with below tags that can run in single go based on the requirement. **

1. @SmokeTest
2. @regressionTest
3. @regressionTestPetAPI
4. @regressionTestStoreAPI
5. @regressionUserAPI

*At any point of time, we can tag test as @smokeTest or @sanityTest as well based on the type of testing we want do. *

** We have applied below levels of testing for PET, Store and User API Testing.**

1. Unit Testing on the endpoint with the respective request applicable. 
2. Integration Testing.
3. System Testing Or End to End Testing. 
4. Regression Testing.

**To achieve all the above Testing in the Pet, Store and User API, we have created feature files utilizing benefits of cucumber framework**

1. Scenarios in the form of **"Scenario Outline:"** 
2. **"Examples:"** to ensure the coverage of positive and negative test cases for the given endpoint along with test data and showing and asserting expected results.
3. Parameterizing of test data in the feature line itself used along with the expected results.




#Automation Test Framework

     The entire Testing is done using Cucumber-Sernerity-BDD ( Behavior Driven Development) framework. 
	 The API call should be able to handle the requests from the user.
	 The Service will be available through different endpoints which should be active at all times for user access while the server is up and running. Step for runnint the pet store server is mention in the starting of this document.
	 The validations will be done on all the endpoints and API request present for Pet, Store and User 

**Working Folder Structure** 


    src
    |-- main
    |-- test
        |-- java
                |-- com.test.runner
				   |-- TestRunner.java
                |-- com.test.StepDefinitions  
                   |-- fetchpetStoreReport.java
				   |-- petStoreStepDef.java
        |-- resources
                |-- features
                        |-- petStore.feature(feature files)
    Target
    |-- site
        |-- Serenity
        |-- Index.html ( Serenity Report)

    |-- pom.xml    
    |-- Serenity.Properties ( Serenity Properties file)       


#Test Execution : 

    framework : Cucumber BDD - Serenity 

    PreRequisite : 

    Java - JDK1.8.0
    Java - JRE1.8.0
    Cucumber(BDD) - 1.9.51
    Serenity - 2.6.0
    maven - 1.5.8
    Intellij IDEA - 2021.2.1 (IDE-Integrated development environment)
    Gitlab/Github - Free Subscription. 
    Chrome Browser - For better view of Serenity Report 
    Manual Testing : Postman ( to verify the results manually) - Optional


#Steps Run the Test cases 

    1.Clone the project SerenityPetStore from gitlab using clone command git clone https://github.com/saket1104/SerenityPetStore.git
	2.Open the project in the Eclipse and import the project as a maven project.
	3.Make sure to wait untill the project is fully updated and loaded in the Eclipse IDE becuase the maven dependencies might take a few seconds to minuted to be ready. 
	4.Once done, Go to the project location where it is stored and Open the command prompt. 
    5.Run the  command:- mvn clean verify -Dtags=”<tags to run>” eg. mvn clean verify -Dtags=”@regressionTestPetAPI”
    6.Or else open the terminal In the intellij and run the above command if using intellij
	
**Specific Tags to Run based on Requirement**

Tags can be seen in the feature files.

    1.If need to run pet api then run the command:- mvn clean verify -Dtags="@regressionTestPetAPI"
	2.If need to run store api then run the command:- mvn clean verify -Dtags="@regressionTestStoreAPI"
	3.If need to run user api then run the command:- mvn clean verify -Dtags="@regressionTestUserAPI"
	*Apart from above, there are also tags present at individual scenario level.* 


#Test Results summary : 

Once the automation suit runs with any tags speified in the command, all the reports can be seen at **\SerenityPetStore\target\site\Serenity** location. 
This location gets updated as soon as the run is complete. Open the html files to see the html reports which will show the Scenario and the steps executed along with the results. 


#Scenarios and the respective Test Cases for PET API Testing

    (I) Scenario Name: Verifying the Adding of a pet using "POST" request at /pet with different cases of payload.
	     - Test Cases Covered:14, Automated:14, Manual:0
		 
        TC_1.Valid case to validate adding pet with valid data in the "pay_load with status as "available" giving status code as 200.
        TC_2.Valid case to validate adding pet with valid data in the "pay_load with status as "pending" giving status code as 200.
        TC_3.Valid case to validate adding pet with valid data in the "pay_load with status as "sold" giving status code as 200.
		TC_4.Valid case to validate adding of a pet with valid data in the pay_load with "Pet name accepting Special characters" giving status code as 200.
		TC_5.Valid case to validate adding of a pet with valid data in the pay_load with "Category name accepting Special characters" giving status code as 200.
		TC_6.Valid case to validate addition of a pet with "blank CategoryID and CategoryName" in the pay_load giving status code as 200.
        TC_7.InValid case to validate non-addition of a pet with "blank ID and Name" in the pay_load giving status code as 500.
        TC_8.InValid case to validate non-addition of a pet with "alphanumeric Pet ID" in the pay_load giving status code as 400.
        TC_9.InValid case to validate non-addition of a pet with "alphanumeric Category ID" in the pay_load giving status code as 400.
		TC_10.InValid case to validate non-addition of a pet with "special chars in Pet ID" in the pay_load giving status code as 400.
		TC_11.InValid case to validate non-addition of a pet with "special chars in Category ID" in the pay_load giving status code as 400.
        TC_12.InValid case to validate non-addition of a pet with "special chars in Tag ID" in the pay_load giving status code as 400.
		TC_13.InValid case to validate non-addition of a pet with "special chars in Tag ID" in the pay_load giving status code as 400.
		TC_14.Manual Testing: Validate pet addition with Long lengths in PetName, category name, Pet Id, Category Id
    
    (II) Scenario Name: Verifying the Updating of a pet using "PUT" request at /pet with different cases of payload.
		- Test Cases Covered:9, Automated:9
		
        TC_1.Valid case to validate updating pet with valid data in the "pay_load with all valid data" giving status code as 200.
        TC_2.Valid case to validate updating pet with valid data in the "pay_load alphanumeric name" giving status code as 200.
        TC_3.Valid case to validate updating pet with valid data in the "pay_load alphanumeric category name" giving status code as 200.
        TC_4.Valid case to validate updating pet with valid data in the "pay_load alphanumeric tag name" giving status code as 200.
		TC_5.Valid case to validate updating pet with valid data in the "pay_load alphanumeric status" giving status code as 200.
		TC_6.InValid case to validate non-updating of a pet with "non existence Pet ID" in the pay_load giving status code as 404.
		TC_7.InValid case to validate non-updating of a pet with "alphanumeric/special Char Pet ID" in the pay_load giving status code as 400.
		TC_8.InValid case to validate non-updating of a pet with "alphanumeric Category ID" in the pay_load giving status code as 400.
		TC_9.InValid case to validate non-updating of a pet with "alphanumeric Tag ID" in the pay_load giving status code as 400.
		
	(III) Scenario Name: Verifying pet retrieval using "GET" request at /pet/ with different cases of  petID supplied.
	    - Test Cases Covered:4, Automated:4
		
		TC_1.Valid case to validate the retrieval of a pet using existing petID giving status code as 200 and validating the response.
		TC_2.InValid case to validate the non-retrieval of a pet non existing petID giving status code as 404 and validating the response.
		TC_3.InValid case to validate the non-retrieval of a pet when Alphanumeric pet ID is used giving status code as 400 and validating the response.
		TC_4.InValid case to validate the non-retrieval of a pet when a special character pet ID is used giving status code as 400 and validating the response.
 
	(IV) Scenario Name: Verifying pet retrieval using "GET" request at /pet/findByStatus with different cases of statuses supplied.
	    - Test Cases Covered:6, Automated:6
		
		TC_1.Valid case to validate the retrieval of a pet using status as "available" giving status code as 200 and validating the response.
		TC_2.Valid case to validate the retrieval of a pet using status as "pending" giving status code as 200 and validating the response.
		TC_3.Valid case to validate the retrieval of a pet using status as "sold" giving status code as 200 and validating the response.
		TC_4.InValid case to validate the retrieval of a pet using "blank status" giving status code as 400.
		TC_5.InValid case to validate the retrieval of a pet using status other than "available, pending, sold" giving status code as 400.
		TC_6.InValid case to validate the retrieval of a pet using status as a special character giving status code as 400.
		
	(V) Scenario Name: Verifying pet deletion using "DELETE" request at /pet/ with different cases of  petID supplied.
	    - Test Cases Covered:5, Automated:6
		
		TC_1.Valid case to validate the deletion of a pet using "valid existing petID" giving status code as 200.
		TC_2.Valid case to validate the deletion of a pet using "Not-existing petID" giving status code as 200.
		TC_3.Deletion of a pet using "valid existing petID" giving status code as 200 followed by verifying retrieving of petID using GET Request giving 404.
		TC_4.InValid case to validate the deletion of a pet using "Invalid petID" giving status code as 400 and response message as "Invalid pet value".
		TC_5.Negative case to validate the deletion of a pet using "blank status" giving status code as 405."
	
	(VI) Scenario Name: Verifying updating an existing pet using POST request at /pet/ using query parameter as PetID and path parameters as pet name and status and then verifying the data of the updated pet.
	    - Test Cases Covered:2, Automated:2
		
		TC_1.Valid case to Update an existing pet using "valid petID" with valid name and status giving status code as 200 and verifying the updated "name".
		TC_2.InValid case to Update a non-existing pet using "No existing petID" thereby giving status code as 404.
		TC_3.InValid case to Update a pet using "Invalid petID" thereby giving status code as 400.
		TC_4.InValid case to Update a pet using "Invalid status" thereby giving status code as 200. (BUG- Ideally it should give 400)
			
	(VII) Scenario Name: End to end Verifying Adding, Updating, Verifying Updates with PetId and then deleting it followed by verifying non existence of the pet after performing DELETE request using ID
	    - Test Case Covered:1, Automated:1, Type: Regression
		
		Step1: Add a pet at /pet using POST request and assert the status code as 200.
		Step2: Update the above added pet at /pet using PUT request and assert the status code as 200.
		Step3: Retrieve the above updated pet at /pet/ using the pet Id and assert the status code as 200.
		Step4: Delete the above added pet at /pet using DELETE request with pet ID and assert the status code as 200. 
		Step5: Retrieve the above deleted pet at /pet/ using the pet Id and assert the status code as 404 validating that a pet is not found.
	    
	(VIII) Scenario Name: End to end Verifying Adding, Updating, Verifying Updates with PetId and then deleting it followed by verifying non existence of the pet after performing DELETE request using ID
	    - Test Case Covered:1, Automated:1, Type: Regression
		
		Step1: Add a pet at /pet using POST request and assert the status code as 200.
		Step2: Update the above added pet at /pet using PUT request and assert the status code as 200.
		Step3: Retrieve the above updated pet at /pet/ using the pet Id and assert the status code as 200.
		Step4: Delete the above added pet at /pet using DELETE request with pet ID and assert the status code as 200. 
		Step5: Retrieve the above deleted pet at /pet/ using the pet Id and assert the status code as 404 validating that a pet is not found.
		
#Scenarios and the respective Test Cases for STORE API Testing

	(I) Scenario Name: Verifying status of the store using GET request at /store/inventory using and then verifying the data in the response.
	    - Test Cases Covered:1, Automated:1
		TC_1.Verifying GET request at /store/inventoryand gives map of statuses as approved, delivered and placed in response and verify the status code as 200
		
	(II) Scenario Name: Verifying the Adding of a pet using "POST" request at /store/order with different cases of payload.
	    - Test Cases Covered:6, Automated:3, Manual:4
		
        TC_1.Valid case to validate adding Order with valid data in the "pay_load with status as "approved" giving status code as 200.
		TC_2.Valid case to validate adding Order with valid data in the "pay_load with status as "placed" giving status code as 200.
		TC_3.Valid case to validate adding Order with valid data in the "pay_load with status as "delivered" giving status code as 200.
		TC_4.InValid case to validate non-addition of an Order with "alphanumeric Order ID" in the pay_load giving status code as 400.
        TC_5.InValid case to validate non-addition of an Order with "special character Order ID" in the pay_load giving status code as 400.
		TC_6.InValid case to validate non-addition of an Order with "alphanumeric Quantity" in the pay_load giving status code as 400.
        TC_7.InValid case to validate non-addition of an Order with "special character Quantity" in the pay_load giving status code as 400.		

	(III) Scenario Name: Verify finding purchase order using "GET" request at /store/order/ with different cases of an Order id supplied.
	    - Test Cases Covered:2, Automated:2, Type: Unit Testing
		TC_1.Valid case to validate the finding of a purchase Order with valid order id and asserting status code as 200 and validating data in the response.
		TC_2.InValid case to validate the finding of a non-existing purchase Order ID and asserting status code as 404.

	(IV) Scenario Name: Verifying deleting order using "DELETE" request at /store/order/ with different cases of  OrderID supplied.
	    - Test Cases Covered:2, Automated:2, Type: Unit Testing
		
		TC_1.Valid case to validate the deletion of a pet using "valid existing OrderID" giving status code as 200.
		TC_2.Valid case to validate the deletion of a pet using "Not-existing OrderID" giving status code as 200.

	(V) Scenario Name: End to end verifying Adding order, verifying Order with GET using OrderID,then deleting the added order with DELETE followed by verifying non existence of the Order with find order using Order ID
	    - Test Case Covered:1, Automated:1, Type: Regression
		
		Step1: Place an Order at /store/order using POST request and assert the status code as 200.
		Step3: Find the above added order at /store/order/ using the Order Id and assert the status code as 200 validating that the order is present.
		Step4: Delete the above added pet at /store/order/ using DELETE request with Purchase Order ID and assert the status code as 200. 
		Step5: Find the above deleted order at /store/order/ using the Order Id and assert the status code as 404 validating that delete was successful and order is not found.	
		
		
#Scenarios and the respective Test Cases for USER API Testing

	(I) Scenario Name: Verifying the loggin in of user using "GET" request at /user/login with different valid invalid combinaion of of username & passwords.
	     - Test Cases Covered:5, Automated:5, Type: Unit Testing
		
		TC_1.Valid case to validate the logging in of a user using "valid userID and password" giving status code as 200.
		TC_2.Valid case to validate the logging in of a user using "valid userID and wrong password" giving status code as 400.
		TC_3.InValid case to validate the logging in of a user using "InValid userID and Valid password" giving status code as 400.
		TC_4.InValid case to validate the logging in of a user using "Valid userID and InValid password" giving status code as 400.
		TC_5.InValid case to validate the logging in of a user using "InValid userID and InValid password" giving status code as 400.
		
		BUG: Getting status code 200 instead of 400 Even with invalid username or password, or with incorrect username or password
		
	(II) Scenario Name: Getting user with username using "GET" request at /user with different valid invalid usernames and validating the response codes.
	     - Test Cases Covered:3, Automated:3, Type: Unit Testing
		
		TC_1.Valid case to validate the getting a user using "valid username" giving status code as 200.
		TC_2.InValid case to validate the getting a user using "Non Existing username" giving status code as 404.
		TC_3.InValid case to validate the getting a user using "Invalid username" giving status code as 400.

	(III) Scenario Name: Verifying Adding of a user using "POST" request at /user with different cases of paylod.
	     - Test Cases Covered:10, Automated:10, Type: Unit Testing
		 
        TC_1.Validate adding user with valid data in the pay_load performed by already logged in user giving status code as 200 and user is created.
		TC_2.Validate adding user with valid data in the pay_load performed by "already deleted" user giving status code as 200 but user is not created.
		TC_3.Validate adding user with valid data in the pay_load performed by "already logged out" user giving status code as 200 but user is not created.
		TC_4.Validate adding user with "special char username in the pay_load" performed by already logged in user giving status code as 200 and user is created.
		TC_5.Validate adding user with "alphanumeric username in the pay_load" performed by already logged in user giving status code as 200  and user is created.
		TC_6.Validate adding user with "alphanumeric phone in the pay_load" performed by already logged in user giving status code as 200 and user is created.
        TC_7.Validate adding user with "special char id in the pay_load" performed by already logged in user giving status code as 400 and user is not created.
		TC_8.Validate adding user with "Alphanumeric id in the pay_load" performed by already logged in user giving status code as 400 and user is not created.
		TC_9.Validate adding user with "Alphanumeric value in userStatus" performed by already logged in user giving status code as 400 and user is not created.
		TC_10.Validate adding user with "invalid email in pay_load" performed by already logged in user giving status code as 200 and user is created.
		
	(IIv) Scenario Name: Verifying updating of a user using "PUT" request at /user with different cases of paylod.
	     - Test Cases Covered:10, Automated:10, Type: Unit Testing
		 
        TC_1.Validate updating user with valid data in the pay_load performed by already logged in user giving status code as 200 and user is udpated.
		TC_2.Validate updating user with valid data in the pay_load performed by "already deleted" user giving status code as 200 but user is not udpated.
		TC_3.Validate updating user with valid data in the pay_load performed by "already logged out" user giving status code as 200 but user is not udpated.
		TC_4.Validate updating user with "special char username in the pay_load" performed by already logged in user giving status code as 200 and user is udpated.
		TC_5.Validate updating user with "alphanumeric username in the pay_load" performed by already logged in user giving status code as 200  and user is udpated.
		TC_6.Validate updating user with "alphanumeric phone in the pay_load" performed by already logged in user giving status code as 200 and user is udpated.
        TC_7.Validate updating user with "special char id in the pay_load" performed by already logged in user giving status code as 400 and user is not udpated.
		TC_8.Validate updating user with "Alphanumeric id in the pay_load" performed by already logged in user giving status code as 400 and user is not udpated.
		TC_9.Validate updating user with "Alphanumeric value in userStatus" performed by already logged in user giving status code as 400 and user is not udpated.
		TC_10.Validate updating user with "invalid email in pay_load" performed by already logged in user giving status code as 200 and user is udpated.
		
	(V)Scenario Name: Verifying that user is able to logout from the system by GET request at /user/logout 
	     - Test Cases Covered:3, Automated:3, Type: Unit Testing + in End to end Scenario
		 
	    TC_1. Verify logged in user is able to log out from the systems giving response code as 200. 
		TC_2. Verify logged out user is not able to place POST request to create a user. 
		TC_3. Verify logged out user is not able to place PUT request to update a user. 
	
	(VI)Scenario Name: Verifying user deletion with DELETE request at /user/
	     - Test Cases Covered:3, Automated:3, Type: Unit Testing + in End to end Scenario
		 
	    TC_1. Verify deletion of a user by logged in user gives response code as 200 and deleted user is not found post deletion 
		TC_2. Verify deletion of a user by non-logged in user is not sucessful but gives response code as 200 and deleted user not found by user id
		TC_2. Verify deleted user is not able to place POST request to create a user. 
		TC_3. Verify deleted user is not able to place PUT request to update a user.
		TC_4. Verify finding the deleted user with username with GET request at /user/ deleted user user gives status code as 404 denoting user not found.
		TC_5. Verify deleted user is not able to login with its credentials by GET request at user/login/ giving the status code as 400 denoting invalid user.
		
	(VII)Scenario Name: Verify end end scenario of user login, new user creation, finding the user, deleting the user, then finding the user again and then logging out.
	    Step1: Login with userid and password successful and verify the status code. 
		Step2: Create a new user with as above logged in user and verify status code as 200.
		Step3: Verify the newly created user using the user name and and verify status code as 200.
		Step4: Delete the newly created user using the user name and and verify status code as 200.
		Step5: Verify the above deleted user created user using the user name and and verify status code as 404.
		Step6: Logout 
		Step7: Try creating a new user again and verify that user is not created (This scenario needs further analysis as after loggin out as user1, still user is getting created with post request)
		
	(VIII)Scenario Name: Verify end end scenario of user login, new user creation, finding the user, deleting the user, then finding the user again and then logging out.
	    Step1: Login with userid and password successful and verify the status code. 
		Step2: Create a new user with as above logged in user and verify status code as 200.
		Step3: Verify the newly created user using the user name and and verify status code as 200.
		Step4: Login with userid and password of newly created user verify the status code 200.
		Step5: Delete the newly logged in user using the user name and and verify status code as 200.
		Step5: Verify the above deleted user created user using the user name and and verify status code as 404.


	
		
#Bugs/Observations:

     1.In pet APII, Status other than available, pending, sold is giving 200 which should have been restricted to given dropdown values only. Refer @petApi_002
     2.In pet Api, While updating a pet with POST request at /pet/, even invalid values supplied for id like alphanumeric or special characters or alphanumeric status returns status code as 200 which should have bee 400. Refer @petApi_006
     3.In store api, GET at /store/inventory returns the same value for count based on status everytime. Even when an order is placed or deleted, the count at the inventory remains the same which ideally should get updated. 
     4.Invalid username or password should give statusCode as 400 but giving 200. (Endpoint /user/login, login with GET request)
     5.Even after supplying invalid usernames to GET request at /user/, we are getting 404 denoting user not found which should have been 400 for an invalid request. 
     6.In user API, User creation with POST with blank spaces in username or with special chars should give 400 instead of 404 as those inputs are invalid rather than user not present.
	 7.In user api, even if user has logged out, we are able to create users in post request with the logged our user. This may be duue user1 that is given for testing.  
	 
	 
	 
	 
     
