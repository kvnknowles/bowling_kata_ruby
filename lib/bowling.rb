class Bowling
  def initialize rolls
    @rolls = rolls
  end

  def score
    score = 0
    current_roll_index = 0
    1.upto(10) do |frame|
      if is_spare current_roll_index
        score += 10 + spare_bonus(current_roll_index)
      else  
        score += @rolls[current_roll_index].to_i + @rolls[current_roll_index+1].to_i
      end
      current_roll_index += 2
    end
    score 
  end

  def is_spare roll_index
    @rolls[roll_index + 1] == '/'
  end

  def spare_bonus roll_index
    @rolls[roll_index + 2].to_i
  end
end
