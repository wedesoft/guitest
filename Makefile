.SUFFIXES: .ui .rb .qrc
RBUIC = rbuic4
RBRCC = rbrcc

all: window_ui.rb gui_rc.rb

clean:
	rm -f *_ui.rb *_rc.rb

%_ui.rb: %.ui
	$(RBUIC) $< > $@

%_rc.rb: %.qrc
	$(RBRCC) $< > $@

