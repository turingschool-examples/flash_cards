require "pry"
class Round
  attr_reader :deck,
              :number_correct,
              :guesses,
              :new_guess,
              :turns,
              :total_cards,
              :total_vocabulary,
              :correct_vocabulary,
              :total_trivia,
              :correct_trivia

  def initialize(deck)
    @deck = deck
    initialize_setup
  end

  def reset_initialize
    initialize_setup
  end

  def initialize_setup
    @current_card = 0
    @total_cards = count
    @correct_category = []
    @guesses = []
    @number_correct = 0
    @correct_guesses = []
    @new_guess = new_guess
  end

  def count
    deck.cards.count
  end

  def current_card
    deck.cards[@current_card]
  end

  def take_turn(guess)
    @new_guess = Turn.new(guess, current_card)
    @guesses << @new_guess
    new_guess
  end

  def next_card
    if @new_guess.correct?
      @number_correct += 1
      if new_guess.card.category == current_card.category
        @correct_category << @new_guess
      end
      @correct_guesses << @new_guess
    end
    @current_card += 1
  end

  def number_correct_by_category(find_card)
    @correct_guesses.select do |turn|
      turn.card.category == find_card
    end
  end

  def total_by_category(find_cards)
    guesses.select do |guess|
      guess.card.category == find_cards
    end
  end

  def percent_correct
    ((number_correct.to_f.round(1) / total_cards.to_f.round(1)) * 100).round(1)
  end

  def percent_correct_by_category(category)
    ((number_correct_by_category(category).count.to_f / total_by_category(category).count.to_f) * 100).round(1)
  end

  def unique_categories
    deck.cards.map do |select_category|
      select_category.category
    end
  end

  def category
    unique_categories.uniq
  end

  def start_round
    p "Welcome! You're playing with #{count} cards"
    p "---------------------------------------------"
    deck.cards.each do |card|
    p "This is card number #{@current_card + 1} out of #{count}."
    p card.question
    answer = gets.chomp
    take_turn(answer)
    next_card
    sleep(0)
    p "Checking Answer"
    sleep(1)
    p @guesses.last.feedback
    end
    p "************ GAME OVER ************"
    p "You had #{@number_correct} correct guesses out of #{count} for a total score of #{percent_correct}%"
    category.each do |results|
    p "In #{results}, you had #{number_correct_by_category(results).count} out of #{total_by_category(results).count}, for a score of #{percent_correct_by_category(results)}%"
    end
  end
end
