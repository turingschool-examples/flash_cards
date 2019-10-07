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
    @deck.cards.shift
    new_turn
  end

  def number_correct
    number_correct = 0
    @turns.each do |turn|
      if turn.correct?
        number_correct += 1
      end
    end
    number_correct
  end

 def number_correct_by_category(category)
   number_correct = 0
   @turns.each do |turn|
     if turn.correct? && turn.card.category == category
       number_correct += 1
     end
   end
   number_correct
 end

end
