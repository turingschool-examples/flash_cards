class Round
  attr_reader :deck, :turns, :correct_response

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_response = []
  end

  # shows current card
  def current_card
    @deck.cards.first
  end

  # takes argument for user to answer question. Compares user response with card answer.
  # gives feedback for response and moves deck to the next card
  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    if current_card.answer == guess
      @correct_response << current_card
    end
    @turns << new_turn
    deck.rotate
    new_turn
  end

  # returns number of correct responses
  def number_correct
    @correct_response.size
  end

  # analyze number of correct responses vs card category
  def number_correct_by_category(card_category)
    correct_by_category = []
    @correct_response.each do |guess|
      if card_category == guess.category
        correct_by_category << guess
      end
    end
    correct_by_category.size
  end

  # returns percentage of correct responses. Able to return different response
  # if no turns have been taken.
  def percent_correct
    return ((@correct_response.size.fdiv(@turns.size)) * 100) if turns.size > 0
    "You haven't taken any turns yet."
  end

  # analyze percentage of correct responses vs card category
  # able to avoid 'divide by 0' errors  
  def percent_correct_by_category(card_category)
    used_card_categories = []
    deck.used_cards.each do |card|
      used_card_categories << card if card.category == (card_category)
    end
    return (number_correct_by_category(card_category).fdiv(used_card_categories.count) * 100) if used_card_categories.count > 0
    "0"
  end
end
