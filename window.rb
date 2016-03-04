class Window < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "YOLO 4 Bananas!"

    @background_image = Gosu::Image.new("assets/images/background.png")
    @player = Player.new
    @items = []
  end

  def update
    # handle items fall
    update_items

    # handle player moves
    update_player
  end

  def update_items
    populate_items
    @items.each(&:update)
    @items.reject! {|item| item.y > WindowHeight }
  end

  def populate_items
    return if @items.size >= 15

    type = rand
    if type < 0.035
      @items.push(Item.new(:positiv_item))
    elsif type < 0.040
      @items.push(Item.new(:negativ_item))
    end
  end

  def update_player
    @player.go_left if Gosu::button_down?(Gosu::KbLeft)
    @player.go_right if Gosu::button_down?(Gosu::KbRight)
    @player.jump if Gosu::button_down?(Gosu::KbSpace)
    @player.move
  end

  def draw
    # background display
    @background_image.draw(0, 0, ZOrder::Background)

    # items display
    @items.each(&:draw)

    # player display
    @player.draw
  end



end
