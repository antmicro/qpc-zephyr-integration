*** Settings ***
Suite Setup                   Setup
Suite Teardown                Teardown
Test Setup                    Reset Emulation
Test Teardown                 Test Teardown
Resource                      ${RENODEKEYWORDS}

*** Variables ***
${SCRIPT}                     ${CURDIR}/nrf52840.resc
${UART}                       sysbus.uart0
${PROMPT}                     uart:~$

*** Keywords ***
Prepare Sample
    [Arguments]                 ${sample_name}

    Execute Command             $bin="${sample_name}.elf"
    Execute Script              ${SCRIPT}
    Create Terminal Tester      ${UART}

*** Test Cases ***
Should Run Hello QPc
    Prepare Sample              zephyr
    Start Emulation
    Wait for Line on Uart       Hello QPc
