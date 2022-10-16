class Round
  attr_reader :deck,
    :turns,
    :number_correct,
    :correct_by_category


  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @correct_by_category = []
    @array_of_categories = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    current_turn = Turn.new(guess, @deck.cards[0])
    if guess.downcase == @deck.cards[0].answer.downcase
      @number_correct += 1
    end

    @deck.cards.shift
    @turns << current_turn

    return current_turn
  end

  def number_correct_by_category(category_correct)
    @correct_by_category = []
    @turns.each do |turn|
      if (turn.card.category == category_correct) &&
        (turn.correct?)
          @correct_by_category << turn
      end
    end
    @correct_by_category.length
  end

  def percent_correct
    100.0 * @number_correct / @turns.length
  end

  def percent_correct_by_category(cat_correct)
    number_correct_by_category(cat_correct)
    number_cards_in_cat_so_far = 0
    @turns.each do |turn|
      if turn.card.category == cat_correct
        number_cards_in_cat_so_far += 1
      end
    end
    100.0 * @correct_by_category.length / number_cards_in_cat_so_far
  end

  def categories_list
    @turns.each do |turn|
      unless @array_of_categories.include? turn.card.category
        @array_of_categories << turn.card.category
      end
    end
    @array_of_categories
  end
end
