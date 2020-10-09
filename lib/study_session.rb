class StudySession
  require './lib/card'
  require './lib/turn'
  require './lib/deck'
  require './lib/round'

  attr_reader :card_1,
              :card_2,
              :card_3,
              :card_4,
              :card_5,
              :cards,
              :deck,
              :round

  def initialize
    @card_1 = Card.new('How do you say "fish" in German?', 'fisch', :German)
    @card_2 = Card.new('How do you say "market" in German?', 'markt', :German)
    @card_3 = Card.new('How do you say "space" in Spanish?', 'espacio', :Spanish)
    @card_4 = Card.new('How do you say "village" in Spanish?', 'aldeano', :Spanish)
    @card_5 = Card.new('How do you say "pudding" in Portuguese?', 'pudim', :Portuguese)
    @cards = [@card_1, @card_2, @card_3, @card_4, @card_5]
    @deck = Deck.new(cards)
    @round = Round.new(deck)
  end
end
