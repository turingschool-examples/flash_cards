require './lib/card'

class Turn

  attr_reader :card, :guess
  
  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    process_turn_input
  end

  def feedback
    correct? ? "Correct!" : "Incorrect."
  end

  def process_turn_input
    guess_str = @guess.to_s.downcase
    answ_str = @card.answer.to_s.downcase
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
    # if @card.answer.length > @guess.length
    #   ans_size_diff = @card.answer.length - @guess.length.to_f
    #   ans_size_diff_perc = (ans_size_diff / @card.answer.length * 100)
    #   if ans_size_diff_perc.to_i < 30
    #     if @card.answer.downcase.include?(str.downcase)
    #       (return @card.answer.downcase)
    #     end
    #   end
    # end
    guess_str == answ_str
  end

  def convert_numeric(str)
    str =~ /.\d/ ? (return str.to_f) : nil
    str =~ /\d$/ ? (return str.to_i) : str
  end
end