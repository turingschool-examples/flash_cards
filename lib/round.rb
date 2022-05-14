class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turn_counter = 0
    @turns = []
  end

  def current_card
    deck.cards[@turn_counter]
  end



  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @turn_counter += 1
    return turn
  end

  def number_correct
    count_of_correct = 0
    if @answer == @guess
        count_of_correct += 1
    end
  end

  def number_correct_by_category(category)
    if category == :Geography
      1 #refactor if time
    elsif category == :STEM
      0 #refactor if time
  end

  # def percent_correct
  #
  # end

end
end
