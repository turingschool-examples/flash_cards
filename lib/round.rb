class Round
  attr_reader :deck, :turns, :guess
  def initialize(deck)
    @deck = deck
    @turns = []
    @guess = Turn.new(guess, current_card)
  end

  def current_card #refactor me into cards!!
    deck.cards.first
  end

  def take_turn(guess)
    nturn = Turn.new(guess, current_card)
    @turns.push(nturn)
    deck.cards.rotate!
    nturn
    # maybe gets.chomp lives here
  end

  def number_correct
    result = []
    @turns.each do |turn|
      if turn.guess == turn.card.answer #refactor this turn.correct?
        result.push(turn.card)
      end
    end
    result.count
  end

  def number_correct_by_category(category)
  #   def number_correct_by_category(category)
  #     @turns.find_all do |turn|
  #       turn.card.category == category && turn.card.answer == turn.guess #want to refactor this
  #      end.length
  #   end
    results = []
    @turns.each do |turn|
      if turn.correct? == true
        results.push(turn)
      end
    end
    separated = []
    results.each do |result1|
      if result1.card.category == category
        separated.push(result1)
      end
    end
    separated.count
  end

  def percent_correct
    (number_correct.to_f/turns.count)*100
  end

  def percent_correct_by_category(category)
    result = []
    @turns.each do |turn|
      if turn.card.category == category && turn.correct? == true
      result.push(turn)
      end
    end
    (result.count.to_f)*100
  end

  def start
    puts "Welcome! \n You're playing with #{deck.count} cards.
        -------------------------------------------------
          This is card number #{turns.count + 1} out of #{deck.count}.
          Question: #{current_card.question}?
          Type answer below"
    first_turn
    until finished_with_cards == true
      if @guess.downcase == current_card.answer.downcase#refactor me
        require "pry"; binding.pry
        puts "#{turns[-1].feedback}
        This is card number #{@turns.count + 1} out of #{deck.count}.
        Question: #{current_card.question}?
        Type answer below"
        @guess = gets.chomp
          take_turn(@guess)
      elsif @guess.downcase != current_card.answer
        # require "pry"; binding.pry
        puts " #{turns[-1].feedback}
        This is card number #{@turns.count + 1} out of #{deck.count}.
        Question: #{current_card.question}?
        Type answer below"
        @guess = gets.chomp
      else
        puts "wtf is happening."
        take_turn(@guess)
      end

    end
  end

  def first_turn
    # @guess = gets.chomp
    nturn = Turn.new(@guess = gets.chomp, @deck.cards[0])
    @turns.push(nturn)
    @deck.cards.rotate!
  end

  # def start
  #
  #   puts "Welcome! \n You're playing with #{deck.count} cards.
  #       -------------------------------------------------
  #         This is card number #{turns.count + 1} out of #{deck.count}.
  #         Question: #{current_card.question}?
  #         Type answer below"
  #   first_turn
  #
  # end

  def finished_with_cards
    @turns.count == (deck.cards.count)-1
  end

  def ending_message
     if finished_with_cards == true
       puts "****** Game over! ******
You had #{number_correct} correct guesses out of 3 for a total score of #{percent_correct}%.
STEM - #{percent_correct_by_category(:STEM)}% correct
Geography - #{percent_correct_by_category(:Geography)}% correct"
     end
  end
end
