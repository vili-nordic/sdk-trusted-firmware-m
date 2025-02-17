#-------------------------------------------------------------------------------
# Copyright (c) 2020-2021, Arm Limited. All rights reserved.
#
# SPDX-License-Identifier: BSD-3-Clause
#
#-------------------------------------------------------------------------------

cmake_policy(SET CMP0079 NEW)

# When using nrf_security we don't need these build scripts
return()

if(BL1 AND PLATFORM_DEFAULT_BL1)
    add_library(bl1_crypto_hw STATIC)
endif()
if(BL2)
    add_library(bl2_crypto_hw STATIC)
endif()
add_library(crypto_service_crypto_hw STATIC)

add_subdirectory(${CRYPTO_HW_ACCELERATOR_TYPE})

################################ BL1 ###########################################

if(BL1 AND PLATFORM_DEFAULT_BL1)
    target_include_directories(bl1_crypto_hw
        PUBLIC
            interface
    )

    target_compile_definitions(bl1_crypto_hw
        PUBLIC
            CRYPTO_HW_ACCELERATOR
    )
endif()

################################ BL2 ###########################################

if(BL2)
    target_include_directories(bl2_crypto_hw
        PUBLIC
            interface
    )

    target_compile_definitions(bl2_crypto_hw
        PUBLIC
            CRYPTO_HW_ACCELERATOR
    )
endif()

############################ Crypto Service ####################################

target_include_directories(crypto_service_crypto_hw
    PUBLIC
        interface
)

target_compile_definitions(crypto_service_crypto_hw
    PUBLIC
        CRYPTO_HW_ACCELERATOR
)
