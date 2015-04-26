class Bowling
  def initialize rolls
    @rolls = rolls
    @current_roll_index = 0
  end

  def score
    score = 0
    1.upto(10) do |frame|
      if is_strike
        @current_roll_index += 1
        score += 10 + strike_bonus
      elsif is_spare
        @current_roll_index += 2
        score += 10 + spare_bonus
      else  
        score += get_roll_score(@current_roll_index) + get_roll_score(@current_roll_index+1)
        @current_roll_index += 2
      end
    end
    score 
  end

  def get_roll_score index
    is_strike ? 10 : @rolls[index].to_i
  end

  def is_strike
    @rolls[@current_roll_index] == 'X'
  end

  def is_spare
    @rolls[@current_roll_index + 1] == '/'
  end

  def strike_bonus
    is_spare ? 10 : get_roll_score(@current_roll_index) + get_roll_score(@current_roll_index + 1)
  end

  def spare_bonus
    get_roll_score(@current_roll_index)
  end
end
