require "sinatra/base"
require "sinatra/reloader"

require "interpreter"

class TimestampSlackCommand < Sinatra::Base
  configure(:development) do
    register Sinatra::Reloader
    also_reload "app/**/*.rb"
  end

  post "/" do
    return [401, "Unauthorized"] unless params[:token] && params[:token] == ENV["SLACK_COMMAND_TOKEN"]
    Interpreter.call(params[:text])
  end
end
