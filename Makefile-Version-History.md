# Makefile Version History

## v1.0
* Initial release - support for generic paterns of c++ files, building in same directory as source
* Add .PHONY clean rule

### v1.1
* Add .PHONY run rule

### v1.2
* Add .PHONY tar rule

### v1.3
* Add .PHONY debug rule

### v1.4
* Add .PHONY memtest rule

## v2.0
* Add var rule
* Add support for dependency files
* Change location of object and dependency files to paths specified in settings
* Change output format to include progress
* Add support for pre-build targets

### v2.1
* Add support for MACOS and LINUX specific flags

## v3.0
* Add new rules to support c files
* Add support for submodules directory
* Change path structure

## v4.0
* Split into seperate folders by rules

## v4.1
* Add install and uninstall rules
* Add aditional debug info to var rule
* Add INSTALL_LOCATION setting

## v5.0
* Add support for clang/gcc specific warning flags
* CHange clean so $(EXE).dSYM is deleted if it exists
* Check if any files used by make have changed since last build. If any have, rebuild project.
* Add ability to disable rules by defining specified variable
