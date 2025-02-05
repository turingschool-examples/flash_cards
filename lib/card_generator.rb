require './lib/card'

class CardGenerator
  def initialize(filename) # filename string for the file/path looks like "./cards.txt"
    @filename = filename
  end

  def cards
    File.open(@filename).map do |line| # open the file and map over each line
      question, answer, category, hint = line.chomp.split(',') # split the line into question, answer, and category
      Card.new(question, answer, category.to_sym, hint) # create a new card
    end
  end
end

# also side note the file opening/editing/reading stuff is super similar to javascript so i enjoyed this part.