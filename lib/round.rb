class Round
  attr_reader :turns,
              :deck,
              :category_to_count_correct,
              :category_cards_seen,
              :category_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = 0
  end

  def take_turn(guess)
    @guess = guess
    if @current_card < @deck.cards.count
      @new_turn = Turn.new(@guess, @deck.cards[@current_card])
      @current_card += 1
      @turns.push(@new_turn)
      @new_turn
    elsif @current_card >= @deck.cards.count
      @new_turn = "****** Game Over!******"
    else
      @new_turn = "Error!!!"
    end
  end

  def current_card
    @deck.cards[@current_card]
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
    @category_correct = @category_cards_seen.count do |turn|
      turn.correct?
    end
    require "pry"; binding.pry
    @category_correct
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
