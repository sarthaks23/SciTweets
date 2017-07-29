# SciTweets
------------
Find the site on <a href="http://www.scitweets.com">scitweets.com</a>

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
It is placed in the resources folder.

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
This file can be placed next to the Aylien.properties file in the resources folder with the Filter.txt

## DBCredentials.properties
This file is included in github. However, you will need to change your username and password as well as the db url to match whatever you have setup.

## Setting up the database
To work properly, a database is required. This webapp uses a MySQL 5.1.13 driver. The following SQL code should set up the tables properly.
```
CREATE TABLE handles (name VARCHAR(50), username VARCHAR(50));
CREATE TABLE linkcache (url VARCHAR(300), summary TEXT);
```
If you decide to change the names of these tables, you will need to modify the DBConnect class.

## Modifying the filter
An easy way to change the bahaviour of this webapp is to modify the wordlist contained in Filter.txt. By adding words to it, the filter will become better and more accurate. Of course, there are other ways of filtering the tweets that are probably much better, but for now, changing the Filter.txt file is the easiest way to improve the filter itself without having to completely rewrite the whole thing.
