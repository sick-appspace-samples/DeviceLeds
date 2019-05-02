--[[----------------------------------------------------------------------------
  Application name:
  DeviceLeds

  Summary:
  Controlling the LEDs of SIM4000, show color change and blinking mode.

  Description:
  The following LEDs on the SIM4000 are set to the different possible colors:
  LEDs: LED_RESULT, LED_FUNC_1, LED_FUNC_2;
  Colors: white, blue, red, green, yellow, aqua, fuchsia
  In addition the sample shows how to blink a LED or turn it off.
  The LEDs can be used to provide feedback for results, errors, or while in
  operation. The sample runs on a SIM4000 and does not require any additional
  devices.

------------------------------------------------------------------------------]]

--Start of Global Scope -------------------------------------------------------

-- Creation of the LED handles, adapt when not using a SIM4000
local led_result = LED.create("LED_RESULT")
local led_func1 = LED.create("LED_FUNC_1")
local led_func2 = LED.create("LED_FUNC_2")

local counter = 0

--Timer for cycling through the possible color settings
-- luacheck: globals gTimerHandle
gTimerHandle = Timer.create()
Timer.setPeriodic(gTimerHandle, true)
Timer.setExpirationTime(gTimerHandle, 500)

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope--------------------------------------------

local function main()
  Timer.start(gTimerHandle)
end
--The following registration is part of the global scope which runs once after startup
--Registration of the 'main' function to the 'Engine.OnStarted' event
Script.register("Engine.OnStarted", main)

local function OnTimer()
  if (counter == 0) then
    LED.setColor(led_result, "white")
    LED.setColor(led_func1,  "white")
    LED.setColor(led_func2,  "white")

    -- Activate programmable LEDs
    LED.activate(led_result)
    LED.activate(led_func1)
    LED.activate(led_func2)
  end
  if (counter == 1) then
    LED.setColor(led_result, "blue")
    LED.setColor(led_func1,  "blue")
    LED.setColor(led_func2,  "blue")
  end
  if (counter == 2) then
    LED.setColor(led_result, "red")
    LED.setColor(led_func1,  "red")
    LED.setColor(led_func2,  "red")
  end
  if (counter == 3) then
    LED.setColor(led_result, "green")
    LED.setColor(led_func1,  "green")
    LED.setColor(led_func2,  "green")
  end
  if (counter == 4) then
    LED.setColor(led_result, "yellow")
    LED.setColor(led_func1,  "yellow")
    LED.setColor(led_func2,  "yellow")
  end
  if (counter == 5) then
    LED.setColor(led_result, "aqua")
    LED.setColor(led_func1,  "aqua")
    LED.setColor(led_func2,  "aqua")
  end
  if (counter == 6) then
    LED.setColor(led_result, "fuchsia")
    LED.setColor(led_func1,  "fuchsia")
    LED.setColor(led_func2,  "fuchsia")
  end
  if (counter == 7) then
    LED.setColor(led_result, "green")
    LED.setColor(led_func1,  "green")
    LED.setColor(led_func2,  "green")

    -- Blink the LEDs
    LED.blink(led_result, 250)
    LED.blink(led_func1, 250)
    LED.blink(led_func2, 250)
  end
  if (counter == 8) then
-- Deactivate programmable LEDs
    LED.deactivate(led_result)
    LED.deactivate(led_func1)
    LED.deactivate(led_func2)
    counter = -1
  end

  counter = counter + 1
end
Timer.register(gTimerHandle, "OnExpired", OnTimer)

--End of Function and EventScope------------------------------------------------
