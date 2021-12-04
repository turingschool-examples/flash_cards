class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_turns = []
  end

  def current_card
    @deck.cards.first
  end

  # creates new turn, checks guess against card answer,
   # shuffles cards, returns new cards
  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    if guess == current_card.answer
      @correct_turns << new_turn
    end
    # binding.pry
    @deck.cards.rotate!
    return new_turn
  end

  def number_correct
    @correct_turns.length
  end

  def percent_correct
    number_correct.to_f / turns.length.to_f * 100
  end

  def total_correct_by_category(category)
    number = @correct_turns.select do |turn|
      category == turn.card.category
    end
    return number.length
  end

  def percent_correct_by_category(category)
    total_cards_in_category = @deck.cards_in_category(category).length.to_f
    percent_correct = (total_correct_by_category(category).to_f / total_cards_in_category) * 100
    percent_correct.ceil(2)
    # require "pry"; binding.pry
  end

end
