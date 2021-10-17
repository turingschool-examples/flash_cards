require_relative 'turn'
require_relative 'deck'
require_relative 'card'

class Round

  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    current_card = deck.cards[0]
    current_card
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.shift
    turn
  end

  def turns_count
    tcount = @turns.count
    tcount
  end

  def correct_cards
    right_answers = []
    @turns.each do |turn|
      if turn.feedback == "Correct!"
        right_answers << turn.card
      end
    end
    right_answers
  end

  def number_correct
    correct_cards.count
  end

  def number_correct_by_category(category)
    count_by_category = 0
    correct_cards.each do |card|
      if card.category == category
        count_by_category += 1
      end
    end
    count_by_category
  end

  def percent_correct
    (number_correct.to_f / turns_count.to_f * 100).to_i
  end

  def percent_correct_by_category(category)
    numcards = 0
    numcorrect = 0
    @turns.each do |turn|
      # if the category matches this method's arg
      if turn.card.category == category
        # count number of cards in the category
        numcards += 1
        # and then, also
        if turn.feedback == "Correct!"
          # track the number of correct turns in same category
          numcorrect += 1
        end
      end
    end
    (numcorrect.to_f / numcards.to_f * 100).to_i
  end

end
