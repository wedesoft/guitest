require 'rake/clean'
require 'cucumber/rake/task'
BUNDLER = 'bundle'
RBUIC = 'rbuic4'
RBRCC = 'rbrcc'
QRC_FILE = 'gui.qrc'
QRC_RB_FILE = 'gui_rc.rb'
ICON_FILES = FileList['*.svg']

desc 'Build everything'
task :default => ['window_ui.rb', 'gui_rc.rb']

Cucumber::Rake::Task.new

desc 'Generate RC Ruby file from .qrc file'
file QRC_RB_FILE => [QRC_FILE, *ICON_FILES] do |rc_file|
  sh "#{BUNDLER} exec #{RBRCC} #{QRC_FILE} -o #{rc_file.name}"
end

desc 'Generate UI Ruby files from .ui files'
rule /.*_ui.rb$/ => [proc { |task_name| task_name.sub( /_ui.rb$/, '.ui' ) }] do |t|
  sh "#{BUNDLER} exec #{RBUIC} #{t.source} -o #{t.name}"
end

CLEAN.include QRC_RB_FILE, '*_ui.rb'

