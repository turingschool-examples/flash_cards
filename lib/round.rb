class Round
  attr_reader :deck, :turns, :current_card, :number_correct, :number_wrong

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards[0]
    @number_correct = 0
    @number_wrong = 0
  end

  def take_turn(guess)
    x = Turn.new(guess, current_card)
    if x.correct?
      @number_correct += 1
    elsif
      @number_wrong += 1
    end
    @turns << x
    @current_card = deck.cards[+1]
    @turns.last
  end

  def number_number_correct_by_category(category)
  end
end


# def take_turn(guess)
#   @turns << Turn.new(guess, current_card)
#   if turns.correct?
#     @number_correct += 1
#   elsif @number_wrong += 1
#   end
#   @turns.last
# end
