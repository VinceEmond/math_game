class MathQuestion
  def initialize
    @rand_num1 = rand(1..20)
    @rand_num2 = rand(1..20)
  end

  def prompt
    "What does #{@rand_num1} + #{@rand_num2} equal?"
  end

  def answer
    @rand_num1 + @rand_num2
  end
end
