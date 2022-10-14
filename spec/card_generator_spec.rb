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
    file_each = file_data.split.join(",")
    binding.pry
    file_each.each_slice(3).to_a
    # def remove_n
    #   @file_each.each_slice(3).to_a
    # end

    # file_cards = file_chomp.sub(/,/, '", "')
    # binding.pry
    # we need do an iteration to divide the lines into individual cards
    f1 = [file_cards[0]]
    f2 = [file_cards[1]]
    f3 = [file_cards[2]]
    f_all = [f1, f2, f3]
    expect(f_all[0]).to eq ["Question1", "Answer1", "cat1"]
  end

  # has a .cards_init method that does this. Might be recursion...
    # something to do with |lines|
  # it sorts these into each card

  # creates an array

end
