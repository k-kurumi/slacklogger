require 'spec_helper'

describe "User" do
  before do
    allow(SlackLogger::User).to receive(:fetch_list).and_return([
      {"id" => "id1", "name" => "aaa"},
      {"id" => "id2", "name" => "bbb"},
    ])
  end

  describe "get name" do
    it "found" do
      expect(SlackLogger::User.get_name("id1")).to eq "aaa"
      expect(SlackLogger::User.get_name("id2")).to eq "bbb"
    end

    it "not found" do
      expect(SlackLogger::User.get_name("idxx")).to eq nil
      expect(SlackLogger::User.get_name("idyy")).to eq nil
    end
  end

end
