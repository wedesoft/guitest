require_relative '../window'

RSpec.configure do |c|
  c.before :suite do
    @app = Qt::Application.new ARGV
  end
end

describe Window do

  let :win do
    @win = Window.new
    @win
  end

  describe '@ui.horizontalSlider' do
    it 'should update the LCD number' do
      win.instance_eval { @ui.horizontalSlider }.setValue 10
      win.instance_eval { @ui.lcdNumber }.value.should eq(10.0)
    end
  end

  describe '@ui.resetButton' do
    context 'with slider having non-zero value' do
      before :each do
        win.instance_eval { @ui.horizontalSlider }.setValue 5
      end
      context 'aborting the message box' do
        before :each do
          Qt::MessageBox.should_receive(:question).and_return Qt::MessageBox::Cancel
        end
        it 'should not reset the slider' do
          win.instance_eval { @ui.resetButton }.clicked
          win.instance_eval { @ui.horizontalSlider }.value.should_not be(0)
        end
      end
      context 'confirming the message box' do
        before :each do
          Qt::MessageBox.should_receive(:question).and_return Qt::MessageBox::Ok
        end
        it 'should reset the slider' do
          win.instance_eval { @ui.resetButton }.clicked
          win.instance_eval { @ui.horizontalSlider }.value.should be(0)
        end
        it 'should reset the LCD number' do
          win.instance_eval { @ui.resetButton }.clicked
          win.instance_eval { @ui.lcdNumber }.value.should eq(0.0)
        end
      end
    end
  end

  after :each do
    @win.dispose if @win
    GC.start
  end

end
