push = require 'src/lib/push'
Timer = require 'src/lib/knife.timer'
Class = require 'src/lib/class'
Event = require 'src/lib/knife.event'
Bump = require 'src/lib/bump'
STI = require 'src/lib/sti'

require 'src/entity/Entity'
require 'src/entity/Player'

require 'src/states/BaseState'
require 'src/states/StateStack'

require 'src/states/game/StartState'
require 'src/states/game/FadeInState'
require 'src/states/game/PlayState'

require 'src/constants'