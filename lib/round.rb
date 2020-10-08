require "pry"

class Round
  attr_reader :deck,
              :number_correct,
              :guesses,
              :new_guess,
              :turns


  def initialize(deck)
    @deck = deck
    @current_card = 0
    @total_cards = 4
    @guesses = []
    @number_correct = 0
    @turns = []
    @new_guess = new_guess
    @category_correct = []
  end

  def total_cards
    @total_cards
  end

  def count
    deck.cards.count
  end

  def current_card
    deck.cards[@current_card]
  end

  def percent_correct
    (@number_correct.to_f / @total_cards.to_f) * 100
  end

  def card_by_category(category_name)
     deck.cards.select do |card|
      card.category == category_name
    end
  end

  def number_correct_by_category(category_name)
      deck.collect do |card|
      card.category == category_name
    end
  end

  def category_correct
    @category_correct.count
  end

  def take_turn(guess)
    @new_guess = Turn.new(guess, current_card)
    @guesses << @new_guess
    @new_guess
  end

  def next_card
    if @new_guess.correct?
      @number_correct += 1
      @turns << @new_guess
    end
    @current_card += 1
  end

  def start

    p "Welcome! You're playing with 4 cards"
    p "---------------------------------------------"

    deck.cards.each do |card|
    p "This is card number #{@current_card + 1} out of 4."
    p card.question
    answer = gets.chomp
    take_turn(answer)
    next_card
    sleep(1)
    p "Storing Answer"
    sleep(1)
    end
    p "************ GAME OVER ************"
    p "You had #{@number_correct} correct guesses out of 4 for a total score of #{percent_correct}%"

  end

end
