# timestamp-slack

This is a simple [Heroku](https://www.heroku.com)-deployable [Sinatra](http://www.sinatrarb.com) app to interact with [Timestamp](http://www.timestamphq.com) from [Slack](https://slack.com).

## Deployment

To deploy this app to Heroku:

1. Create a Heroku app: `heroku create YOUR_APP_NAME`
2. Configure a Slack command to POST to the previously created app (`https://YOUR_APP_NAME.herokuapp.com`)
3. Configure the Heroku app with the Slack command token: `heroku config:set SLACK_COMMAND_TOKEN=12345 -a YOUR_APP_NAME`

## Usage

In Slack, enter `/timestamp Hi there`.
It should greet back :smiley:

## License

This code is distributed by [Alpine Lab](http://www.alpine-lab.com) under the terms of the MIT license.

See [LICENCE.md](https://github.com/alpinelab/timestamp-slack/blob/develop/LICENSE.md)
