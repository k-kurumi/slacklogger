require 'singleton'

module SlackLogger
  class Config
    include Singleton

    def initialize
      @config = {}
    end

    def set(hash)
      @config = hash
    end

    def get(key)
      @config[key]
    end

    def get_all
      @config
    end

  end
end
