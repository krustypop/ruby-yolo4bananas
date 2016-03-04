class Item
  attr_reader :y

  def initialize(type)
    @image = if type == :positiv_item
               Gosu::Image.new("assets/images/banana.png")
             elsif type == :negativ_item
               Gosu::Image.new("assets/images/bomb.png")
             end

    @velocity = Gosu::random(0.8, 3.3)

    @x = rand * (WindowWidth - @image.width)
    @y = 0
  end

  def update
    @y += @velocity
  end

  def draw
    @image.draw(@x, @y, ZOrder::Items)
  end

end
