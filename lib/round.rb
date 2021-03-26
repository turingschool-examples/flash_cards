class Round

  attr_reader :deck,
              :turns,
              :turn_counter

  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_counter = 1
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
  card = current_card
  turn = Turn.new(guess, card)
  end

  def store_turn(turn)
    @turns << turn
    deck.cards.shift
    @turn_counter += 1
  end

  def number_correct
    correct = @turns.select do |turn|
      turn.correct? == true
    end
    return correct.length
  end

  def number_correct_by_category(subject)
    group = @turns.select do |turn|
      turn.card.category == subject
    end

    correct = group.select do |turn|
      turn.correct? == true
    end

    correct.length
  end

  def percent_correct
    percent = (number_correct.to_f / @turns.length.to_f) * 100
    percent.truncate(2)
  end

  def percent_correct_by_category(subject)
    correct = number_correct_by_category(subject)
    total = @turns.select do |turn|
      turn.card.category == subject
    end
    total = total.length
    percent = (correct.to_f / total.to_f) * 100
    percent.truncate(2)
  end

  def start
    puts "Welcome! You're playing with 4 cards.
    --------------------------------------------- "
  end

  def display_question
    puts "This is card number #{@turn_counter} out of #{@deck.cards.length + @turns.length}
    Question: #{current_card.question}"
    get_guess
  end


  def get_guess
    guess = gets.chomp
    turn = take_turn(guess)
    puts turn.feedback
    store_turn(turn)
  end

  def game_over
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{turns.length} for a total score of #{percent_correct}"
  end

  def summarize_by_category(category)
  puts "#{category} - #{percent_correct_by_category(category)}"
  end



end
