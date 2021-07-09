class PlayGame

  def start_game
    make_cards
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
    begin_game
    game_flow
    end_game
  end

  def make_cards
    filename = "cards.txt"
    @cards = CardGenerator.new(filename).cards
    # @card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    # @card_2 = Card.new('How long is the backend program at Turing?', '7 months', :Turing)
    # @card_3 = Card.new('What does FSD stand for? Hint: Pesto Paws!', 'Freedom Service Dogs', :Pesto)
    # @card_4 = Card.new('How long are the modules or innings at Turing?', '6 weeks', :Turing)
    # @card_5 = Card.new("Is it appropriate to greet or 'say hello' to Pesto when you meet him?", 'No', :Pesto)
    # @cards = [@card_1, @card_2, @card_3, @card_4, @card_5]
  end

  def begin_game
    puts "Welcome! You're playing with #{@deck.count} cards."
  end

  def game_flow
    until @round.turn_count == (@deck.cards.count + 1)
      puts "This is card number #{@round.turn_count} out of #{@deck.cards.count}."

      puts "Question: #{@round.current_card.question}"
      @round.take_turn(user_guess)
      puts "#{@round.turns.last.feedback}"
    end
  end

  def user_guess
    gets.chomp
  end

  def end_game
    puts "****** Game over! ******"
    puts "You had #{@round.number_correct} correct guesses out of #{@deck.count} for a total score of #{@round.percent_correct}%.
    Geography - #{@round.percent_correct_by_category(:Geography).round(0)}% correct
    Turing - #{@round.percent_correct_by_category(:Turing).round(0)}% correct
    Pesto - #{@round.percent_correct_by_category(:Pesto).round(0)}% correct"
  end
end
