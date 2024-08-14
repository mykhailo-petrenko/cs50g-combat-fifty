PLAYER_WALK_SPEED = 30

ENTITY_DEFS = {
  ['player'] = {
    width = 32,
    height = 32,
    walkSpeed = PLAYER_WALK_SPEED,
    animations = {
      ['walk-left'] = {
        frames = {17, 18, 19},
        interval = 0.15,
        looping = true,
        texture = 'characters',
        mirrorX = true,
      },
      ['walk-right'] = {
        frames = {17, 18, 19},
        interval = 0.15,
        looping = true,
        texture = 'characters'
      },
      ['walk-down'] = {
        frames = {1, 2, 3},
        interval = 0.15,
        looping = true,
        texture = 'characters'
      },
      ['walk-up'] = {
        frames = {33, 34, 35},
        interval = 0.15,
        looping = true,
        texture = 'characters'
      },
      ['idle-left'] = {
        frames = {17},
        looping = true,
        texture = 'characters',
        mirrorX = true,
      },
      ['idle-right'] = {
        frames = {17},
        looping = true,
        texture = 'characters'
      },
      ['idle-down'] = {
        frames = {1},
        looping = true,
        texture = 'characters'
      },
      ['idle-up'] = {
        frames = {33},
        looping = true,
        texture = 'characters'
      },
      ['death'] = {
        frames = {49, 50, 51},
        interval = 0.33,
        looping = false,
        texture = 'characters'
      },
      ['fade-out'] = {
        frames = {1, 2, 4},
        interval = 0.33,
        looping = false,
        texture = 'characters'
      },
      ['fade-in'] = {
        frames = {4, 2, 1},
        interval = 0.33,
        looping = false,
        texture = 'characters'
      }
    }
  },
}