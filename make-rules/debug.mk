# @Filename: debug.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:02pm]
# @Modified: February 16th, 2019 [10:08pm]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

ifndef MAKEFILE_RULE_DEBUG_DISABLE
.PHONY: debug
debug: build
	@$(DEBUGGER) ./$(EXE) $(COMMAND_LINE_ARGS)
endif
