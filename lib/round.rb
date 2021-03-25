require_relative 'card'
require_relative 'deck'
require_relative 'turn'

class Round
  attr_reader :deck, :turns, :current_card, :card_index, :correct_card_array

  def initialize(deck_in_play)
    @turns = []
    @deck = deck_in_play
    @card_index = 0 # used as index to access cards in deck
    @current_card = @deck.cards[@card_index] # current card begins at the first card in the deck array
    @correct_card_array = []


  end

  # This method does a lot of leg-work, specifically:
  # - instantiates new turn
  # - adds turn to turns array
  # - increments number_correct
  # - increments current card by one
  def take_turn(user_guess)
    new_turn = Turn.new(user_guess, @current_card) # instantiates new turn
    @turns << new_turn # adds turn to turns array

    # The reason why I used an array to hold correct cards is because
    # then I can initialize a new Deck with it and access the
    # cards_in_category method.
    if new_turn.correct?
      @correct_card_array << @current_card
    end

    @card_index += 1 # increments current card by one
    @current_card = @deck.cards[@card_index] # !!! this line is important --
    # it reassigns current_card as a last step.

    return new_turn
  end

  def number_correct
    @correct_card_array.count
  end

  # This method is a little insteresting.
  # I used the correct_card_array to initialize a new subset deck
  # This was done so I could utilize the cards_in_category method
  # that lives in the Deck class.
  def number_correct_by_category(category_name)
    deck_subset = Deck.new(@correct_card_array)
    deck_subset.cards_in_category(category_name).count
  end

  def percent_correct
    percentage = (self.number_correct.to_f / @deck.cards.count) * 100
    percentage.truncate(1) # truncates to 1 decimal place
  end

  # Didn't realize the prompt was referring to the last method from the Array class
  # def last
  #   last_card_index = @turns.count - 2 # subtracting 2 from array length instead of 1,
  #   # because the index starts at 0 and not 1.
  #   @turns[last_card_index]
  # end


end

# The code below was used for testing purposes only
card1 = Card.new('Given x = 13 and y = 2, what is the result of x to the power of y?',
169, :Math)
card2 = Card.new('What is the capital of US state of Indiana?', 'Indianapolis', :Geography)
card3 = Card.new('Fill in the blank: In the US, the ___ of Rights is a section of the Constitution that guarantees the rights and liberties for an individual.',
"Bill", :Civics)

cards = [card1, card2, card3]
deck = Deck.new(cards)
round = Round.new(deck)

# round.take_turn('why even?')
# require 'pry'; binding.pry
# round.take_turn('42')
# require 'pry'; binding.pry
# round.take_turn('G-Eazy')
#
# require 'pry'; binding.pry
