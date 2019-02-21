# @Filename: var.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:02pm]
# @Modified: February 21st, 2019 [3:13am]
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
	@printf "CFLAGS: $(CFLAGS)\n\n"
	@printf "CXX: $(CXX)\n"
	@printf "CXXFLAGS: $(CXXFLAGS)\n\n"
	@printf "Debugger: $(DEBUGGER)\n\n"
	@printf "SOURCES: \n$(strip $(foreach d, $(SOURCES), \t$d\n))\n"
	@printf "OBJECTS: \n$(strip $(foreach d, $(OBJECTS), \t$d\n))\n"
endif
