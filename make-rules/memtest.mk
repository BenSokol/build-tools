# @Filename: memtest.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:02pm]
# @Modified: February 14th, 2019 [5:03pm]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

.PHONY: memtest
memtest: $(EXE)
	@valgrind --leak-check=full --show-leak-kinds=all ./$(EXE) $(COMMAND_LINE_ARGS) || true
