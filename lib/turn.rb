require './lib/card'

class Turn

  attr_reader :card, :guess
  
  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    process_turn_input(@guess.to_s.downcase, 
                       @card.answer.to_s.downcase)
  end

  def feedback
    correct? ? "Correct!" : "Incorrect."
  end

  def process_turn_input(process_guess, process_answer)
    guess_str = process_guess
    answ_str = process_answer
    guess_str.empty? ? (return false) : nil
    guess_str = convert_numeric(guess_str)
    answ_str = convert_numeric(answ_str)
    if guess_str.kind_of?(String) && answ_str.kind_of?(String)
      big_word = answ_str.split
                         .map {|word| word.delete('?!.*&#')}
                         .max_by(&:length)
      match = guess_str.split.select {|word| word == big_word}
      match.length > 0 ? guess_str = answ_str : nil
    end
    guess_str == answ_str
  end

  def convert_numeric(str)
    str =~ /.\d/ ? (return str.to_f) : str
    str =~ /\d$/ ? (return str.to_i) : str
  end
end