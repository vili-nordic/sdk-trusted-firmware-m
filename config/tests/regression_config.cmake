#-------------------------------------------------------------------------------
# Copyright (c) 2022, Arm Limited. All rights reserved.
#
# SPDX-License-Identifier: BSD-3-Clause
#
#-------------------------------------------------------------------------------

if(TEST_NS OR TEST_S)
    # Enable default Secure Partition for tests when secure or non-secure regressions are enabled

    set(TFM_PARTITION_INTERNAL_TRUSTED_STORAGE ON       CACHE BOOL      "Enable Internal Trusted Storage partition")
    set(TFM_PARTITION_PROTECTED_STORAGE        ON       CACHE BOOL      "Enable Protected Storage partition")
    set(TFM_PARTITION_CRYPTO                   ON       CACHE BOOL      "Enable Crypto partition")
    set(TFM_PARTITION_INITIAL_ATTESTATION      ON       CACHE BOOL      "Enable Initial Attestation partition")
    set(TFM_PARTITION_PLATFORM                 ON       CACHE BOOL      "Enable Platform partition")
endif()

if(TEST_S_CRYPTO OR TEST_NS_CRYPTO)
    set(TFM_PARTITION_INTERNAL_TRUSTED_STORAGE ON       CACHE BOOL      "Enable Internal Trusted Storage partition")
    set(TFM_PARTITION_CRYPTO                   ON       CACHE BOOL      "Enable Crypto partition")
endif()

if(TEST_S_ITS OR TEST_NS_ITS)
    set(TFM_PARTITION_INTERNAL_TRUSTED_STORAGE ON       CACHE BOOL      "Enable Internal Trusted Storage partition")
endif()

if(TEST_S_PS OR TEST_NS_PS)
    set(TFM_PARTITION_PROTECTED_STORAGE        ON       CACHE BOOL      "Enable Protected Storage partition")
    set(TFM_PARTITION_INTERNAL_TRUSTED_STORAGE ON       CACHE BOOL      "Enable Internal Trusted Storage partition")
    set(TFM_PARTITION_CRYPTO                   ON       CACHE BOOL      "Enable Crypto partition")
endif()

if(TEST_S_ATTESTATION OR TEST_NS_ATTESTATION)
    set(TFM_PARTITION_INITIAL_ATTESTATION      ON       CACHE BOOL      "Enable Initial Attestation partition")
    set(TFM_PARTITION_INTERNAL_TRUSTED_STORAGE ON       CACHE BOOL      "Enable Internal Trusted Storage partition")
    set(TFM_PARTITION_CRYPTO                   ON       CACHE BOOL      "Enable Crypto partition")
endif()

if(TEST_S_FPU OR TEST_NS_FPU)
    # FPU test partition only support IPC model so far
    if(CONFIG_TFM_SPM_BACKEND STREQUAL "SFN")
        message(FATAL_ERROR "FPU test partition is implemented in IPC model. SFN cannot support it.")
    endif()
    set(CONFIG_TFM_SPM_BACKEND                "IPC"       CACHE STRING    "The SPM backend [IPC, SFN]")
    message("Set CONFIG_TFM_SPM_BACKEND to IPC Backend to support FPU regressions")
endif()
