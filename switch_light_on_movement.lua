--[[
%% properties
%% autostart
%% globals
--]]

-- created by Jan-Paul van Burgsteden (https://github.com/jpvanburgsteden)
-- More fibaro scenes at https://github.com/jpvanburgsteden/fibaro-hc2

local pir       = 1;  -- * change this to the id of your pir/motion detector *
local light     = 2;  -- * change this to the id of your light (dimmer only) *

local dimlevel  = 35; -- level of dimming
local duration  = 60; -- seconds to keep on the light after last detected movement

local countdown = 0;
local movement;

while true do
  local movement = tonumber(fibaro:getValue(pir, 'value'));

  -- if ( movement == 1 ) then -- uncomment this line and comment next one to disable Darkness condition
  if ( movement == 1 and tonumber(fibaro:getGlobalValue("Darkness")) == 1 ) then
    countdown = duration;
  end
  
  if ( countdown > 0 ) then
    if ( tonumber(fibaro:getValue(light, 'value')) == 0 ) then
      fibaro:call(light, "setValue", dimlevel);
    end
    
    countdown = countdown - 1;
  end
  
  if ( countdown == 0 and tonumber(fibaro:getValue(light, 'value')) > 0 ) then
    fibaro:call(light, "turnOff");
  end
  
  -- fibaro:debug("Movement: " .. movement .. " Countdown: " .. countdown .. " Light: " .. fibaro:getValue(light, 'value'));
  fibaro:sleep(1000);
end
