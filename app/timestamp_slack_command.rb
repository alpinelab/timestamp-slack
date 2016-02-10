require "sinatra/base"
require "sinatra/reloader"
require "colorize"

require "timestamp_api"
TimestampAPI.verbose = true

require "interpreter"

class TimestampSlackCommand < Sinatra::Base
  configure(:development) do
    register Sinatra::Reloader
    also_reload "app/**/*.rb"
  end

  post "/" do
    return [401, "Unauthorized"] unless params[:token] && params[:token] == ENV["SLACK_COMMAND_TOKEN"]
    puts "Interpreting command #{params[:text].colorize(:green)} from #{"@".concat(params[:user_name]).colorize(:blue)}"
    Interpreter.call(params[:text])
  end
end
