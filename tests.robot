*** Settings ***
Library  OperatingSystem
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

    Execute Command             $bin="${sample_name}"
    Execute Script              ${SCRIPT}
    Create Terminal Tester      ${UART}

*** Test Cases ***
Should Run Hello QPc sample
    Prepare Sample              %{ZEPHYR_QPC_HELLO}
    Start Emulation
    Wait for Line on Uart       Hello QPc

Should Run Blinky QPc sample
    Prepare Sample              %{ZEPHYR_QPC_BLINKY}
    Start Emulation
    Wait for Line on Uart       LED OFF
    Wait for Line on Uart       LED ON
    Wait for Line on Uart       LED OFF
    Wait for Line on Uart       LED ON

Should Run DPP sample
    Prepare Sample              %{ZEPHYR_QPC_DPP}
    Start Emulation
    Wait for Line on Uart       Philosopher 0 is thinking
    Wait for Line on Uart       Philosopher 1 is thinking
    Wait for Line on Uart       Philosopher 2 is thinking
    Wait for Line on Uart       Philosopher 3 is thinking
    Wait for Line on Uart       Philosopher 4 is thinking
    Wait for Line on Uart       Philosopher 0 is hungry
    Wait for Line on Uart       Philosopher 0 is eating
    Wait for Line on Uart       Philosopher 0 is thinking
    Wait for Line on Uart       Philosopher 1 is hungry
    Wait for Line on Uart       Philosopher 1 is eating
    Wait for Line on Uart       Philosopher 1 is thinking
    Wait for Line on Uart       Philosopher 2 is hungry
    Wait for Line on Uart       Philosopher 2 is eating
    Wait for Line on Uart       Philosopher 2 is thinking
    Wait for Line on Uart       Philosopher 3 is hungry
    Wait for Line on Uart       Philosopher 3 is eating
    Wait for Line on Uart       Philosopher 3 is thinking
    Wait for Line on Uart       Philosopher 4 is hungry
    Wait for Line on Uart       Philosopher 4 is eating
    Wait for Line on Uart       Philosopher 4 is thinking
