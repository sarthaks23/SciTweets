# SciTweets
------------
## Twitter4j.properties
A twitter4j.properties file is required for this project. The reason it's not included is because it contains sensitive information such as the accesstoken and other things that the app requires to access the twitter APIs. The file is set up as follows:
```
debug=false
oauth.consumerKey=***************************
oauth.consumerSecret=***************************
oauth.accessToken=***************************
oauth.accessTokenSecret=***************************
tweetModeExtended=true
```
It is placed right next to the pom.xml file in the main project folder.

## Next Steps
* Allow easy addition of new people (most likely by creating a user object)
* Format the tweet list view on the jsp so it doesn't look like a bunch of listed variables
