require("lib/perlin")
--require("prototype/style")

rain = {
    tile = {
        x = 10,
        y = 10
    },
    center = {
        x = 0,
        y = 0
    },
    noise_scale = {
        x = 0.01,
        y = 0.01
    }
}

script.on_event({defines.events.on_tick},
function (e)
    if e.tick % 60 == 0 then
        --update rain pattern

        -- get map seed so that every map will have different weather patters
        local seed = game.surfaces.nauvis.map_gen_settings.seed
        
        -- get wind data for the rain to flow across the map
        local wind_speed = game.surfaces.nauvis.wind_speed
        local wind_orientaion = game.surfaces.nauvis.wind_orientation

        rain.center.x = rain.center.x - math.cos(wind_orientaion) * wind_speed
        rain.center.y = rain.center.y - math.sin(wind_orientaion) * wind_speed

        local populated = {}

        -- display weather only where players are standing (save on resources)
        for index,player in pairs(game.connected_players) do

            local range = {
                x = math.floor((player.display_resolution.width / (6 * rain.tile.x))/2), -- max zoomout factor (would do this dynamicaly, but player.zoom is read-only)
                y = math.floor((player.display_resolution.height / (6 * rain.tile.y))/2)
            }
            
            local pos = {
                x = player.position.x - player.position.x % rain.tile.x,
                y = player.position.y - player.position.y % rain.tile.y
            }
            
            for rel_pos_x = range.x*-1, range.x do
                for rel_pos_y = range.y*-1, range.y do
                    
                    local tile_pos = {
                        x = pos.x + rel_pos_x*rain.tile.x,
                        y = pos.y + rel_pos_y*rain.tile.y,
                    }

                    if populated[tile_pos.x] ~= tile_pos.y then
                        populated[tile_pos.x] = tile_pos.y
                        local noise = perlin:noise(
                            tile_pos.x * rain.noise_scale.x + seed + rain.center.x,
                            tile_pos.y * rain.noise_scale.y + seed + rain.center.y,
                            0.2
                        )

                        if noise > 0 then
                            player.surface.create_entity{position=tile_pos, name="demoRain"}
                        end
                        
                        -- darken screen when player is in rain
                        if rel_pos_x == 0 and rel_pos_y == 0 then
                            if noise > 0 then
                                if not player.gui.center.rain_dark then
                                    player.gui.center.add{type="sprite", sprite="rain-dark", name="rain_dark"}
                                end
                            elseif player.gui.center.rain_dark then
                                player.gui.center.rain_dark.destroy()
                            end
                        end
                    end
                end
            end
        end

        -- modify production of solar panels

        -- decrease polution

        -- calm enemies
    end
end)

--]]