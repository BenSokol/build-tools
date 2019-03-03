# @Filename: install.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [9:25pm]
# @Modified: March 3rd, 2019 [12:33am]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

ifndef MAKEFILE_RULE_INSTALL_DISABLE
.PHONY: install
install: build
	@if ! sudo -n true 2>/dev/null; then printf "Please enter password to install.\n" && sudo -v; fi
	@if [ ! -d $(INSTALLDIR) ]; then printf "Creating $(INSTALLDIR)\n" && sudo mkdir $(INSTALLDIR); fi
	@printf "Creating $(INSTALLDIR)/$(EXE)\n" && sudo ln -s -i $(CURDIR)/$(EXE) $(INSTALLDIR)/ && sudo chmod +x $(INSTALLDIR)/$(EXE)
	@if [ -e $(CURDIR)/$(MANDIR)/$(MANTYPE)/$(EXE).1 ]; then printf "Creating symbolic link to manpage at /usr/share/man/man1/$(EXE).1\n" && sudo ln -s -i $(CURDIR)/$(MANDIR)/$(MANTYPE)/$(EXE).1 /usr/share/man/man1/ && sudo chmod +x /usr/share/man/man1/$(EXE).1; else printf "ERROR: Unable to locate manpage. Expected $(CURDIR)/$(MANDIR)/$(MANTYPE)/$(EXE).1\n"; fi
endif
