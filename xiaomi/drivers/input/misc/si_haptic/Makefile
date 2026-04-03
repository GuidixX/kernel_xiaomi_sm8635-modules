all: modules

modules:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) modules $(KBUILD_OPTIONS)

modules_install:
	$(MAKE) M=$(M) -C $(KERNEL_SRC) modules_install

clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) clean

%:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) $@ $(KBUILD_OPTIONS)

obj-m += si_haptic.o
si_haptic-objs := haptic.o sih688x_func_config.o haptic_mid.o sih688x.o sih688x_reg.o haptic_misc.o haptic_regmap.o ringbuffer.o
