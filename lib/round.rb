require './lib/deck'

class Round
  attr_reader :deck, :current_card, :turns

  def initialize(deck)
    @deck = deck
    @current_card = deck.cards[0]
    @turns = Array.new
    @categories = Array.new
  end

  def advance_turn
    # Discards the top card in the deck
    @deck.cards.shift
    # Sets the current card to the new top card in the deck
    @current_card = deck.cards[0]
  end

  def store_turn
    # Storing the current turn in the array for all turns
    @turns << @turn
  end

  def take_turn(guess)
    # Create a new Turn object with parameters for a guess and a card
    @turn = Turn.new(guess, current_card)
    store_turn
    advance_turn
    @turn
  end

  def number_correct
    correct_cards = Array.new
    @turns.each do |turn|
      if turn.correct?
        correct_cards << turn
      else
      end
    end
      correct_cards.count
  end

  def number_correct_by_category(category)
    @turns.find_all { |turn| turn.correct? && turn.card.category == category}.count
  end

  def percent_correct
    (number_correct / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category) / @turns.find_all{ |turn| turn.card.category == category}.count.to_f) * 100
  end

  def identify_all_categories
    @categories = @turns.map { |turn| turn.card.category}
  end
end
