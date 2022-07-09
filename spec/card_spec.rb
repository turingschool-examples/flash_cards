require './lib/card.rb'

RSpec.describe Card do
before :each do
  @test_question = "What is the capital of Alaska?"
  @test_ans = "Juneau"
  @test_category = :Geography
  @card = Card.new(@test_question, @test_ans, @test_category)
end

  it 'exists' do
    expect(@card).to be_instance_of(Card)
  end

  it 'has a question' do
    expect(@card.question).to be_a(String)
    expect(@card.question).to eq(@test_question)
  end

  it 'has an answer' do
    expect(@card.answer).to be_a(String)
    expect(@card.answer).to eq(@test_ans)
  end

  it 'has a category' do
    expect(@card.category).to be_a(Symbol)
    expect(@card.category).to eq(@test_category)
  end
end