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

  def number_correct
    correct_int = 0
    self.turns.each do |turn|
      if turn.correct?
        correct_int += 1
      end
    end
    correct_int
  end

  def number_correct_by_category(category_input)
    correct_int = 0
    self.turns.each do |turn|
      if turn.correct? && turn.card.category == category_input
        correct_int += 1
      end
    end
    correct_int
  end


end
