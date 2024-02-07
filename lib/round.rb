class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct = 0
    @cards = 0

  end

  def current_card
    @deck.cards[@cards]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    change_current_card
    turn
  end

  def change_current_card
    @cards += 1

  end

  def new_turn
    correct?
  end

  def number_correct
      correct = 0
      @turns.each do |turn|
        if turn.correct? 
        correct += 1
        end
    end
    correct
  end

  def number_correct_by_category(subject)
    correct = 0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == subject
      correct += 1
      end
    end
    
    correct % 100
  end

  def perecnt_correct
     number_correct * 100.0 / @turns.count
  end 

  def percent_correct_by_category(category)
    number_correct_by_category * 100.0 / @turns.count
    
  end

  def percent_correct_by_category(subject)
    total_category_turns = @turns.select do |turn| 
      # require 'pry'; binding.pry
      turn.card.category == subject
    end

    correct_turns_category = total_category_turns.select do |turn|
      turn.correct? 
    end

     (correct_turns_category.count.to_f / total_category_turns.count * 100).round(2)

  end

  def start
    p "Hello what's your name?"
    name = gets.chomp

    p "Welcome #{name}! You're playing with 4 cards"
    p "-----------------------------------------------"

    @deck.cards.each do |card|
      p current_card.question 
      guess = gets.chomp
      turn = take_turn(guess)
      # @deck.change_current_card
      p turn.feedback
     
    end
    p "****** Game over! ******"
    p "You had #{number_correct} correct guesses out of 4 for a total score of #{perecnt_correct} "
  end




end