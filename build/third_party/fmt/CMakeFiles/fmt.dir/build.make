# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/cbk/NJU_DBPractice

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/cbk/NJU_DBPractice/build

# Include any dependencies generated for this target.
include third_party/fmt/CMakeFiles/fmt.dir/depend.make

# Include the progress variables for this target.
include third_party/fmt/CMakeFiles/fmt.dir/progress.make

# Include the compile flags for this target's objects.
include third_party/fmt/CMakeFiles/fmt.dir/flags.make

third_party/fmt/CMakeFiles/fmt.dir/src/format.cc.o: third_party/fmt/CMakeFiles/fmt.dir/flags.make
third_party/fmt/CMakeFiles/fmt.dir/src/format.cc.o: ../third_party/fmt/src/format.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cbk/NJU_DBPractice/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object third_party/fmt/CMakeFiles/fmt.dir/src/format.cc.o"
	cd /home/cbk/NJU_DBPractice/build/third_party/fmt && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/fmt.dir/src/format.cc.o -c /home/cbk/NJU_DBPractice/third_party/fmt/src/format.cc

third_party/fmt/CMakeFiles/fmt.dir/src/format.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fmt.dir/src/format.cc.i"
	cd /home/cbk/NJU_DBPractice/build/third_party/fmt && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cbk/NJU_DBPractice/third_party/fmt/src/format.cc > CMakeFiles/fmt.dir/src/format.cc.i

third_party/fmt/CMakeFiles/fmt.dir/src/format.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fmt.dir/src/format.cc.s"
	cd /home/cbk/NJU_DBPractice/build/third_party/fmt && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cbk/NJU_DBPractice/third_party/fmt/src/format.cc -o CMakeFiles/fmt.dir/src/format.cc.s

third_party/fmt/CMakeFiles/fmt.dir/src/os.cc.o: third_party/fmt/CMakeFiles/fmt.dir/flags.make
third_party/fmt/CMakeFiles/fmt.dir/src/os.cc.o: ../third_party/fmt/src/os.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cbk/NJU_DBPractice/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object third_party/fmt/CMakeFiles/fmt.dir/src/os.cc.o"
	cd /home/cbk/NJU_DBPractice/build/third_party/fmt && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/fmt.dir/src/os.cc.o -c /home/cbk/NJU_DBPractice/third_party/fmt/src/os.cc

third_party/fmt/CMakeFiles/fmt.dir/src/os.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fmt.dir/src/os.cc.i"
	cd /home/cbk/NJU_DBPractice/build/third_party/fmt && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cbk/NJU_DBPractice/third_party/fmt/src/os.cc > CMakeFiles/fmt.dir/src/os.cc.i

third_party/fmt/CMakeFiles/fmt.dir/src/os.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fmt.dir/src/os.cc.s"
	cd /home/cbk/NJU_DBPractice/build/third_party/fmt && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cbk/NJU_DBPractice/third_party/fmt/src/os.cc -o CMakeFiles/fmt.dir/src/os.cc.s

# Object files for target fmt
fmt_OBJECTS = \
"CMakeFiles/fmt.dir/src/format.cc.o" \
"CMakeFiles/fmt.dir/src/os.cc.o"

# External object files for target fmt
fmt_EXTERNAL_OBJECTS =

lib/libfmt.a: third_party/fmt/CMakeFiles/fmt.dir/src/format.cc.o
lib/libfmt.a: third_party/fmt/CMakeFiles/fmt.dir/src/os.cc.o
lib/libfmt.a: third_party/fmt/CMakeFiles/fmt.dir/build.make
lib/libfmt.a: third_party/fmt/CMakeFiles/fmt.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cbk/NJU_DBPractice/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library ../../lib/libfmt.a"
	cd /home/cbk/NJU_DBPractice/build/third_party/fmt && $(CMAKE_COMMAND) -P CMakeFiles/fmt.dir/cmake_clean_target.cmake
	cd /home/cbk/NJU_DBPractice/build/third_party/fmt && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fmt.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
third_party/fmt/CMakeFiles/fmt.dir/build: lib/libfmt.a

.PHONY : third_party/fmt/CMakeFiles/fmt.dir/build

third_party/fmt/CMakeFiles/fmt.dir/clean:
	cd /home/cbk/NJU_DBPractice/build/third_party/fmt && $(CMAKE_COMMAND) -P CMakeFiles/fmt.dir/cmake_clean.cmake
.PHONY : third_party/fmt/CMakeFiles/fmt.dir/clean

third_party/fmt/CMakeFiles/fmt.dir/depend:
	cd /home/cbk/NJU_DBPractice/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cbk/NJU_DBPractice /home/cbk/NJU_DBPractice/third_party/fmt /home/cbk/NJU_DBPractice/build /home/cbk/NJU_DBPractice/build/third_party/fmt /home/cbk/NJU_DBPractice/build/third_party/fmt/CMakeFiles/fmt.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : third_party/fmt/CMakeFiles/fmt.dir/depend

