class Round
  attr_reader :deck, :turns, :current_card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0

  end

  def current_card
     deck.cards.first
  end



  def take_turn(new_guess)
     turn = Turn.new(new_guess, current_card)
     @turns << turn
     if new_guess == current_card.answer
       @number_correct += 1
     end
     deck.cards.rotate!
     return turn
   end

   def number_correct_by_category(category)
     number_correct_by_category = 0

     @turns.each do |turn|
       if turn.card.category == category && turn.correct?
         number_correct_by_category += 1
       end
       return number_correct_by_category
     end
   end

   def percent_correct
     percent = (number_correct.to_f / turns.count) *100
     return percent


   end

   # def percent_correct_by_category(category)
   #   total_in_category = 0
   #   @turns.each do |turn|
   #     if turn.card.category == category
   #       total_in_category += 1
   #     end
   #   end
   #   (number_correct_by_category(category).to_f) / total_in_category) * 100








end
