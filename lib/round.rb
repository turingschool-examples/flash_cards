class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @turns << turn
    @deck.cards.rotate!(1)
    turn
  end

  def number_correct
    correct = 0
    @turns.map do |turn|
      if turn.card.answer == turn.guess
        correct += 1
      end
    end
    correct
  end

  def number_correct_by_category(category)
    correct_turns = []
    @turns.each do |turn|
      if turn.card.answer == turn.guess
        correct_turns << turn
      end
    end
    correct_by_category = []
    correct_turns.each do |turn|
      if turn.card.category == category
        correct_by_category << turn
      end
    end
    correct_by_category.count
  end

  def percent_correct
    count = @turns.count
    number_correct.to_f / count * 100
  end

  def percent_correct_by_category(category)
    turns_by_category = []
    @turns.each do |turn|
      if turn.card.category == category
        turns_by_category << turn
      end
    end
    number_correct_by_category(category).to_f / turns_by_category.count * 100
  end

  def start
    turns = 0
    until turns == 3
      turns += 1
      puts current_card.question
      user_input = gets.chomp
      turn = take_turn(user_input)
      puts turn.feedback
    end
  end
end
