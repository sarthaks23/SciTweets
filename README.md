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

## Aylien.properties
This app uses Aylien for analysing link tweets. In order to use it, create and Aylien.properties file and fill in your information.
```
APP_ID=***********
KEY=**************************
```

## AdminCredentials.properties
In order to use the admin controls for this website, you need to create and AdminCredentials.properties file. The file should look like this:
```
Username=[username]
Password=[password]
```
