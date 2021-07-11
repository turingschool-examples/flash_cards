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
    new_turn
  end

  def number_correct
    number = 0
    @turns.each do |turn|
      if turn.correct? == true
        number += 1
      end
    end
    number
  end

  def number_correct_by_category(category)
    number = 0
    @turns.each do |turn|
      if turn.correct? == true && turn.card.category == category
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
    total_num_of_cards_by_category
    (number_correct_by_category(category).to_f/ total_num_of_cards_by_category.to_f) * 100
  end

  def start(round)  #Start the game

    card_num = 1
    total_of_cards_in_deck = round.deck.count
    list_of_categories = round.deck.list_of_categories

    puts "Welcome! You're playing with #{total_of_cards_in_deck} cards."
    puts "-" * 30

    while card_num >= 1 && card_num <= total_of_cards_in_deck
      puts "This is card number #{card_num} out of #{total_of_cards_in_deck}."
      puts "Question: #{round.current_card.question}"
      puts "Please enter your guess: "
      # Get an input from user
      guess = gets.chomp
      turn = round.take_turn(guess)
      check_guess = turn.correct?
      puts turn.feedback
      card_num += 1

        if card_num > total_of_cards_in_deck
          puts "********** Game Over! **********"
          puts "You had #{round.number_correct} correct guesses out of #{total_of_cards_in_deck} for a total score of #{round.percent_correct}%."

          list_of_categories.each do |category|
            puts "#{category} - #{round.percent_correct_by_category(category)}% correct"
          end
        end
    end
  end

end
