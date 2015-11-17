# Twitter Test

## Decisions
For this project I'm using sferic/twitter gem to don't waste time dealing directly
with Twitters'API.
And as an app to consume Twitter API, I thought reasonable that it could only be used for someone with an Twitter account. So I configured Devise to authenticate users only on Twitter through OAuth.

For template, as I didn't have so much time, I prefered to use Bootstrap, and do just some css by myself.

For Caching, I'm using Memcached on developer and production environment. On developement just to ensure that it's working, but on production, because Heroku don't have good caching support.
On Heroku, I'm using a Memcachier's Free Tier server.

As Webserver, I choose Puma, mostly because Webrick is only for development environment because it can not deal many connections simultaneously and Puma is the webserver I've already used before.

## Local environment Setup

To setup on local env, you need to generate an `.env` file, you can rename and fill the file `.env.sample`

To run the app, I'm using Foreman, mostly because of Puma, to simulate how Heroku run the app.
You can start it with the command
```
foreman start
```

To deploy on Heroku, you need just an Addon for Memcached server. I'm using Memcachier, but there are many with free tiers.

To run the tests, you only need run
```
rspec
```

And everthing gona be Green, or Nyancat if you prefer run 

```
rspec --format NyanCatFormatter
```
