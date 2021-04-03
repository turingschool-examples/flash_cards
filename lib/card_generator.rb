require './lib/card'

class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
    @cards = []
  end

  #because we are initializing a class with the filename, we won't need to use ARGV 

  def read_file
    file = File.open(@filename, 'r')
    file_data = file.read
    # iterate through file_data 
    #try to play with what gets churned out inside file_data
    file.close
    return file_data
  end 
end