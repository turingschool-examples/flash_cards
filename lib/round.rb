
class Round
  attr_reader :deck, :turns, :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    turns << turn
    if turn.correct?
      @number_correct += 1
    end
    deck.cards.rotate!
    turn
  end

  def number_correct_by_category(category)
    number_correct_by_category = 0

    @turns.each do |turn|
        if turn.card.category == category
          if turn.correct?
            number_correct_by_category += 1
          end
        end
    end
      number_correct_by_category
  end

  def percent_correct
    (@number_correct / turns.length.to_f) * 100
  end

  def percent_correct_by_catagory(category)
    number_in_category = 0

    @turns.each do |turn|
      if turn.card.category == category
        number_in_category += 1
      end
    end
    (number_correct_by_category(category).to_f / number_in_category) * 100
  end

  def start
    puts "  Welcome!  You're playing with #{deck.count} cards."
    puts "------------------------------------------------------"
    show_card
    show_card
    show_card


    puts " ****** Game Over *******"
    puts " You had #{number_correct} guesses correct out of #{turns.count} for a total score of #{percent_correct}%"
    puts "Geography - #{percent_correct_by_catagory(:Geography)}% correct"
    puts "STEM - #{percent_correct_by_catagory(:STEM)}% correct"

  end

  def show_card
    puts "  This is card number #{turns.count + 1} out of #{deck.cards.count}"
    puts "  Question: #{current_card.question} "
    guess = gets.chomp
    turn = take_turn(guess)
    puts turn.feedback

  end

end
