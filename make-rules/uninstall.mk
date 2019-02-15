# @Filename: uninstall.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [9:25pm]
# @Modified: February 14th, 2019 [10:05pm]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

.PHONY: uninstall
uninstall:
	@if ! sudo -n true 2>/dev/null; then printf "Please enter password to uninstall.\n" && sudo -v; fi
	@if [ -h $(INSTALL_LOCATION)/$(EXE) ]; then printf "Removing symbolic link at $(INSTALL_LOCATION)/$(EXE)\n" && sudo rm $(INSTALL_LOCATION)/$(EXE); fi
	@if [ -e $(CURDIR)/$(EXE).1 ]; then if [ -h /usr/share/man/man1/$(EXE).1 ]; then printf "Removing symbolic link to manpage at /usr/share/man/man1/$(EXE).1\n" && sudo rm /usr/share/man/man1/$(EXE).1; else printf "ERROR: Unable to locate manpage. Manpage doesnt exist at /usr/share/man/man1/$(EXE).1"; fi; else printf "ERROR: Unable to locate manpage. Expected $(CURDIR)/$(EXE).1\n"; fi
