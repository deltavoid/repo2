

BUILD_DIR ?= build
.PHONY: build clean
# default: run


WORK_DIR:=$(CURDIR)/..
REPO1_DIR:=$(WORK_DIR)/repo1


build: $(BUILD_DIR)/Makefile
	cd $(BUILD_DIR) && make

install: $(BUILD_DIR)/Makefile
	cd $(BUILD_DIR) && make install

$(BUILD_DIR)/Makefile: Makefile
	mkdir -p $(BUILD_DIR) \
	&& cmake -S . -B $(BUILD_DIR) 
#		-DCMAKE_PREFIX_PATH=$(REPO1_DIR)/build 

clean:	
	rm -rf $(BUILD_DIR)

uninstall:
	-rm -rf /usr/local/lib/repo2
	-rm -rf /usr/local/lib/cmake/repo2
	-rm -rf /usr/local/include/repo2


run: build
	$(BUILD_DIR)/binary2/binary2
