class Bowling
  def initialize rolls
    @rolls = rolls
  end

  def score
    score = 0
    current_roll_index = 0
    1.upto(10) do |frame|
      if @rolls[current_roll_index + 1] == '/'
        score += 10 + @rolls[current_roll_index + 2].to_i
      else  
        score += @rolls[current_roll_index].to_i + @rolls[current_roll_index+1].to_i
      end
      current_roll_index += 2
    end
    score 
  end
end
