# @Filename: clean.mk
# @Author:   Ben Sokol <Ben>
# @Email:    ben@bensokol.com
# @Created:  February 14th, 2019 [5:02pm]
# @Modified: February 14th, 2019 [5:03pm]
# @Version:  1.0.0
#
# Copyright (C) 2019 by Ben Sokol. All Rights Reserved.

.PHONY: clean
clean:
	@find . -name '.DS_Store' -type f -delete
	@if [ -f .pre_build ]; then rm -f .pre_build && printf "rm -f .pre_build\n"; fi
	@if [ -d $(OBJDIR) ]; then rm -rf $(OBJDIR) && printf "rm -rf $(OBJDIR)\n"; fi
	@if [ -d $(DEPDIR) ]; then rm -rf $(DEPDIR) && printf "rm -rf $(DEPDIR)\n"; fi
	@if [ -f $(EXE) ]; then rm -f $(EXE) && printf "rm -f $(EXE)\n"; fi
