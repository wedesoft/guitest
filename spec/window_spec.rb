require 'window'

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
    it 'should update @ui.lcdNumber' do
      win.instance_eval { @ui.horizontalSlider }.setValue 10
      win.instance_eval { @ui.lcdNumber }.value.should eq(10.0)
    end
  end

  after :each do
    @win.dispose if @win
    GC.start
  end

end
