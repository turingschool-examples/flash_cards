require './cards.txt'

require "pry"; binding.pry

class CardGenerator

  def initialize(filename)
    
  end

  cards_txt_string = cards.txt
  questions_array = []
  cards_txt_string.split("\n") << questions_array

end
