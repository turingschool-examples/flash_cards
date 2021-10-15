require './lib/deck'
require './lib/turn'


class Round
  attr_reader :deck, :turns, :current_card_index

  def initialize(deck_input)
    @deck = deck_input
    @turns = []
    @current_card_index = 0
  end

  def current_card # tells the user which card they need to answer from the deck
    self.deck.cards[@current_card_index]
  end

  def take_turn(user_guess) # user takes a turn answering the current card
    turn = Turn.new(user_guess, self.current_card)
    @turns.push(turn)
    @current_card_index += 1
    turn
  end

  def number_correct # Returns how many questions the user got right no matter where they are in the game
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category_input) # Returns how many turns the user got right by category
    @turns.count do |turn|
      turn.card.category == category_input && turn.correct?
    end
  end

  def percent_correct
    (100 * (self.number_correct.to_f / @turns.length))
  end

  def percent_correct_by_category(category_input)
    category_specific_arry = @turns.find_all do |turn|
      if turn.card.category == category_input
        turn
      end
    end
    (100 * (self.number_correct_by_category(category_input).to_f / category_specific_arry.length))
  end


end
