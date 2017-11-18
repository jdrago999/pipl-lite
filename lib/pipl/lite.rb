

require 'uri'
require 'httparty'
module Pipl
  class Lite
    include HTTParty

    class NotConfiguredError < StandardError; end
    class ResponseError < StandardError; end

    base_uri 'https://api.pipl.com'
    @@configured = false

    def self.configure(key:)
      @@pipl_key = key
      @@configured = true
    end

    def self.key
      @@pipl_key
    end

    def self.reset_key!
      @@pipl_key = nil
      @@configured = false
    end

    def self.search(args={})
      raise NotConfiguredError unless @@configured
      args[:key] = key
      uri = URI(base_uri + '/search')
      uri.query = URI.encode_www_form(args)
      response = get(uri.to_s)
      case response.code
      when 200..299
        # Return the top 0-5 matches, sorted by score in descending order:
        json = JSON.parse(response.body, symbolize_names: true)
        (json.key?(:person) ? [json[:person]] : json[:possible_persons].select{ |person| person[:@match] > 0 })
          .sort_by{ |x| x[:@match] }
          .reverse[0..4] rescue []
      else
        raise ResponseError.new(response)
      end
    end
  end
end
