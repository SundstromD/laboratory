install(
    TARGETS laboratory_exe
    RUNTIME COMPONENT laboratory_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
