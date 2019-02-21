# @Filename: uninstall.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [9:25pm]
# @Modified: February 21st, 2019 [8:53am]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

ifndef MAKEFILE_RULE_UNINSTALL_DISABLE
.PHONY: uninstall
uninstall:
	@if ! sudo -n true 2>/dev/null; then printf "Please enter password to uninstall.\n" && sudo -v; fi
	@if [ -h $(INSTALLDIR)/$(EXE) ]; then printf "Removing symbolic link at $(INSTALLDIR)/$(EXE)\n" && sudo rm $(INSTALLDIR)/$(EXE); fi
	@if [ -e $(CURDIR)/$(EXE).1 ]; then if [ -h /usr/share/man/man1/$(EXE).1 ]; then printf "Removing symbolic link to manpage at /usr/share/man/man1/$(EXE).1\n" && sudo rm /usr/share/man/man1/$(EXE).1; else printf "ERROR: Unable to locate manpage. Manpage doesnt exist at /usr/share/man/man1/$(EXE).1"; fi; else printf "ERROR: Unable to locate manpage. Expected $(CURDIR)/$(EXE).1\n"; fi
endif
