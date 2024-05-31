# ----------------------------------------------------------------------------
# nrfx library makefile
#
# This is designed to be included as part of a make system designed
# to be expandable and maintainable using techniques found in:
#
# Managing Projects with GNU Make - Robert Mecklenburg - ISBN 0-596-00610-1
# ----------------------------------------------------------------------------

MODULE := nrfx

MODULE_PATH := $(call make_current_module_path)
$(call log_debug,MODULE_PATH is $(MODULE_PATH))

$(MODULE)_PATH := $(MODULE_PATH)
$(call log_debug,$(MODULE)_PATH is $($(MODULE)_PATH))

# ----------------------------------------------------------------------------
# Source file lists go here, C dependencies are automatically generated
# by the compiler using the -m option
#
# You can set up a common source path late in the file
#
# Note that each module gets its own, privately scoped variable for building
# ----------------------------------------------------------------------------

# We need both else a previous definition is used :-) Can we make this an include?

SRC_C :=
SRC_ASM :=

SRC_C += drivers/src/nrfx_adc.c
SRC_C += drivers/src/nrfx_bellboard.c
SRC_C += drivers/src/nrfx_clock.c
SRC_C += drivers/src/nrfx_comp.c
SRC_C += drivers/src/nrfx_dppi.c
SRC_C += drivers/src/nrfx_egu.c
SRC_C += drivers/src/nrfx_gpiote.c
SRC_C += drivers/src/nrfx_grtc.c
SRC_C += drivers/src/nrfx_i2s.c
SRC_C += drivers/src/nrfx_ipc.c
SRC_C += drivers/src/nrfx_lpcomp.c
SRC_C += drivers/src/nrfx_nfct.c
SRC_C += drivers/src/nrfx_nvmc.c
SRC_C += drivers/src/nrfx_pdm.c
SRC_C += drivers/src/nrfx_power.c
SRC_C += drivers/src/nrfx_ppi.c
SRC_C += drivers/src/nrfx_pwm.c
SRC_C += drivers/src/nrfx_qdec.c
SRC_C += drivers/src/nrfx_qspi.c
SRC_C += drivers/src/nrfx_rng.c
SRC_C += drivers/src/nrfx_rramc.c
SRC_C += drivers/src/nrfx_rtc.c
SRC_C += drivers/src/nrfx_saadc.c
SRC_C += drivers/src/nrfx_spi.c
SRC_C += drivers/src/nrfx_spim.c
SRC_C += drivers/src/nrfx_spis.c
SRC_C += drivers/src/nrfx_systick.c
SRC_C += drivers/src/nrfx_tbm.c
SRC_C += drivers/src/nrfx_temp.c
SRC_C += drivers/src/nrfx_timer.c
SRC_C += drivers/src/nrfx_twi.c
SRC_C += drivers/src/nrfx_twim.c
SRC_C += drivers/src/nrfx_twis.c
SRC_C += drivers/src/nrfx_twi_twim.c
SRC_C += drivers/src/nrfx_uart.c
SRC_C += drivers/src/nrfx_uarte.c
SRC_C += drivers/src/nrfx_usbd.c
SRC_C += drivers/src/nrfx_usbreg.c
SRC_C += drivers/src/nrfx_vevif.c
SRC_C += drivers/src/nrfx_wdt.c

SRC_C += drivers/src/prs/nrfx_prs.c

SRC_C += mdk/startup_nrf_common.c
SRC_C += mdk/$(MCU_SYSTEM_FILE).c

SRC_ASM += mdk/$(MCU_STARTUP_FILE).S

# ----------------------------------------------------------------------------
# Set up the module level source and include paths

$(MODULE)_SRCPATH :=
$(MODULE)_SRCPATH += $(MODULE_PATH)/drivers/src
$(MODULE)_SRCPATH += $(MODULE_PATH)/drivers/src/prs
$(MODULE)_SRCPATH += $(MODULE_PATH)/mdk

$(MODULE)_INCPATH :=
$(MODULE)_INCPATH += $(MODULE_PATH)
$(MODULE)_INCPATH += $(MODULE_PATH)/mdk
$(MODULE)_INCPATH += $(MODULE_PATH)/drivers/include
$(MODULE)_INCPATH += $(MODULE_PATH)/drivers/include
$(MODULE)_INCPATH += $(cmsis_core_PATH)/Include

# ----------------------------------------------------------------------------
# NOTE: The default HAL config file must be created somehow - it is normally
#       up to the developer to specify which HAL elements are needed and how
#       they are to be configured.
#
# By convention we place config files in $(PRODUCT)/$(MCU) because
# that's an easy pace to leave things like HAL config, linker scripts etc

$(MODULE)_INCPATH += $(PRODUCT)/config/$(MCU)

# ---------------------------- ------------------------------------------------
# Set any module level compile time defaults here

$(MODULE)_CDEFS :=
$(MODULE)_CDEFS += __START=main __STARTUP_CLEAR_BSS

$(MODULE)_CFLAGS :=
$(MODULE)_CFLAGS +=

# ----------------------------------------------------------------------------
# Include the adaptabuild library makefile - must be done for each module!

include $(ADAPTABUILD_PATH)/make/library.mak

# ----------------------------------------------------------------------------
