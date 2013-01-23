require 'Qt4'
require 'window_ui'
class Window < Qt::Widget
  def initialize(parent = nil)
    super parent
    @ui = Ui::Window.new
    @ui.setupUi self
  end
end

