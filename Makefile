.SUFFIXES: .ui .rb .qrc
RBUIC = rbuic4
RBRCC = rbrcc
RSPEC = rspec

all: window_ui.rb gui_rc.rb

test:
	$(RSPEC)

clean:
	rm -f *_ui.rb *_rc.rb

dist:
	tar cjf guitest.tar.bz2 .gitignore Makefile README.md gui.qrc gui.rb reset.svg spec/window_spec.rb window.rb window.ui

%_ui.rb: %.ui
	$(RBUIC) $< > $@

%_rc.rb: %.qrc
	$(RBRCC) $< > $@

