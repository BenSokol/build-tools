# @Filename: cppcheck.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:02pm]
# @Modified: February 18th, 2019 [9:56pm]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

ifndef MAKEFILE_RULE_CPPCHECK_DISABLE
.PHONY: cppcheck
cppcheck: $(SOURCES)
	@printf "Running cppcheck:\n" && cppcheck --force --error-exitcode=1 $(SRCDIR)/* $(SUBDIR)/* || true
endif
