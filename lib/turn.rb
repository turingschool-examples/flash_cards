require './lib/card'

class Turn

  attr_reader :card,
              :guess

  def initialize(string, card)
    @guess = string
    @card  = card
  end

  def correct?
    process_turn_input(@guess.to_s.downcase, @card.answer.to_s.downcase)
  end

  def feedback
    correct? ? "Correct!" : "Incorrect."
  end

  def process_turn_input(guess, answer)
    return false if guess.empty?
    if guess.is_a?(String)
      full_answer = answer.split
                          .map { |word| word.delete('?!.*&#') }
                          .max_by(&:length)
      match = guess.split.select { |word| word == full_answer }
      guess = answer if match.length.positive?
    end
    guess == answer
  end
end
