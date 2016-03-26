set(PTHREAD_CFLAGS -pthread)

if(NOT DARWIN)
  set(PTHREAD_LDFLAGS -pthread)
endif(NOT DARWIN)

if(ANDROID)
  find_host_package(BISON 2.5 REQUIRED)
else(ANDROID)
  find_package(BISON 2.5 REQUIRED)
endif(ANDROID)

find_package(libuecc REQUIRED)

set(NACL_INCLUDE_DIR)
set(NACL_CFLAGS_OTHER)
set(NACL_LIBRARIES)
set(NACL_LDFLAGS_OTHER)

if(ENABLE_LIBSODIUM)
  find_package(libsodium)

  if(LIBSODIUM_FOUND)
    set(NACL_INCLUDE_DIR "${LIBSODIUM_INCLUDE_DIR}/sodium")
    set(NACL_LIBRARIES "${LIBSODIUM_LIBRARIES}")
    set(NACL_CFLAGS_OTHER "${LIBSODIUM_CFLAGS_OTHER}")
    set(NACL_LDFLAGS_OTHER "${LIBSODIUM_LDFLAGS_OTHER}")
  endif(LIBSODIUM_FOUND)
else(ENABLE_LIBSODIUM)
  find_package(NaCl)

  set(NACL_LIBRARIES "${NACL_LIBRARY}")
endif(ENABLE_LIBSODIUM)

set_property(GLOBAL PROPERTY NACL_REQUIRED FALSE)


if(ENABLE_OPENSSL)
  find_package(OpenSSL REQUIRED)
else(ENABLE_OPENSSL)
  set(OPENSSL_INCLUDE_DIR "")
  set(OPENSSL_CRYPTO_LIBRARY "")
endif(ENABLE_OPENSSL)


if(WITH_CAPABILITIES)
  find_package(libcap REQUIRED)
else(WITH_CAPABILITIES)
  set(LIBCAP_INCLUDE_DIR "")
  set(LIBCAP_LIBRARY "")
endif(WITH_CAPABILITIES)

if(WITH_STATUS_SOCKET)
  find_package(JSON_C REQUIRED)
else(WITH_STATUS_SOCKET)
  set(JSON_C_INCLUDE_DIRS "")
  set(JSON_C_CFLAGS_OTHER "")
  set(JSON_C_LIBRARY_DIRS "")
  set(JSON_C_LIBRARIES "")
  set(JSON_C_LDFLAGS_OTHER "")
endif(WITH_STATUS_SOCKET)
