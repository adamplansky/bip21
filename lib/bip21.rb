require "bip21/version"
require 'uri'



# https://github.com/bitcoin/bips/blob/master/bip-0021.mediawiki
module Bip21
  class InvalidAmountError < Exception; end

  class Bip21

    def self.decode(uri)
      raise NotImplementedError
    end

    def self.encode(currency, address, options = {})
      query = URI.encode_www_form(options)
      if(options[:amount])
        begin
          Float(options[:amount])
        rescue
          raise InvalidAmountError, "Invalid amount"
        end
      end
      "#{currency}:#{address}" + (!query.empty? ? '?' : '') + query
    end
  end

end
