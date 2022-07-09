require './lib/card_generator'
filename = "cards.txt"

RSpec.describe CardGenerator do
  it 'exists' do
    card = CardGenerator.new("cards.txt")

    expect(card).to be_instance_of(CardGenerator)
  end

  it 'returns an array of cards' do
    card = CardGenerator.new("cards.txt")

    expect(card.cards).to be_instance_of(Array)
    expect(card.cards).to all( be_an(Card) )

    #no way to say what will be in the array yet
    #other testing options - make sure it returns an instance of an aray
    #    expect(card.cards).to be_instance_of(Array) - placeholder
    # use an all matcher when you want to verify that an array contains a certain
    #    expect(card.cards).to all( be_an(Card) ) checks for type so insert a class

  end

end


#think of tests in terms on returns
