# @Filename: cppcheck.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:02pm]
# @Modified: February 21st, 2019 [2:17pm]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

ifndef MAKEFILE_RULE_CPPCHECK_DISABLE
.PHONY: cppcheck
cppcheck: $(SOURCES)
	@cppcheck --check-config $(strip $(CPPCHECK_FLAGS)) $(INC) $(SOURCES)
	@printf "Running cppcheck...\n" && cppcheck $(CPPCHECK_FLAGS) $(INC) $(SOURCES)
endif
