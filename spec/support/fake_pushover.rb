require 'sinatra/base'

class FakePushover < Sinatra::Base

  post '/1/messages.json' do 
    puts params.inspect

    result = Hash.new
    result[:status] = 1
    result[:request] = "e460545a8b333d0da2f3602aff3133d6"
    JSON.encode(result)
  end

end
