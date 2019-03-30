# @Filename: run.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:02pm]
# @Modified: March 28th, 2019 [1:29pm]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

ifndef MAKEFILE_RULE_RUN_DISABLE
.PHONY: run
run: build
	@$(RUN_CMD) $(COMMAND_LINE_ARGS) || printf "Non-zero return code detected.\n"; true
endif
