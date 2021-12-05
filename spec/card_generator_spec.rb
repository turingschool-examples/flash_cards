require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'

RSpec.describe CardGenerator do
  it 'exists' do
    filename = "./lib/test_cards.txt"
    card_gen = CardGenerator.new(filename)
    expect(card_gen).to be_instance_of(CardGenerator)
  end

  it 'builds cards from file' do
    card_1 = Card.new('What recording artist in 1993 changed their name to a symbol that is not included in the Ruby character map?', 'Prince', :FamousPeople)
    card_1 = Card.new('What recording artist in 1993 changed their name to a symbol that is not included in the Ruby character map?', 'Prince', :FamousPeople)
    card_2 = Card.new('You have seven times more potatoes than the difference of nine and six. How many potatoes do you have?', 21, :Math)
    card_3 = Card.new('Complete this piece of sage advice: "Live, Laugh, _____."', 'Love', :Philosophy)
    card_4 = Card.new('Which famous scientologist starred in the year-2000 trainwreck known as Battlefield Earth?', 'John Travolta', :FamousPeople)
    card_5 = Card.new('Two rabbits mate and have 4 baby rabbits, who grow up to make 16 new babies. If a rabbit eats two carrots a day, how many carrots are needed to feed the whole family for a week?', 308, :Math)
    card_6 = Card.new('"Go to bed with itchy butt, wake up with _______."', 'stinky fingers', :Philosophy)
    card_7 = Card.new('Who is the legendary pop diva that ROASTED rapper Jay-Z on a ground-breaking double album in 2016?', 'Beyoncé', :FamousPeople)
    card_8 = Card.new('You cut a large cheese wheel into 40 equal wedges. You eat four of the cheese wedges, give one to your neighbor, and lose five when you accidentally leave them on the roof of your car before driving off. You put the remaining wedges back together to form a circle with a missing section. If one edge of the missing section of this incomplete cheese wheel were to represent the minute hand pointing at 12 on a clock, and if the other edge of the missing section represented the clock\'s hour hand, what is the SMALLEST number that the hour hand could be pointing to?', 3, :Math)
    card_9 = Card.new('Between FAST, CHEAP, and GOOD, any project can only be how many of these things?', 2, :Philosophy)

    manual_cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9]

    filename = "./lib/test_cards.txt"
    auto_cards = CardGenerator.new(filename).cards
    expect(auto_cards[0].question).to eq(manual_cards[0].question)
    expect(auto_cards[0].answer).to eq(manual_cards[0].answer)
    expect(auto_cards[0].answer).to eq(manual_cards[0].answer)
    expect(auto_cards[1].question).to eq(manual_cards[1].question)
    expect(auto_cards[1].answer).to eq(manual_cards[1].answer)
    expect(auto_cards[1].answer).to eq(manual_cards[1].answer)
    expect(auto_cards[2].question).to eq(manual_cards[2].question)
    expect(auto_cards[2].answer).to eq(manual_cards[2].answer)
    expect(auto_cards[2].answer).to eq(manual_cards[2].answer)
    expect(auto_cards[3].question).to eq(manual_cards[3].question)
    expect(auto_cards[3].answer).to eq(manual_cards[3].answer)
    expect(auto_cards[3].answer).to eq(manual_cards[3].answer)
    expect(auto_cards[4].question).to eq(manual_cards[4].question)
    expect(auto_cards[4].answer).to eq(manual_cards[4].answer)
    expect(auto_cards[4].answer).to eq(manual_cards[4].answer)
    expect(auto_cards[5].question).to eq(manual_cards[5].question)
    expect(auto_cards[5].answer).to eq(manual_cards[5].answer)
    expect(auto_cards[5].answer).to eq(manual_cards[5].answer)
    expect(auto_cards[6].question).to eq(manual_cards[6].question)
    expect(auto_cards[6].answer).to eq(manual_cards[6].answer)
    expect(auto_cards[6].answer).to eq(manual_cards[6].answer)
    expect(auto_cards[7].question).to eq(manual_cards[7].question)
    expect(auto_cards[7].answer).to eq(manual_cards[7].answer)
    expect(auto_cards[7].answer).to eq(manual_cards[7].answer)
    expect(auto_cards[8].question).to eq(manual_cards[8].question)
    expect(auto_cards[8].answer).to eq(manual_cards[8].answer)
    expect(auto_cards[8].answer).to eq(manual_cards[8].answer)
  end
end
