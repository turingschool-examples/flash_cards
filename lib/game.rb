require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

class Game
  attr_reader :deck, :rounds

  def initialize
    @deck = deck
    @rounds = []
  end

  def create_deck(user_deck)
    card_generator = CardGenerator.new(user_deck)
    @deck = Deck.new(card_generator.convert_to_cards)
  end

  def start
    welcome_message
    @deck = choose_deck
    play = true
    while play
      round = Round.new(@deck)
      round.play_round
      @rounds << round
      p "Type 'Yes' if you want to play another round."
      p "You can also type 'Change Deck' to choose a different deck."
      play = end_of_round_message
    end
    game_over
  end

  def end_of_round_message
    round_over_answer = gets.chomp
    case round_over_answer.downcase
    when `yes`
      true
    when `change deck`
      p 'Please choose from one of the decks below!'
      p 'Math, Geography, History, Games or Anime'
      choose_deck
      true
    else
      false
    end
  end

  def welcome_message
    p 'Welcome to the Flash Card game!'
    p '-------------------------------------------------'
    p 'Please choose from one of the decks below!'
    p 'Math, Geography, History, Games or Anime'
    p "You can type 'Quit' in the middle of any round to quit early."
  end

  def choose_deck
    user_deck = gets.chomp.downcase
    decks_that_exist = %w[math geography history games anime]
    until decks_that_exist.include?(user_deck)
      p 'Please choose a deck that exists.'
      p 'Math, Geography, History, Games or Anime'
      user_deck = gets.chomp.downcase
    end
    create_deck(user_deck.concat('.txt').prepend('./decks/'))
  end

  def game_over
    p 'Hope you had fun! Here are your results!'
    rounds.each_with_index do |round, i|
      p "Round #{i + 1}: #{round.current_card.category} - #{round.percent_correct_by_category(round.current_card.category)}% correct"
    end
  end
end