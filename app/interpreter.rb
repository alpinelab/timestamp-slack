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
    when /^projects/i     then display TimestampAPI::Project.all
    when /^clients/i      then display TimestampAPI::Client.all
    when /^tasks/i        then display TimestampAPI::Task.all
    when /^time_entries/i then display TimestampAPI::TimeEntry.all
    when /^users/i        then display TimestampAPI::User.all
    when /^help/i         then "Available\ commands: `projects`, `clients`, `tasks`, `time_entries`, `users`, `help`"
    else "Unknown command"
    end + "\n"
  end

  private

  def display(object)
    case object
    when Array                   then object.map{ |item| display(item) }.join("\n")
    when TimestampAPI::Project   then "[#{object.id}] `#{object.name}` | client `#{object.client.name}` (#{object.client.id})"
    when TimestampAPI::Client    then "[#{object.id}] `#{object.name}`"
    when TimestampAPI::Task      then "[#{object.id}] `#{object.name}` | project `#{object.project.name}` (#{object.project.id})"
    when TimestampAPI::TimeEntry then "[#{object.id}] `#{object.minutes}min` | user: #{object.user.full_name} (#{object.user.id}) | project: #{object.project.name} (#{object.project.id})"
    when TimestampAPI::User      then "[#{object.id}] `#{object.full_name}`"
    else object.to_s
    end
  end
end
