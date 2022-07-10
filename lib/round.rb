

class Round
  attr_reader :deck,
              :turns
              :current_card
              :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = []
  end

  def current_card
    deck.cards[turns.count]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn

    if new_turn.correct?
      @number_correct << new_turn
    end
    new_turn
  end

  def number_correct
    @number_correct.count
  end

  def number_correct_by_category(category)
    correct_by_category = turns.select do |turn|
      turn.card.answer == turn.guess && turn.card.category == category
    end
    correct_by_category.count
    
  end

  def percent_correct
   percent = (@number_correct.count.to_f / @turns.count.to_f) * 100
   percent.round
  end

  def percent_correct_by_category(category)
    by_category = turns.select do |turn|
    turn.card.category == category

  end
  cat_percent = (number_correct_by_category(category) / by_category.count.to_f) * 100
  cat_percent.round

  end
  def start
     puts "Welcome! You're playing with 3 cards."
     puts "-------------------------------------------------"
     puts "This is card number 1 out of 3."

  end
end
