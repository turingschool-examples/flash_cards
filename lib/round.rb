class Round
  attr_reader :deck, :turns, :count
  def initialize(deck)
    @deck = deck
    @turns = []
    @count = 0
  end
  def current_card
    @deck.cards.first
  end

    def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @deck.cards.shift
    @turns.last
    end
    def number_correct
      @turns.find_all do |turn|
      return @count+1 if turn.correct?
      end
    end
end

# the_current_card = deck.cards.each.with_index do |card, |
# next_card = deck.cards[index+1]
# return counter + next_card
  #require 'pry'; binding.pry
