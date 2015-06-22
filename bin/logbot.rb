require './lib/slack_logger/bot'
require './lib/slack_logger/config'

SlackLogger::Config.instance.set(
  {
    slack_token:  ENV['SLACK_TOKEN'],
    fluentd_host: ENV['FLUENTD_HOST'],
    fluentd_port: ENV['FLUENTD_PORT'],
    fluentd_tag:  ENV['FLUENTD_TAG'],
  }
)

logger = SlackLogger::Bot.new
logger.exec
