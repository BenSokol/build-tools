# @Filename: memtest.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:02pm]
# @Modified: October 19th, 2019 [11:27pm]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

ifndef MAKEFILE_RULE_MEMTEST_DISABLE
.PHONY: memtest
memtest: debug
	@valgrind --leak-check=full --show-leak-kinds=all $(RUN_CMD) $(COMMAND_LINE_ARGS) || true
endif
