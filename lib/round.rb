class Round

attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.rotate!
    # @deck.cards.rotate.map do |card|
    new_turn
  end

  def number_correct
    correct = @turns.find_all do |turn|
      turn.correct?
    end
    correct.count
  end

  def number_correct_by_category(category)
    cat_category = @turns.find_all do |turn|
      turn.card.category == category && turn.correct?
    end
    cat_category.count
  end


   def percent_correct
     (number_correct.to_f / @turns.count * 100).round
   end

   def percent_correct_by_category(category)
     turns_by_category = @turns.find_all do |turn|
       turn.card.category == category
     end
     (number_correct_by_category(category).to_f / turns_by_category.count * 100).round
   end
end
