# @Filename: cppcheck.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:02pm]
# @Modified: February 19th, 2019 [12:51am]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

ifndef MAKEFILE_RULE_CPPCHECK_DISABLE
.PHONY: cppcheck
cppcheck: $(SOURCES)
	@printf "Running cppcheck...\n" && cppcheck -q --suppress=preprocessorErrorDirective:submodules/utilities/UTL_textWrap.cpp:17 -D__cplusplus --std=c11 --std=c++14 --force --error-exitcode=1 --enable=warning $(SRCDIR)/* $(SUBDIR)/* -I $(SRCDIR)/* -I $(SUBDIR)/* || true
endif
