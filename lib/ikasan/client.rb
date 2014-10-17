require 'uri'
require 'net/https'

module Ikasan
  class Client
    def initialize(host, port = 4979, ssl: false, verify_ssl: false, ca_file: nil)
      @host = host
      @port = port
      @ssl = ssl
      @verify_ssl = verify_ssl
      @ca_file = ca_file
    end

    def notice(channel, message, color: nil, message_format: nil)
      http_post_request('notice', channel: channel, message: message, color: color, message_format: message_format)
    end

    def privmsg(channel, message, color: nil, message_format: nil)
      http_post_request('privmsg', channel: channel, message: message, color: color, message_format: message_format)
    end

    private

    def http
      http = Net::HTTP.new(@host, @port)

      if @ssl
        http.use_ssl = true

        if @verify_ssl
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          http.ca_file = @ca_file if @ca_file
        else
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        end
      end

      http
    end

    def http_post_request(method, params)
      request = Net::HTTP::Post.new('/' + method)
      request.set_form_data(params)
      http.request(request)
    end
  end
end
