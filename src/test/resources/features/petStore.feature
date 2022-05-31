#Author: Saket  Anand
#Email: SAKET1104@GMAIL.COM

@FullPet_Store_Api_Testing
  
Feature: This feature contains the automation testing scenarios for pet & store api.
      
 @petApi_001 @regressionTest  @regressionTestPetAPI 
 Scenario Outline: This scenario verifies the different cases of Valid & Invalid inputs for adding new pets in the store using POST Request and 
 asserting and validating the respective response codes.
 
 Given Verify <scenario> to add new pet addition at <endPoint> with <ID>, <name>, <categoryID>, <categoryName>, <pUrls>, <tagID>, <tagName>, <status> gives <statusCode>
 Examples:
|scenario     |endPoint|ID|name   |categoryID|categoryName|pUrls |tagID|tagName|status   |statusCode|
|ValidAddPet  |/pet    |23|doggies|    1     |  Dogs      |string|0    |string |available|200       |
|ValidAddPet  |/pet    |24|cat24  |    2     |  Cats      |string|0    |string |pending  |200       |
|ValidAddPet  |/pet    |25|Eagle  |    3     |  Birds     |string|0    |string |sold     |200       |
|ValidAddPet  |/pet    |30| &^%*& |   30     |  Dogs      |string|0    |string |available|200       |
|ValidAddPet  |/pet    |30| Husk  |   30     |  *&^4Ab    |string|0    |string |available|200       |
|ValidAddPet  |/pet    |30|husky  |          |            |string|0    |string |available|200       |
|InValidAddPet|/pet    |  |       |    1     |  Dogs      |string|0    |string |available|500       |
|InValidAddPet|/pet    |3A| PBull |    1     |  Dogs      |string|0    |string |available|400       |
|InValidAddPet|/pet    |30| Bull  |   3A     |  Dogs      |string|0    |string |available|400       |
|InValidAddPet|/pet    |$%| GerS  |   30     |  Dogs      |string|0    |string |available|400       |
|InValidAddPet|/pet    |30| GerS  |   %^*    |  Dogs      |string|0    |string |available|400       |
|InValidAddPet|/pet    |30| Pomm  |   30     |  Dogs      |string|&^   |string |available|400       |
|InValidAddPet|/pet    |30| Pomm  |   30     |  Dogs      |string|3FT  |string |available|400       |

@petApi_002  @regressionTest @regressionTestPetAPI 
 Scenario Outline: This scenario verifies the different cases of Valid & Invalid inputs for Updating pets in the store using PUT Request and 
 asserting and validating the respective response codes.
 
 Given Verify <scenario> to update a pet addition at <endPoint> with <ID>, <name>, <categoryID>, <categoryName>, <pUrls>, <tagID>, <tagName>, <status> gives <statusCode>
 Examples:
|scenario          |endPoint|ID|name   |categoryID|categoryName|pUrls |tagID|tagName|status   |statusCode|
|ValidUpdatePet    |/pet    |23|Caties |    1     |  Cats      |string|0    |string |available|200       |
|ValidUpdatePet    |/pet    |23|AB03%$ |    1     |  Cats      |string|0    |string |available|200       |
|ValidUpdatePet    |/pet    |23|Caties |    1     |  bh&^43    |string|0    |string |available|200       |
|ValidUpdatePet    |/pet    |23|Caties |    1     |  Cats      |string|0    |jksh12 |available|200       |
|ValidUpdatePet    |/pet    |23|Caties |    1     |  Cats      |string|0    |jksh12 |hjs78    |200       |
|ValidUpdatePet    |/pet    |56|Caties |    1     |  Cats      |string|0    |string |available|404       |
|InValidUpdatePet  |/pet    |$$|doggie |    1     |  Dogs      |string|0    |string |available|400       |
|InValidUpdatePet  |/pet    |56|PerCat |    &^&   |  wer       |string|0    |string |available|400       |
|InValidUpdatePet  |/pet    |56|PerCat |    1     |  wer       |string|$@&  |string |available|400       |

# Bug/Observations: Status other than available, pending, sold is giving 200 which should have been restricted to given dropdown values only.
# Bug/Observations: Even on trying various test data, PUT on /pet is not giving validation expection denoted by 405


@petApi_003  @regressionTest @regressionTestPetAPI 
 Scenario Outline: This scenario verifies the different cases of Valid and Invalid scenarios for getting pets from store based on the diferent 
 petID in the GET request and then asserting and validating the respective response codes.
 
 Given Verify get Pet <scenario> with endpoint <endPoint> having ID <ID> gives statusCode as <statusCode>
 Examples:
|scenario           |endPoint    |ID |statusCode|
|ValidGetPetById    |/pet/       |1  | 200|	 
|ValidGetPetById    |/pet/       |2  | 200|
|InValidGetPetById  |/pet/       |111| 404| 
|InValidGetPetById  |/pet/       |5AA| 400|  
|InValidGetPetById  |/pet/       |*&^| 400| 
 
@petApi_004  @regressionTest @regressionTestPetAPI 
 Scenario Outline: This scenario verifies the different cases of Valid and Invalid scenarios for finding pets from store based on the differenct 
 status in GET request and then asserting and validating the respective response codes.
 
 Given Verify pet store <scenario> with endpoint <endPoint> having status <status> gives statusCode as <statusCode>
 Examples:
|scenario       |endPoint         |status            | statusCode | 
|ValidByStatus  |/pet/findByStatus|available         | 200        |  
|ValidByStatus  |/pet/findByStatus|pending           | 200        | 
|ValidByStatus  |/pet/findByStatus|sold              | 200        | 
|InValidByStatus|/pet/findByStatus|invalidStatus     | 400        | 
|InValidByStatus|/pet/findByStatus|                  | 400        |
|InValidByStatus|/pet/findByStatus|(*&(*&(*^         | 400        |


@petApi_005  @regressionTest @regressionTestPetAPI 
 Scenario Outline: This scenario verifies the different cases of deleting pets using DELETE request by first adding a pet and then 
 deleting it and then again checking it in store using ID.
 
 Given Verify <scenario> to add new pet addition at <endPoint> with <ID>, <name>, <categoryID>, <categoryName>, <pUrls>, <tagID>, <tagName>, <status> gives <statusCode>
 When Verify delete Pet <scenario> with endpoint <endPoint> having ID <ID> gives statusCode as <statusCode>
 Then Verify get Pet <scenario> with endpoint <endPoint> having ID <ID> gives statusCode as <statusCode>
 Examples:
|scenario                    |endPoint|ID |name   |categoryID|categoryName|pUrls |tagID|tagName  |status   |statusCode|
|ValidAddPet                 |/pet/   |31 |Parrot |    1     |  Birds     |string|0    |string   |available|200       |
|ValidDeletePetByID          |/pet/   |31 | NULL  | NULL     |   NULL     |NULL  |NULL |NULL     |NULL     |200       |
|InValidDeletePetByID        |/pet/   |@% | NULL  | NULL     |   NULL     |NULL  |NULL |NULL     |NULL     |400       |
|ValidGetPetById             |/pet/   |31 | NULL  | NULL     |   NULL     |NULL  |NULL |NULL     |NULL     |404       |
|InValidDeletePetByID        |/pet/   |   | NULL  | NULL     |   NULL     |NULL  |NULL |NULL     |NULL     |405       |

@petApi_006 @regressionTest @regressionTestPetAPI
 Scenario Outline: This scenario verifies valid and invalid updating of pet with POST using ID, Name & Status and then asserting 
 them name post valid and invalid udpates along with status code. 
 
 Given Verify <scenario> to add new pet addition at <endPoint> with <ID>, <name>, <categoryID>, <categoryName>, <pUrls>, <tagID>, <tagName>, <status> gives <statusCode>
 Then Updating pet <scenario> using post request at <endPoint> using <ID> and <name> and <status> returns <statusCode>
 Then Verify that get request for <scenario> at <endPoint> of <ID> returns name as <name> and status code as <statusCode>
 Examples:
|scenario                          |endPoint |ID  |name     |categoryID|categoryName|pUrls |tagID|tagName|status   |statusCode|
|ValidAddPet                       |/pet/    |45  |Dog 1    |    1     |  Dogs      |string|0    |string |available|200       |
|ValidGetPetByIDAndVerifyName      |/pet/    |45  |Dog 1    |    1     |  Dogs      |string|0    |string |available|200       |
|ValidPostUpdatePet                |/pet/    |45  |Dog 2    |    1     |  Dogs      |string|0    |string |available|200       |
|ValidGetPetByIDAndVerifyName      |/pet/    |45  |Dog 2    |    1     |  Dogs      |string|0    |string |available|200       |
|InValidPostUpdatePet              |/pet/    |500 |Tiger    |    1     |  Cat       |string|0    |string |available|404       |
|InValidGetPetByIDAndVerifyName    |/pet/    |500 |Tiger    |    1     |  Cat       |string|0    |string |available|404       |
|InValidPostUpdatePet              |/pet/    |5AB |Tiger    |    1     |  Cat       |string|0    |string |available|400       |
|InValidPostUpdatePet              |/pet/    |45  |Tiger    |    1     |  Cat       |string|0    |string |345354ble|200       |

#Bug: InValid case to Update a pet using "Invalid status" in POST at /pet/ is giving status code as 200. (BUG- Ideally it should give 400)

 
@petApi_007 @regressionTest  @regressionTestPetAPI
Scenario Outline: This is a end-to-end scenario which verifies Adding, Updating, Verifying Update with PetId and then deleting it followed by 
verifying non existence of the pet after performing DELETE request using ID.

Given Verify <scenario> to add new pet addition at <endPoint> with <ID>, <name>, <categoryID>, <categoryName>, <pUrls>, <tagID>, <tagName>, <status> gives <statusCode>
Then Verify <scenario> to update a pet addition at <endPoint> with <ID>, <name>, <categoryID>, <categoryName>, <pUrls>, <tagID>, <tagName>, <status> gives <statusCode>
Then Verify get Pet <scenario> with endpoint <endPoint> having ID <ID> gives statusCode as <statusCode>
Then Verify delete Pet <scenario> with endpoint <endPoint> having ID <ID> gives statusCode as <statusCode>
Then Verify get Pet <scenario> with endpoint <endPoint> having ID <ID> gives statusCode as <statusCode>
 Examples:
|scenario          |endPoint|ID |name   |categoryID|categoryName|pUrls |tagID|tagName|status   |statusCode|
|ValidAddPet       |/pet    |23 |doggies|    1     |  Dogs      |string|0    |string |available|200       |
|ValidUpdatePet    |/pet    |23 |Caties |    1     |  Cats      |string|0    |string |available|200       |
|ValidGetPetById   |/pet/   |23 | NULL  |   NULL   |  NULL      |NULL  |NULL |NULL   |NULL     |200       |	
|ValidDeletePetByID|/pet/   |23 | NULL  |   NULL   |  NULL      |NULL  |NULL |NULL   |NULL     |200       |
|ValidGetPetById   |/pet/   |23 | NULL  |   NULL   |  NULL      |NULL  |NULL |NULL   |NULL     |404       |	

@petApi_008 @regressionTest @regressionTestPetAPI
 Scenario Outline: This scenario verifies valid and invalid updating of pet with POST using ID, Name & Status and asserting 
 them name post valid and invalid udpates along with status code. 
 
 Given Verify <scenario> to add new pet addition at <endPoint> with <ID>, <name>, <categoryID>, <categoryName>, <pUrls>, <tagID>, <tagName>, <status> gives <statusCode>
 Then Updating pet <scenario> using post request at <endPoint> using <ID> and <name> and <status> returns <statusCode>
 Then Verify that get request for <scenario> at <endPoint> of <ID> returns name as <name> and status code as <statusCode>
 Examples:
|scenario                    |endPoint |ID  |name      |categoryID|categoryName|pUrls |tagID|tagName|status   |statusCode|
|ValidAddPet                 |/pet/    |45  |Dog 1    |    1     |  Dogs      |string|0    |string |available|200       |
|ValidGetPetByIDAndVerifyName|/pet/    |45  |Dog 1    |    1     |  Dogs      |string|0    |string |available|200       |
|ValidUpdatePet              |/pet/    |45  |Dog 2    |    1     |  Dogs      |string|0    |string |available|200       |
|ValidGetPetByIDAndVerifyName|/pet/    |45  |Dog 2    |    1     |  Dogs      |string|0    |string |available|200       |
|InValidUpdatePet            |/pet/    |500 |Tiger    |    1     |  Cat       |string|0    |string |available|404       |
|InValidGetPetByIDAndVerifyName|/pet/  |500 |Tiger    |    1     |  Cat       |string|0    |string |available|404       |


@petApi_009 @regressionTest  @regressionTestPetAPI
 Scenario Outline: This scenario verifies getting pet based on the tags in the GET request
 
 Given Verify the pet store with endpoint <endpointByTags> having tags <tags> gives statusCode as <statusCode>
 Examples:
|endpointByTags|tags           | statusCode | 
|/findByTags   |tag1,tag2,tag3 | 200        | 


# Scenarios for Store API

 @StoreApi_001  @regressionTest @regressionTestStoreAPI
 Scenario Outline: Verify GET request at store api /store/inventory returns map of statuses.
 
 Given Get request on store api at <endPoint> and gives status code as <statusCode> and returns inventories by statuses <statuses>
 Examples:
 |endPoint        |statusCode|statuses|
 |/store/inventory| 200      |approved,placed,delivered|
 
 
 @StoreApi_TC_002 @regressionTest @regressionTestStoreAPI
 Scenario Outline: Validating placing a new order with POST request
 
 Given Place an order for <scenario> using post request at <endPoint> with <id>,<petId>,<quantity>,<shipDate>,<status>,<complete> gives <statusCode>
 Examples: 
 |scenario              |endPoint     |id |petId  |quantity|shipDate                |status   |complete|statusCode|
 |ValidPlaceOrder       |/store/order |10 |198772 |7       |2022-05-28T12:26:03.267Z|approved |true    |200|
 |ValidPlaceOrder       |/store/order |11 |198773 |8       |2022-05-28T12:26:03.267Z|placed   |true    |200|
 |ValidPlaceOrder       |/store/order |12 |198774 |9       |2022-05-28T12:26:03.267Z|delivered|true    |200|
 
 
 @StoreApi_TC_003 @regressionTest @regressionTestStoreAPI
 Scenario Outline: Verifying finding purchase order based on ID in a GET request and validating response code and petID from the response 
 
 Given Verify the purchase order <scenario> at <endPoint> by <id> and assert that petId obtained is equal to <petId> and gives <statusCode>
 Examples: 
 |scenario                |endPoint     |id |petId  |statusCode|
 |ValidGetPurchaseById    |/store/order/|10 |198772 |200       |
 |InValidGetPurchaseById  |/store/order/|50 |198772 |404       |
 
 @StoreApi_TC_004 @regressionTest @regressionTestStoreAPI
 Scenario Outline:
 
 Given Delete the purchase order <scenario> at <endPoint> by <id> and verify status code obtained is <statusCode>
 Examples:
 |scenario                  |endPoint     |id  |petId  |quantity |shipDate                |status   |complete|statusCode|
 |ValidDeletePurchaseById   |/store/order/|13  |NULL   |NULL     |NULL                    |NULL     |true    |200|
 |InValidDeletePurchaseById |/store/order/|50  |NULL   |NULL     |NULL                    |NULL     |true    |200|
 
 
 @StoreApi_TC_005 @regressionTest @regressionTestStoreAPI
 Scenario Outline: Validate placing a new purchase, verifying the the purchase with ID and then deleting the purchase and then verifying again
 
 Given Place an order for <scenario> using post request at <endPoint> with <id>,<petId>,<quantity>,<shipDate>,<status>,<complete> gives <statusCode>
 Then Verify the purchase order <scenario> at <endPoint> by <id> and assert that petId obtained is equal to <petId> and gives <statusCode>
 Then Delete the purchase order <scenario> at <endPoint> by <id> and verify status code obtained is <statusCode>
 Then Verify the purchase order <scenario> at <endPoint> by <id> and assert that petId obtained is equal to <petId> and gives <statusCode>
 Examples: 
 |scenario                  |endPoint     |id  |petId  |quantity |shipDate                |status   |complete|statusCode|
 |ValidPlaceOrder           |/store/order |13  |198780 |10       |2022-05-28T12:26:03.267Z|approved |true    |200|
 |ValidGetPurchaseById      |/store/order/|13  |198780 |10       |2022-05-28T12:26:03.267Z|approved |true    |200|
 |ValidDeletePurchaseById   |/store/order/|13  |198780 |10       |2022-05-28T12:26:03.267Z|approved |true    |200|
 |InValidGetPurchaseById    |/store/order/|13  |198780 |10       |2022-05-28T12:26:03.267Z|approved |true    |404| 
 
 
#Bug is that the store inventory status is not getting updated on placing/deleting orders
 
 
################################################################################################################################## 
 

@loginuser  @regressionUserAPI
Scenario Outline: Verifying the loggin in of user using "GET" request at /user/login with different valid invalid combinaion of of username & passwords.
Given user logs into for <scenario> into the system at <endPoint> using <username> and <password> and verify <statusCode>
Examples:
|scenario      |endPoint      |username|password    |statusCode|
|ValidUserLogin|/user/login   |user1   |XXXXXXXXXXX |200       |
|InValidUserLogin|/user/login   |user1   |88374838XXX |400       |
|InValidUserLogin|/user/login   |jhd6j   |jhdfhjf     |400       |
|InValidUserLogin|/user/login   |*&^*&   |&^*&&^7     |400       |

#BUG: Getting status code 200 instead of 400 Even with invalid username or password, or with incorrect username or password
#Hence the above Invalid scenarios of login as expected to fail.

@createwithpost   @regressionUserAPI
Scenario Outline:
Given user logs into for <scenario> into the system at <endPoint> using <username> and <password> and verify <statusCode>
Then User is created as <scenario> at <endPoint> with <id>,<username>,<firstName>,<lastName>,<email>,<password>,<phone>,<userStatus> and validate status code as <statusCode>
Examples:
|scenario                   |endPoint     |id |username  |firstName|lastName  |email         |password       |phone |userStatus|statusCode|
|ValidUserLogin             |/user/login  |10 |user1     |John     |James     |sak@email.com |XXXXXXXXXXX    |12345 |1         | 200      |
|ValidUserCreationWithPOST  |/user        |10 |sake45    |John     |James     |sdfsdfdfdfddf |12345          |12345 |1         | 200      |
|InValidUserCreationWithPOST|/user        |AA |sake45    |John     |James     |sdfsdfdfdfddf |12345          |12345 |1         | 400      |
|InValidUserCreationWithPOST|/user        |5A |sake45    |John     |James     |sdfsdfdfdfddf |12345          |12345 |1         | 400      |
|ValidUserCreationWithPOST  |/user        |10 |sake45    |John     |James     |sdfsdfdfdfddf |12345          |AAS45 |1         | 200      |
|InValidUserCreationWithPOST|/user        |10 |sake45    |John     |James     |sdfsdfdfdfddf |12345          |12345 |A         | 400      |
|ValidUserCreationWithPOST  |/user        |10 |sake45    |John     |James     |^&^%&^%&^%&^f |12345          |12345 |1         | 200      |


@getuserwithusername  @regressionUserAPI
Scenario Outline: Getting user with valid and invalid cases of Username
Given Get the user with GET request as <scenario> at <endPoint> with <username> gives the status code as <statusCode>
Examples:
|scenario                 |endPoint |username   |statusCode|
|ValidGETUserWithUserName |/user/   |user1       | 200     |
|ValidGETUserWithUserName |/user/   |asdffff     | 404     |
|ValidGETUserWithUserName |/user/   |78*&^jhgd   | 400     |

#Bug: even after giving invalid values in the user name on GET /user/ we are getting 404 -user not found instead of 400.
#Therefore 1 of 3 test cases are supposed to fail for username 78*&^jhgd as it is giving 404 instead of 400



@deleteUserwithUsername  @regressionUserAPI
Scenario Outline: Verify user deletion
Then Delete the user with <scenario> at <endPoint> using <username> and validate the status code as <statusCode>
Examples: 
|scenario                    |endPoint|id |username  |firstName|lastName    |email      |password |phone|userStatus|statusCode|
|ValidDELETEUserWithUserName |/user/  |10 |saket56    |NULL     |NULL        |NULL        |NULL    |NULL |1         | 200      |

@logoutuser    @regressionUserAPI
Scenario Outline: Verifying that user is able to logout from the system by GET request at /user/logout 
Given user logout from the system in <scenario> using GET request at <endPoint> giving <statusCode>
Examples:
|scenario    |endPoint    |statusCode|
|userLogout  |/user/logout|200       |

@endtoEnd  @regressionUserAPI
Scenario Outline: Verify end end scenario of user login, new user creation, finding the user, deleting the user, then finding the user again and then loggin out. 
Given user logs into for <scenario> into the system at <endPoint> using <username> and <password> and verify <statusCode>
When User is created as <scenario> at <endPoint> with <id>,<username>,<firstName>,<lastName>,<email>,<password>,<phone>,<userStatus> and validate status code as <statusCode>
Then Get the user with GET request as <scenario> at <endPoint> with <username> gives the status code as <statusCode>
When Delete the user with <scenario> at <endPoint> using <username> and validate the status code as <statusCode>
Then Get the user with GET request as <scenario> at <endPoint> with <username> gives the status code as <statusCode>
And user logout from the system in <scenario> using GET request at <endPoint> giving <statusCode>
When User is created as <scenario> at <endPoint> with <id>,<username>,<firstName>,<lastName>,<email>,<password>,<phone>,<userStatus> and validate status code as <statusCode>
Then Get the user with GET request as <scenario> at <endPoint> with <username> gives the status code as <statusCode>
Examples:
|scenario                   |endPoint       |id   |username  |firstName|lastName  |email          |password       |phone |userStatus|statusCode|
|ValidUserLogin             |/user/login    |10   |user1     |John     |James     |sak@email.com  |XXXXXXXXXXX    |12345 |1         | 200      |
|ValidUserCreationWithPOST  |/user          |10   |saket5    |John     |James     |sak@email.com  |12345          |12345 |1         | 200      |
|ValidGETUserWithUserName   |/user/         |10   |saket5    |John     |James     |sak@email.com  |12345          |12345 |1         | 200      |
|ValidDELETEUserWithUserName|/user/         |10   |saket5    |John     |James     |sak@email.com  |12345          |12345 |1         | 200      |
|ValidGETUserWithUserName   |/user/         |10   |saket5    |John     |James     |sak@email.com  |12345          |12345 |1         | 404      |
|userLogout                 |/user/logout   |10   |user1     |John     |James     |sak@email.com  |12345          |12345 |1         | 200      |
|ValidUserCreationWithPOST  |/user          |11   |saket6    |John     |James     |sak@email.com  |12345          |12345 |1         | 200      |
|ValidGETUserWithUserName   |/user/         |11   |saket6    |John     |James     |sak@email.com  |12345          |12345 |1         | 404      |


@endtoEnd  @regressionUserAPI 
Scenario Outline: Validate that newly created user is able to login with credentials and then getting that user post deletion gives 404
Given user logs into for <scenario> into the system at <endPoint> using <username> and <password> and verify <statusCode>
Then Get the user with GET request as <scenario> at <endPoint> with <username> gives the status code as <statusCode>
When User is created as <scenario> at <endPoint> with <id>,<username>,<firstName>,<lastName>,<email>,<password>,<phone>,<userStatus> and validate status code as <statusCode>
Then Get the user with GET request as <scenario> at <endPoint> with <username> gives the status code as <statusCode>
Given user logs into for <scenario> into the system at <endPoint> using <username> and <password> and verify <statusCode>
When Delete the user with <scenario> at <endPoint> using <username> and validate the status code as <statusCode>
Then Get the user with GET request as <scenario> at <endPoint> with <username> gives the status code as <statusCode>
Examples:
|scenario                   |endPoint       |id   |username  |firstName|lastName  |email          |password       |phone |userStatus|statusCode|
|ValidUserLogin             |/user/login    |10   |user1     |John     |James     |sak@email.com  |XXXXXXXXXXX    |12345 |1         | 200      |
|ValidGETUserWithUserName   |/user/         |10   |saket5    |John     |James     |sak@email.com  |12345          |12345 |1         | 404      |
|ValidUserCreationWithPOST  |/user          |10   |saket5    |John     |James     |sak@email.com  |12345          |12345 |1         | 200      |
|ValidGETUserWithUserName   |/user/         |10   |saket5    |John     |James     |sak@email.com  |12345          |12345 |1         | 200      |
|ValidUserLogin             |/user/login    |10   |saket5    |John     |James     |sak@email.com  |12345          |12345 |1         | 200      |
|ValidDELETEUserWithUserName|/user/         |10   |saket5    |John     |James     |sak@email.com  |12345          |12345 |1         | 200      |
|ValidGETUserWithUserName   |/user/         |10   |saket5    |John     |James     |sak@email.com  |12345          |12345 |1         | 404      |


@reguser3  @bug  @regressionUserAPI
Scenario Outline: Validate that logged out user is not able to post and create new user. 
Given user logs into for <scenario> into the system at <endPoint> using <username> and <password> and verify <statusCode>
And user logout from the system in <scenario> using GET request at <endPoint> giving <statusCode>
When User is created as <scenario> at <endPoint> with <id>,<username>,<firstName>,<lastName>,<email>,<password>,<phone>,<userStatus> and validate status code as <statusCode>
Then Get the user with GET request as <scenario> at <endPoint> with <username> gives the status code as <statusCode>
Examples:
|scenario                   |endPoint       |id   |username  |firstName|lastName  |email          |password       |phone |userStatus|statusCode|
|ValidUserLogin             |/user/login    |10   |user1     |John     |James     |sak@email.com  |XXXXXXXXXXX    |12345 |1         | 200      |
|userLogout                 |/user/logout   |10   |user1     |John     |James     |sak@email.com  |12345          |12345 |1         | 200      |
|ValidUserCreationWithPOST  |/user          |10   |saket57    |John     |James     |sak@email.com  |12345          |12345 |1         | 200     |
|ValidGETUserWithUserName   |/user/         |10   |saket57    |John     |James     |sak@email.com  |12345          |12345 |1         | 404     |

#BUG: Invalid username or password should give statusCode as 400 but giving 200. (Endpoint /user/login, login with GET request)
# even when loggin out of user1, still we are able to create user with post request.

@user3 @bug @regressionUserAPI
Scenario Outline: Getting user with valid and invalid cases of Username
Given Get the user with GET request as <scenario> at <endPoint> with <username> gives the status code as <statusCode>
Examples:
|scenario                 |endPoint |username   |statusCode|
|ValidGETUserWithUserName |/user/   |saket1      | 200      |
|ValidGETUserWithUserName |/user/   |saket1      | 200      |
|ValidGETUserWithUserName |/user/   |theUser123  | 404      |
|ValidGETUserWithUserName |/user/   |&^&^&^&9@*  | 404      |

#BUG: Even after supplying invalid usernames to GET request at /user/, we are getting 404 which should have been 400.

@deleteUser @regressionUserAPI
Scenario Outline: Deleting user with username
Given User is created as <scenario> at <endPoint> with <id>,<username>,<firstName>,<lastName>,<email>,<password>,<phone>,<userStatus> and validate status code as <statusCode>
Then Delete the user with <scenario> at <endPoint> using <username> and validate the status code as <statusCode>
Examples: 
|scenario                    |endPoint|id |username  |firstName|lastName    |email          |password |phone|userStatus|statusCode|
|ValidUserCreationWithPOST   |/user   |15 |theUser15 |theUser15 |theUser15  |john5@email.com |123456   |11111|1         | 200  | 
|ValidDELETEUserWithUserName |/user/ |15 |theUser15 |theUser15 |theUser15  |john5@email.com |123456   |11111|1         | 200  |


@userlogout @regressionUserAPI
Scenario Outline: 
Given user logout from the system in <scenario> using GET request at <endPoint> giving <statusCode>
Examples:
|scenario    |endPoint    |statusCode|
|userLogout  |/user/logout|200       |


@putRequestToupdateUser  @regressionUserAPI 
Scenario Outline: Validate that newly created user is able to login with credentials and then getting that user post deletion gives 404
Given user logs into for <scenario> into the system at <endPoint> using <username> and <password> and verify <statusCode>
When User is created as <scenario> at <endPoint> with <id>,<username>,<firstName>,<lastName>,<email>,<password>,<phone>,<userStatus> and validate status code as <statusCode>
Then Get the user with GET request as <scenario> at <endPoint> with <username> gives the status code as <statusCode>
When User is updated as <scenario> at <endPoint> with <id>,<username>,<firstName>,<lastName>,<email>,<password>,<phone>,<userStatus> and validate status code as <statusCode>
Then Get the user with GET request as <scenario> at <endPoint> with <username> gives the status code as <statusCode>
Examples:

|scenario                   |endPoint       |id   |username  |firstName|lastName  |email          |password       |phone |userStatus|statusCode|
|ValidUserLogin             |/user/login    |10   |user1     |John     |James     |sak@email.com  |XXXXXXXXXXX    |12345 |1         | 200      |
|ValidUserCreationWithPOST  |/user          |10   |saket5    |John     |James     |sak@email.com  |12345          |12345 |1         | 200      |
|ValidGETUserWithUserName   |/user/         |10   |saket5    |John     |James     |sak@email.com  |12345          |12345 |1         | 200      |
|ValidUserUpdationWithPut   |/user/         |10   |saket55    |John     |James     |sak@email.com  |12345          |12345|1         | 200      |
|ValidGETUserWithUserName   |/user/         |10   |saket55    |John     |James     |sak@email.com  |12345          |12345 |1        | 200      |
|ValidUserUpdationWithPut   |/user/         |5A   |saket55    |John     |James     |sak@email.com  |12345          |12345|1         | 400      |
|ValidUserUpdationWithPut   |/user/         |10   |saket55    |John     |James     |sak@email.com  |12345          |12345|AA        | 400      |
|ValidUserUpdationWithPut   |/user/         |^&   |saket55    |John     |James     |sak@email.com  |12345          |12345|1         | 400      |
|ValidUserUpdationWithPut   |/user/         |10   |saket55    |John     |James     |irueroieroiwe  |12345          |12345|1         | 200      |





