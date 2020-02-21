# @Filename: uninstall.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [9:25pm]
# @Modified: February 21st, 2020 [10:32am]
# @Version:  1.0.0
#
# Copyright (C) 2019-2020 by Ben Sokol. All Rights Reserved.

ifndef MAKEFILE_RULE_UNINSTALL_DISABLE

ifeq (,$(findstring NT,$(shell uname)))
SUDO = sudo
endif

.PHONY: uninstall
uninstall:
ifdef $(SUDO)
	@if ! $(SUDO) -n true 2>/dev/null; then printf "Please enter password to uninstall.\n" && $(SUDO) -v; fi
endif
	@if [ -h $(INSTALLDIR)/$(EXE) ]; then printf "Removing symbolic link at $(INSTALLDIR)/$(EXE)\n" && $(SUDO) rm $(INSTALLDIR)/$(EXE); fi
	@if [ -e $(CURDIR)/$(MANDIR)/man$(MANTYPE)/$(EXE).$(MANTYPE) ]; then if [ -h /usr/share/man/man$(MANTYPE)/$(EXE).$(MANTYPE) ]; then printf "Removing symbolic link to manpage at /usr/share/man/man$(MANTYPE)/$(EXE).$(MANTYPE)\n" && $(SUDO) rm /usr/share/man/man$(MANTYPE)/$(EXE).$(MANTYPE); else printf "ERROR: Unable to locate manpage. Manpage doesnt exist at /usr/share/man/man$(MANTYPE)/$(EXE).$(MANTYPE)"; fi; fi
endif
