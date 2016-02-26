# Infractores

Infractores is a tool that lets anyone with a Twitter account report an infraction using a tweet.

The infractions are recorded and placed in a map along with the evidence supporting the report.

## Considerations

The project uses a Twitter application to find the tweets that describe an infraction. It also uses Amazon Web Services to store the evidence related to the infraction.

### Requirements

* Postgres 9.4.1+
* Redis 3.0.1+
* Ruby 2.2.1

## Setup

### Setup your environment

    cp .env.sample .env

You will **need** to enter your AWS and Twitter credentials in this file.

### Setup your database

    rake db:create db:migrate

### Get infractions from Twitter

    rake twitter:download_tweets

This task will download all the mentions for the user associated with the Twitter credentials and this hashtag: [#InfractoresBA](https://twitter.com/hashtag/infractoresba?f=tweets&src=hash)

## Start

    foreman start

This will start the Rails server and a Sidekiq worker to process the tweets.

## License

See: [MIT License](LICENSE). 
