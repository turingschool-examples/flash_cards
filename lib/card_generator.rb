require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

class CardGenerator
  attr_accessor :filename, :cards
  def initialize(filename)
    # @filename = "cards.txt"
    file = File.new(filename)
    questions_array = file.readlines

    card = Card.new("","","")
    cards_for_deck = []

    questions_array.each do |element|
      # each time it runs - initialize card
      card = Card.new("","","")
      # add question, answer, category
      card_array = []
      card_array = element.split(',')
      # require "pry"; binding.pry
      card.question = card_array[0]
      card.answer = card_array[1]
      card.category = card_array[2]
      # deck << card
      cards_for_deck << card
    end
    return deck = Deck.new(cards_for_deck)
    # require "pry"; binding.pry
  end


end
