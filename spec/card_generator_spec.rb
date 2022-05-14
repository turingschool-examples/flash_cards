require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

RSpec.describe CardGenerator do
  before :each do
    @data = File.open('./lib/cards.txt').readlines.map(&:chomp)
    @card_generator = CardGenerator.new(@data)
  end

  it 'exists & has attributes' do
    expect(@card_generator).to be_a(CardGenerator)
    expect(@card_generator.data).to eq(@data)
    expect(@card_generator.nu_cards).to eq([])
  end

  it 'can format the data into new cards' do
    @card_generator.format(:question, :answer, :category)
    expect(@card_generator.nu_cards.first.answer).to eq("10")
    expect(@card_generator.nu_cards[1].question).to eq("What is Rachel's favorite animal?")
    expect(@card_generator.nu_cards.last.category).to eq("Pop Culture")
  end

  it 'is cards now' do
    expect(@card_generator.cards).to eq(@card_generator.nu_cards)
  end
end
