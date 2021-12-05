

class Card
  attr_reader :question, :answer, :category

  def initialize(question,answer,category)
    @question = question
    @answer = answer
    @category = category
  end
end

class Deck
  attr_reader :cards, :cards_in_category

  def initialize(cards)
    @cards = cards
  end

  def cards_in_category(arg)
    included_cards = []
    cards.each do |card|
      if card.category == arg
        included_cards << card
      end
    end
    return included_cards

  end
end

class Turn
  attr_reader :guess,
              :card,
              :correct

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    @guess == card.answer
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect"
    end
  end
end

class Round
  attr_reader :round,
              :turns,
              :current_card,
              :deck,
              :take_turn

  def initialize(deck)
    @round = round
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @turns.last
    @deck.cards.rotate!
    return new_turn
  end

  def number_correct
    correct_guesses = 0
    @turns.each do |turn|
      if turn.correct?
        correct_guesses += 1
      end
    end

    return correct_guesses
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.card.category == category && turn.correct?
    end
  end

  def percent_correct
    (number_correct.to_f / @turns.count.to_f) * 100.0
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / number_correct.to_f) * 100.0
  end
end

card_1 = Card.new("What is the tallest mountain in the world?", "Mt. Everast", :Geography)
card_2 = Card.new("How many Meters are in a Kilometer", "1000", :STEM)
card_3 = Card.new("What is the southernmost town in the continental United States", "Key West", :Geogrpahy)
card_3 = Card.new("What is the periodic symbol for Gold", "Au", :STEM)
cards =[card_1, card_2, card_3]
deck = Deck.new(cards)
round = Round.new(deck)





  puts "Welcome, you are playing with 4 cards!"
  puts "________________________________________"
  puts "This is card number 1 out of 4"
  puts "What is the tallest mountain in the world?"
new_turn = round.take_turn("Juneau")
