# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.29

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/wand/cpp/void_http

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wand/cpp/void_http/build

# Include any dependencies generated for this target.
include CMakeFiles/void-http.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/void-http.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/void-http.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/void-http.dir/flags.make

CMakeFiles/void-http.dir/src/main.cc.o: CMakeFiles/void-http.dir/flags.make
CMakeFiles/void-http.dir/src/main.cc.o: /home/wand/cpp/void_http/src/main.cc
CMakeFiles/void-http.dir/src/main.cc.o: CMakeFiles/void-http.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/wand/cpp/void_http/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/void-http.dir/src/main.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/void-http.dir/src/main.cc.o -MF CMakeFiles/void-http.dir/src/main.cc.o.d -o CMakeFiles/void-http.dir/src/main.cc.o -c /home/wand/cpp/void_http/src/main.cc

CMakeFiles/void-http.dir/src/main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/void-http.dir/src/main.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wand/cpp/void_http/src/main.cc > CMakeFiles/void-http.dir/src/main.cc.i

CMakeFiles/void-http.dir/src/main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/void-http.dir/src/main.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wand/cpp/void_http/src/main.cc -o CMakeFiles/void-http.dir/src/main.cc.s

CMakeFiles/void-http.dir/src/void_server.cc.o: CMakeFiles/void-http.dir/flags.make
CMakeFiles/void-http.dir/src/void_server.cc.o: /home/wand/cpp/void_http/src/void_server.cc
CMakeFiles/void-http.dir/src/void_server.cc.o: CMakeFiles/void-http.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/wand/cpp/void_http/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/void-http.dir/src/void_server.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/void-http.dir/src/void_server.cc.o -MF CMakeFiles/void-http.dir/src/void_server.cc.o.d -o CMakeFiles/void-http.dir/src/void_server.cc.o -c /home/wand/cpp/void_http/src/void_server.cc

CMakeFiles/void-http.dir/src/void_server.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/void-http.dir/src/void_server.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/wand/cpp/void_http/src/void_server.cc > CMakeFiles/void-http.dir/src/void_server.cc.i

CMakeFiles/void-http.dir/src/void_server.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/void-http.dir/src/void_server.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/wand/cpp/void_http/src/void_server.cc -o CMakeFiles/void-http.dir/src/void_server.cc.s

# Object files for target void-http
void__http_OBJECTS = \
"CMakeFiles/void-http.dir/src/main.cc.o" \
"CMakeFiles/void-http.dir/src/void_server.cc.o"

# External object files for target void-http
void__http_EXTERNAL_OBJECTS =

void-http: CMakeFiles/void-http.dir/src/main.cc.o
void-http: CMakeFiles/void-http.dir/src/void_server.cc.o
void-http: CMakeFiles/void-http.dir/build.make
void-http: /usr/lib/libboost_system.so.1.83.0
void-http: CMakeFiles/void-http.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/wand/cpp/void_http/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable void-http"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/void-http.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/void-http.dir/build: void-http
.PHONY : CMakeFiles/void-http.dir/build

CMakeFiles/void-http.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/void-http.dir/cmake_clean.cmake
.PHONY : CMakeFiles/void-http.dir/clean

CMakeFiles/void-http.dir/depend:
	cd /home/wand/cpp/void_http/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wand/cpp/void_http /home/wand/cpp/void_http /home/wand/cpp/void_http/build /home/wand/cpp/void_http/build /home/wand/cpp/void_http/build/CMakeFiles/void-http.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/void-http.dir/depend

