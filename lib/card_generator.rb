require 'rspec'

class CardGenerator

  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def convert_text_file
    # this method should open the text file 
    card_file = File.open(ARGV[0], 'r')
    #uploads the card.txt files 
    cards_txt = #should split the text by the commas
    #and runs 
    open.close
    puts cards
  end

  # def 
  #   #replaces cards = [card_1, card_2, card_3]
  #   # map each line to a variable >> array of cards
  #   # return array of cards 
  # end
end

