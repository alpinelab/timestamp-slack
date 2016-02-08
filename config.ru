$LOAD_PATH.unshift("#{File.expand_path(File.dirname(__FILE__))}/app/")

require "timestamp_slack_command"

run TimestampSlackCommand.new
