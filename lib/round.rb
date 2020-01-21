require_relative 'deck.rb'
require_relative 'turn.rb'


class Round

  attr_accessor :deck, :turns, :current_card
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
    @turns_correct = []

  end

  def take_turn(guess)
    turn = Turn.new(guess, @current_card)
    @turns << turn
    if turn.guess == @current_card.answer
      @turns_correct << turn
    end
    @deck.cards.shift
    @current_card = @deck.cards[0]

    turn
  end

  def number_correct
    @turns_correct.size
  end

  def number_correct_by_category(category)
     return 0 if @turns_correct.none? {|turn| turn.card.category == category}
     cat = @turns_correct.select {|turn| turn.card.category == category}
     cat.size
  end

end
