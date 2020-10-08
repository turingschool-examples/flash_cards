class Round
  attr_reader :deck,
              :turns,
              :turn,
              :number_correct,
              :number_incorrect

  def initialize(deck)
    @deck = deck
    @turns = []
    @turn = nil
    @number_correct = 0
    @number_incorrect = 0
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @turn = Turn.new(guess, current_card)
    @turns << turn
    process_guess(turn)
    @deck.cards.rotate!
    return turn
  end

  def process_guess(turn)
    if turn.correct?
      add_number_correct
    else
      add_number_incorrect
    end
  end

  def add_number_correct
    @number_correct += 1
  end

  def add_number_incorrect
    @number_incorrect += 1
  end

  def number_correct_by_category(category)
    correct_by_category = turns_by_category(category).count do |turn|
                            turn.guess.downcase == turn.card.answer.downcase
                          end
  end

  def turns_by_category(category)
    turns_by_category = @turns.select do |turn|
                          turn.card.category.downcase == category.downcase
                        end
  end

  def percent_correct
    (@number_correct.to_f / @turns.length.to_f) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / turns_by_category(category).length.to_f) * 100
  end

  def group_turns_by_category
    @turns.group_by do |turn|
      turn.card.category
    end
  end

  def start
    puts "Welcome! You're playing with #{@deck.cards.length} cards."
    puts "-------------------------------------------------"
    puts "This is card number #{@turns.length + 1} out of #{@deck.cards.length}."
    puts "\nQuestion:  #{current_card.question}"
    print ">> "
    guess = gets.chomp
    take_turn(guess)
    if @turn.correct?
      puts "\n\n****** Correct! ******\n\n"
    else
      puts "\n\n****** Incorrect. ******\n\n"
    end
    next_card
  end

  def next_card
    until @turns.length == @deck.cards.length
      print "This is card number #{@turns.length + 1}"
      puts " out of #{@deck.cards.length}.\n\n"
      puts "Question:  #{current_card.question}"
      print ">> "
      guess = gets.chomp
      take_turn(guess)
      if @turn.correct?
        puts "\n\n****** Correct! ******\n\n"
      else
        puts "\n\n****** Incorrect. ******\n\n"
      end
    end
    print_results
  end

  def print_results
    correct_ratio = percent_correct.round
    puts "****** Game over! ******"
    print "You had #{@number_correct} correct guesses out"
    puts " of #{@deck.cards.length} for a total score of #{correct_ratio}%."
    category_hash = group_turns_by_category
    category_hash.each do |category, turn|
      result = percent_correct_by_category(category)
      puts "#{category} - #{result.round}% correct"
    end
  end
end
