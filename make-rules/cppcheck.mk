# @Filename: cppcheck.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:02pm]
# @Modified: February 18th, 2019 [8:10pm]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

ifndef MAKEFILE_RULE_CPPCHECK_DISABLE
.PHONY: cppcheck
cppcheck: $(SOURCES)
	@printf "Running cppcheck:\n" && cppcheck --error-exitcode=1 src/* || true
endif
