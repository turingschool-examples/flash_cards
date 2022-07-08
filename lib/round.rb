require './lib/deck'

class Round

  attr_reader :deck, 
              :turns
  attr_accessor :correct_answers, 
                :turn_count, 
                :total_cards, 
                :categories

  def initialize(deck)
    @deck = deck
    @turns = []
    @correct_answers = 0
    @turn_count = 1
    @total_cards = 0
    @categories = []
  end

  def current_card
    deck.cards.first
  end

  def take_turn(answer, card = current_card)
    @deck.cards.shift
    @turn_count += 1
    new_turn = Turn.new(answer, card)
    @turns << new_turn
    @correct_answers += 1 if @turns.last.correct?
    new_turn
  end

  def number_correct
    @correct_answers
  end

# The percent correct method will take in correct_answers, convert it to a float, and divide it by the number of turns taken so far
  def percent_correct
    (@correct_answers.to_f / turns.count) * 100
  end


  # the number correct by category method needs to take a category as an argument. it should make an array of cards that include that category. it should then test that array for correct answers (answer == guess) and return the total number of correct answers.
  def number_correct_by_category(cat)
    num_by_cat = 0
    turns.each do |turn|
      num_by_cat =+ 1 if turn.correct? && turn.card.category == cat
    end
    num_by_cat
  end

  # The percent correct by category method will be passed a card category as an argument. It will then divide the value of the number_correct_by_category method converted to float by the total occurences of that category in the deck

  def percent_correct_by_category(cat)
    total_by_cat = 0
    @turns.each do |turn|
      total_by_cat += 1 if turn.card.category == cat
    end
    (number_correct_by_category(cat).to_f / total_by_cat) * 100
  end

  # method to collect cards from text file
  def collect_cards
    @cards = []
    File.open('flashcards.txt', 'r') do |file|
    for line in file.readlines()
        import_card = line.split("/")
        card = Card.new(import_card[0], import_card[1], import_card[2].strip.to_sym)
        @cards << card
    end
    @cards
  end

  # shuffles deck => every game is played in diff order
  # def shuffle
  #   @cards = @cards.sample(@cards.count)
  # end


  # Add a method to start the game
  def start
    collect_cards
    shuffle
    @deck = Deck.new(@cards)
    @total_cards = deck.cards.count
    collect_category
    puts "\n\n"
    puts "Welcome! You're playing with #{total_cards} cards."
    puts "-"*30
  end

  

  # Add a collect category method to handle end game feedback
  def collect_category
    deck.cards.each do |card|
      @categories << card.category if categories.include?(card.category) == false
    end
  end
end
