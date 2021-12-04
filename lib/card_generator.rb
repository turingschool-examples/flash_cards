require 'pry'

class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end
  
  def cards
    file.map { |line|
      question, answer, category = line.split(",")
      Card.new(question, answer, category)
    }
  end

  def file
    File.open("./lib/#{filename}", "r")
  end
end
