require './lib/slack_logger/client'

module SlackLogger
  class User
    @@users = []

    class << self
      def get_name(user_id)
        name = search_name(user_id)
        if name
          return name
        else
          @@users = fetch_list()

          name = search_name(user_id)
          return name
        end
      end

      private

      def search_name(user_id)
        if user = @@users.find {|u| u["id"] == user_id}
          return user["name"]
        else
          return nil
        end
      end

      def fetch_list
        Client.instance.slack.users_list["members"]
      end
    end

  end
end
