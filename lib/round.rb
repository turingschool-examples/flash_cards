class Round
  attr_reader :deck,
              :guesses,
              :correct_guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
    @correct_guesses = []
  end

  def reset_guesses
    @guesses = []
    @correct_guesses = []
  end

  def take_turn(guess, current_card)
    new_guess = Turn.new(guess, current_card)
    @guesses << new_guess
    if new_guess.correct?
      @correct_guesses << new_guess
    end
  end

  def correct_guess_count
    correct_guesses.count
  end

  def number_correct_by_category(find_card)
    @correct_guesses.count do |turn|
      turn.card.category == find_card
    end
  end

  def total_by_category(find_cards)
    guesses.count do |guess|
      guess.card.category == find_cards
    end
  end

  def percent_correct
    ((correct_guess_count / deck.count) * 100).round(1)
  end

  def percent_correct_by_category(category)
    ((number_correct_by_category(category) / total_by_category(category)) * 100).round(1)
  end

  def start
    reset_guesses
    p "Welcome! You're playing with #{deck.count} cards"
    p "---------------------------------------------"
    deck.cards.each_with_index do |card, index|
      p "This is card number #{index + 1} out of #{deck.count}."
      p card.question
      answer = gets.chomp
      take_turn(answer, card)
      p "Checking Answer"
      sleep(1)
      p guesses.last.feedback
    end
    p "************ GAME OVER ************"
    p "You had #{correct_guess_count} correct guesses out of #{deck.count} for a total score of #{percent_correct}%"
    deck.categories.each do |results|
      p "In #{results}, you had #{number_correct_by_category(results)} out of "\
        "#{total_by_category(results)}, for a score of #{percent_correct_by_category(results)}%"
    end
  end
end
