class Round
attr_reader :deck,
            :turns,
            :number_correct,
            :current_card,
            :count

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @current_card = deck.cards[0]
    @count = 0
    @correct_turn = []
  end

  def round_count
    @round_count = @count += 1
  end

  def current_card
    @current_card = deck.cards[@count]
  end

#  def take_turn(guess)
#    @take_turn(guess)
#  end
  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    if turn.correct?
      @number_correct += 1
      @correct_turn << turn
    end
    @count += 1
    @turns.last
  #  made_guesses = []
  #  @guess = guess
  #  @round.each do |round|
  #    if guess == round.guess
  #    end
  #  end
  #  return made_guesses
  end

  def number_correct_by_category(category)
    correct_categories = 0
    @correct_turn.each do |check|
      if check.card.category == category
        correct_categories += 1
      end
    end
    correct_categories
  end

  #def number_correct

#    correct_guess = []
#    if take_turn(guess) == card.answer
#      correct_guess + 1
#    end
#    return correct_guess
  #end
  def percent_correct
    ((number_correct * 100) / turns.length).to_f
  end
end
