# Marvel Api test by Anderson de Vasconcelos Sant'Ana

## Summary
- [Resume](#resume)
- [Dependencies](#dependencies)
- [Running](#running)
- [Contribute](#contribute)

## Resume
This is a test project. The goal is to use the Public Marvel API, in client-side, validating the return of endpoints.
This project uses:
* Airborne(RSpec driven API testing framework)
* Rubocop(Ruby static code analyzer and code formatter.)
* dotenv(to load environment variables from .env)

## Dependencies
* Ruby 2.5.1
* Docker

## Running
* Before everything, take your own Marvel api-key: https://developer.marvel.com/signup
* copy `.env-example` to a new file, named: `.env` and populate `PUBLIC_KEY` and `PRIVATE_KEY` with your keys.
* With docker, only run: `docker build .`
* Without docker, first install gems: `bundle install`, then: `rspec`

## Contribute
* First, always run 'rubocop' when you make any changes
* Commit, and be happy