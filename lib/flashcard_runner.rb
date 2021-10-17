# require './card'
# require './deck'
# require './turn'
# require './round'


class Card

  attr_accessor :question, :answer, :category

  def initialize(question, answer, category)

    @question = question
    @answer = answer
    @category  = category

  end

end

class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    cards_in_category = []
    @cards.each do |card|
      if card.category == category
        cards_in_category << card
      end
    end
    cards_in_category
  end
end

class Turn

  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    card.answer == @guess
  end

  def feedback
    if correct? == true
       "Correct!"
    else
       "Incorrect."
    end
  end
end

# class Round
#
#   attr_reader :deck, :turns
#
#   def initialize(deck)
#     @deck = deck
#     @turns = []
#   end
#
#   def current_card
#     if @turns.count == 0
#       return deck.cards[0]
#     elsif @turns.count == 1
#       return deck.cards[1]
#     elsif @turns.count == 2
#       return deck.cards[2]
#     else
#     end
#   end
#
#
#
#   def take_turn(guess)
#     if guess == "Juneau"
#       new_turn = Turn.new(guess, deck.cards[0])
#     elsif guess == "Venus"
#       new_turn = Turn.new(guess, deck.cards[1])
#     elsif guess == "North north west"
#       new_turn = Turn.new(guess, deck.cards[2])
#     else
#     end
#       @turns << new_turn
#       return new_turn
#   end
#
#   def number_correct
#     number_correct = []
#     @turns.each do |turn|
#       if turn.feedback.include?("Correct!")
#         number_correct << turn
#       end
#     end
#     return number_correct.count
#   end
#
#
#   def number_correct_by_category(category)
#     correct_by_cat = []
#
#     @turns.each do |turn|
#       if turn.feedback.include?("Correct!") && turn.card.category == category # and if the
#         correct_by_cat << turn
#       end
#       return correct_by_cat.count
#     end
#   end
#
#   def percent_correct
#     number_correct = []
#     number_incorrect = []
#     @turns.each do |turn|
#       if turn.feedback.include?("Correct!")
#         number_correct << turn
#       else
#         number_incorrect << turn
#       end
#     end
#     x = number_correct.count.to_f
#     y = number_correct.count.to_f + number_incorrect.count.to_f
#     fraction = x / y
#     100 * fraction
#
#     # require 'pry';binding.pry
#   end
#
#   def percent_correct_by_category(category)
#     cat_correct = []
#     cat_incorrect = []
#       # require 'pry';binding.pry
#     @turns.each do |turn|
#       if turn.feedback.include?("Correct!") && turn.card.category == category
#         cat_correct << turn
#       else
#         cat_incorrect << turn
#       end
#
#       x = cat_correct.count.to_f
#       y = cat_incorrect.count.to_f + cat_correct.count.to_f
#       fraction = x / y
#       return 100 * fraction
#     end
#   end
# end
#
# # require './lib/card'
# # require './lib/turn'
# # require './lib/deck'
#
#
#
class Round

  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    if @turns.count == 0
      return deck.cards[0]
    elsif @turns.count == 1
      return deck.cards[1]
    elsif @turns.count == 2
      return deck.cards[2]
    elsif @turns.count == 3
      return deck.cards [3]
    else
    end
  end


  # if @turns == []
  #   new_turn = Turn.new(guess, deck.cards[0])
  # elsif @turns == [Turn.new(guess, deck.cards[0])]
  #   new_turn = Turn.new(guess, deck.cards[1])
  # elsif @turns == [Turn.new(guess, deck.cards[0]), Turn.new(guess, deck.cards[1])]
  #   new_turn = Turn.new(guess, deck.cards[2])
  # elsif @turns == [Turn.new(guess, deck.cards[0]), Turn.new(guess, deck.cards[1]), Turn.new(guess, deck.cards[2])]
  #   new_turn = Turn.new(guess, deck.cards[3])
  # else
  # end
  #
  # if guess == "Juneau"
  #   new_turn = Turn.new(guess, deck.cards[0])
  # elsif guess == "Venus"
  #   new_turn = Turn.new(guess, deck.cards[1])
  # elsif guess == "North north west"
  #   new_turn = Turn.new(guess, deck.cards[2])
  # else
  # end

  # if @turns == []
  #   new_turn = Turn.new(guess, deck.cards[0])
  # elsif @turns.last == [Turn.new(guess, deck.cards[0])]
  #   new_turn = Turn.new(guess, deck.cards[1])
  # elsif @turns.last == [Turn.new(guess, deck.cards[1])]
  #   new_turn = Turn.new(guess, deck.cards[2])
  # elsif @turns.last == [Turn.new(guess, deck.cards[2])]
  #   new_turn = Turn.new(guess, deck.cards[3])
  # else
  # end
#
#   if guess == card_1.guess
#   new_turn = Turn.new(guess, card_1)
# elsif guess == card_2.guess
#   new_turn = Turn.new(guess, card_2)
# elsif guess == card_3.guess
#   new_turn = Turn.new(guess, card_3)
# end


  def take_turn(guess) #dont forget to copy edits to round.rb
    if @turns.count == 0
      new_turn = Turn.new(guess, deck.cards[0])
    elsif @turns.count == 1
      new_turn = Turn.new(guess, deck.cards[1])
    elsif @turns.count == 2
      new_turn = Turn.new(guess, deck.cards[2])
    elsif @turns.count == 3
      new_turn = Turn.new(guess, deck.cards[3])
    end
      @turns << new_turn
      return @turns.last
  end

  def number_correct
    number_correct = []
    @turns.each do |turn|
      if turn.feedback.include?("Correct!")
        number_correct << turn
      end
    end
    return number_correct.count
  end


  def number_correct_by_category(category)
    correct_by_cat = []

    @turns.each do |turn|
      if turn.feedback.include?("Correct!") && turn.card.category == category # and if the
        correct_by_cat << turn
      end
      return correct_by_cat.count
    end
  end

  def percent_correct
    number_correct = []
    number_incorrect = []
    @turns.each do |turn|
      if turn.feedback.include?("Correct!")
        number_correct << turn
      else
        number_incorrect << turn
      end
    end
    x = number_correct.count.to_f
    y = number_correct.count.to_f + number_incorrect.count.to_f
    fraction = x / y
    100 * fraction

    # require 'pry';binding.pry
  end

  def percent_correct_by_category(category)
    cat_correct = []
    cat_incorrect = []
      # require 'pry';binding.pry
    @turns.each do |turn|
      if turn.feedback.include?("Correct!") && turn.card.category == category
        cat_correct << turn
      else
        cat_incorrect << turn
      end

      x = cat_correct.count.to_f
      y = cat_incorrect.count.to_f + cat_correct.count.to_f
      fraction = x / y
      return 100 * fraction
    end
  end
end
# require 'pry';binding.pry


def start
  card_1 = Card.new("What is 5 + 5?", "10", :STEM)
  card_2 = Card.new("What is Rachel's favorite animal?", "Elephant", :Staff)
  card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Staff)
  card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Turing)
  cards = [card_1, card_2, card_3, card_4]
  deck = Deck.new(cards)
  round = Round.new(deck)
  puts "Welcome! You're playing with 4 cards."
  puts "---------------------------------------------"
  puts "This is card number 1 out of 4."
  puts card_1.question
  guess = gets.chomp
  round.take_turn(guess)
  round.turns.last.correct?
  puts round.turns.last.feedback

  puts "This is card number 2 out of 4."
  puts card_2.question
  guess = gets.chomp
  round.take_turn(guess)
  round.turns.last.correct?
  puts round.turns.last.feedback

  puts "This is card number 3 out of 4."
  puts card_3.question
  guess = gets.chomp
  round.take_turn(guess)
  round.turns.last.correct?
  puts round.turns.last.feedback

  puts "This is card number 4 out of 4."
  puts card_4.question
  guess = gets.chomp
  round.take_turn(guess)
  round.turns.last.correct?
  puts round.turns.last.feedback


  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct guesses out of #{round.turns.count} for a total score of #{round.percent_correct.to_i}%."
  puts "STEM -#{round.percent_correct_by_category(:STEM).to_i}% correct"
  # require 'pry';binding.pry
  puts "Fun -#{round.percent_correct_by_category(:Staff).to_i}% correct"
  # require 'pry';binding.pry
  puts "Turing -#{round.percent_correct_by_category(:Turing).to_i}% correct"
end
start
