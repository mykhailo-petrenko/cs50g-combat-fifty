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
        texture = 'characters',
        mirrorX = true,
      },
      ['walk-right'] = {
        frames = {17, 18, 19},
        interval = 0.15,
        texture = 'characters'
      },
      ['walk-down'] = {
        frames = {1, 2, 3},
        interval = 0.15,
        texture = 'characters'
      },
      ['walk-up'] = {
        frames = {33, 34, 35},
        interval = 0.15,
        texture = 'characters'
      },
      ['idle-left'] = {
        frames = {17},
        texture = 'characters',
        mirrorX = true,
      },
      ['idle-right'] = {
        frames = {17},
        texture = 'characters'
      },
      ['idle-down'] = {
        frames = {1},
        texture = 'characters'
      },
      ['idle-up'] = {
        frames = {33},
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