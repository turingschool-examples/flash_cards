class Round

  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @turns.last
  end

  def number_correct
    @turns.find_all do |turn|
      turn.guess == turn.card.answer
    end.count
  end

  def number_correct_by_category(category)
    @turns.find_all do |turn|
      turn.guess == turn.card.answer && category == turn.card.category
    end.count
  end

   def percent_correct
    percentage = number_correct.to_f / @turns.count
    percentage.round(2) * 100
   end

   def percent_correct_by_category(category)
     percentage = number_correct_by_category(category).to_f / percent_of_category(category)
     percentage.round(2) * 100
   end

   def percent_of_category(category)
     @turns.find_all do |turn|
      turn.card.category == category
    end.count
   end

   def start
     puts "Welcome! You're playing with #{@deck.cards.count} cards."
     puts "-------------------------------------------------"
     puts "This is card number #{@turns.count + 1} out of #{@deck.cards.count}."
   end
end
