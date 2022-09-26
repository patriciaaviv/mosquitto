# # CMAKE generated file: DO NOT EDIT!
# # Generated by "Unix Makefiles" Generator, CMake Version 3.24

# # Default target executed when no arguments are given to make.
# default_target: all
# .PHONY : default_target

# # Allow only one "make -f Makefile2" at a time, but pass parallelism.
# .NOTPARALLEL:

# #=============================================================================
# # Special targets provided by cmake.

# # Disable implicit rules so canonical targets will work.
# .SUFFIXES:

# # Disable VCS-based implicit rules.
# % : %,v

# # Disable VCS-based implicit rules.
# % : RCS/%

# # Disable VCS-based implicit rules.
# % : RCS/%,v

# # Disable VCS-based implicit rules.
# % : SCCS/s.%

# # Disable VCS-based implicit rules.
# % : s.%

# .SUFFIXES: .hpux_make_needs_suffix_list

# # Command-line flag to silence nested $(MAKE).
# $(VERBOSE)MAKESILENT = -s

# #Suppress display of executed commands.
# $(VERBOSE).SILENT:

# # A target that is always out of date.
# cmake_force:
# .PHONY : cmake_force

# #=============================================================================
# # Set environment variables for the build.

# # The shell in which to execute make rules.
# SHELL = /bin/sh

# # The CMake executable.
# CMAKE_COMMAND = /usr/bin/cmake

# # The command to remove a file.
# RM = /usr/bin/cmake -E rm -f

# # Escaping for special characters.
# EQUALS = =

# # The top-level source directory on which CMake was run.
# CMAKE_SOURCE_DIR = /root/mqtt

# # The top-level build directory on which CMake was run.
# CMAKE_BINARY_DIR = /root/mqtt

# #=============================================================================
# # Targets provided globally by CMake.

# # Special rule for the target test
# test:
# 	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running tests..."
# 	/usr/bin/ctest --force-new-ctest-process $(ARGS)
# .PHONY : test

# # Special rule for the target test
# test/fast: test
# .PHONY : test/fast

# # Special rule for the target edit_cache
# edit_cache:
# 	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake cache editor..."
# 	/usr/bin/cmake-gui -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
# .PHONY : edit_cache

# # Special rule for the target edit_cache
# edit_cache/fast: edit_cache
# .PHONY : edit_cache/fast

# # Special rule for the target rebuild_cache
# rebuild_cache:
# 	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
# 	/usr/bin/cmake --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
# .PHONY : rebuild_cache

# # Special rule for the target rebuild_cache
# rebuild_cache/fast: rebuild_cache
# .PHONY : rebuild_cache/fast

# # Special rule for the target list_install_components
# list_install_components:
# 	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Available install components are: \"Unspecified\""
# .PHONY : list_install_components

# # Special rule for the target list_install_components
# list_install_components/fast: list_install_components
# .PHONY : list_install_components/fast

# # Special rule for the target install
# install: preinstall
# 	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Install the project..."
# 	/usr/bin/cmake -P cmake_install.cmake
# .PHONY : install

# # Special rule for the target install
# install/fast: preinstall/fast
# 	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Install the project..."
# 	/usr/bin/cmake -P cmake_install.cmake
# .PHONY : install/fast

# # Special rule for the target install/local
# install/local: preinstall
# 	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing only the local directory..."
# 	/usr/bin/cmake -DCMAKE_INSTALL_LOCAL_ONLY=1 -P cmake_install.cmake
# .PHONY : install/local

# # Special rule for the target install/local
# install/local/fast: preinstall/fast
# 	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing only the local directory..."
# 	/usr/bin/cmake -DCMAKE_INSTALL_LOCAL_ONLY=1 -P cmake_install.cmake
# .PHONY : install/local/fast

# # Special rule for the target install/strip
# install/strip: preinstall
# 	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing the project stripped..."
# 	/usr/bin/cmake -DCMAKE_INSTALL_DO_STRIP=1 -P cmake_install.cmake
# .PHONY : install/strip

# # Special rule for the target install/strip
# install/strip/fast: preinstall/fast
# 	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing the project stripped..."
# 	/usr/bin/cmake -DCMAKE_INSTALL_DO_STRIP=1 -P cmake_install.cmake
# .PHONY : install/strip/fast

# # The main all target
# all: cmake_check_build_system
# 	$(CMAKE_COMMAND) -E cmake_progress_start /home/patty/Desktop/TUM/BA/mosquitto/CMakeFiles /home/patty/Desktop/TUM/BA/mosquitto//CMakeFiles/progress.marks
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 all
# 	$(CMAKE_COMMAND) -E cmake_progress_start /home/patty/Desktop/TUM/BA/mosquitto/CMakeFiles 0
# .PHONY : all

# # The main clean target
# clean:
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 clean
# .PHONY : clean

# # The main clean target
# clean/fast: clean
# .PHONY : clean/fast

# # Prepare targets for installation.
# preinstall: all
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
# .PHONY : preinstall

# # Prepare targets for installation.
# preinstall/fast:
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
# .PHONY : preinstall/fast

# # clear depends
# depend:
# 	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
# .PHONY : depend

# #=============================================================================
# # Target rules for targets named libmosquitto

# # Build rule for target.
# libmosquitto: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 libmosquitto
# .PHONY : libmosquitto

# # fast build rule for target.
# libmosquitto/fast:
# 	$(MAKE) $(MAKESILENT) -f lib/CMakeFiles/libmosquitto.dir/build.make lib/CMakeFiles/libmosquitto.dir/build
# .PHONY : libmosquitto/fast

# #=============================================================================
# # Target rules for targets named mosquittopp

# # Build rule for target.
# mosquittopp: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 mosquittopp
# .PHONY : mosquittopp

# # fast build rule for target.
# mosquittopp/fast:
# 	$(MAKE) $(MAKESILENT) -f lib/cpp/CMakeFiles/mosquittopp.dir/build.make lib/cpp/CMakeFiles/mosquittopp.dir/build
# .PHONY : mosquittopp/fast

# #=============================================================================
# # Target rules for targets named mosquitto_pub

# # Build rule for target.
# mosquitto_pub: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 mosquitto_pub
# .PHONY : mosquitto_pub

# # fast build rule for target.
# mosquitto_pub/fast:
# 	$(MAKE) $(MAKESILENT) -f client/CMakeFiles/mosquitto_pub.dir/build.make client/CMakeFiles/mosquitto_pub.dir/build
# .PHONY : mosquitto_pub/fast

# #=============================================================================
# # Target rules for targets named mosquitto_sub

# # Build rule for target.
# mosquitto_sub: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 mosquitto_sub
# .PHONY : mosquitto_sub

# # fast build rule for target.
# mosquitto_sub/fast:
# 	$(MAKE) $(MAKESILENT) -f client/CMakeFiles/mosquitto_sub.dir/build.make client/CMakeFiles/mosquitto_sub.dir/build
# .PHONY : mosquitto_sub/fast

# #=============================================================================
# # Target rules for targets named mosquitto_rr

# # Build rule for target.
# mosquitto_rr: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 mosquitto_rr
# .PHONY : mosquitto_rr

# # fast build rule for target.
# mosquitto_rr/fast:
# 	$(MAKE) $(MAKESILENT) -f client/CMakeFiles/mosquitto_rr.dir/build.make client/CMakeFiles/mosquitto_rr.dir/build
# .PHONY : mosquitto_rr/fast

# #=============================================================================
# # Target rules for targets named dos_attacker

# # Build rule for target.
# dos_attacker: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 dos_attacker
# .PHONY : dos_attacker

# # fast build rule for target.
# dos_attacker/fast:
# 	$(MAKE) $(MAKESILENT) -f client/CMakeFiles/dos_attacker.dir/build.make client/CMakeFiles/dos_attacker.dir/build
# .PHONY : dos_attacker/fast

# #=============================================================================
# # Target rules for targets named mosquitto

# # Build rule for target.
# mosquitto: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 mosquitto
# .PHONY : mosquitto

# # fast build rule for target.
# mosquitto/fast:
# 	$(MAKE) $(MAKESILENT) -f src/CMakeFiles/mosquitto.dir/build.make src/CMakeFiles/mosquitto.dir/build
# .PHONY : mosquitto/fast

# #=============================================================================
# # Target rules for targets named mosquitto_ctrl

# # Build rule for target.
# mosquitto_ctrl: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 mosquitto_ctrl
# .PHONY : mosquitto_ctrl

# # fast build rule for target.
# mosquitto_ctrl/fast:
# 	$(MAKE) $(MAKESILENT) -f apps/mosquitto_ctrl/CMakeFiles/mosquitto_ctrl.dir/build.make apps/mosquitto_ctrl/CMakeFiles/mosquitto_ctrl.dir/build
# .PHONY : mosquitto_ctrl/fast

# #=============================================================================
# # Target rules for targets named mosquitto_passwd

# # Build rule for target.
# mosquitto_passwd: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 mosquitto_passwd
# .PHONY : mosquitto_passwd

# # fast build rule for target.
# mosquitto_passwd/fast:
# 	$(MAKE) $(MAKESILENT) -f apps/mosquitto_passwd/CMakeFiles/mosquitto_passwd.dir/build.make apps/mosquitto_passwd/CMakeFiles/mosquitto_passwd.dir/build
# .PHONY : mosquitto_passwd/fast

# #=============================================================================
# # Target rules for targets named mosquitto_dynamic_security

# # Build rule for target.
# mosquitto_dynamic_security: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 mosquitto_dynamic_security
# .PHONY : mosquitto_dynamic_security

# # fast build rule for target.
# mosquitto_dynamic_security/fast:
# 	$(MAKE) $(MAKESILENT) -f plugins/dynamic-security/CMakeFiles/mosquitto_dynamic_security.dir/build.make plugins/dynamic-security/CMakeFiles/mosquitto_dynamic_security.dir/build
# .PHONY : mosquitto_dynamic_security/fast

# #=============================================================================
# # Target rules for targets named mosquitto_message_timestamp

# # Build rule for target.
# mosquitto_message_timestamp: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 mosquitto_message_timestamp
# .PHONY : mosquitto_message_timestamp

# # fast build rule for target.
# mosquitto_message_timestamp/fast:
# 	$(MAKE) $(MAKESILENT) -f plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/build.make plugins/message-timestamp/CMakeFiles/mosquitto_message_timestamp.dir/build
# .PHONY : mosquitto_message_timestamp/fast

# #=============================================================================
# # Target rules for targets named mosquitto_payload_modification

# # Build rule for target.
# mosquitto_payload_modification: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 mosquitto_payload_modification
# .PHONY : mosquitto_payload_modification

# # fast build rule for target.
# mosquitto_payload_modification/fast:
# 	$(MAKE) $(MAKESILENT) -f plugins/payload-modification/CMakeFiles/mosquitto_payload_modification.dir/build.make plugins/payload-modification/CMakeFiles/mosquitto_payload_modification.dir/build
# .PHONY : mosquitto_payload_modification/fast

# #=============================================================================
# # Target rules for targets named mosquitto_ctrl.1

# # Build rule for target.
# mosquitto_ctrl.1: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 mosquitto_ctrl.1
# .PHONY : mosquitto_ctrl.1

# # fast build rule for target.
# mosquitto_ctrl.1/fast:
# 	$(MAKE) $(MAKESILENT) -f man/CMakeFiles/mosquitto_ctrl.1.dir/build.make man/CMakeFiles/mosquitto_ctrl.1.dir/build
# .PHONY : mosquitto_ctrl.1/fast

# #=============================================================================
# # Target rules for targets named mosquitto_ctrl_dynsec.1

# # Build rule for target.
# mosquitto_ctrl_dynsec.1: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 mosquitto_ctrl_dynsec.1
# .PHONY : mosquitto_ctrl_dynsec.1

# # fast build rule for target.
# mosquitto_ctrl_dynsec.1/fast:
# 	$(MAKE) $(MAKESILENT) -f man/CMakeFiles/mosquitto_ctrl_dynsec.1.dir/build.make man/CMakeFiles/mosquitto_ctrl_dynsec.1.dir/build
# .PHONY : mosquitto_ctrl_dynsec.1/fast

# #=============================================================================
# # Target rules for targets named mosquitto_passwd.1

# # Build rule for target.
# mosquitto_passwd.1: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 mosquitto_passwd.1
# .PHONY : mosquitto_passwd.1

# # fast build rule for target.
# mosquitto_passwd.1/fast:
# 	$(MAKE) $(MAKESILENT) -f man/CMakeFiles/mosquitto_passwd.1.dir/build.make man/CMakeFiles/mosquitto_passwd.1.dir/build
# .PHONY : mosquitto_passwd.1/fast

# #=============================================================================
# # Target rules for targets named mosquitto_pub.1

# # Build rule for target.
# mosquitto_pub.1: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 mosquitto_pub.1
# .PHONY : mosquitto_pub.1

# # fast build rule for target.
# mosquitto_pub.1/fast:
# 	$(MAKE) $(MAKESILENT) -f man/CMakeFiles/mosquitto_pub.1.dir/build.make man/CMakeFiles/mosquitto_pub.1.dir/build
# .PHONY : mosquitto_pub.1/fast

# #=============================================================================
# # Target rules for targets named mosquitto_sub.1

# # Build rule for target.
# mosquitto_sub.1: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 mosquitto_sub.1
# .PHONY : mosquitto_sub.1

# # fast build rule for target.
# mosquitto_sub.1/fast:
# 	$(MAKE) $(MAKESILENT) -f man/CMakeFiles/mosquitto_sub.1.dir/build.make man/CMakeFiles/mosquitto_sub.1.dir/build
# .PHONY : mosquitto_sub.1/fast

# #=============================================================================
# # Target rules for targets named mosquitto_rr.1

# # Build rule for target.
# mosquitto_rr.1: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 mosquitto_rr.1
# .PHONY : mosquitto_rr.1

# # fast build rule for target.
# mosquitto_rr.1/fast:
# 	$(MAKE) $(MAKESILENT) -f man/CMakeFiles/mosquitto_rr.1.dir/build.make man/CMakeFiles/mosquitto_rr.1.dir/build
# .PHONY : mosquitto_rr.1/fast

# #=============================================================================
# # Target rules for targets named libmosquitto.3

# # Build rule for target.
# libmosquitto.3: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 libmosquitto.3
# .PHONY : libmosquitto.3

# # fast build rule for target.
# libmosquitto.3/fast:
# 	$(MAKE) $(MAKESILENT) -f man/CMakeFiles/libmosquitto.3.dir/build.make man/CMakeFiles/libmosquitto.3.dir/build
# .PHONY : libmosquitto.3/fast

# #=============================================================================
# # Target rules for targets named mosquitto.conf.5

# # Build rule for target.
# mosquitto.conf.5: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 mosquitto.conf.5
# .PHONY : mosquitto.conf.5

# # fast build rule for target.
# mosquitto.conf.5/fast:
# 	$(MAKE) $(MAKESILENT) -f man/CMakeFiles/mosquitto.conf.5.dir/build.make man/CMakeFiles/mosquitto.conf.5.dir/build
# .PHONY : mosquitto.conf.5/fast

# #=============================================================================
# # Target rules for targets named mosquitto-tls.7

# # Build rule for target.
# mosquitto-tls.7: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 mosquitto-tls.7
# .PHONY : mosquitto-tls.7

# # fast build rule for target.
# mosquitto-tls.7/fast:
# 	$(MAKE) $(MAKESILENT) -f man/CMakeFiles/mosquitto-tls.7.dir/build.make man/CMakeFiles/mosquitto-tls.7.dir/build
# .PHONY : mosquitto-tls.7/fast

# #=============================================================================
# # Target rules for targets named mqtt.7

# # Build rule for target.
# mqtt.7: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 mqtt.7
# .PHONY : mqtt.7

# # fast build rule for target.
# mqtt.7/fast:
# 	$(MAKE) $(MAKESILENT) -f man/CMakeFiles/mqtt.7.dir/build.make man/CMakeFiles/mqtt.7.dir/build
# .PHONY : mqtt.7/fast

# #=============================================================================
# # Target rules for targets named mosquitto.8

# # Build rule for target.
# mosquitto.8: cmake_check_build_system
# 	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 mosquitto.8
# .PHONY : mosquitto.8

# # fast build rule for target.
# mosquitto.8/fast:
# 	$(MAKE) $(MAKESILENT) -f man/CMakeFiles/mosquitto.8.dir/build.make man/CMakeFiles/mosquitto.8.dir/build
# .PHONY : mosquitto.8/fast

# # Help Target
# help:
# 	@echo "The following are some of the valid targets for this Makefile:"
# 	@echo "... all (the default if no target is provided)"
# 	@echo "... clean"
# 	@echo "... depend"
# 	@echo "... edit_cache"
# 	@echo "... install"
# 	@echo "... install/local"
# 	@echo "... install/strip"
# 	@echo "... list_install_components"
# 	@echo "... rebuild_cache"
# 	@echo "... test"
# 	@echo "... libmosquitto.3"
# 	@echo "... mosquitto-tls.7"
# 	@echo "... mosquitto.8"
# 	@echo "... mosquitto.conf.5"
# 	@echo "... mosquitto_ctrl.1"
# 	@echo "... mosquitto_ctrl_dynsec.1"
# 	@echo "... mosquitto_passwd.1"
# 	@echo "... mosquitto_pub.1"
# 	@echo "... mosquitto_rr.1"
# 	@echo "... mosquitto_sub.1"
# 	@echo "... mqtt.7"
# 	@echo "... dos_attacker"
# 	@echo "... libmosquitto"
# 	@echo "... mosquitto"
# 	@echo "... mosquitto_ctrl"
# 	@echo "... mosquitto_dynamic_security"
# 	@echo "... mosquitto_message_timestamp"
# 	@echo "... mosquitto_passwd"
# 	@echo "... mosquitto_payload_modification"
# 	@echo "... mosquitto_pub"
# 	@echo "... mosquitto_rr"
# 	@echo "... mosquitto_sub"
# 	@echo "... mosquittopp"
# .PHONY : help



# #=============================================================================
# # Special targets to cleanup operation of make.

# # Special rule to run CMake to check the build system integrity.
# # No rule that depends on this can have commands that come from listfiles
# # because they might be regenerated.
# cmake_check_build_system:
# 	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
# .PHONY : cmake_check_build_system

include config.mk

DIRS=lib apps client plugins src
DOCDIRS=man
DISTDIRS=man
DISTFILES= \
	apps/ \
	client/ \
	cmake/ \
	deps/ \
	examples/ \
	include/ \
	installer/ \
	lib/ \
	logo/ \
	man/ \
	misc/ \
	plugins/ \
	security/ \
	service/ \
	snap/ \
	src/ \
	test/ \
	\
	CMakeLists.txt \
	CONTRIBUTING.md \
	ChangeLog.txt \
	LICENSE.txt \
	Makefile \
	about.html \
	aclfile.example \
	config.h \
	config.mk \
	edl-v10 \
	epl-v20 \
	libmosquitto.pc.in \
	libmosquittopp.pc.in \
	mosquitto.conf \
	NOTICE.md \
	pskfile.example \
	pwfile.example \
	README-compiling.md \
	README-letsencrypt.md \
	README-windows.txt \
	README.md

.PHONY : all mosquitto api docs binary check clean reallyclean test install uninstall dist sign copy localdocker

all : $(MAKE_ALL)

api :
	mkdir -p api p
	naturaldocs -o HTML api -i lib -p p
	rm -rf p

docs :
	set -e; for d in ${DOCDIRS}; do $(MAKE) -C $${d}; done

binary : mosquitto

mosquitto :
ifeq ($(UNAME),Darwin)
	$(error Please compile using CMake on Mac OS X)
endif

	set -e; for d in ${DIRS}; do $(MAKE) -C $${d}; done

clean :
	set -e; for d in ${DIRS}; do $(MAKE) -C $${d} clean; done
	set -e; for d in ${DOCDIRS}; do $(MAKE) -C $${d} clean; done
	$(MAKE) -C test clean

reallyclean :
	set -e; for d in ${DIRS}; do $(MAKE) -C $${d} reallyclean; done
	set -e; for d in ${DOCDIRS}; do $(MAKE) -C $${d} reallyclean; done
	$(MAKE) -C test reallyclean
	-rm -f *.orig

check : test

test : mosquitto
	$(MAKE) -C test test

ptest : mosquitto
	$(MAKE) -C test ptest

utest : mosquitto
	$(MAKE) -C test utest

install : all
	set -e; for d in ${DIRS}; do $(MAKE) -C $${d} install; done
ifeq ($(WITH_DOCS),yes)
	set -e; for d in ${DOCDIRS}; do $(MAKE) -C $${d} install; done
endif
	$(INSTALL) -d "${DESTDIR}/etc/mosquitto"
	$(INSTALL) -m 644 mosquitto.conf "${DESTDIR}/etc/mosquitto/mosquitto.conf.example"
	$(INSTALL) -m 644 aclfile.example "${DESTDIR}/etc/mosquitto/aclfile.example"
	$(INSTALL) -m 644 pwfile.example "${DESTDIR}/etc/mosquitto/pwfile.example"
	$(INSTALL) -m 644 pskfile.example "${DESTDIR}/etc/mosquitto/pskfile.example"

uninstall :
	set -e; for d in ${DIRS}; do $(MAKE) -C $${d} uninstall; done
	rm -f "${DESTDIR}/etc/mosquitto/mosquitto.conf.example"
	rm -f "${DESTDIR}/etc/mosquitto/aclfile.example"
	rm -f "${DESTDIR}/etc/mosquitto/pwfile.example"
	rm -f "${DESTDIR}/etc/mosquitto/pskfile.example"

dist : reallyclean
	set -e; for d in ${DISTDIRS}; do $(MAKE) -C $${d} dist; done
	mkdir -p dist/mosquitto-${VERSION}
	cp -r ${DISTFILES} dist/mosquitto-${VERSION}/
	cd dist; tar -zcf mosquitto-${VERSION}.tar.gz mosquitto-${VERSION}/

sign : dist
	cd dist; gpg --detach-sign -a mosquitto-${VERSION}.tar.gz

copy : sign
	cd dist; scp mosquitto-${VERSION}.tar.gz mosquitto-${VERSION}.tar.gz.asc mosquitto:site/mosquitto.org/files/source/
	scp ChangeLog.txt mosquitto:site/mosquitto.org/

coverage :
	lcov --capture --directory . --output-file coverage.info
	genhtml coverage.info --output-directory out

localdocker : reallyclean
	set -e; for d in ${DISTDIRS}; do $(MAKE) -C $${d} dist; done
	rm -rf dockertmp/
	mkdir -p dockertmp/mosquitto-${VERSION}
	cp -r ${DISTFILES} dockertmp/mosquitto-${VERSION}/
	cd dockertmp/; tar -zcf mosq.tar.gz mosquitto-${VERSION}/
	cp dockertmp/mosq.tar.gz docker/local
	rm -rf dockertmp/
	cd docker/local && docker build . -t eclipse-mosquitto:local

