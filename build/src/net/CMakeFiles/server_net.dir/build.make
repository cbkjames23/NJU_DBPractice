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
include src/net/CMakeFiles/server_net.dir/depend.make

# Include the progress variables for this target.
include src/net/CMakeFiles/server_net.dir/progress.make

# Include the compile flags for this target's objects.
include src/net/CMakeFiles/server_net.dir/flags.make

src/net/CMakeFiles/server_net.dir/net_controller.cpp.o: src/net/CMakeFiles/server_net.dir/flags.make
src/net/CMakeFiles/server_net.dir/net_controller.cpp.o: ../src/net/net_controller.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cbk/NJU_DBPractice/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/net/CMakeFiles/server_net.dir/net_controller.cpp.o"
	cd /home/cbk/NJU_DBPractice/build/src/net && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/server_net.dir/net_controller.cpp.o -c /home/cbk/NJU_DBPractice/src/net/net_controller.cpp

src/net/CMakeFiles/server_net.dir/net_controller.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/server_net.dir/net_controller.cpp.i"
	cd /home/cbk/NJU_DBPractice/build/src/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cbk/NJU_DBPractice/src/net/net_controller.cpp > CMakeFiles/server_net.dir/net_controller.cpp.i

src/net/CMakeFiles/server_net.dir/net_controller.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/server_net.dir/net_controller.cpp.s"
	cd /home/cbk/NJU_DBPractice/build/src/net && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cbk/NJU_DBPractice/src/net/net_controller.cpp -o CMakeFiles/server_net.dir/net_controller.cpp.s

# Object files for target server_net
server_net_OBJECTS = \
"CMakeFiles/server_net.dir/net_controller.cpp.o"

# External object files for target server_net
server_net_EXTERNAL_OBJECTS =

lib/libserver_net.so: src/net/CMakeFiles/server_net.dir/net_controller.cpp.o
lib/libserver_net.so: src/net/CMakeFiles/server_net.dir/build.make
lib/libserver_net.so: lib/libcommon_net.so
lib/libserver_net.so: lib/libsystem_handle.so
lib/libserver_net.so: lib/libstorage_buffer.so
lib/libserver_net.so: lib/libstorage_disk.so
lib/libserver_net.so: lib/libstorage_index.so
lib/libserver_net.so: lib/libsystem_table.a
lib/libserver_net.so: lib/libsystem_index.so
lib/libserver_net.so: lib/libfmt.a
lib/libserver_net.so: src/net/CMakeFiles/server_net.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cbk/NJU_DBPractice/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library ../../lib/libserver_net.so"
	cd /home/cbk/NJU_DBPractice/build/src/net && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/server_net.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/net/CMakeFiles/server_net.dir/build: lib/libserver_net.so

.PHONY : src/net/CMakeFiles/server_net.dir/build

src/net/CMakeFiles/server_net.dir/clean:
	cd /home/cbk/NJU_DBPractice/build/src/net && $(CMAKE_COMMAND) -P CMakeFiles/server_net.dir/cmake_clean.cmake
.PHONY : src/net/CMakeFiles/server_net.dir/clean

src/net/CMakeFiles/server_net.dir/depend:
	cd /home/cbk/NJU_DBPractice/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cbk/NJU_DBPractice /home/cbk/NJU_DBPractice/src/net /home/cbk/NJU_DBPractice/build /home/cbk/NJU_DBPractice/build/src/net /home/cbk/NJU_DBPractice/build/src/net/CMakeFiles/server_net.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/net/CMakeFiles/server_net.dir/depend

