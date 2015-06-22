require 'spec_helper'

describe "Bot" do
  before do
    allow(SlackLogger::User).to receive(:get_name).and_return("user1")
    allow(SlackLogger::Channel).to receive(:get_name).and_return("channel1")
  end

  let(:logbot) { SlackLogger::Bot.new }

  describe "for_user" do
    let(:data_user) do
      {"type"=>"message", "channel"=>"ccc", "user"=>"uuu",
       "text"=>"あああ", "ts"=>"1434701526.000022", "team"=>"ttt"}
    end

    let(:data_user_parsed) do
      {:ts=>"2015-06-19T17:12:06+09:00", :user_id=>"uuu", :user_name=>"user1",
       :channel_id=>"ccc", :channel_name=>"channel1", :text=>"あああ"}
    end

    it "valid data" do
      expect(logbot.__send__(:for_user, data_user)).to eq data_user_parsed
    end
  end

  # describe "for_bot" do
  #   let(:data_bot) do
  #     {"text"=>"あああ", "username"=>"botbot", "bot_id"=>"bbb",
  #      "icons"=>{"emoji"=>":jenkins:"}, "type"=>"message", "subtype"=>"bot_message",
  #      "channel"=>"ccc", "ts"=> "1434700803.007719"}
  #   end
  #
  #   let(:data_bot_parsed) do
  #     {:ts=>"2015-06-19T17:00:03+09:00", :user_id=>"bbb", :user_name=>"botbot",
  #      :channel_id=>"ccc", :channel_name=>"channel1", :text=>"あああ"}
  #   end
  #
  #   it "valid data" do
  #     expect(logbot.__send__(:for_bot, data_bot)).to eq data_bot_parsed
  #   end
  # end
  #
  # describe "for_url" do
  #   let(:data_url) do
  #     {"type"=>"message", "message"=>{"type"=>"message", "user"=>"U03N72GKW", "text"=>"<https://github.com/github/hubot>", "attachments"=>[{"service_name"=>"GitHub", "title"=>"github/hubot", "title_link"=>"https://github.com/github/hubot", "text"=>"hubot - A customizable life embetterment robot.", "fallback"=>"GitHub: github/hubot", "thumb_url"=>"https://avatars1.githubusercontent.com/u/9919?v=3&s=400", "from_url"=>"https://github.com/github/hubot", "thumb_width"=>400, "thumb_height"=>400, "id"=>1}], "ts"=>"1434898608.000022"}, "subtype"=>"message_changed", "hidden"=>true, "channel"=>"C03N72GLY", "event_ts"=>"1434898609.567608", "ts"=>"1434898609.000023"}
  #   end
  #
  #   let(:data_url_parsed) do
  #     {:ts=>"2015-06-21T23:56:48+09:00", :user_id=>"U03N72GKW", :user_name=>"tron", :channel_id=>"C03N72GLY", :channel_name=>"general", :text=>"github/hubot hubot - A customizable life embetterment robot."}
  #   end
  #
  #   it "valid data" do
  #     expect(logbot.__send__(:for_url, data_url)).to eq data_url_parsed
  #   end
  # end

end
