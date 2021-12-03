class Round
  attr_reader :deck, :turns, :correct_guesses

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_guesses = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    if current_card.answer == guess
      @correct_guesses << current_card
    end
    @turns << new_turn
    deck.rotate
    new_turn
  end

  def number_correct
    @correct_guesses.size
  end

  def number_correct_by_category(card_category)
    correct_by_category = []
    @correct_guesses.each do |guess|
      if card_category == guess.category
        correct_by_category << guess
      end
    end
    correct_by_category.size
  end

  def percent_correct
    return ((@correct_guesses.size.fdiv(@turns.size)) * 100) if turns.size > 0
    "You haven't taken any turns yet."
  end

  def percent_correct_by_category(card_category)
    correct_by_category = []
    percent_by_category = []
    @correct_guesses.each do |guess|
      if card_category == guess.category
        correct_by_category << guess
      end
    end
    correct_by_category.each do |correct_turn|
      if card_category == correct_turn.category
        percent_by_category << correct_turn
      end
    end
    return (percent_by_category.size.fdiv(@correct_guesses.size) * 100) if correct_guesses.size > 0
    "0"
  end
end
