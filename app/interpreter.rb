class Interpreter
  attr_reader :command

  def initialize(command)
    @command = command
  end

  def self.call(command)
    new(command).call
  end

  def call
    case command
    when /^hi/i           then "Hi there :wave::skin-tone-4:"
    when /^projects/i     then model_list TimestampAPI::Project.all
    when /^clients/i      then model_list TimestampAPI::Client.all
    when /^tasks/i        then model_list TimestampAPI::Task.all
    when /^time_entries/i then model_list TimestampAPI::TimeEntry.all
    when /^users/i        then model_list TimestampAPI::User.all
    when /^help/i         then "Available\ commands:\n" + raw_list(%w{projects clients tasks time_entries users help})
    else "Unknown command"
    end + "\n"
  end

  private

  def raw_list(string_array)
    string_array.map{ |line| "* #{line}" }.join("\n")
  end

  def model_list(model_array)
    raw_list model_array.map{ |model| display(model) }
  end

  def display(model)
    case model
    when TimestampAPI::Project   then "[#{model.id}] `#{model.name}` | client `#{model.client.name}` (#{model.client.id})"
    when TimestampAPI::Client    then "[#{model.id}] `#{model.name}`"
    when TimestampAPI::Task      then "[#{model.id}] `#{model.name}` | project `#{model.project.name}` (#{model.project.id})"
    when TimestampAPI::TimeEntry then "[#{model.id}] #{model.minutes}min | user: #{model.user.full_name} (#{model.user.id}) | project: #{model.project.name} (#{model.project.id})"
    when TimestampAPI::User      then "[#{model.id}] #{model.full_name}"
    end
  end
end
