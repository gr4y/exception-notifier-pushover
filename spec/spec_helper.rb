require 'simplecov'
SimpleCov.start do 
  add_group 'Lib', 'lib'
  add_filter '/spec/'
end

def throw_exception(&block)
  begin
    raise "This is an intended exception"
  rescue Exception => e
    block.call(e)
  end
end

require 'support/fake_pushover'
require 'rspec'
require 'webmock/rspec'
RSpec.configure do |config|
  config.before(:each) do
    WebMock.disable_net_connect!
    stub_request(:any, /api.pushover.net/).to_rack(FakePushover)
  end
end

require 'exception_notifier/pushover_notifier'
