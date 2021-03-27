require './lib/turn'

class Round
  attr_reader :deck, :current_card, :number_correct, :turns

  def initialize(deck)
    @deck = deck
    @current_card = @deck.cards.first
    @current_card_index = 0
    @turns = []
    @number_correct = 0
  end

  def take_turn(guess)

    return nil if @current_card == nil

    new_turn = Turn.new(guess, @current_card)
    @turns << new_turn

    guess_is_correct = new_turn.correct?

    @number_correct += 1 if guess_is_correct
    category = @current_card.category

    @current_card_index += 1
    @current_card = @deck.cards[@current_card_index]

    return new_turn
  end

  def number_correct_by_category(category)
    number_of_correct_cards = 0
    @turns.each do |turn|
      number_of_correct_cards += 1 if turn.correct? and turn.card.category == category
    end
    number_of_correct_cards
  end

  def percent_correct
    (@number_correct / @deck.count.to_f) * 100.0
  end

  def percent_correct_by_category(category)
    number_of_correct_cards = number_correct_by_category(category)

    total_cards = @deck.cards_in_category(category).length.to_f

    (number_of_correct_cards / total_cards) * 100.0
  end

end
