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
include src/storage/buffer/CMakeFiles/storage_buffer.dir/depend.make

# Include the progress variables for this target.
include src/storage/buffer/CMakeFiles/storage_buffer.dir/progress.make

# Include the compile flags for this target's objects.
include src/storage/buffer/CMakeFiles/storage_buffer.dir/flags.make

src/storage/buffer/CMakeFiles/storage_buffer.dir/buffer_pool_manager.cpp.o: src/storage/buffer/CMakeFiles/storage_buffer.dir/flags.make
src/storage/buffer/CMakeFiles/storage_buffer.dir/buffer_pool_manager.cpp.o: ../src/storage/buffer/buffer_pool_manager.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cbk/NJU_DBPractice/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/storage/buffer/CMakeFiles/storage_buffer.dir/buffer_pool_manager.cpp.o"
	cd /home/cbk/NJU_DBPractice/build/src/storage/buffer && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/storage_buffer.dir/buffer_pool_manager.cpp.o -c /home/cbk/NJU_DBPractice/src/storage/buffer/buffer_pool_manager.cpp

src/storage/buffer/CMakeFiles/storage_buffer.dir/buffer_pool_manager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/storage_buffer.dir/buffer_pool_manager.cpp.i"
	cd /home/cbk/NJU_DBPractice/build/src/storage/buffer && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cbk/NJU_DBPractice/src/storage/buffer/buffer_pool_manager.cpp > CMakeFiles/storage_buffer.dir/buffer_pool_manager.cpp.i

src/storage/buffer/CMakeFiles/storage_buffer.dir/buffer_pool_manager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/storage_buffer.dir/buffer_pool_manager.cpp.s"
	cd /home/cbk/NJU_DBPractice/build/src/storage/buffer && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cbk/NJU_DBPractice/src/storage/buffer/buffer_pool_manager.cpp -o CMakeFiles/storage_buffer.dir/buffer_pool_manager.cpp.s

src/storage/buffer/CMakeFiles/storage_buffer.dir/replacer/lru_replacer.cpp.o: src/storage/buffer/CMakeFiles/storage_buffer.dir/flags.make
src/storage/buffer/CMakeFiles/storage_buffer.dir/replacer/lru_replacer.cpp.o: ../src/storage/buffer/replacer/lru_replacer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cbk/NJU_DBPractice/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/storage/buffer/CMakeFiles/storage_buffer.dir/replacer/lru_replacer.cpp.o"
	cd /home/cbk/NJU_DBPractice/build/src/storage/buffer && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/storage_buffer.dir/replacer/lru_replacer.cpp.o -c /home/cbk/NJU_DBPractice/src/storage/buffer/replacer/lru_replacer.cpp

src/storage/buffer/CMakeFiles/storage_buffer.dir/replacer/lru_replacer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/storage_buffer.dir/replacer/lru_replacer.cpp.i"
	cd /home/cbk/NJU_DBPractice/build/src/storage/buffer && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cbk/NJU_DBPractice/src/storage/buffer/replacer/lru_replacer.cpp > CMakeFiles/storage_buffer.dir/replacer/lru_replacer.cpp.i

src/storage/buffer/CMakeFiles/storage_buffer.dir/replacer/lru_replacer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/storage_buffer.dir/replacer/lru_replacer.cpp.s"
	cd /home/cbk/NJU_DBPractice/build/src/storage/buffer && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cbk/NJU_DBPractice/src/storage/buffer/replacer/lru_replacer.cpp -o CMakeFiles/storage_buffer.dir/replacer/lru_replacer.cpp.s

src/storage/buffer/CMakeFiles/storage_buffer.dir/replacer/lru_k_replacer.cpp.o: src/storage/buffer/CMakeFiles/storage_buffer.dir/flags.make
src/storage/buffer/CMakeFiles/storage_buffer.dir/replacer/lru_k_replacer.cpp.o: ../src/storage/buffer/replacer/lru_k_replacer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cbk/NJU_DBPractice/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/storage/buffer/CMakeFiles/storage_buffer.dir/replacer/lru_k_replacer.cpp.o"
	cd /home/cbk/NJU_DBPractice/build/src/storage/buffer && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/storage_buffer.dir/replacer/lru_k_replacer.cpp.o -c /home/cbk/NJU_DBPractice/src/storage/buffer/replacer/lru_k_replacer.cpp

src/storage/buffer/CMakeFiles/storage_buffer.dir/replacer/lru_k_replacer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/storage_buffer.dir/replacer/lru_k_replacer.cpp.i"
	cd /home/cbk/NJU_DBPractice/build/src/storage/buffer && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cbk/NJU_DBPractice/src/storage/buffer/replacer/lru_k_replacer.cpp > CMakeFiles/storage_buffer.dir/replacer/lru_k_replacer.cpp.i

src/storage/buffer/CMakeFiles/storage_buffer.dir/replacer/lru_k_replacer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/storage_buffer.dir/replacer/lru_k_replacer.cpp.s"
	cd /home/cbk/NJU_DBPractice/build/src/storage/buffer && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cbk/NJU_DBPractice/src/storage/buffer/replacer/lru_k_replacer.cpp -o CMakeFiles/storage_buffer.dir/replacer/lru_k_replacer.cpp.s

src/storage/buffer/CMakeFiles/storage_buffer.dir/replacer/replacer.cpp.o: src/storage/buffer/CMakeFiles/storage_buffer.dir/flags.make
src/storage/buffer/CMakeFiles/storage_buffer.dir/replacer/replacer.cpp.o: ../src/storage/buffer/replacer/replacer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cbk/NJU_DBPractice/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/storage/buffer/CMakeFiles/storage_buffer.dir/replacer/replacer.cpp.o"
	cd /home/cbk/NJU_DBPractice/build/src/storage/buffer && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/storage_buffer.dir/replacer/replacer.cpp.o -c /home/cbk/NJU_DBPractice/src/storage/buffer/replacer/replacer.cpp

src/storage/buffer/CMakeFiles/storage_buffer.dir/replacer/replacer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/storage_buffer.dir/replacer/replacer.cpp.i"
	cd /home/cbk/NJU_DBPractice/build/src/storage/buffer && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cbk/NJU_DBPractice/src/storage/buffer/replacer/replacer.cpp > CMakeFiles/storage_buffer.dir/replacer/replacer.cpp.i

src/storage/buffer/CMakeFiles/storage_buffer.dir/replacer/replacer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/storage_buffer.dir/replacer/replacer.cpp.s"
	cd /home/cbk/NJU_DBPractice/build/src/storage/buffer && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cbk/NJU_DBPractice/src/storage/buffer/replacer/replacer.cpp -o CMakeFiles/storage_buffer.dir/replacer/replacer.cpp.s

# Object files for target storage_buffer
storage_buffer_OBJECTS = \
"CMakeFiles/storage_buffer.dir/buffer_pool_manager.cpp.o" \
"CMakeFiles/storage_buffer.dir/replacer/lru_replacer.cpp.o" \
"CMakeFiles/storage_buffer.dir/replacer/lru_k_replacer.cpp.o" \
"CMakeFiles/storage_buffer.dir/replacer/replacer.cpp.o"

# External object files for target storage_buffer
storage_buffer_EXTERNAL_OBJECTS =

lib/libstorage_buffer.so: src/storage/buffer/CMakeFiles/storage_buffer.dir/buffer_pool_manager.cpp.o
lib/libstorage_buffer.so: src/storage/buffer/CMakeFiles/storage_buffer.dir/replacer/lru_replacer.cpp.o
lib/libstorage_buffer.so: src/storage/buffer/CMakeFiles/storage_buffer.dir/replacer/lru_k_replacer.cpp.o
lib/libstorage_buffer.so: src/storage/buffer/CMakeFiles/storage_buffer.dir/replacer/replacer.cpp.o
lib/libstorage_buffer.so: src/storage/buffer/CMakeFiles/storage_buffer.dir/build.make
lib/libstorage_buffer.so: lib/libstorage_disk.so
lib/libstorage_buffer.so: lib/libfmt.a
lib/libstorage_buffer.so: src/storage/buffer/CMakeFiles/storage_buffer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cbk/NJU_DBPractice/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX shared library ../../../lib/libstorage_buffer.so"
	cd /home/cbk/NJU_DBPractice/build/src/storage/buffer && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/storage_buffer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/storage/buffer/CMakeFiles/storage_buffer.dir/build: lib/libstorage_buffer.so

.PHONY : src/storage/buffer/CMakeFiles/storage_buffer.dir/build

src/storage/buffer/CMakeFiles/storage_buffer.dir/clean:
	cd /home/cbk/NJU_DBPractice/build/src/storage/buffer && $(CMAKE_COMMAND) -P CMakeFiles/storage_buffer.dir/cmake_clean.cmake
.PHONY : src/storage/buffer/CMakeFiles/storage_buffer.dir/clean

src/storage/buffer/CMakeFiles/storage_buffer.dir/depend:
	cd /home/cbk/NJU_DBPractice/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cbk/NJU_DBPractice /home/cbk/NJU_DBPractice/src/storage/buffer /home/cbk/NJU_DBPractice/build /home/cbk/NJU_DBPractice/build/src/storage/buffer /home/cbk/NJU_DBPractice/build/src/storage/buffer/CMakeFiles/storage_buffer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/storage/buffer/CMakeFiles/storage_buffer.dir/depend

