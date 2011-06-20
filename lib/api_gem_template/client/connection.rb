require 'faraday_middleware'

module ApiGemTemplate
  class Client
    module Connection
      private

      def connection
        Faraday.new(:url => 'http://ogdi.cloudapp.net/v1/') do |connection|
          connection.use Faraday::Request::UrlEncoded
          connection.use Faraday::Response::RaiseError
          connection.use Faraday::Response::Rashify
          #connection.use Faraday::Response::ParseXml
          connection.use Faraday::Response::ParseJson
          connection.adapter(Faraday.default_adapter)
        end
      end
    end
  end
end
