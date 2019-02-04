# Rails CMS

This project models a Media reviews domain with User registration, authentication, third party identity integration, and the following relationships:  

![Model of Database](https://cdn.buttercms.com/0p3WydW7TSez9lsOW9Do)

## Installation

Clone the repo and install dependencies

```bash
$ git clone https://github.com/endotnick/media-reviews.git
$ bundle install
```

Migrate and Seed dev DB:

```bash
$ rake db:migrate
$ rake db:seed
```

[Omniauth](https://github.com/omniauth/omniauth) integration is handled through the setting of the following environment variables:

`TWITTER_KEY`, `TWITTER_SECRET`  
`GOOGLE_KEY`, `GOOGLE_SECRET`  
`FACEBOOK_KEY`, `FACEBOOK_SECRET`  

Either set the environment variables on your system, or add to a `.env` file at the root of the project. The [dotenv](https://github.com/bkeepers/dotenv) gem is included in development and should automatically pick up your `.env` file.

## Development

After installation, run 

```bash
$ thin start --ssl
```
to launch the dev server.   
The app should be running on `localhost:3000` by default


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/endotnick/media-reviews. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The code is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the media-reviews project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/endotnick/media-reviews/blob/master/CODE_OF_CONDUCT.md).
