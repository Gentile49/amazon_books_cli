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
      puts "The number #{i + 1} selection by David Foster Wallace is: " + @wigit.bookList[i]
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
        when 1..25
          puts "More information on book #{input}.  " + @wigit.bookDetail(input - 2)
          menu
        when "list"
          list
        when "exit"
          goodbye
        else
          puts "Not sure what you want. Type 1 - 25 for a selection, list or exit."
        end
      end
  end

  def goodbye
    puts "Thank you for stopping by."
  end
end
