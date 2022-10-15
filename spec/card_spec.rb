require './lib/card'

RSpec.describe Card do
  # card class exists and an instance can be made
  it 'exists' do
    card = Card.new(card_arr = [1,2,3])

    expect(card).to be_instance_of(Card)
  end
  # contains a question that can be accessed with :question
  it 'has a question' do
    card = Card.new(card_arr = ["Question", "Answer", :category])

    expect(card.question).to eq("Question")
  end
  # contains an answer that can be accessed with :answer
  it 'has an answer' do
    card = Card.new(card_arr = ["Question", "Answer", :category])

    expect(card.answer).to eq("Answer")
  end
  # contains a category that can be accessed with :category
  it 'has a category' do
    card = Card.new(card_arr = ["Question", "Answer", :category])

    expect(card.category).to eq(:category)
  end
  # question, answer, and category are dynamic

  # any other edge cases?
end
