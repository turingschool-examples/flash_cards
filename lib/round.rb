class Round
  attr_reader :deck, :turns, :current_turn, :number_correct, :correct_qs, :curr_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_turn = 0
    @number_correct = 0
    @correct_qs = []
  end

  def current_card
    @curr_card = @deck.cards[@current_turn]
  end

  def take_turn(guess_string)
   if @current_turn > @deck.count
      return  "you have reached the limit of questions"
   else
     @new_turn = Turn.new(guess_string, current_card)
     @turns << @new_turn
     @current_turn += 1

     if @new_turn.correct?
       @number_correct += 1
       @correct_qs << @curr_card
     end
   end
   @new_turn
 end

 def number_correct
   @correct_qs.count
 end

 def number_correct_by_category(category_choice)
   cat_correct = 0
   @correct_qs.each do |card|
     if card.category == category_choice
       cat_correct += 1
     end
   end
   cat_correct
 end

 def percent_correct
   @number_correct.to_f / @current_turn.to_f * 100.00
 end

 def percent_correct_by_category(category_choice)
   num_cat = 0
   @deck.cards.each do |card|
     if card.category == category_choice
       num_cat += 1
     end
   end
   num_cat.to_f / number_correct_by_category(category_choice).to_f * 100
 end
end
