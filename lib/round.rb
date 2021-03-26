require_relative 'card'
require_relative 'deck'
require_relative 'turn'

class Round
  attr_reader :deck, :turns, :current_card, :card_index, :correct_card_array, :play_again

  def initialize(deck_in_play)
    @turns = []
    @correct_card_array = []
    @card_index = 0 # used as index to access cards in deck
    @deck = deck_in_play
    @current_card = @deck.cards[@card_index] # current card begins at the first card in the deck array
  end


  # This method does a lot of leg-work, specifically it:
  # - instantiates a new turn and adds a turn to turns array
  # - checks if a turn is correct
  # - increments card index and current card
  def take_turn(user_guess)
    new_turn = Turn.new(user_guess, @current_card)
    @turns << new_turn # adds turn to turns array

    # helper method to deal with correct cards and store them
    check_if_correct(new_turn)

    @card_index += 1 # increments card index by one
    @current_card = @deck.cards[@card_index] # applies incremented card index

    return new_turn
  end


  # Method checks whether a turn is correct and then adds card to array
  # Uses an array to hold correct cards to reference later
  def check_if_correct(turn)
    if turn.correct?
      @correct_card_array << @current_card
      puts "Correct!" # output to user
    end
  end


  # Utilize the correct card array to count score
  def number_correct
    @correct_card_array.count
  end


  # Method utilizes find all method with count to return refined score
  def number_correct_by_category(category_name)
    @correct_card_array.find_all do |card|
      card.category == category_name
    end.count
  end


  # Calculating overall score with all cards in deck
  def percent_correct
    percentage = (self.number_correct.to_f / @deck.cards.count) * 100.0 # to_f method used to force accurate divison
    percentage.truncate(1) # truncates to 1 decimal place
  end


  # Calculating percentage on a category basis
  def percent_correct_by_category(category_name)
    # Better way to format this find_all block?
    categorized_cards =
      @deck.cards.find_all do |card|
        card.category == category_name
      end
    percentage = (number_correct_by_category(category_name).to_f / categorized_cards.count) * 100.0
    percentage.truncate(1) # truncates to 1 decimal place
  end

  # This method starts the round and provides user iteraction and feedback
  def start

    puts "Welcome! You're playing with #{@deck.cards.count} cards."
    37.times do print("-")
    end

    # Iterating over each card in the deck and providing user with a guess
    @deck.cards.each do |turn|

      puts "This is card number #{@card_index + 1} out of #{@deck.cards.count}."
      puts "Question: #{@current_card.question}"

      guess = gets.chomp
      self.take_turn(guess)
    end

    # These two statements only get printed once after game is over
    puts "****** Game Over! ******"
    puts "You had #{self.number_correct} correct guesses out of #{@deck.cards.count} for a total score of #{percent_correct}%"

    # Another use of iteration to break down score by category
    @correct_card_array.each do |card|
      category = card.category
      puts "#{category} - #{percent_correct_by_category(category)}%"
    end

    # Initial testing fails in runner file due to not creating new Round
    # This isn't in the scope of project, but provides a way for user to play again
    # puts "Do you want to try again? y/n"
    # @play_again = gets.chomp

  end

end
