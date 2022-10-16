require './lib/card'

class CardGenerator
  attr_reader :txt_cards, :filename
  filename = File.open("cards.txt")

  def initialize(filename)
    @filename = File.open(filename)
    @questions = []
    @txt_cards = File.open("cards.txt").readlines()
  end

end
