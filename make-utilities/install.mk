# @Filename: install.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [9:25pm]
# @Modified: February 21st, 2020 [10:32am]
# @Version:  1.0.0
#
# Copyright (C) 2019-2020 by Ben Sokol. All Rights Reserved.

ifndef MAKEFILE_RULE_INSTALL_DISABLE

ifeq (,$(findstring NT,$(shell uname)))
SUDO = sudo
endif

.PHONY: install
install: $(INSTALL_TYPE)
ifdef $(SUDO)
  @if ! $(SUDO) -n true 2>/dev/null; then printf "Please enter password to install.\n" && $(SUDO) -v; fi
endif
	@if [ ! -d $(INSTALLDIR) ]; then printf "Creating $(INSTALLDIR)\n" && $(SUDO) mkdir $(INSTALLDIR); fi
	@printf "Creating $(INSTALLDIR)/$(EXE)\n" && $(SUDO) ln -s -i $(CURDIR)/$(EXE) $(INSTALLDIR)/ && $(SUDO) chmod +x $(INSTALLDIR)/$(EXE)
	@if [ -e $(CURDIR)/$(MANDIR)/man$(MANTYPE)/$(EXE).$(MANTYPE) ]; then printf "Creating symbolic link to manpage at /usr/share/man/man$(MANTYPE)/$(EXE).$(MANTYPE)\n" && $(SUDO) ln -s -i $(CURDIR)/$(MANDIR)/man$(MANTYPE)/$(EXE).$(MANTYPE) /usr/share/man/man$(MANTYPE)/ && $(SUDO) chmod +x /usr/share/man/man$(MANTYPE)/$(EXE).$(MANTYPE); fi

endif
