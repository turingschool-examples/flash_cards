class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def start
    start_message = "Welcome! You're playing with #{deck.cards.count} cards."
    puts start_message
    puts "-------------------------------------------------"

    i = 1
    while i <= deck.count
      puts "This is card number #{i} out of #{deck.count}."
      puts current_card.question
      guess = gets.chomp
      next_turn = take_turn(guess)
      puts next_turn.feedback
      i += 1
    end
  end

  def end
    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{deck.count} for a total score of #{percent_correct.to_i}%."

    used_categories = []

    turns.each do |turn|
      if used_categories.include?(turn.card.category)
        next
      else
        puts "#{turn.card.category} - #{percent_correct_by_category(turn.card.category).to_i}% correct"
      end
      used_categories << turn.card.category
    end
  end

  def current_card
    return deck.cards[turns.count]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    if turn.correct?
      @number_correct += 1
    end
    return turn
  end

  def number_correct
    return @number_correct
  end

  def percent_correct
    percent_correct = (@number_correct.to_f / @turns.count.to_f) * 100
    return percent_correct
  end

  def number_correct_by_category(category)
    category_correct = 0
    @turns.each do |turn|
      if category == turn.card.category
          if turn.correct?
            category_correct += 1
          end
        end
    end
    return category_correct
  end

  def percent_correct_by_category(category)
    category_correct = 0
    @turns.each do |turn|
      if category == turn.card.category
          if turn.correct?
            category_correct += 1
          end
        end
    end
    number_in_category = deck.cards_in_category(category).count
    percent_correct = (category_correct.to_f / number_in_category.to_f) * 100
    return percent_correct
  end
end
