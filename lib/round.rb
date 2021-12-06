class Round
  attr_reader :deck,
              :turns,
              :current_card,
              :number_correct,
              :number_wrong,
              :number_correct_by_category,
              :incorrect_guess,
              :new_turn,
              :response

  def initialize(deck)
    @deck = deck
    @turns = []
    #require 'pry'; binding.pry
    #@current_card = deck.cards[0]
    #require 'pry'; binding.pry
    #@take_turn = Turn
    @current_card = deck.cards[0]
    @number_correct = +1
    @incorrect_guess =
    @response = []
    @new_turn = 0

  end

          #def test_records_guess
            #  round.test_records_guess("Juneau")
              #end
  def take_turn(guess)
    another_turn = Turn.new(guess, current_card)
    #another_turn.correct?

    #@number_correct += 1
    #@number_wrong += 1

    #@turns << another_turn

    #deck.cards.shift
    #require 'pry'; binding.pry

  end
  def current_card_now
    #deck.cards[@card.count]
  @cards.count
  #  @cards.map do |card|
  #    card.current_card == current_card_2
    #new_card_2 = 0
    #cards.each do |card|
    #  total += card
      #@current_card << deck.cards[1]
    #  if new_card_2
      #new_card_2 += card

  end

    #  def percent_correct
    #    (number_correct/turns.size.to_f) *100
    #  end

  #def number_right_by_category(category)
  #  turns_correct_by_category = turns.count do |turn|
  #    category == turn.card.category && turn.guess == turn.card.an


  #def percent_correct_by_category(category)
  #  turns_correct_by_category = turns.count do |turn|
  #    category == turn.card.category && turn.guess == turn.card.an
  #  (turns_correct_by_category / total_turns_by_category.to_f) *1
  #end

  def record_guess(guess)
    guesses << guess = Guess.new(guess, current_card)
    user_response << guess.correct?
    @number_correct += 1 if guess.correct?
    @card_count += 1
  end

  def percent_correct
    ((@number_correct.to_f / guesses.count) * 100).round
  end

end
