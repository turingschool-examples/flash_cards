class CardManager
  attr_reader :cards_by_file

  def initialize(file_name=nil)
    @cards_by_file = {}
    @file_name = file_name
  end

  def load_from_file(file_name) 
    if @cards_by_file.has_key?
      puts "File already loaded!"
    else
      # TODO Open file and load
    end
  end

  # def valid?(line)
  #   data = line.split(',')
  #   return data if data.length == 3
  #     puts "Invalid line format."
  # end


end
