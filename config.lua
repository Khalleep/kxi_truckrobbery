K = {}
ox_inventory = exports.ox_inventory

-- Locales
K.locales = {
  failed = 'You failed',
  eioleitemia = 'You need a item to do this!',
  container = 'Rob the container',
  yougot = 'You got',
  robnotify = 'Someone is robbing a container!',
  cooldown = 'Cooldown is on!',
  stash = 'Truck container'
}

-- Jobs that will be alerted
K.Jobs = { 
    'police'
}

-- How long is the cooldown
K.Cooldown = 900000

-- what dispatch you are using
K.Notify = "your_dispatch" -- supports op-dispatch, core-dispatch, quasar-dispatch and cd_dispatch

-- Here you can choose how hard the skillcheck is. difficulty: 'easy' or 'medium' or 'hard'
K.Skillcheck = 'medium'
K.Skillcheck = 'medium'
K.Skillcheck = 'medium'
K.Skillcheck = 'medium'

-- choose what item do you need to start the robbery
K.Robitem = 'drill'

-- What items you can get from the robbery
K.itemsTable = {
  {"bread", 1, 3, 100},  -- item name, min item, max item, chance %
  {"water", 3, 5, 100},  -- item name, min item, max item, chance %
  {"gold", 1, 3, 55},  -- item name, min item, max item, chance %
  {"money", 155, 255, 15},  -- item name, min item, max item, chance %
  {"lockpick", 1, 3, 23},  -- item name, min item, max item, chance %
  {"bandage", 1, 2, 29},  -- item name, min item, max item, chance %
  {"bandage", 1, 2, 29},  -- item name, min item, max item, chance %
  {"iron", 1, 2, 26},  -- item name, min item, max item, chance %
  {"copper", 1, 2, 26},  -- item name, min item, max item, chance %
  {"paperbag", 1, 2, 31},  -- item name, min item, max item, chance %
  {"black_money", 1, 2, 21},  -- item name, min item, max item, chance %
}

K.Distance = 1.3

-- How long the robbery is
K.RobbingTime = 50000

K.RobIcon = "fa-solid fa-star" -- You can choose the icons here: https://fontawesome.com/search

--- Ox lib lockpick keys
K.Inputs = {'e', 'e', 'e', 'e'}

-- coordinates
K.Coordinates = {
  { position = vector3(219.9976, 6385.8096, 31.4170), radius = 2.0 },
  { position = vector3(-251.9888, -2451.7532, 6.0006), radius = 2.0 },
  { position = vector3(-262.4613, -2494.3738, 6.0006), radius = 2.0 },
  { position = vector3(-1192.2247, -2137.3757, 13.2560), radius = 2.0 },
  { position = vector3(-1188.2964, -2141.3499, 13.2557), radius = 2.0 },
  { position = vector3(-1175.0845, -2154.5095, 13.2564), radius = 2.0 },
  { position = vector3(-1167.2318, -2162.3391, 13.2746), radius = 2.0 },
  { position = vector3(-1197.8566, -2197.6489, 13.1951), radius = 2.0 },
  { position = vector3(-1203.2568, -2194.7769, 13.1949), radius = 2.0 },
  { position = vector3(-1207.4037, -2192.4900, 13.1947), radius = 2.0 },
  { position = vector3(214.3721, 6382.8716, 31.4356), radius = 2.0 },
  { position = vector3(-1102.3331, -2051.0176, 13.2915), radius = 2.0 },
  { position = vector3(-1081.8497, -2072.9160, 13.2915), radius = 2.0 },
  { position = vector3(-1047.8643, -2219.2854, 8.9818), radius = 2.0 },
  { position = vector3(-1030.2137, -2203.3064, 8.9809), radius = 2.0 },
  { position = vector3(-988.8453, -2233.3894, 9.0020), radius = 2.0 },
  { position = vector3(-977.0242, -2246.3398, 9.0020), radius = 2.0 },
  { position = vector3(-973.0513, -2250.3586, 9.0020), radius = 2.0 }
}