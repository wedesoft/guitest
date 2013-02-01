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
    if Qt::MessageBox.question(self,
                               'Reset Value',
                               'Do you really want to reset the slider?',
                               Qt::MessageBox::Ok | Qt::MessageBox::Cancel,
                               Qt::MessageBox::Cancel) == Qt::MessageBox::Ok
      @ui.horizontalSlider.setValue 0
    end
  end
end

