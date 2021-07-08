class Round
  attr_reader :deck, :turns


  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_count = 0
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    card_guess = Turn.new(guess, @deck.cards.first) #need to fetch first card



  end

  def number_correct
    @correct_count
  end






end
