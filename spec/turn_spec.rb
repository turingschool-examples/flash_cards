require './lib/card.rb'
require './lib/turn.rb'

RSpec.describe Turn do
  before :each do
    @test_question = "What is the capital of Alaska?"
    @test_ans = "Juneau"
    @test_category = :Geography
    @card = Card.new(@test_question, @test_ans, @test_category)
    @guess_wrong = "arbitrarily wrong"
    @turn_correct = Turn.new(@test_ans, @card)
    @turn_wrong = Turn.new(@guess_wrong, @card)
  end

  it 'exists' do
     expect(@turn_correct).to be_instance_of(Turn)
     expect(@turn_wrong).to be_instance_of(Turn)
  end


  it 'correctly created card' do
    expect(@card).to be_instance_of(Turn)
  end


  it 'has a guess' do
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to be_a(String)
  end


  it 'identifies correct' do
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq(true)
  end


  it 'identifies incorrect' do
    turn_wrong = Turn.new("Anchorage", card)

    expect(turn_wrong.correct?).to eq(false)
  end
  

  it 'returns correct feedback' do
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq("Correct!")


    turn_wrong = Turn.new("Anchorage", card)

    expect(turn_wrong.feedback).to eq("Incorrect.")
  end

end
