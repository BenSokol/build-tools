# @Filename: install.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [9:25pm]
# @Modified: February 14th, 2019 [10:04pm]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

.PHONY: install
install: build
	@if ! sudo -n true 2>/dev/null; then printf "Please enter password to install.\n" && sudo -v; fi
	@if [ ! -d $(INSTALL_LOCATION) ]; then printf "Creating $(INSTALL_LOCATION)\n" && sudo mkdir $(INSTALL_LOCATION); fi
	@if [ ! -h $(INSTALL_LOCATION)/$(EXE) ]; then printf "Creating $(INSTALL_LOCATION)/$(EXE)\n" && sudo ln -s $(CURDIR)/$(EXE) $(INSTALL_LOCATION)/ && sudo chmod +x $(INSTALL_LOCATION)/$(EXE); fi
	@if [ -e $(CURDIR)/$(EXE).1 ]; then if [ ! -h /usr/share/man/man1/$(EXE).1 ]; then printf "Creating symbolic link to manpage at /usr/share/man/man1/$(EXE).1\n" && sudo ln -s $(CURDIR)/$(EXE).1 /usr/share/man/man1/ && sudo chmod +x /usr/share/man/man1/$(EXE).1; else printf "ERROR: Unable to link manpage. Manpage already exists at /usr/share/man/man1/$(EXE).1"; fi; else printf "ERROR: Unable to locate manpage. Expected $(CURDIR)/$(EXE).1\n"; fi
