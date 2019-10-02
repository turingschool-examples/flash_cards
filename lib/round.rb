class Round



  attr_accessor :deck, :turns, :count
  def initialize(deck)
    @deck = deck
    @turns = []
    @count = 0
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guesses)
   deck.cards.rotate
   self.turns << Turn.new(guesses, current_card)
  #need to get the shovel into array work
  #need to figure out why the turn.new is not working here...works in repl
  end

  def correct?
    turns.each do |turn|
       if turn.guesses = card.answer
        "Correct."
        count += 1
       else
        "Incorrect."
      end
    end
  end

  def number_correct
  end

  def count
  end

  def last

  end

  def feedback
  end

  def number_correct_by_category(category)
  end

  def percent_correct
  end

  def percent_correct_by_category(category)
  end

  def start
  end

end


card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)
  round.deck
 round.current_card
 turn_1 = round.take_turn("Juneau")
