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
include src/CMakeFiles/wsdb.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/wsdb.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/wsdb.dir/flags.make

src/CMakeFiles/wsdb.dir/main.cpp.o: src/CMakeFiles/wsdb.dir/flags.make
src/CMakeFiles/wsdb.dir/main.cpp.o: ../src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cbk/NJU_DBPractice/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/wsdb.dir/main.cpp.o"
	cd /home/cbk/NJU_DBPractice/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/wsdb.dir/main.cpp.o -c /home/cbk/NJU_DBPractice/src/main.cpp

src/CMakeFiles/wsdb.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/wsdb.dir/main.cpp.i"
	cd /home/cbk/NJU_DBPractice/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cbk/NJU_DBPractice/src/main.cpp > CMakeFiles/wsdb.dir/main.cpp.i

src/CMakeFiles/wsdb.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/wsdb.dir/main.cpp.s"
	cd /home/cbk/NJU_DBPractice/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cbk/NJU_DBPractice/src/main.cpp -o CMakeFiles/wsdb.dir/main.cpp.s

# Object files for target wsdb
wsdb_OBJECTS = \
"CMakeFiles/wsdb.dir/main.cpp.o"

# External object files for target wsdb
wsdb_EXTERNAL_OBJECTS =

bin/wsdb: src/CMakeFiles/wsdb.dir/main.cpp.o
bin/wsdb: src/CMakeFiles/wsdb.dir/build.make
bin/wsdb: lib/libsystem.so
bin/wsdb: lib/libparser.so
bin/wsdb: lib/libplanner.so
bin/wsdb: lib/liboptimizer.so
bin/wsdb: lib/libexecution.so
bin/wsdb: lib/libexpr.so
bin/wsdb: lib/liblog.so
bin/wsdb: lib/libconcurrency.so
bin/wsdb: lib/libserver_net.so
bin/wsdb: lib/libsystem_handle.so
bin/wsdb: lib/libstorage_buffer.so
bin/wsdb: lib/libstorage_disk.so
bin/wsdb: lib/libstorage_index.so
bin/wsdb: lib/libsystem_table.a
bin/wsdb: lib/libsystem_index.so
bin/wsdb: lib/libcommon_net.so
bin/wsdb: lib/libfmt.a
bin/wsdb: src/CMakeFiles/wsdb.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cbk/NJU_DBPractice/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../bin/wsdb"
	cd /home/cbk/NJU_DBPractice/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/wsdb.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/wsdb.dir/build: bin/wsdb

.PHONY : src/CMakeFiles/wsdb.dir/build

src/CMakeFiles/wsdb.dir/clean:
	cd /home/cbk/NJU_DBPractice/build/src && $(CMAKE_COMMAND) -P CMakeFiles/wsdb.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/wsdb.dir/clean

src/CMakeFiles/wsdb.dir/depend:
	cd /home/cbk/NJU_DBPractice/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cbk/NJU_DBPractice /home/cbk/NJU_DBPractice/src /home/cbk/NJU_DBPractice/build /home/cbk/NJU_DBPractice/build/src /home/cbk/NJU_DBPractice/build/src/CMakeFiles/wsdb.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/wsdb.dir/depend

