# @Filename: build.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:02pm]
# @Modified: April 11th, 2019 [3:31pm]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

.PHONY: build
build: $(EXE)
ifdef POSTBUILD
	@make -s .post_build
endif
