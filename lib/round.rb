require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :turns,
              :deck

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = 0
  end

  def take_turn(guess)
    @guess = guess
    if @current_card < @deck.cards.count
      @new_turn = Turn.new(@guess, @deck.cards[@current_card])
      @turns.push(@new_turn)
      @new_turn
    elsif @current_card >= @deck.cards.count
      "****** Game Over!******"
    else
      "Error!!!"
    end
    @current_card =+ 1
  end

  def current_card
    @deck.cards[@current_card]
  end

  def cards_in_category(catagory_to_check)
    @turns.count do |turn|
      turn.card.category == catagory_to_check
    end
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category_to_count_correct)
    @category_to_count_correct = category_to_count_correct
    @category_cards_seen = turns.select do |turn|
      turn.card.category == @category_to_count_correct
    end
    @category_cards_seen.count do |turn|
      turn.correct?
    end
  end

  def percent_correct
    @turns_guess_correct = @turns.count { |turn| turn.correct?}
    @turns_taken = @turns.count
    (@turns_guess_correct / @turns_taken) * 100
  end

  def percent_correct_by_category(catagory_percent_check)
    # @catagory_percent_check = catagory_percent_check
    # @category_turn_deck = Deck.new(@turns)
    # @category_percent_correct = @category_turn_deck.cards_in_category(@catagory_percent_check)
    # @category_correct = @category_percent_correct.count do |turn|
    #   turn.correct?
    # end
    # @category_total = @category_turn_deck.count
    # @category_percent_correct = (@category_correct / @category_total) * 100
  end
end
