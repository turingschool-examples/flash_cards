class Round
  attr_reader :deck,
    :turns,
    :number_correct,
    :correct_by_category
  # , :current_turn

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    # @correct_by_category = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    current_turn = Turn.new(guess, @deck.cards[0])
    if guess == @deck.cards[0].answer
      @number_correct += 1
    end
    #put correct in an array

    # if guess == @deck.cards[0].answer
    #   @correct_by_category.each do |category|
    #     if
    #   end
    # end
    @deck.cards.shift
    @turns << current_turn

    return current_turn
  end

  def number_correct_by_category(category_correct)
    this_category = []
    @turns.each do |turn|
      if turn.card.category == category_correct
        if turn.guess == turn.card.answer
          this_category << turn
        end
      end
    end
    this_category.length
  end

  def percent_correct
    100.0 * @number_correct / @turns.length
  end
end


# require "pry"; binding.pry
