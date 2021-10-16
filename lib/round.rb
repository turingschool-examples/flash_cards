
class Round

  attr_reader :deck,
              :turns,
              :correct


  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    deck.cards.rotate!
  end

  def number_correct
    correct = 0
    @turns.each do |turn|
      if turn.correct? == true
        correct += 1
      end
    end
    correct
  end

  def number_correct_by_category(category_arg)
    category_correct = 0
    @turns.each do |turn|
      if turn.card.category == category_arg && turn.correct? == true
        category_correct += 1
      end
    end
    category_correct
  end

  def percent_correct
    @correct.to_f / @turns.count * 100.0
  end

  def percent_correct_by_category(category_arg)
    category_turns = 0
    @turns.each do |turn|
      if turn.card.category == category_arg
        category_turns += 1
      end
    end
    number_correct_by_category(category_arg) / category_turns.to_f * 100
  end

  def start
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "___________________________________________________________ "

    puts "This is card number 1 out of #{deck.count}."
    puts "Question: #{current_card.question}"
    answer = gets.chomp
    new_turn = Turn.new(answer,current_card)
    take_turn(answer)
    number_correct
    puts new_turn.feedback

    puts "This is card number 2 out of #{deck.count}."
    puts "Question: #{current_card.question}"
    answer = gets.chomp
    new_turn = Turn.new(answer,current_card)
    take_turn(answer)
    puts new_turn.feedback

    puts "This is card number 3 out of #{deck.count}."
    puts "Question: #{current_card.question}"
    answer = gets.chomp
    new_turn = Turn.new(answer,current_card)
    take_turn(answer)
    puts new_turn.feedback

    puts "This is card number 4 out of #{deck.count}."
    puts "Question: #{current_card.question}"
    answer = gets.chomp
    new_turn = Turn.new(answer,current_card)
    take_turn(answer)
    puts new_turn.feedback

    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of 4 total for a score of #{percent_correct}%"
    puts "Geography - #{percent_correct_by_category(:Geography)} correct"
    puts "STEM - #{percent_correct_by_category(:STEM)} correct"
    puts "Pop Culture - #{percent_correct_by_category("Pop Culture")} correct"
  end

# Secret Refector for number_correct by category_arg by Chris
# def number_correct_by_category(category)
#   turns.count do |turn|
#     turn.correct? && category == turn.card.cateogry
#   end


end
