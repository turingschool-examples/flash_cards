require "./turn.rb"

class Round
  attr_reader :deck
  def initialize(deck)
    @deck = deck.cards
    @turns = []
    @current_card = @deck[@turns.count]
    @number_correct = 0
  end

  def take_turn
    p "This is card #{@turns.count+1} out of #{@deck.count}"
    print "Question: #{@current_card.question}  "
    guess = gets.chomp
    turn = Turn.new(guess, @current_card)
    check = turn.correct?
    @turns << turn
    if check == 'Correct!'
      @number_correct+=1
    end
    @current_card = @deck[@turns.count]
    if @deck.count == @turns.count
      puts "*****Thank you for playing!*****"
      puts "You got #{percent_correct}% of the questions correct!"
      puts "Anime: #{percent_correct_by_category(:anime)}% of the questions correct."
      puts "Gaming: #{percent_correct_by_category(:gaming)}% of the questions correct."
    else
      take_turn
    end
  end

  def percent_correct
    @number_correct * 100 / @turns.count 
  end

  def percent_correct_by_category category
    num_in_cat = 0
    num_correct = 0
    
    @turns.each do |theturn|
      if theturn.card.category == category && theturn.turn_feedback == "Correct!"
        num_correct+=1
        num_in_cat+=1
      elsif theturn.card.category == category && theturn.turn_feedback == "Incorrect!"
        num_in_cat+=1
      end
    end
    num_correct * 100 / num_in_cat
  end
end