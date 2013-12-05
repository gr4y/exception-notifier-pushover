require 'httparty'

module ExceptionNotifier
  class PushoverNotifier

    attr_accessor :api_token, :url, :logger
    attr_accessor :default_options

    def initialize(options)
      @api_token = options.delete(:api_token)
      @url = options.delete(:url)
      @logger = options.delete(:logger)
      @default_options = options
    end

    def call(exception, options={})
      return if !is_active?
      server = ::Socket.gethostname
      options = options.merge(@default_options)
      message = "#{server}: A new exception occured: #{exception.message} on #{exception.backtrace.first}"
      options[:users].each do |user_token|
        response = send(user_token, message)
        if response.code == 200 && response.parsed_response[:status]
          @logger.error("Can't send notification to user with token #{user_token}") if defined?(@logger)
        end
      end
    end

    private
    def send(user_token, message)
      options = { :body => { :token => @api_token, :user => user_token, :message => message } }
      ::HTTParty.post(@url, options)
    end

    def is_active?
      !@api_token.empty? && !@url.empty?
    end

  end
end
