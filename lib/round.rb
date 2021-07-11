class Round

  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    #need to figure out how to show the card
    @deck.cards[0]
  end

  def take_turn(guess)
    #takes a string representing the guess
    #creates new turn object with guess and card
    #stores new turn and returns it from take_turn
    #when called the round moves to the next card in the deck
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.shift
    new_turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  #I had to get help with the following and not sure I would have gotten there on my own just yet.
  def number_correct_by_category(category)
    @turns.find_all do |turn|
      turn.card.category == category && turn.card.answer == turn.guess
    end.length
    #I do not understand when/why to call a method after end like in line 37.
  end

  #To get percentage I need to take the amount correct and divide it by the amount of turns. Then multiply by 100.

  def percent_correct
    (number_correct.to_f / @turns.length) * 100
  end

  def correct_category(category)
    @turns.count do |turn|
      turn.card.category == category
    end
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / correct_category(category)) * 100
  end

  def card_number
    @turns.count + 1
  end
end
