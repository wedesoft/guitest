require 'Qt4'
require 'window_ui'
class Window < Qt::Widget
  slots 'reset()'
  def initialize(parent = nil)
    super parent
    @ui = Ui::Window.new
    @ui.setupUi self
    connect @ui.resetButton, SIGNAL('clicked()'), self, SLOT('reset()')
  end
  def reset
    @ui.horizontalSlider.setValue 0
  end
end

