require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

require 'pry';
# binding.pry
#

############## BIG IDEAS ###################

# MOVE CARDS INTO AN ARRAY FOR CORRECT_CARDS
# AN ARRAY FOR WRONG_CARDS TOO??
# ALL NUMBER CORRECT OR CATEGORY CORRECT CAN HAPPEN THERE.

#############################################
#############################################

# def begin
### puts welcome, card number, and line break
### hit enter to go to next step???

# def turn
  # - round.current_card
  # return *numb of *numb
  # return cur_card.question
  # - turn1 = round.taketurn( ASK FOR GUESS )
  # - turn1.correct?
  # - turn1.feedback
  # - round.store_card

  # until deck.empty? == true
  #  turn
  # end
# end

# def finish
  # - count cards correct
  # - pct correct
  # - sort cards correct by category
  # - pct correct by category
# end

#######################################################
#######################################################

### Start a new game / deck of cards.
    # Welcome! You're playing with 4 cards.
    # -------------------------------------------------


### New turn happens, puts count card of total cards
    # This is card number 1 out of 4.
    # Question: What is 5 + 5?

### This is where @guess is prompted and input is given
    # 10

### Guess is added to turn and verified against card.answer
### Gives turn.feedback
    # Correct!

### Another New turn...
    # This is card number 2 out of 4.
    # Question: What is Rachel's favorite animal?
    # panda
    # Incorrect.

### Next turn
    # This is card number 3 out of 4.
    # Question: What is Mike's middle name?
    # nobody knows
    # Correct!

### Final turn
    # This is card number 4 out of 4.
    # Question: What cardboard cutout lives at Turing?
    # Justin Bieber
    # Correct!

### Sort by categories, number right, percents of these.
### Gives this back to user
    # ****** Game over! ******
    # You had 3 correct guesses out of 4 for a total score of 75%.
    # STEM - 100% correct
    # Turing Staff - 50% correct
    # Pop Culture - 100% correct
