require 'httparty'
module LocoCache
  module LocoBase
    def self.included(base) 
      base.extend ClassMethods
    end

    module ClassMethods
      def find(item_id)

      end

    end 
  end
end