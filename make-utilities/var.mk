# @Filename: var.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:02pm]
# @Modified: October 20th, 2019 [2:54am]
# @Version:  untracked - used for debug only
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

ifndef MAKEFILE_RULE_VAR_DISABLE
.PHONY: var
var:
	@printf "MAKEFILE_DIR_LOCATION: $(MAKEFILE_DIR_LOCATION)\n"
	@printf "MAKEFILE_FILES: $(MAKEFILE_FILES)\n\n"
	@printf "INSTALL_LOCATION: $(INSTALL_LOCATION)\n\n"
	@printf "CC: $(CC)\n"
	@printf "CC: $(shell $(CC) --version)\n"
	@printf "CXX: $(CXX)\n"
	@printf "CC: $(shell $(CXX) --version)\n"
	@printf "Debugger: $(DEBUGGER)\n\n"

	@printf "RELEASECFLAGS: $(RELEASECFLAGS)\n\n"
	@printf "DEVCFLAGS: $(DEVCFLAGS)\n\n"
	@printf "DEBUGCFLAGS: $(DEBUGCFLAGS)\n\n"
	@printf "TESTCFLAGS: $(TESTCFLAGS)\n\n"

	@printf "RELEASECXXFLAGS: $(RELEASECXXFLAGS)\n\n"
	@printf "DEVCXXFLAGS: $(DEVCXXFLAGS)\n\n"
	@printf "DEBUGCXXFLAGS: $(DEBUGCXXFLAGS)\n\n"
ifndef MAKEFILE_RULE_TEST_DISABLE
	@printf "TESTCXXFLAGS: $(TESTCXXFLAGS)\n\n"
endif
	@printf "SOURCES: \n$(strip $(foreach d, $(SOURCES), \t$d\n))\n"
	@printf "OBJECTS: \n$(strip $(foreach d, $(OBJECTS), \t$d\n))\n"
ifndef MAKEFILE_RULE_TEST_DISABLE
	@printf "TESTSOURCES: \n$(strip $(foreach d, $(TESTSOURCES), \t$d\n))\n"
	@printf "TESTOBJECTS: \n$(strip $(foreach d, $(TESTOBJECTS), \t$d\n))\n"
endif
endif
