require './lib/slack_logger/client'

module SlackLogger
  class Channel
    @@channels = []

    class << self
      def get_name(channel_id)
        name = search_name(channel_id)
        if name
          return name
        else
          @@channels = fetch_list()

          name = search_name(channel_id)
          return name
        end
      end

      private

      def search_name(channel_id)
        if channel = @@channels.find {|u| u["id"] == channel_id}
          return channel["name"]
        else
          return nil
        end
      end

      def fetch_list
        Client.instance.slack.channels_list["channels"]
      end
    end

  end
end
