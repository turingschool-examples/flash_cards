class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    @deck.cards.shift
    @turns.last
  end

  def number_correct
    @turns.count do |turn|
      turn.correct? == true
    end
  end

  def percent_correct
    result = (number_correct / @turns.count.to_f) * 100
  end

  def correct_turns
    find = @turns.find_all do |turn|
      turn.correct? == true
    end
  end

  def number_correct_by_category(category)
    correct_turns.count do |turn|
      turn.card.category == (category)
    end
  end

  def turns_by_category(category)
    @turns.count do |turn|
      turn.card.category == category
    end
  end

  def percent_correct_by_category(category)
    result = (number_correct_by_category(category) / turns_by_category(category).to_f) * 100
  end
end







# def turns_by_category(category)
#   array = []
#   @turns.each do |turn|
#     if turn.card.category == category
#       array << turn
#     end
#   end
#   array.count
# end

# def correct_cards
#   found = @turns.find_all do |turn|
#     if turn.correct? == true
#       turn.card
#     end
#   end
# end

# def number_correct_by_category(category)
#   array = []
#   correct_cards.each do |card|
#     if card.category == (category)
#       array << card
#     end
#   end
#   array.count
# end

# it 'correct cards' do
#   card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#   card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
#   card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
#   card_4 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#
#   cards = [card_1, card_2, card_3, card_4]
#   deck = Deck.new(cards)
#   round = Round.new(deck)
#   first_turn = round.take_turn("Juneau")
#   second_turn = round.take_turn("Juneau")
#   third_turn = round.take_turn("Juneau")
#   fourth_turn = round.take_turn("Juneau")
#
#   expect(round.correct_cards).to eq([card_1, card_4])
# end
