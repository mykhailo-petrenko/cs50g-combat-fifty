--[[
    GD50
    Legend of Zelda

    -- Animation Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

Animation = Class{}

function Animation:init(def)
    self.name = def.name
    self.frames = def.frames
    self.interval = def.interval
    self.texture = def.texture
    self.looping = def.looping or false
    self.mirrorX = def.mirrorX or false

    self.timer = 0
    self.currentFrame = 1

    -- used to see if we've seen a whole loop of the animation
    self.timesPlayed = 0
end

function Animation:refresh()
    self.timer = 0
    self.currentFrame = 1
    self.timesPlayed = 0
end

function Animation:update(dt)
    -- if not a looping animation and we've played at least once, exit
    if not self.looping and self.timesPlayed > 0 then
        return
    end

    -- no need to update if animation is only one frame
    if #self.frames > 1 then
        self.timer = self.timer + dt

        if self.timer > self.interval then
            self.timer = self.timer % self.interval

            self.currentFrame = math.max(1, (self.currentFrame + 1) % (#self.frames + 1))

            -- if we've looped back to the beginning, record
            if self.currentFrame == #self.frames then
                self.timesPlayed = self.timesPlayed + 1
            end
        end
    end
end

function Animation:getCurrentFrame()
    return self.frames[self.currentFrame]
end

function Animation.animationsFactory(animations, frameShift)
    local animationsReturned = {}
    local shift = frameShift or 0

    for k, animationDef in pairs(animations) do
        local frames = {}
        local N = #animationDef.frames

        for i = 1, N do
            frames[i] = animationDef.frames[i] + shift
        end

        animationsReturned[k] = Animation({
            name = k,
            texture = animationDef.texture,
            frames = frames,
            interval = animationDef.interval,
            looping = animationDef.looping,
            mirrorX = animationDef.mirrorX or false
        })
    end

    return animationsReturned
end
