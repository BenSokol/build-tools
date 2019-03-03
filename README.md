# build-tools

## General Requirements
-   Linux or macOS (Windows is NOT supported)
-   gcc, clang, or a different compiler

### Rule Specific Requirements
-   cppcheck requires cppcheck
-   debug requires gdb or lldb
-   install requires sudo
-   memtest requires valgrind
-   tar requires the tar cli utility
-   uninstall requires sudo

## Setup
To use, create a Makefile at the project root with the following code in it:
```makefile
MAKEFILE_DIR_LOCATION = ./submodules/build-tools
-include $(MAKEFILE_DIR_LOCATION)/Makefile
```
Where MAKEFILE_DIR_LOCATION matches the path to this directory. The above path is recommended.

## Rules
The following list does NOT include rules used only during the build process.

| Rule      | Description                                                                                                                          |
| --------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| clean     | Deletes build related files                                                                                                          |
| cppcheck  | Runs all source code through cppcheck                                                                                                |
| debug     | Same as run, except EXE is run within DEBUGGER                                                                                       |
| memtest   | Same as run, except EXE is run within a valgrind leak-check.                                                                         |
| run       | Compiles then runs EXE passing COMMAND_LINE_ARGS to EXE                                                                              |
| tar       | Runs clean then creates a tgz archive of the entire project folder. The tgz file will be located 1 directory above the project root. |
| var       | Used for debugging the Makefile. Prints important variables to terminal and exits.                                                   |
| install   | Used to install project binary in ~/$(INSTALLDIR). Also installs manpage if man page exists.                                         |
| uninstall | Used to uninstall project binary. Also removes manpage.                                                                              |

## Settings
If you would like to customize settings available, create a file named **Makefile-Settings.mk** located at the project root.

### Options
The following options are available:

#### Target name
| Setting | Default Value | Description                   |
|:-------:|:-------------:|:----------------------------- |
| EXE     | prog          | Name of the target executable |

#### Directories
| Setting    | Default Value | Description                                                                       |
|:----------:|:-------------:|:--------------------------------------------------------------------------------- |
| SRCDIR     | src           | Directory containing source files                                                 |
| OBJDIR     | obj           | Directory to store object files                                                   |
| DEPDIR     | dep           | Directory to store object files                                                   |
| SUBDIR     | submodules    | Directory containing git submodules                                               |
| LOGDIR     | logs          | Directory containing log files                                                    |
| INSTALLDIR | ~/.bin        | Location to install to. NOTE: Location must be owned by user or group user is in. |

#### Compilers
| Setting  | Default Value                              | Description                     |
|:--------:|:------------------------------------------:|:------------------------------- |
| CC       | gcc                                        | Name of C compiler executable   |
| CXX      | g++                                        | Name of C++ compiler executable |
| DEBUGGER | gdb[<sup>1</sup>](#reference-CC-CXX-etc-1) | Name of debugger executable     |

<a name="reference-CC-CXX-etc-1">1.</a> On macOS, the default is lldb.

#### Compiler Flags
| Setting             | Default Value | Description                                                                                                                                                                                   |
|:-------------------:|:-------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| CSTD                | -std=c11      | What C Standard to use                                                                                                                                                                        |
| CXXSTD              | -std=c++11    | What C++ Standard to use                                                                                                                                                                      |
| CFLAGS              |               | Flags to pass to CC                                                                                                                                                                           |
| CXXFLAGS            |               | Flags to pass to CXX                                                                                                                                                                          |
| WARNING_FLAGS       | -Wall         | Warning flags to always use                                                                                                                                                                   |
| WARNING_FLAGS_CLANG |               | Warning flags to use when using LLVM's clang compiler                                                                                                                                         |
| WARNING_FLAGS_GCC   |               | Warning flags to use when using GNU's GCC compiler                                                                                                                                            |
| LINUX_FLAGS         |               | Flags to pass on Linux environments[<sup>1</sup>](#reference-Compiler-Flags-1)                                                                                                                |
| MACOS_FLAGS         |               | Flags to pass on macOS environments[<sup>2</sup>](#reference-Compiler-Flags-2)                                                                                                                |
| INC                 |               | Any additional include directories to pass to CC or CXX.[<sup>3</sup>](#reference-Compiler-Flags-3)<br>Use ```-IDirectoryPath``` where DirectoryPath is the path to the directory to include. |

<a name="reference-Compiler-Flags-1">1.</a> Checks if Linux using uname. uname must return "Linux"<br/>
<a name="reference-Compiler-Flags-2">2.</a> Checks if macOS usign uname. uname must return "Darwin"<br/>
<a name="reference-Compiler-Flags-3">3.</a> Makefile automatically includs all SRCDIR/ and SUBDIR/* folders (recursively), excluding .git and MAKEFILE_DIR_LOCATION.

#### CPPCHECK Flags
| Setting           | Default Value | Description                                                 |
|:-----------------:|:-------------:|:----------------------------------------------------------- |
| CPPCHECK_FLAGS    |               | General flags to pass to cppcheck                           |
| CPPCHECK_DEFINES  |               | Define rules to pass to cppcheck (formated as -D\<value\>)  |
| CPPCHECK_SUPPRESS |               | Warnings cppcheck should suppress                           |
| CPPCHECK_ENABLE   |               | cppcheck checks to enable, in the format --enable=\<value\> |

#### Other Settings
| Setting           | Default Value | Description                                                                          |
|:-----------------:|:-------------:|:------------------------------------------------------------------------------------ |
| COMMAND_LINE_ARGS |               | Arguments to pass to executable when using rules: run, memtest, and debug.           |
| PREBUILD          |               | Any rules to run before the executable is built                                      |
| ENABLE_LOGGING    |               | Logs calls to make to PROJECT_ROOT/make.log if defined to 1. Not defined by default. |

### Disable Rules
The following rules can be disabled by defining the variable listed in **Makefile-Settings.mk**. They can be defined to anything.

| Rule      | Variable to disable             |
| --------- | ------------------------------- |
| clean     | MAKEFILE_RULE_CLEAN_DISABLE     |
| cppcheck  | MAKEFILE_RULE_CPPCHECK_DISABLE  |
| debug     | MAKEFILE_RULE_DEBUG_DISABLE     |
| install   | MAKEFILE_RULE_INSTALL_DISABLE   |
| memtest   | MAKEFILE_RULE_MEMTEST_DISABLE   |
| run       | MAKEFILE_RULE_RUN_DISABLE       |
| tar       | MAKEFILE_RULE_TAR_DISABLE       |
| uninstall | MAKEFILE_RULE_UNINSTALL_DISABLE |
| var       | MAKEFILE_RULE_VAR_DISABLE       |

## Typical Directory Tree
```none
.
├── .git
│   └── ...
├── .gitignore
├── .gitmodules
├── .pre_build  #auto-generated by Makefile
├── LICENSE
├── Makefile
├── Makefile-Settings.mk
├── make.log  #auto-generated by Makefile if
├── README.md
├── dep  #auto-generated by Makefile
├── obj  #auto-generated by Makefile
├── man
│   └── EXE.1
├── src
│   ├── class.cpp
│   ├── class.hpp
│   ├── main.cpp
│   ├── ...
│   └── folder
│       └── ...
└── submodules
    ├── build-tools
    │   ├── .git
    │   │   └── ...
    │   ├── LICENSE
    │   ├── Makefile
    │   ├── Makefile-Default-Settings.mk
    │   ├── Makefile-Version-History.md
    │   ├── README.md  <-- THIS FILE
    │   ├── make-rules
    │   │   └── ...
    │   └── make-utilities
    │       └── ...
    └── otherGitSubmodule
    │   ├── .git
    │   │   └── ...
    │   └── ...
    └── ...
```
