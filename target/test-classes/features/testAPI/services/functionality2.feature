@jira-456 @functionality2 @testAPI
Feature: Feature 2

  Background:
    * url host
    * configure headers = {header1: 'Testing'}

  @test3
  Scenario: [TESTRAIL_TESTCASE_ID]- Check Application Status for a new wiired customer
    #* configure retry = { count: 5, interval: 10000 }
    Given path '/abc/' + a + '/testEndPoint'
    When method get
    Then status 200

    # Read response attributes
    * def a = response.data.a
    * def RESPONSE_ATTRIBUTE_1 = "/abc/" + a + "/xyz"
    * def RESPONSE_ATTRIBUTE_2 = "/def/" + a + "/mno"
    * def RESPONSE_ATTRIBUTE_3 = "/abc/" + a + "/test/sample"
    * def RESPONSE_ATTRIBUTE_4 = "/abc/" + a + "/sample"
    * def date = response.data.attributes.date

    # Read respective schema and response payloads from /schema/functionality1.json
    * def responseSchema = read ('./schema/functionality2.json')

    # match schema as per the API contract
    * match response == '#(responseSchema)'

    # remove certain attribute from matching
    * remove response.data.attributes.date

    # Read respective schema and response payloads from /schema/functionality1.json
    * def res = read ('./schema/functionality2Response.json')

    # match response
    * match response == '#(res)'