push = require 'lib/push'
Timer = require 'lib/knife.timer'
Class = require 'lib/class'
Event = require 'lib/knife.event'

require 'src/states/BaseState'
require 'src/states/StateStack'

require 'src/states/game/StartState'
require 'src/states/game/FadeInState'
require 'src/states/game/PlayState'

require 'constants'