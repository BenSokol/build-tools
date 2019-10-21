# @Filename: run-test.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:02pm]
# @Modified: October 20th, 2019 [7:37pm]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

ifndef MAKEFILE_RULE_RUN_DISABLE
ifndef MAKEFILE_RULE_TEST_DISABLE

.PHONY: run-test run-tests
ifdef MAKEFILE_RULE_CPPCHECK_DISABLE
run-test: test
	@printf "Running mod tests...\n"
	@./$(TESTEXE) --reporter compact --success
endif

ifndef MAKEFILE_RULE_CPPCHECK_DISABLE
run-test: test cppcheck
	@printf "Running mod tests...\n"
	@./$(TESTEXE) --reporter compact --success
endif

run-tests: run-test

endif
endif
