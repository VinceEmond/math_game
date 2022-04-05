class Player
  TOTAL_LIVES = 3
  attr_reader :name, :lives

  def initialize(name)
    @name = name
    @lives = TOTAL_LIVES
  end

  def lose_life
    @lives -= 1
  end
end
