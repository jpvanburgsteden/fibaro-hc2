--[[
%% properties
%% autostart
%% globals
--]]

-- created by Jan-Paul van Burgsteden (https://github.com/jpvanburgsteden)
-- More fibaro scenes at https://github.com/jpvanburgsteden/fibaro-hc2

local margin = 30;  -- amount of minutes before sunset/after sunrise we should change the Darkness value

local sunsettime;
local sunset;
local sunrise;
local sunrisetime;

while true do
  sunsettime  = os.date("%H:%M", os.time()-margin * 60);
  sunrisetime = os.date("%H:%M", os.time()+margin * 60);
  
  sunset  = fibaro:getValue(1, "sunsetHour");
  sunrise = fibaro:getValue(1, "sunriseHour");

  if ( sunsettime >= sunset or sunrisetime <= sunrise ) then
    fibaro:setGlobal("Darkness", "1");
  else
    fibaro:setGlobal("Darkness", "0");
  end
  
  -- fibaro:debug("Darkness: " .. fibaro:getGlobalValue("Darkness") .. " Sunset: " .. sunset .. " (" .. sunsettime .. ") Sunrise: " .. sunrise .. " (" .. sunrisetime .. ")");

  fibaro:sleep(60000);
end
