class Player

  Y = 300
  AccelerationFactor = 1
  SkidingFactor = 0.80
  JumpHeight = 10

  def initialize
    @y = Y
    @x = WindowHeight / 2
    @velocity = 0.0
    @image = Gosu::Image.new("assets/images/player.png")
  end

  def draw
    @image.draw(@x, @y, ZOrder::Player)
  end

  def go_left
    @velocity -= AccelerationFactor
  end

  def go_right
    @velocity += AccelerationFactor
  end

  def jump
    @velocity += AccelerationFactor
  end

  def move
    @x += @velocity
    @x %= WindowWidth

    @y += @velocity
    @y %= WindowHeight
    @velocity *= SkidingFactor
  end

end
