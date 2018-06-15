
data:extend{
    {
        name = "lightRain",
        type = "explosion",
        flags = {"not-on-map"},
        animations =
        {
            {
                filename = "__Weather__/graphics/rain/light/1.png",
                priority = "high",
                width = 64,
                height = 59,
                frame_count = 16,
                animation_speed = 0.5
            },
            {
                filename = "__Weather__/graphics/rain/light/2.png",
                priority = "high",
                width = 64,
                height = 57,
                frame_count = 16,
                animation_speed = 0.5
            },
            {
                filename = "__Weather__/graphics/rain/light/3.png",
                priority = "high",
                width = 64,
                height = 49,
                frame_count = 16,
                animation_speed = 0.5
            },
            {
                filename = "__Weather__/graphics/rain/light/4.png",
                priority = "high",
                width = 64,
                height = 51,
                frame_count = 16,
                animation_speed = 0.5
            }
        },
        light = {intensity = 1, size = 20, color = {r=1.0, g=1.0, b=1.0}},
        sound = {
            aggregation = {
                max_count = 1,
                remove = true
            },
            variations = {
                {
                    filename = "__Weather__/sound/rain/lightRain-1.ogg",
                    volume = 0.75
                },
                {
                    filename = "__Weather__/sound/rain/lightRain-2.ogg",
                    volume = 0.75
                }
            }
        }
    }
}
