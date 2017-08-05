class AmazonBooksCli::Cli
  def call
    puts "Welcome to Kindle daily deals."
    list
    menu
    goodbye
  end

  def list
  end

  def menu
      puts "Enter the number of the deal you would like more information on, or type list, or type exit."
      input = nil
      while input != "exit"
        input = gets.strip.downcase
        case input
        when "1"
          puts "More information on book one."
        when "2"
          puts "More information on book two"
        when "list"
          list
        when "exit"
          goodbye
        end
      end
  end

  def goodbye
    puts "Thank you for stopping by."
  end
end
