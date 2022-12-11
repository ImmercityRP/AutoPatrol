Config = {} -- Don't remove

Config.Framework = 'ESX' -- Can be 'ESX' or 'Standalone'

Config.Speeds = { -- Can list as many as you want - must be a float value
    2.236936, -- 5 mph / 8 kmh
    4.473872, -- 10 mph / 16 kmh
    6.710808, -- 15 mph / 24 kmh
    11.18468, -- 25 mph / 40 kmh
    22.36936, -- 50 mph / 80 kmh
    40.264848, -- 90 mph / 145 kmh
}

Config.DefaultSpeed = 5 -- Default Speed based on Config.Speeds Index Position

Config.SpeedUnit = 'MPH' -- 'MPH' OR 'KMH'

Config.DriveStyle = 447 -- Use this site to calculate your preferred driving style: https://vespura.com/fivem/drivingstyle/

Config.Jobs = {'police', 'ambulance'} -- Set to false if you want available to everyone

Config.Keybind = "O" -- Registered Key Mapping under AutoPatrol. Input Parameters listed here: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
Config.SpeedUp = 71 -- Control ID for increasing patrol speed. Default is 'W'. Control IDs listed here: https://docs.fivem.net/docs/game-references/controls/
Config.SpeedUpLabel = 'W' -- Key Label for ESX Notifications
Config.SpeedDown = 72 -- Control ID for decreasing patrol speed. Default is 'S'. Control IDs listed here: https://docs.fivem.net/docs/game-references/controls/
Config.SpeedDownLabel = 'S' -- Key label for ESX Notifications