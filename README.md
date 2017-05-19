# SciTweets
------------
## Twitter4j.properties
A twitter4j.properties file is required for this project. The reason it's not included is because it contains sensitive information such as the accesstoken and other things that the app requires to access the twitter APIs. The file is set up as follows:

   debug=false
   oauth.consumerKey=**************
   oauth.consumerSecret=********************************************
   oauth.accessToken=********************************************
   oauth.accessTokenSecret=***************************************
   tweetModeExtended=true

It can go in the main folder right where the pom.xml file is located.
------------
##Next Step
*Allow easier customizability for adding names to the list
*Format tweets to display properly instead of being in a raw array
