require "./lib/turn.rb"
require "./lib/card.rb"

# Handle correct guesses
# Error code: NameError:
#   undefined local variable or method `card' for #<RSpec::ExampleGroups::Turn:0x00007fd5d5ae8fc8>
# ./spec/turn_spec.rb:25:in `block (2 levels) in <top (required)>'
RSpec.describe Turn do
  it 'exists' do
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
  end

  it 'is correct' do
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq(True)
  end

  it 'has a feedback' do
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq("Correct!")
  end
end


# Handle incorrect guesses

# RSpec.describe Turn do
#   it 'does not exist' do
#     turn = Turn.new("What is the capital of Alaska?", "Juneau", :Geography)
#
#     expect(turn).to be_instance_of(Card)
#   end
#
#   it 'has a quess' do
#     turn = Turn.new("What is the capital of Alaska?", "Juneau", :Geography)
#
#     expect(turn.quess).to eq("Juneau")
#   end
#
#   it 'is correct' do
#     turn = Turn.new("What is the capital of Alaska?", "Juneau", :Geography)
#
#     expect(turn.correct?).to eq(True)
#   end
#
#   it 'has a feedback' do
#     turn = Turn.new("What is the capital of Alaska?", "Juneau", :Geography)
#
#     expect(turn.feedback).to eq("Correct!")
#   end
# end
