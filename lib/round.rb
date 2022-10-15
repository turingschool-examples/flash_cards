class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @deck_size = deck.cards.length
  end

  def current_card
    @current_card = deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(current_card, guess)
    @turns << turn
    deck.cards.shift
    turn
  end

  def number_correct
    score = 0
    turns.each do |turn|
      score += 1 if turn.correct?
    end
    score
  end

  def number_correct_by_category(category_feedback)
    score_by_category = 0
    turns.each do |turn|
      score_by_category += 1 if turn.card.category == category_feedback && turn.correct?
    end
    score_by_category
  end

  def percent_correct
    (number_correct / turns.length.to_f) * 100
  end

  def percent_correct_by_category(category_feedback)
    score_by_category_percent = 0
    turns.each do |turn|
      score_by_category_percent += 1 if turn.card.category == category_feedback
    end
    (number_correct_by_category(category_feedback).to_f / score_by_category_percent) * 100
  end

  def start
    puts " Welcome! You're playing with #{@deck_size} cards."
    puts '-------------------------------------------------'
    count = 0
    while deck.cards.length.positive?
      puts "This is card number #{count += 1} out of #{@deck_size}."
      puts "#{deck.cards[0].question}"
      new_turn = take_turn(gets)
      puts new_turn.feedback
    end
  end

  def complete
    puts '****** Game over! ******'
    puts "You had #{number_correct} correct guesses out of #{@deck_size} for a total score of #{percent_correct.to_i}%."
    final_score_categories = []
    turns.each do |turn|
      final_score_categories << turn.card.category
    end
    final_score_categories.uniq.each do |ctgrs|
      puts "#{ctgrs} - #{percent_correct_by_category(ctgrs).to_i}% correct"
    end
  end
end
