require "pry"

class AmazonBooksCli::Cli
  attr_accessor :wigit
  def initialize
    @wigit = AmazonBooksCli::Book.new

  end

  def call
    puts "Welcome to Kindle daily deals."
    list
    menu
  end

  def list
    i = 0
    while i < 25
      puts "The number #{i} selection by David Foster Wallace is: " + @wigit.bookList[i + 1]
      i += 1
    end
  end

  def menu
      puts "Enter the number of the deal you would like more information on, or type list, or type exit."
      input = nil
      while input != "exit"
        input = gets.strip.downcase
        if input.to_i < 25 && input.to_i > 0
          input = input.to_i
        end
        case input
        when 0..25
          puts "More information on book #{input}." + @wigit.bookDetail(input)
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
