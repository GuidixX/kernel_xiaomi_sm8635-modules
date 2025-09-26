all:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) modules
	$(MAKE) -C $(KERNEL_SRC) M=$(M)/mi_fp modules

modules_install:
	$(MAKE) M=$(M) -C $(KERNEL_SRC) modules_install
	$(MAKE) M=$(M)/mi_fp -C $(KERNEL_SRC) modules_install

%:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) $@ $(KBUILD_OPTIONS)

clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) clean
	$(MAKE) -C $(KERNEL_SRC) M=$(M)/mi_fp clean

