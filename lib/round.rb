class Round
  attr_reader :deck, :turns
  attr_accessor :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @deck_size = deck.cards.length
    @current_card = deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(current_card, guess)
    @turns << turn
    deck.cards.shift
    @current_card = deck.cards[0]
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
    card_plural = 'cards'
    card_plural = 'card' if @deck_size == 1
    puts " Welcome! You're playing with #{@deck_size} #{card_plural}."
    puts '-------------------------------------------------'
    sleep(1)

    count = 0
    while deck.cards.length.positive?
      puts "This is card number #{count += 1} out of #{@deck_size}."
      sleep(1)

      puts "#{deck.cards[0].question}"
      new_turn = take_turn(gets)
      sleep(1)

      puts new_turn.feedback
      sleep(1)
    end
  end

  def complete
    puts '****** Game over! ******'
    sleep(1)

    guess_plural = 'guesses'
    guess_plural = 'guess' if number_correct == 1
    puts "You had #{number_correct} correct #{guess_plural} out of #{@deck_size} for a total score of #{percent_correct.to_i}%."
    sleep(2)

    final_score_categories = []
    turns.each do |turn|
      final_score_categories << turn.card.category
    end

    final_score_categories.uniq.each do |categories|
      puts "#{categories} - #{percent_correct_by_category(categories).to_i}% correct"
    end
    sleep(1)

    puts "Switch .txt files to play with another deck."
    sleep(3)

    puts "Thanks for playing!"
    sleep(1)
  end
end
