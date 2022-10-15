require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

 require 'pry';
 #binding.pry

RSpec.describe CardGenerator do
  # exists
  it 'exists' do
    cards = CardGenerator.new(0)

    expect(cards).to be_a CardGenerator
  end

  # contains cards.txt as filename
  it 'stores filename' do
    filename = "cards.txt"

    cards = CardGenerator.new(filename)

    expect(cards.filename).to eq "cards.txt"
  end

  # cards.txt is able to print as pure text
  it 'can print cards.txt' do
    filename = "./lib/cards.txt"

    cards = CardGenerator.new(filename)

    # testing how files open and print
    file = File.open("./lib/cards.txt")
    file_data = file.read

    expect(file_data).to eq "Question1,Answer1,cat1\nQuestion2,Answer2,cat1\nQuestion3,Answer3,cat2\n"
end

  # it recognizes each line as a separate card instance
  it 'can split the text into an array' do
    # testing how files open and print
    file = File.open("./lib/cards.txt")
    file_data = file.read
    file_cards = file_data.lines(chomp: true)

    expect(file_cards).to eq ["Question1,Answer1,cat1", "Question2,Answer2,cat1", "Question3,Answer3,cat2"]
  end

  # it recognizes each comma as question, answer, category
  it 'keeps splitting the text into multiple arrays' do
    # testing how files open and print
    file = File.open("./lib/cards.txt")
    file_data = file.read
    file_data.chomp!
    file_sort = file_data.gsub("\n", ",")
    file_each = file_sort.split(',')

    file_done = file_each.each_slice(3).to_a

    expect(file_done[0]).to eq ["Question1", "Answer1", "cat1"]
  end

  it 'does all this in a single method' do

  # has a .cards_init method that does this. Might be recursion...
    # something to do with |lines|
  # it sorts these into each card

    cards = CardGenerator.new("./lib/cards.txt")

    cards.cards_init

  # creates an array
    expect(cards.sorted_cards).to eq [["Question1", "Answer1", :cat1], ["Question2", "Answer2", :cat1], ["Question3", "Answer3", :cat2]]
  end

  it 'puts each array grouping into a card class' do

    cards_gen = CardGenerator.new('./lib/cards.txt').cards_init
    # how to take each array element and make them card classes

    deck = cards_gen.map{|c| c = Card.new(c)}
binding.pry
  end
end
