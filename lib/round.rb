class Round
  attr_reader :deck, :turns, :index, :number_correct, :correct_array

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @index = 0
    @correct_array = []
  end

  def current_card
    deck.cards[@index]
  end

  def take_turn(guess)
    another_turn = Turn.new(guess, current_card)
    if another_turn.correct? == true
      @number_correct += 1
      @correct_array << another_turn.card.category
    end
    # @turns << current_card
    # @index += 1
    # another_turn.correct?
    # another_turn.feedback
    @turns << current_card
    @index += 1
    another_turn
  end

  def number_correct_by_category(category)
    @correct_array.count(category)
  end

  def percent_correct
    correct = @correct_array.count.to_f
    total = @turns.count.to_f
    percent = (correct / total) * 100
  end

  def percent_correct_by_category(category_argument)
    category_array = []
    @turns.each do |card|
       category_array << card.category
    end
    category_number = category_array.count(category_argument)
    category_correct = number_correct_by_category(category_argument)
    result = (category_correct / category_number) * 100
    result.to_f
  end

end
