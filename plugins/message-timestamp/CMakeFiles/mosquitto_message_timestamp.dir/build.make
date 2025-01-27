# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

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
CMAKE_SOURCE_DIR = /home/patty/Desktop/TUM/BA/mosquitto

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/patty/Desktop/TUM/BA/mosquitto

# Include any dependencies generated for this target.
include plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/compiler_depend.make

# Include the progress variables for this target.
include plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/progress.make

# Include the compile flags for this target's objects.
include plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/flags.make

plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/mosquitto_message_timestamp.c.o: plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/flags.make
plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/mosquitto_message_timestamp.c.o: plugins/message-timestamp/mosquitto_message_timestamp.c
plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/mosquitto_message_timestamp.c.o: plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/patty/Desktop/TUM/BA/mosquitto/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/mosquitto_message_timestamp.c.o"
	cd /home/patty/Desktop/TUM/BA/mosquitto/plugins/message-timestamp && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/mosquitto_message_timestamp.c.o -MF CMakeFiles/mosquitto_message_timestamp.dir/mosquitto_message_timestamp.c.o.d -o CMakeFiles/mosquitto_message_timestamp.dir/mosquitto_message_timestamp.c.o -c /home/patty/Desktop/TUM/BA/mosquitto/plugins/message-timestamp/mosquitto_message_timestamp.c

plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/mosquitto_message_timestamp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mosquitto_message_timestamp.dir/mosquitto_message_timestamp.c.i"
	cd /home/patty/Desktop/TUM/BA/mosquitto/plugins/message-timestamp && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/patty/Desktop/TUM/BA/mosquitto/plugins/message-timestamp/mosquitto_message_timestamp.c > CMakeFiles/mosquitto_message_timestamp.dir/mosquitto_message_timestamp.c.i

plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/mosquitto_message_timestamp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mosquitto_message_timestamp.dir/mosquitto_message_timestamp.c.s"
	cd /home/patty/Desktop/TUM/BA/mosquitto/plugins/message-timestamp && /usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/patty/Desktop/TUM/BA/mosquitto/plugins/message-timestamp/mosquitto_message_timestamp.c -o CMakeFiles/mosquitto_message_timestamp.dir/mosquitto_message_timestamp.c.s

# Object files for target mosquitto_message_timestamp
mosquitto_message_timestamp_OBJECTS = \
"CMakeFiles/mosquitto_message_timestamp.dir/mosquitto_message_timestamp.c.o"

# External object files for target mosquitto_message_timestamp
mosquitto_message_timestamp_EXTERNAL_OBJECTS =

plugins/message-timestamp/mosquitto_message_timestamp.so: plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/mosquitto_message_timestamp.c.o
plugins/message-timestamp/mosquitto_message_timestamp.so: plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/build.make
plugins/message-timestamp/mosquitto_message_timestamp.so: plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/patty/Desktop/TUM/BA/mosquitto/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared module mosquitto_message_timestamp.so"
	cd /home/patty/Desktop/TUM/BA/mosquitto/plugins/message-timestamp && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mosquitto_message_timestamp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/build: plugins/message-timestamp/mosquitto_message_timestamp.so
.PHONY : plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/build

plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/clean:
	cd /home/patty/Desktop/TUM/BA/mosquitto/plugins/message-timestamp && $(CMAKE_COMMAND) -P CMakeFiles/mosquitto_message_timestamp.dir/cmake_clean.cmake
.PHONY : plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/clean

plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/depend:
	cd /home/patty/Desktop/TUM/BA/mosquitto && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/patty/Desktop/TUM/BA/mosquitto /home/patty/Desktop/TUM/BA/mosquitto/plugins/message-timestamp /home/patty/Desktop/TUM/BA/mosquitto /home/patty/Desktop/TUM/BA/mosquitto/plugins/message-timestamp /home/patty/Desktop/TUM/BA/mosquitto/plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/depend

