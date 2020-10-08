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
    @current_card = 0
    @total_cards = 4
    @correct_vocabulary = []
    @total_vocabulary = 3
    @correct_trivia = []
    @total_trivia = 1
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
    (number_correct.to_f / total_cards.to_f) * 100
  end
  def number_correct_by_category(category)
    if category == :Vocabulary
      @correct_vocabulary.count
    elsif category == :Trivia
      @correct_trivia.count
    end
  end
  def percent_correct_by_category(category)
    if category == :Vocabulary
      (@correct_vocabulary.count.to_f / @total_vocabulary.to_f) * 100
    elsif category == :Trivia
      (@correct_vocabulary.count.t_f / @total_vocabulary.to_f) * 100
    end
  end
  def take_turn(guess)
    @new_guess = Turn.new(guess, current_card)
    @guesses << @new_guess
    @new_guess
  end
  def next_card
    if @new_guess.correct?
      @number_correct += 1
      if new_guess.card.category == :Vocabulary
        @correct_vocabulary << @new_guess
      elsif new_guess.card.category == :Trivia
        @correct_trivia << @new_guess
      end
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
    p "Checking Answer"
    sleep(1)
    p @guesses.last.feedback
    end
    p "************ GAME OVER ************"
    p "You had #{@number_correct} correct guesses out of 4 for a total score of #{percent_correct}%"
    p "In Vocabulary, you had #{number_correct_by_category(:Vocabulary)} out of 3, for a score of #{percent_correct_by_category(:Vocabulary)}"
    p "In Trivia, you had #{number_correct_by_category(:Trivia)} out of 1, for a score of #{percent_correct_by_category(:Trivia)}"
  end
end
