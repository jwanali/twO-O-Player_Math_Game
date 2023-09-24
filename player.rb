class Player
  attr_accessor :lives, :his_turn
  attr_reader :name
  def initialize(name,his_turn)
    @name = name
    @his_turn = his_turn
    @lives = 3
  end

end