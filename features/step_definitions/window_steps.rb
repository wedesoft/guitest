Given /^the slider at "(.*?)"$/ do |input|
  @input = input
  @win = Window.new
  @win.instance_eval { @ui.horizontalSlider }.setValue input.to_i
end

Then /^the LCD number should show "(.*?)"$/ do |expected|
  @win.instance_eval { @ui.lcdNumber }.value.should eq(expected.to_f)
end
