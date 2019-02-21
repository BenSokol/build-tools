# @Filename: tar.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:02pm]
# @Modified: February 16th, 2019 [10:07pm]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

ifndef MAKEFILE_RULE_TAR_DISABLE
.PHONY: tar
tar: clean
	@printf "Creating \"../$(notdir $(CURDIR)).tgz\":\n" &&  \
	COPYFILE_DISABLE=1 &&                                    \
	cd $(dir $(CURDIR)) &&                                   \
	tar -czf $(notdir $(CURDIR)).tgz $(notdir $(CURDIR)) &&  \
	mv -f $(CURDIR).tgz $(notdir $(CURDIR)).tgz
endif
