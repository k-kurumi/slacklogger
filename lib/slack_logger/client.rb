require 'slack'
require 'singleton'

require './lib/slack_logger/config'

module SlackLogger
  class Client
    include Singleton

    def initialize
      Slack.configure do |config|
        config.token = Config.instance.get(:slack_token)
      end
      auth = Slack.auth_test
      fail auth['error'] unless auth['ok']
    end

    def slack
      Slack
    end

  end
end
