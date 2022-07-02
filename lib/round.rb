class Round
  attr_reader :deck, :turns, :current_turn, :number_correct, :correct_qs

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_turn = 0
    @number_correct = 0
    @correct_qs = []
  end

  def current_card
    @deck.cards[@current_turn]
  end

  def take_turn(guess_string)

   if @current_turn > @deck.count
      return  "you have reached the limit of questions"
   else
     new_turn = Turn.new(guess_string, @current_card)
     @turns << new_turn
     @current_turn += 1

     if new_turn.correct?
       @number_correct += 1 #increments correct if correct
       @correct_qs << @current_card #will send in current card
     end

     return new_turn
   end
 end
 
end
