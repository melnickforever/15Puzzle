#15 puzzle

class Puzzle

  attr_accessor :data, :solution
  
  @zero_pos

  @limit


  def initialize
    @solution = [[1,2,3,4], [5,6,7,8], [9,10,11,12], [13,14,15,0]]
    @data = [[1,2,3,4], [5,6,7,8], [9,10,11,12], [13,14,15,0]]
    @limit = 500
   
    self.set_task
   
    
  end

  def data
    @data.flatten
    
  end

 
  def calc_move_item (pos)


    if  ((@zero_pos["row"] - pos["row"])**2 == 1 and (@zero_pos["col"] - pos["col"]) == 0) or
        ((@zero_pos["col"] - pos["col"])**2 == 1 and (@zero_pos["row"] - pos["row"]) == 0)

      @data[@zero_pos["row"]][@zero_pos["col"]] = @data[pos["row"]][pos["col"]]
      @data[pos["row"]][pos["col"]] = 0

      temp = pos
      pos = @zero_pos
      @zero_pos = temp


      return pos

    end

    return nil
  end

  
  def move_item (left, top, old_p, new_p)

    top =  new_p["row"] - old_p["row"]
    left = new_p["col"] - old_p["col"]

    return [top, left]

  end


  def win?

    if @data == @solution
      return true

    else
      return false
    end
        
  end


  def set_task

    while self.win?

      @zero_pos = {"row" => 3, "col" => 3}
      i = 0
      limit = (rand * @limit).to_i

      while i < limit

        self.do_next_step
        i += 1
      end
    end

  end


  def do_next_step

    if @zero_pos["row"] == 3

      b = 0
    else
      b = 1
    end

    if @zero_pos["row"] == 0
      t = 0
    else
      t = 1
    end

    if @zero_pos["col"] == 3
      r = 0
    else
      r = 1
    end

    if @zero_pos["col"] == 0
      l = 0
    else
      l = 1
    end

    l = (rand * 100 * l).to_i
    r = (rand * 100 * r).to_i
    t = (rand * 100 * t).to_i
    b = (rand * 100 * b).to_i


    case self.set_direction(l, r, t, b)
    when "l"
      @data[@zero_pos["row"]][@zero_pos["col"]] = @data[@zero_pos["row"]][@zero_pos["col"] - 1]
      @data[@zero_pos["row"]][@zero_pos["col"] - 1] = 0
      @zero_pos["col"] -= 1

    when "r"
      @data[@zero_pos["row"]][@zero_pos["col"]] = @data[@zero_pos["row"]][@zero_pos["col"] + 1]
      @data[@zero_pos["row"]][@zero_pos["col"] + 1] = 0
      @zero_pos["col"] += 1

    when "t"

      @data[@zero_pos["row"]][@zero_pos["col"]] = @data[@zero_pos["row"] - 1][@zero_pos["col"]]
      @data[@zero_pos["row"] - 1][@zero_pos["col"]] = 0
      @zero_pos["row"] -= 1

    when "b"
      @data[@zero_pos["row"]][@zero_pos["col"]] = @data[@zero_pos["row"] + 1][@zero_pos["col"]]
      @data[@zero_pos["row"] + 1][@zero_pos["col"]] = 0
      @zero_pos["row"] += 1

    end
  end


  def set_direction (l, r, t, b)

    if l >= r && l >= t && l >= b
      return "l"
    end

    if r >= l && r >= t && r >= b
      return "r"
    end

    if t >= r && t >= l && t >= b
      return "t"
    end

    if b >= r && b >= t && b >= l
      return "b"
    end

  end
end

