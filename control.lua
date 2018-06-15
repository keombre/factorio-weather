require("lib/perlin")

rain = {
    tile = {
        x = 150,
        y = 150
    },
    center = {
        x = 0,
        y = 0
    },
    range = {
        x = 50,
        y = 50
    },
    scale = 0.03
}

script.on_event({defines.events.on_tick},
function (e)
    if e.tick % (60 * 5) == 0 then
        --update rain pattern

        -- get map seed so that every map will have different weather patters
        local seed = game.surfaces.nauvis.map_gen_settings.seed
        
        -- get wind data for the rain to flow across the map
        local wind_speed = game.surfaces.nauvis.wind_speed
        local wind_orientaion = game.surfaces.nauvis.wind_orientation

        rain.center.x = rain.center.x + math.cos(wind_orientaion) * wind_speed
        rain.center.y = rain.center.y + math.sin(wind_orientaion) * wind_speed

        local populated = {}

        -- display weather only where players are standing (save on resources)
        for index,player in pairs(game.connected_players) do
            
            local scr_size = player.display_resolution
            local pos = {
                x = player.position.x - rain.range.x,
                y = player.position.y - rain.range.y
                --x = (player.position.x - scr_size.width/2) - (player.position.x - scr_size.width/2) % rain.tile.x,
                --y = (player.position.y - scr_size.height/2) - (player.position.y - scr_size.height/2) % rain.tile.y
            }
            
            for rel_pos_x = 0, rain.range.x do
                for rel_pos_y = 0, rain.range.y do
                    
                    local tile_pos = {
                        x = pos.x + rel_pos_x*rain.tile.x*rain.scale,
                        y = pos.y + rel_pos_y*rain.tile.y*rain.scale,
                    }

                    --player.print(tile_pos.x)
                    
                    if populated[tile_pos.x] ~= tile_pos.y then
                        populated[tile_pos.x] = tile_pos.y
                        local noise = perlin:noise(tile_pos.x + seed + rain.center.x, tile_pos.y + seed + rain.center.y, 0.2)

                        --player.surface.create_entity{position=tile_pos, text=noise, name="flying-text"}
                        player.surface.create_entity{position=tile_pos, name="demoRain"}
                    end
                end
            end
            for var=2,20 do
                print(var)
            end
        end

        -- modify production of solar panels

        -- decrease polution

        -- calm enemies
    end
end)

--]]