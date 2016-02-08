class Interpreter
  def self.call(command)
    case command
    when /^Hi/ then "Hi there :wave::skin-tone-4:"
    else "Unknown command"
    end
  end
end
