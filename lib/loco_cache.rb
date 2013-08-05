require 'singleton'

module LocoCache
  autoload :LocoBase, 'loco_cache/loco_base'

  class Configuration
    include Singleton
    
    @@defaults = {
      locomotive_engine_base: 'http://localhost:8080',
      locomotive_api_path: 'locomotive/api',
      content_path: "content_types/:slug/entries",
      redis: ""
    }

    def initialize
      @@defaults.each_pair{|k,v| self.send("#{k}=",v)}
    end

    def self.default_logger
      logger = Logger.new(STDOUT)
      logger.progname = "loco_cache"
      logger
    end

    def self.defaults
      @@defaults
    end

    def self.config
       Configuration.instance
     end

     def self.configure
       yield config
     end

     def self.logger
       config.logger
     end
  end
end
