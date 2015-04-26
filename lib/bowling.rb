class Bowling
  def initialize rolls
    @rolls = rolls
  end

  def score
    score = 0
    @rolls.each_char do |roll|
      score += roll.to_i
    end
    score 
  end
end
