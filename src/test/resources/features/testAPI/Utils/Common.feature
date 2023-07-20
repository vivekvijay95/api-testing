Feature: Common utilities
Scenario: Common functions

  * def pause =
  """
    function () {
      java.lang.Thread.sleep(20000);
    }
  """

  * def uuid =
  """
    function () {
     return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
     });
    }
  """

* def random =
  """
    function() {
      return  Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15);
    }
  """

* def encoded =
  """
    function (creds) {
      var temp = creds;
      var Base64 = Java.type('java.util.Base64');
      var encoded = Base64.getEncoder().encodeToString(temp.bytes);
      return  encoded;
    }
  """

* def randomNumber =
  """
    function(number) {
      return Math.round( Math.floor((Math.random() * 10000000) + 1));
    }
  """

  * def getTopFiveNames =
  """
     function(x) {
        if(x.length > 5){
           x = x.slice(0, 5);
        }
        return x;
     }
  """

