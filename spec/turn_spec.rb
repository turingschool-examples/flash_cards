require './lib/card.rb'
require './lib/turn.rb'

RSpec.describe Turn do
  before :each do
    @test_question = "What is the capital of Alaska?"
    @test_ans = "Juneau"
    @test_category = :Geography
    @card = Card.new(@test_question, @test_ans, @test_category)
    @guess_wrong = "arbitrarily wrong"
    @guess_correct = @test_ans
    @turn_correct = Turn.new(@test_ans, @card)
    @turn_wrong = Turn.new(@guess_wrong, @card)
  end

  it 'exists' do
     expect(@turn_correct).to be_instance_of(Turn)
     expect(@turn_wrong).to be_instance_of(Turn)
  end

  it 'correctly created card' do
    expect(@card).to be_instance_of(Card)
    expect(@card.question).to eq(@test_question)
    expect(@card.answer).to eq(@test_ans)
    expect(@card.category).to eq(@test_category)
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
