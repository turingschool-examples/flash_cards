require './lib/card.rb'
require './lib/turn.rb'
require './lib/Card_generator.rb'

RSpec.describe Turn do
  before :each do
    cardset = CardGenerator.new('cards.txt').temp_deck
    @deck = Deck.new(cardset)
    @card = @deck.card_at(0)
    @guess_wrong = "arbitrarily wrong"
    @guess_correct = @card.answer
    @turn_correct = Turn.new(@card.answer, @card)
    @turn_wrong = Turn.new(@guess_wrong, @card)
  end

  it 'exists' do
     expect(@turn_correct).to be_instance_of(Turn)
     expect(@turn_wrong).to be_instance_of(Turn)
     p @card
  end

  it 'correctly created card within turn' do
    expect(@card).to be_instance_of(Card)
    expect(@turn_correct.card.question).to eq(@card.question)
    expect(@turn_correct.card.answer).to eq(@card.answer)
    expect(@turn_correct.card.category).to eq(@card.category)
  end
  
  it 'turns have correctly assigned guess' do 
    expect(@turn_correct.guess).to be_a(String)
    expect(@turn_wrong.guess).to be_a(String)
    expect(@turn_correct.guess).to eq(@guess_correct)
    expect(@turn_wrong.guess).to eq(@guess_wrong)
  end


  it 'identifies correct & incorrect' do
    expect(@turn_correct.correct?).to eq(true)
    expect(@turn_wrong.correct?).to eq(false)
  end
  

  it 'returns correct feedback' do
    expect(@turn_correct.feedback).to eq("Correct!")
    expect(@turn_wrong.feedback).to eq("Incorrect.")
  end

end
