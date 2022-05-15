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

card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "girrafe", :Animal)
card_3 = Card.new("What is Mike's middle name?", "Sal", :Turing_staff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Pop_culture)

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

class Round
  attr_reader :deck, :turns, :turn_counter, :correct, :num, :guess
  def initialize(deck)
    @deck = deck
    @turns = []
    @turn_counter = 0
    @correct = 0
    @num = 0
    @guess = guess
  end

  def start
    puts "Welcome! You're playing with 4 cards."

    print "------------------------------------"
    puts
    puts "This is card 1 out of 4."
    puts "Question: What is 5 + 5?"

    guess = gets.chomp
    # correct = 0

    if guess == "10"
      puts "Correct!"
      # return correct += 1
      # print "So far you have #{correct} correct."
    else
      puts "Incorrect."
      # return correct = 0
    end
  end

  def next_card
    puts "This is card 2 out of 4."
    puts "Question: What is Rachel's favorite animal?"

    animal = gets.chomp
    # correct = 1

    if animal == "giraffe" || animal == "Giraffe"
      puts "Correct!"
      # return correct += 1
      # print "So far you have #{correct} correct."
    else
      puts "Incorrect."
      # return correct = 0
    end
  end

  def third_card
    puts "This is card 3 out of 4."
    puts "Question: What is Mike's middle name?"

    mid_name = gets.chomp
    # correct = 2
    # mid_name.capitalize

    if mid_name == "Sal" || mid_name == "sal"
      puts "Correct!"
      # return correct += 1
      # print "So far you have #{correct} correct."
    else
      puts "Incorrect."
      # return correct = 0
    end
  end

  def last_card
    puts "This is card 4 out of 4."
    puts "Question: What cardboard cutout lives at Turing?"

    cutout = gets.chomp
    # correct = 3

    if cutout == "Justin Bieber" || cutout == "justin bieber"
      puts "Correct!"
      # return correct += 1
      # print "So far you have #{correct} correct."
    else
      puts "Incorrect."
      # return correct
    end
  end
end

round = Round.new(deck)
p round.start
p round.next_card
p round.third_card
p round.last_card
print "******* GAME OVER **********"
puts



puts "You had (num) correct guesses out of () for a total score of (%)"

puts "STEM - "
puts "Turing Staff - "
puts "Pop Culture - "





  # def feedback
  #   if guess == cards[0].answer
  #     p "Correct"
  #   else
  #     p "Incorrect"
  #   end
  # end




#   def rotate_cards
#     @deck.cards.rotate
#   end
#
#   def current_Card
#     rotate_cards
#     p rotate_cards[0]
#   end
#
#   def add_1_to_turn
#     @turn_counter += 1
#   end
# end
    # print "You guessed #{guess}"
# answer = int(input("\n Enter answer"))
  # def correct?
  #   if guess == "10"
  #   return true
  #   end
  # end
    # if gets == 10 ## I want to use my feedback method here##
    #    return "Correct!"
    # else
    #    return "Incorrect"
    #  end

  # def correct?
  #   if @guess == @answer
  #       return true
  #   end
  # end

  ##feedback method in place of this block

# round = Round.new(deck)
# p round.start
# p round.feedback
# round.rotate_cards
# round.current_card


# puts "This is card 2 out of 4."
# puts "Question: What is Beyonce's middle name?"
#
# guess = gets.chomp

# p round.feedback
#
# puts "This is card 3 out of 4."
# puts "Question: ?"
#
# guess = gets.chomp
# p round.feedback
#
# puts "This is card 4 out of 4."
# puts "Question: ?"
#
# guess = gets.chomp
# p round.feedback

# p "You had  correct guesses out of "
# p "STEM - correct"
# p "Geography - correct"
# p "Pop Culture - correct"

# p round.feedback
## This will START the new round of the Game.

# class Turns
#   attr_reader :guess, :card, :answer
#   def initialize(guess, card)
#       @guess = guess
#       @card = card
#       @answer = answer
#   end
#
#   def correct?
#     if @guess == @answer
#       return true
#     end
#   end
# end

  # def feedback
    # if turns.correct? == true
    #How to call sister method scope for turns.correct??
    # if @guess == @answer ## If the correct method isn't working this works
    #   return "Correct!"
    # else
    #   return "Incorrect!"
    # end
# p turns.feedback
# p round.start




# turns = Turns.new("10", card_1) #This will create a new Turn.
# return turns.correct?
# p turns.feedback


  # if answer == 10
  #   turns.correct? == true
  # # else
  # #   turns.correct? == false
  #
  # turns.feedback
  # p "This is card 2 out of 4."
