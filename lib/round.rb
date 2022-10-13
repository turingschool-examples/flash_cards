require './lib/turn'

class Round
  attr_reader :deck
  attr_accessor :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.shift
    turn
  end

  def number_correct
    @turns.count {|turn| turn.correct?}

    # @turns.count do |turn|
    #   turn.correct?
    # end

    # correct_count = 0
    # @turns.each do |turn|
    #   if turn.correct?
    #     correct_count += 1
    #   end
    # end
    # correct_count
  end

end
