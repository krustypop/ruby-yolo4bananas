require 'gosu'

WindowWidth  = 640
WindowHeight = 480

require_relative 'z_order'
require_relative 'player'
require_relative 'item'
require_relative 'window'

window = Window.new(WindowWidth, WindowHeight)
window.show
