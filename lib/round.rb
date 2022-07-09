class Round
  attr_reader :deck, :turns, :current_card
  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = @deck.cards[0]
  end

  def take_turn(guess)
    turn_taken = Turn.new(guess, @current_card)
    @turns << turn_taken
    @current_card = @deck.cards[@turns.length]
    return turn_taken
  end

  def number_correct
    number_correct = 0
    @turns.each do |turn|
      if turn.correct? == true
        number_correct += 1
      end
    end
    return number_correct
  end

  def number_correct_by_category(category)
    number_correct_by_category = 0
    @turns.each do |turn|
      if turn.correct? == true && category == turn.card.category
        number_correct_by_category += 1
      end
    end
    return number_correct_by_category
  end

  def percent_correct
    number_correct.to_f / @turns.length * 100
  end

  def percent_correct_by_category(category)
    turns_in_category = 0
    @turns.each do |turn|
      if category == turn.card.category
        turns_in_category += 1
      end
    end

    number_correct_by_category(category).to_f / turns_in_category * 100
  end

  def start
    puts "Welcome! You're playing with #{@deck.cards.length} cards."
    puts "~~~~-------------------------------------------~~~~"
    puts "This is card number #{@turns.length + 1} out of #{@deck.cards.length}."
    puts "Question: #{@current_card.question}"
    current_turn = take_turn(gets.chomp.capitalize)
    current_turn.feedback
    until @turns.length == @deck.cards.length do
      puts "-------------------------------------------------"
      puts "This is card number #{@turns.length + 1} out of #{@deck.cards.length}."
      puts "Question: #{@current_card.question}"
      current_turn = take_turn(gets.chomp.capitalize)
      current_turn.feedback
    end
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{deck.cards.length} for a total score of #{percent_correct.round(0)}%."
    puts "Biology - #{percent_correct_by_category(:Biology).round(0)}% correct"
    puts "Chemistry - #{percent_correct_by_category(:Chemistry).round(0)}% correct"
    puts "Astronomy - #{percent_correct_by_category(:Astronomy).round(0)}% correct"
  end

end
