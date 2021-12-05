# require 'pry'
class Round
#need a deck of cards
#need a user to guess for a certain card in the deck
#need a correct/incorrect for if answer matches guess
#need to record correct turns
#need to go to next card in deck
#record # correct
#record # correct by category
#record % correct by category (req # correct by category over # in category attempted)
attr_reader :deck,
            :turns

  def initialize(deck)
    @deck              = deck
    @turns             = []
  end

  def current_card
    current_card = @deck.cards.first
  end

  def take_turn(guess) #How to align?
    container = Turn.new(guess, current_card)

    # if guess == current_card.answer
    #   @correct_container += 1
    #   #puts @correct_container
    # end

    @turns << container
    deck.cards.rotate!
    return container
  end

  def number_correct
    correct_counter = 0

    @turns.each do |turn|
      if turn.correct? == true
        correct_counter += 1
      end
    end
    return correct_counter
  end

  def number_correct_by_category(category)
    correct_counter = 0

    @turns.each do |turn|
      if turn.correct? == true && category == turn.card.category
        correct_counter += 1
      end
    end
    return correct_counter
  end

  def percent_correct
    (number_correct / turns.length.to_f) * 100
  end

end
