# Makefile Version History

## v1.0
-   Initial release -support for generic paterns of c++ files, building in same directory as source
-   Add .PHONY clean rule

### v1.1
-   Add .PHONY run rule

### v1.2
-   Add .PHONY tar rule

### v1.3
-   Add .PHONY debug rule

### v1.4
-   Add .PHONY memtest rule

## v2.0
-   Add .PHONY var rule
-   Add support for dependency files
-   Change location of object and dependency files to paths specified in settings
-   Change output format to include progress
-   Add support for pre-build targets

### v2.1
-   Add support for MACOS and LINUX specific flags

## v3.0
-   Add new rules to support c files
-   Add support for submodules directory
-   Change path structure

## v4.0
-   Split into seperate folders by rules

### v4.1
-   Add .PHONY install rule
-   Add .PHONY uninstall rule
-   Add aditional debug info to var rule
-   Add INSTALL_LOCATION setting

## v5.0
-   Add support for clang/gcc specific warning flags
-   CHange clean so $(EXE).dSYM is deleted if it exists
-   Check if any files used by make have changed since last build. If any have, rebuild project.
-   Add ability to disable rules by defining specified variable

### v5.1
-   Add .PHONY cppcheck rule

### v5.2
-   Add LOGDIR

### v5.3
-   Move toggleable rules to make-utilities folder.
-   Add support for logging builds to file

### v5.4
-   Add support for cppcheck flags

### v5.5
-   Update .PHONY install to always try to make a symbolic link, using ln -s -i for exe and manpage

### v5.6
-   Add RUN_CMD to allow variable ways to run after building

## v6.0
-   Add new optional include at project root "Makefile-Special-Rules.mk" which can contain any special rules
-   Add POST_BUILD flag that should be defined if a post build step is required.
    -   A post build step should be defined under a rule named '.post_build' in Makefile-Special-Rules.mk
-   clean will now delete .post_build if it exists
-   Add LINKFLAGS to allow link specific flags

### v6.1
-   Add LIB to allow dynamic libraries to be included
