class Player

  attr_reader :life

  def initialize
    @life = 3
  end

  def lose_life
    @life -= 1
  end

end