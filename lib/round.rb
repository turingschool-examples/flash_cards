class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    return new_turn
  end

  def number_correct
    number = 0
    @turns.each do |turn|
      if turn.card.answer == turn.guess
        number += 1
      end
    end
    number
  end

  def number_correct_by_category(category)
    number = 0
    @turns.each do |turn|
      if turn.card.answer == turn.guess && turn.card.category == category
        number += 1
      end
    end
    number
  end

  def percent_correct
    (number_correct.to_f / @turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    total_num_of_cards_by_category = 0
    @turns.each do |turn|
      if turn.card.category == category
        total_num_of_cards_by_category += 1
      end
    end
    (number_correct_by_category(category).to_f / total_num_of_cards_by_category.to_f) * 100
  end

  def start(round)

    card_num = 1
    total_of_cards_in_deck = round.deck.cards.size

    puts "Welcome! You're playing with #{total_of_cards_in_deck} cards."
    puts "-------------------------------------------------------------"

    loop do
      if card_num >= 1 && card_num <= total_of_cards_in_deck
        #card_num >= 1 && card_num <= total_of_cards_in_deck
        puts "This is card number #{card_num} out of #{total_of_cards_in_deck}."
        puts "Question: #{round.current_card.question}"
        puts "Please enter your guess: "
        # Get an input from user
        guess = gets.chomp
        turn = round.take_turn(guess)
        check_guess = turn.correct?
        puts turn.feedback

      elsif card_num > total_of_cards_in_deck
        puts "***** Game Over! *****"
        puts "You had #{round.number_correct} correct guesses out of #{total_of_cards_in_deck} for a total score of #{round.percent_correct}%."

        puts "#{turn.card.category} - #{round.percent_correct_by_category(turn.card.category)}% correct"
        break
      end
      card_num += 1
    end
  end
end
