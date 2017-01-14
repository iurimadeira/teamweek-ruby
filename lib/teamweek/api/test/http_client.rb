require 'httparty'

module Teamweek
  module Api
    module Test
      class HttpClient
        attr_reader :headers

        def initialize(headers = {})
          @headers = headers
        end

        def send_request(method, uri, parameters)
          response = HTTParty.send(method, uri, headers: headers, query: parameters)
          return response.parsed_response if [200, 204].include? response.code
          response
        end

        def get(uri, parameters = {})
          send_request(:get, uri, parameters)
        end

        def post(uri, parameters = {})
          send_request(:post, uri, parameters)
        end

        def patch(uri, parameters = {})
          send_request(:patch, uri, parameters)
        end

        def put(uri, parameters = {})
          send_request(:put, uri, parameters)
        end

        def delete(uri, parameters = {})
          send_request(:delete, uri, parameters)
        end
      end
    end
  end
end
