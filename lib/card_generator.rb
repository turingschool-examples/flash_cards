require 'rspec'



class CardGenerator

  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def convert_text_file
    open = File.open(ARGV[0], 'r')
    cards_txt = open.read.readlines.map(&:chomp)
    open.close
    puts cards
  end
  


  # def 
  #   #replaces cards = [card_1, card_2, card_3]
  
  #   # map each line to a variable >> array of cards
  #   # return array of cards 
  # end
end

