class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    # take_turn takes a guess
    new_turn = Turn.new(guess, self.current_card)
    @turns << new_turn
    deck.cards.rotate!
    new_turn
    # want to return last method called
  end

  def number_correct
    # because the first question, answer, and category matched the guess, we have 1 correct
    @turns.find_all do |turn|
    turn.correct?
    end.count
    # find_all creates an array, the ".length" is counting the number of elements in the array
  end

  def number_correct_by_category(category)
    @turns.find_all do |turn|
    turn.card.category == category && turn.correct?
  end.count
  end

  def percent_correct
    (number_correct * 100.0) / (turns.count)
  end

  def percent_correct_by_category(category)
    total_cards_in_category = @turns.find_all do |turn|
      turn.card.category == category
    end.count
    (number_correct_by_category(category) * 100.0) / total_cards_in_category

    end
  end
