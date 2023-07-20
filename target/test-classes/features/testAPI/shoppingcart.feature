Feature: Shopping Cart API

Background:
  * url 'http://localhost:8500'

Scenario: View items in the shopping cart
  Given path 'shoppingcart/items'
  And header Client-Id = 'DPE-QE'
  And configure ssl = true
  And param Type = 'Fresh'
  And param Discount = 'Applied'
  When method GET
  Then status 200


Scenario: Invalid param passed
  Given path 'shoppingcart/items'
  And header Client-Id = 'DPE-QE'
  And configure ssl = true
  And param Type = 'test'
  And param Discount = 'Applied'
  When method GET
  Then status 400



Scenario: Invalid or missing header
  Given path 'shoppingcart/items'
  And header Client-Id = 'DPE'
  And configure ssl = true
  And param Type = 'Fresh'
  And param Discount = 'Applied'
  When method GET
  Then status 401