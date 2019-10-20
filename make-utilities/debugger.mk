# @Filename: debugger.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:02pm]
# @Modified: October 20th, 2019 [2:53am]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

ifndef MAKEFILE_RULE_DEBUGGER_DISABLE
.PHONY: debugger
debugger: debug
	@$(DEBUGGER) $(RUN_CMD) $(COMMAND_LINE_ARGS)
endif
