# @Filename: var.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:02pm]
# @Modified: February 14th, 2019 [10:06pm]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

.PHONY: var
var:
	@printf "MAKEFILE_DIR_LOCATION: $(MAKEFILE_DIR_LOCATION)\n"
	@printf "INSTALL_LOCATION: $(INSTALL_LOCATION)\n"
	@printf "CC: $(CC)\n"
	@printf "CFLAGS: $(CFLAGS)\n\n"
	@printf "CXX: $(CXX)\n"
	@printf "CXXFLAGS: $(CXXFLAGS)\n\n"
	@printf "Debugger: $(DEBUGGER)\n\n"
	@printf "SOURCES: \n$(strip $(foreach d, $(SOURCES), \t$d\n))\n"
	@printf "OBJECTS: \n$(strip $(foreach d, $(OBJECTS), \t$d\n))\n"
