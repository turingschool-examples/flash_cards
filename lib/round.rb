require './lib/card'
require './lib/turn'
require './lib/deck'

class Round
  attr_reader :deck, :turns, :card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @deck_count = 0
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)#Create new turn object with guess and card
    @turns << new_turn #Store this new turn object in @turns

    if new_turn.correct? == true
      @number_correct += 1
    end

    def feedback
      if new_turn.correct? == false
        "Incorrect."
      end
    end
    @deck.cards.shift#Change current card to next card in array - push out first element

    new_turn
  end

  def number_correct_by_category(category_turn)
    category_correct = 0

    @turns.each do |turn|
      if turn.card.category == category_turn && turn.correct? == true
        category_correct += 1
      end
   end
   category_correct
 end

def percent_correct
  (number_correct.to_f / turns.count) * 100
end

def percent_correct_by_category(category_turn)
  category_total = 0

  @turns.each do |turn|
    if turn.card.category == category_turn
      category_total += 1
    end
  end

  (number_correct_by_category(category_turn).to_f/ category_total) * 100
end

def start
  puts "Welcome! You're playing with #{deck.cards.count} cards.
  -------------------------------------------------"


turn_number = 0
deck_count = deck.count
  until deck_count == turn_number
    puts "This is card number #{turn_number + 1} out of #{deck_count}."
    puts current_card.question
    guess = gets.chomp
    new_turn = take_turn(guess)
    puts new_turn.feedback
    turn_number += 1
  end
  puts "****** Game over! ******"
  puts "You had #{number_correct} out of 8 for a total score of #{percent_correct}%."

  categories_list = []
  @turns.each do |turn|
     categories_list << turn.card.category
  end
  categories_list.uniq

  categories_list.uniq.each do |category_list|
    puts "#{category_list} - #{percent_correct_by_category(category_list).to_i}%"
  end
end

end
