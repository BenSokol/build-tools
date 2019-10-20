# @Filename: test.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:02pm]
# @Modified: October 20th, 2019 [12:43am]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

ifndef MAKEFILE_RULE_TEST_DISABLE
.PHONY: test
test: $(EXE)-test
ifdef POSTBUILD
	@make -s .post_build
endif
endif
