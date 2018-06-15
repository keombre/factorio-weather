
data:extend{
    {
        name = "demoRain",
        type = "explosion",
        flags = {"not-blueprintable", "not-deconstructable", "not-on-map"},
        animations =
        {
            {
                filename = "__Weather__/graphics/rain/1.png",
                priority = "high",
                width = 320,
                height = 320,
                scale = 1,
                frame_count = 1,
                animation_speed = 0.0166
            }
        },
        light = {intensity = 1, size = 20, color = {r=1.0, g=1.0, b=1.0}}
    }
}
