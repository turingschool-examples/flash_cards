require './lib/round.rb'
#create some Cards
#put those card into a Deck
#create a Round using the Deck you created
#START the round using a new method called start
class Card
  attr_reader :question, :answer, :category
  def initialize (question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end

card_1 = Card.new("What is the fastest animal?", "Cheetah", :Animal)
card_2 = Card.new("What is the color of the ocean?", "Blue", :Geography)
card_3 = Card.new("What is the coolest city on earth?", "NYC", :Geography)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop)

cards = [card_1, card_2, card_3, card_4]

# p cards

class Deck
  attr_reader :card, :category, :cards
  def initialize(cards)
    @cards = cards
    @category = category
  end
end

deck = Deck.new(cards)
# p deck

class Turns
  attr_reader :guess, :card, :answer
  def initialize(guess, card)
    @guess = guess
    @card = card
    @answer = answer
  end

  def correct?
    if @guess == @answer
      return true
    end
  end

  def feedback
    if @guess == @answer
      return "Correct!"
    else
      return "Incorrect"
    end
  end

  def start
    puts "Welcome! You're playing with 4 cards."

    print "------------------------------------"
    puts
    puts "This is card 1 out of 4."
    puts "What is the fastest animal?"

    @guess = gets.chomp

  end
end


turns = Turns.new("Cheetah", cards[0])
round = Round.new(deck)
p turns.start
# puts turns.correct?

round.add_1_to_turn
turns.correct?

# round.take_turn("Cheetah")

puts turns.feedback
# round.add_1_to_correct

puts "This is card 2 out of 4."
puts cards[1].question

@guess = gets.chomp

turns_2 = Turns.new("Blue", cards[1])

round.add_1_to_turn
turns_2.correct?

# round.take_turn("Blue")

puts turns_2.feedback
# round.add_1_to_correct

puts "This is card 3 out of 4."
puts cards[2].question

@guess = gets.chomp

turns_3 = Turns.new("NYC", cards[2])


round.add_1_to_turn
turns_3.correct?

# round.take_turn("NYC")
puts turns_3.feedback
# round.add_1_to_correct

puts "This is card 4 out of 4."
puts cards[3].question

@guess = gets.chomp

turns_4 = Turns.new("Justin Bieber", cards[3])

round.add_1_to_turn
turns_4.correct?

# round.take_turn("Justin Bieber")
puts turns_4.feedback

# round.add_1_to_correct


print "***********GAME OVER***************"

puts



puts "You had 4 correct guesses out of 4 for a score of  "
p round.percent_correct(4,4)

p "Animal - #{round.percent_correct_by_category(:Animal)} % correct"

p "Geography - #{round.percent_correct_by_category(:Geography)} % correct"

p "Pop - #{round.percent_correct_by_category(:Pop)} % correct"






# class Round
#   attr_reader :deck, :turns, :turn_counter, :correct, :num, :guess
#   def initialize(deck)
#     @deck = deck
#     @turns = []
#     @turn_counter = 0
#     @correct = 0
#     @num = 0
#     @guess = guess
#   end

  # def start
  #   puts "Welcome! You're playing with 4 cards."
  #
  #   print "------------------------------------"
  #   puts
  #   puts "This is card 1 out of 4."
  #   puts "Question: What is 5 + 5?"
  #
  #   guess = gets.chomp
  #   # correct = 0
  #
  #   if guess == "10"
  #     puts "Correct!"
  #     # return correct += 1
      # print "So far you have #{correct} correct."
  #   else
  #     puts "Incorrect."
  #     # return correct = 0
  #   end
  # end
  #
  # def next_card
  #   puts "This is card 2 out of 4."
  #   puts "Question: What is the fastest animal?"
  #
  #   animal = gets.chomp
  #   # correct = 1

  #   if animal == "cheetah" || animal == "Cheetah"
  #     puts "Correct!"
  #     # return correct += 1
  #     # print "So far you have #{correct} correct."
  #   else
  #     puts "Incorrect."
  #     # return correct = 0
  #   end
  # end
  #
  # def third_card
  #   puts "This is card 3 out of 4."
  #   puts "Question: What is 8 + 8?"
  #
  #   guess = gets.chomp
  #   # correct = 2
    # mid_name.capitalize

    # if guess == "16"
    #   puts "Correct!"
      # return correct += 1
      # print "So far you have #{correct} correct."
  #   else
  #     puts "Incorrect."
  #     # return correct = 0
  #   end
  # end

  # def last_card
  #   puts "This is card 4 out of 4."
  #   puts "Question: What cardboard cutout lives at Turing?"
  #
  #   cutout = gets.chomp
    # correct = 3

#     if cutout == "Justin Bieber" || cutout == "justin bieber"
#       puts "Correct!"
#       # return correct += 1
#       # print "So far you have #{correct} correct."
#     else
#       puts "Incorrect."
#       # return correct
#     end
#   end
# end

# p cards
# round = Round.new(deck)
# p round.start
# p round.next_card
# p round.third_card
# p round.last_card
# print "******* GAME OVER **********"
# puts
# puts "You had 4 correct guesses out of 4 for a total score of 100%"
#
# puts "STEM - 100% "
# puts "Geography - 100% "
# puts "Pop Culture - 100% "
