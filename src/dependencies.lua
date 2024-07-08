push = require 'src/lib/push'
Timer = require 'src/lib/knife.timer'
Class = require 'src/lib/class'
Event = require 'src/lib/knife.event'

sti = require 'src/lib/sti'

require 'src/states/BaseState'
require 'src/states/StateStack'

require 'src/states/game/StartState'
require 'src/states/game/FadeInState'
require 'src/states/game/PlayState'

require 'src/constants'