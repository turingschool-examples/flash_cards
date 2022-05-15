class Round
  attr_reader :deck, :turns, :current_card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0

  end

  def current_card
     deck.cards[0]
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
     end
     return number_correct_by_category
   end

   def percent_correct
     percent = (number_correct.to_f / turns.count) *100
     return percent


   end

   def percent_correct_by_category(category)
     total_in_category = 0
     @turns.each do |turn|
       if turn.card.category == category
         total_in_category += 1
       end
     end
     (number_correct_by_category(category).to_f / total_in_category) * 100
   end


   def start
      i = 0
      while i < deck.count
        i += 1
        puts "Question #{i} of #{deck.count}:  #{current_card.question}"
        puts take_turn(gets.chomp).feedback
      end
   end


   # p "You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct.to_i}%"
   # p "STEM - #{round.percent_correct_by_category(:STEM).to_i}% correct"
   # p "Turing Staff - #{round.percent_correct_by_category(:"Turing Staff").to_i}% correct"
   # p "Pop Culture - #{round.percent_correct_by_category("Pop Culture").to_i}% correct"

   # def start
   #   i = 0
   #   while i < deck.count
   #     if deck.count
   #       i += 1
   #
   #    puts take_turn(gets.chomp).feedback








end
