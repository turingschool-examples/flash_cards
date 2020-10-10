class Card_Generator

  def initialize (file_name)
    @file_name = file_name
  end

  def save_info
    File.open(@file_name).each do |line|
      Card.new(line)
    end 
  end


end
