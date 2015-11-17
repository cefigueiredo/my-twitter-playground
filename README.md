# Twitter Test

## Decisions
On that project I'm using sferic/twitter gem to don't waste time dealing directly
with Twitters'API.
As an app to consume Twitter API, I found reasonable that could be used only for when have an Twitter account. So I configured Devise to authenticate users only through OAuth.

For template, as I didn't have so much time, I prefered to use Bootstrap, and do just some css by myself.

For Caching, I'm using Memcached on developer and production environment. On developement just to test, but on production, because Heroku don't have caching built-in.
On Heroku, I'm using a Memcachier's Free Tier server.

As Webserver, I choose Puma, mostly because Webrick sucks and Puma is the webserver I alredy used before, and I like how deal with workers and threads. Even deploying it on a Herok's Free Tier.

## Local environment Setup

To setup on local env, you need to generate an `.env` file, you can rename and fill the file `.env.sample`

To run the app, I'm using Foreman, mostly because of Puma, to simulate how Heroku run the app.
You can start it with the command
```
foreman start
```

To deploy on Heroku, you need just an Addon for Memcached, I'm using Memcachier, but there are many with free tiers.

To run the tests, you only need run
```
rspec
```

And everthing gona be Green, or Nyancat if you prefer run 

```
rspec --format NyanCatFormatter
```
