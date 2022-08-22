class Question
  
  attr_reader :answer

  def initialize
    @num1 = rand(1 .. 20)
    @num2 = rand(1 .. 20)

    @answer = @num1 + @num2
  end

  def generate_question
    self.initialize
    "What does #{@num1} + #{@num2} equal?"
  end

end