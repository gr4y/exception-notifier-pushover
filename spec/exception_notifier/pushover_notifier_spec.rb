require 'spec_helper'
require 'logger'

describe ExceptionNotifier::PushoverNotifier do

  let(:options) do
    { :url => 'https://api.pushover.net/1/messags.json', :logger => ::Logger.new(STDOUT),
    :api_token => '123456789', :users => ['abcdefgh', 'ijklmnp'] }
  end

  subject(:notifier) { ExceptionNotifier::PushoverNotifier.new(options) }
  it 'has to respond to call method' do
    expect(notifier).to respond_to(:call)
  end

  it 'has sent a message cause an exception was thrown' do 
    throw_exception do |e| 
      notifier.call(e)
    end
  end

end
