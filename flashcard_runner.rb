  require './lib/card'
  require './lib/turn'
  require './lib/deck'
  require './lib/round'
  require 'pry'

class Play_Game

    def initialize
      @card_1 = Card.new("Question: 1 + 1 = ?", "2", :Math)
      @card_2 = Card.new("Question: 1 + 2 = ?", "3", :Math)
      @card_3 = Card.new("Question: What food do I like to eat now?", "Humus", :Food)
      @card_4 = Card.new("Question: What other food do I like to eat now?", "Grapes", :Food)
      @cards = [@card_1, @card_2, @card_3, @card_4]
      @deck = Deck.new(@cards)
      @round = Round.new(@deck)
      @round_number = 0
    end

  def start
    puts "Welcome! You're playing with #{@deck.count} cards."
    50.times {print "-"}
  end


end

  game = Play_Game.new
  game.start
