class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @number_wrong = 0
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(user_input)
    turn = Turn.new(user_input, current_card)
    if turn.correct?
      @number_correct += 1
    else
      @number_wrong += 1
    end
    @turns << turn
    turn
  end

  def number_correct
    @number_correct
  end

  def number_correct_by_category
  #
  #   # if @category == category
  #   if turn.number_correct?
  #     @number_correct == true
  #     @category += 1
  #   end
    # @category.number_correct = 0
  end
end
