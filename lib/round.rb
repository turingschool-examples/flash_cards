#~/round.rb
class Round
  attr_reader :deck, :turns, :count, :correct_tally

  def initialize(deck)
    @deck = deck
    @turns = []
    @count = 1
    @correct_tally = 0
  end

  def current_card
    @deck.cards[@count - 1]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    number_correct
    @count += 1
    @turns.last
  end

  def number_correct
    if @turns.last.correct? == true
      @correct_tally += 1
    end
  end

  
end
