load("//build/kernel/kleaf:kernel.bzl", "ddk_module")
load("//build/bazel_common_rules/dist:dist.bzl", "copy_to_dist_dir")

def define_basic_modules(targets, variants):
    for t in targets:
        for v in variants:
            define_modules(t, v)

def define_modules(target, variant):
    tv = "{}_{}".format(target, variant)

    # 1. xlogchar
    xlogchar_name = "{}_xlogchar".format(tv)
    ddk_module(
        name = xlogchar_name,
        out = "xlogchar.ko",
        deps = ["//msm-kernel:all_headers"],
        srcs = native.glob([
            "drivers/char/**/*.c",
            "drivers/char/**/*.h",
        ]),
        includes = ["include/linux"],
        kernel_build = "//msm-kernel:{}".format(tv),
        visibility = ["//visibility:public"],
    )

    # 2. dump_display
    dump_display_name = "{}_dump_display".format(tv)
    ddk_module(
        name = dump_display_name,
        out = "dump_display.ko",
        deps = ["//msm-kernel:all_headers"],
        srcs = native.glob([
            "drivers/xiaomi/dump_display/**/*.c",
            "drivers/xiaomi/dump_display/**/*.h",
        ]),
        includes = ["include/linux"],
        kernel_build = "//msm-kernel:{}".format(tv),
        visibility = ["//visibility:public"],
    )

    # 3. aw8697-haptic
    aw8697_haptic_name = "{}_aw8697-haptic".format(tv)
    ddk_module(
        name = aw8697_haptic_name,
        out = "aw8697-haptic.ko",
        deps = ["//msm-kernel:all_headers"],
        srcs = native.glob([
            "drivers/input/misc/aw86927_haptic/**/*.c",
            "drivers/input/misc/aw86927_haptic/**/*.h",
        ]),
        includes = ["include/linux"],
        kernel_build = "//msm-kernel:{}".format(tv),
        visibility = ["//visibility:public"],
    )

    # 4. si_haptic
    si_haptic_name = "{}_si_haptic".format(tv)
    ddk_module(
        name = si_haptic_name,
        out = "si_haptic.ko",
        deps = ["//msm-kernel:all_headers"],
        srcs = native.glob([
            "drivers/input/misc/si_haptic/**/*.c",
            "drivers/input/misc/si_haptic/**/*.h",
        ]),
        includes = ["include/linux"],
        kernel_build = "//msm-kernel:{}".format(tv),
        visibility = ["//visibility:public"],
    )

    # 5. mi_thermal_interface
    mi_thermal_interface_name = "{}_mi_thermal_interface".format(tv)
    ddk_module(
        name = mi_thermal_interface_name,
        out = "mi_thermal_interface.ko",
        deps = ["//msm-kernel:all_headers"],
        srcs = native.glob([
            "drivers/thermal/xiaomi/**/*.c",
            "drivers/thermal/xiaomi/**/*.h",
        ]),
        includes = ["include/linux"],
        kernel_build = "//msm-kernel:{}".format(tv),
        visibility = ["//visibility:public"],
    )

    # 6. wl2866d
    wl2866d_name = "{}_wl2866d".format(tv)
    ddk_module(
        name = wl2866d_name,
        out = "wl2866d.ko",
        deps = ["//msm-kernel:all_headers"],
        srcs = native.glob([
            "drivers/regulator/**/*.c",
            "drivers/regulator/**/*.h",
        ]),
        includes = ["include/linux"],
        kernel_build = "//msm-kernel:{}".format(tv),
        visibility = ["//visibility:public"],
    )

    # Dist action
    dist_name = "{}_xiaomi_modules_dist".format(tv)
    copy_to_dist_dir(
        name = dist_name,
        data = [
            ":{}".format(xlogchar_name),
            ":{}".format(dump_display_name),
            ":{}".format(aw8697_haptic_name),
            ":{}".format(si_haptic_name),
            ":{}".format(mi_thermal_interface_name),
            ":{}".format(wl2866d_name),
        ],
        dist_dir = "../out/target/product/{}/dlkm/lib/modules/".format(target),
        flat = True,
        wipe_dist_dir = False,
        allow_duplicate_filenames = False,
        mode_overrides = {"**/*": "644"},
        log = "info",
    )
