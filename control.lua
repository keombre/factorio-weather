
require("lib/perlin")

rain = {
    tile = {
        x = 150,
        y = 150
    },
    populated = {},
    center = {
        x = 0,
        y = 0
    }
}

script.on_event({defines.events.on_tick},
function (e)
    if e.tick % 60 == 0 then
        --update rain pattern

        -- get map seed so that every map will have different weather patters
        local seed = e.surfaces.nauvis.map_gen_settings.seed
        
        -- get wind data for the rain to flow across the map
        local wind_speed = e.surfaces.nauvis.wind_speed
        local wind_orientaion = e.surfaces.nauvis.wind_orientation

        rain.center.x = rain.center.x + math.cos(wind_orientaion) * wind_speed
        rain.center.y = rain.center.y + math.sin(wind_orientaion) * wind_speed

        -- display weather only where players are standing (save on resources)
        for index,player in pairs(game.connected_players) do
            
            local display_resolution = player.display_resolution
            local pos = {
                x = player.position.x - player.position.x % rain.tile.x,
                y = player.position.y - player.position.y % rain.tile.y
            }

            perin:noise(pos.x )
        end

        -- modify production of solar panels

        -- decrease polution

        -- calm enemies
    end
end)
