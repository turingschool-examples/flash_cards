class Round

  attr_reader :deck, :round, :turns, :si
  def initialize(deck)
    @deck = deck
    @turns = []
    @si = 0
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    new_card = current_card



    @my_turn = Turn.new(guess, new_card)

    @turns << @my_turn
    # require "pry"; binding.pry
    @deck.cards.shift

    if @my_turn.correct?
      @si += 1
    end

    @my_turn
  end

  def correct?
    if @my_turn.guess == new_card.answer
      true
    end
  end

  def number_correct
    corr = 0
    @turns.each do |turn|
      if turn.correct?
        corr += 1
      end
    end
    corr
  end
#in pulling out correct by category, you have to iterate through an array using a boolean where called category == argument category && turn is correct
#if true add one to counter
#then at the end return your counter

  def number_correct_by_category(category)
    cbc = 0
    @turns.each do |turn|
      if turn.correct? && turn.card.category ==  category
        cbc += 1
      end
      end
      cbc
  end

  def percent_correct
    corr = 0
    @turns.each do |turn|
      if turn.correct?
        corr += 1
      end
    end
    # require "pry"; binding.pry
    (corr * 100.0 / @turns.length)
  end

  def percent_correct_by_category(category)
      corr = 0
      @turns.each do |turn|
        if turn.correct? && turn.card.category == category
          corr += 1
        end
      end
      # require "pry"; binding.pry

      cards_in_cat = @turns.find_all do |turn|
        category == turn.card.category
      end
# require "pry"; binding.pry
      (corr * 100.0 / cards_in_cat.length)
  end
end
