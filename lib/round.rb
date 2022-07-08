
class Round
  attr_accessor :deck, 
                :turns, 
                :turn, 
                :current_card, 
                :number_correct, 
                :correct_by_category, 
                :percent_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    # returns the first element of the deck.cards array and removes it from the array
    @current_card = @deck.cards.shift
    @number_correct = 0
  end

  def take_turn(guess)
    @turn = Turn.new(guess, @current_card)
    @turns << @turn

    @number_correct += 1 if @turn.correct? == true
    @percent_correct = (number_correct.to_f/@turns.length.to_f)*100

    @current_card = @deck.cards.shift

    @turn
  end

  def number_correct_by_category(category)
    @correct_by_category = 0
    @turns.each do |turn|
      if turn.card.category == category && turn.feedback == "Correct!"
        @correct_by_category += 1
      end
    end
    return @correct_by_category
  end

  def percent_correct_by_category(category)
    correct_by_category = number_correct_by_category(category)
    number_of_trys_in_category = 0

    @turns.each do |turn|
      if turn.card.category == category
        number_of_trys_in_category += 1
      end
    end
    return (correct_by_category/number_of_trys_in_category)*100
  end
end
