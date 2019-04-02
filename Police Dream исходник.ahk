#NoEnv
#SingleInstance force
#InstallKeybdHook
#MaxThreads, 20
#MaxThreadsPerHotkey, 255
SetBatchLines, -1
global ADDR_SET_POSITION                    := 0xB7CD98
global ADDR_SET_POSITION_OFFSET             := 0x14
global ADDR_SET_POSITION_X_OFFSET           := 0x30
global ADDR_SET_POSITION_Y_OFFSET           := 0x34
global ADDR_SET_POSITION_Z_OFFSET           := 0x38
global ADDR_SET_INTERIOR_OFFSET             := 0xB72914
global SAMP_SZIP_OFFSET                     := 0x20
global SAMP_INFO_SETTINGS_OFFSET            := 0x3C5
global SAMP_DIALOG_LINENUMBER_OFFSET        := 0x140
global ERROR_OK                             := 0
global ERROR_PROCESS_NOT_FOUND              := 1
global ERROR_OPEN_PROCESS                   := 2
global ERROR_INVALID_HANDLE                 := 3
global ERROR_MODULE_NOT_FOUND               := 4
global ERROR_ENUM_PROCESS_MODULES           := 5
global ERROR_ZONE_NOT_FOUND                 := 6
global ERROR_CITY_NOT_FOUND                 := 7
global ERROR_READ_MEMORY                    := 8
global ERROR_WRITE_MEMORY                   := 9
global ERROR_ALLOC_MEMORY                   := 10
global ERROR_FREE_MEMORY                    := 11
global ERROR_WAIT_FOR_OBJECT                := 12
global ERROR_CREATE_THREAD                  := 13
global ADDR_ZONECODE                        := 0xA49AD4
global ADDR_POSITION_X                      := 0xB6F2E4
global ADDR_POSITION_Y                      := 0xB6F2E8
global ADDR_POSITION_Z                      := 0xB6F2EC
global ADDR_CPED_PTR                        := 0xB6F5F0
global ADDR_CPED_HPOFF                      := 0x540
global ADDR_CPED_ARMOROFF                   := 0x548
global ADDR_CPED_MONEY                      := 0x0B7CE54
global ADDR_CPED_INTID                      := 0xA4ACE8
global ADDR_CPED_SKINIDOFF                  := 0x22
global ADDR_VEHICLE_PTR                     := 0xBA18FC
global ADDR_VEHICLE_HPOFF                   := 0x4C0
global ADDR_VEHICLE_DOORSTATE               := 0x4F8
global ADDR_VEHICLE_ENGINESTATE             := 0x428
global ADDR_VEHICLE_SIRENSTATE              := 0x1069
global ADDR_VEHICLE_SIRENSTATE2             := 0x1300
global ADDR_VEHICLE_LIGHTSTATE              := 0x584
global ADDR_VEHICLE_MODEL                   := 0x22
global ADDR_VEHICLE_TYPE                    := 0x590
global ADDR_VEHICLE_DRIVER                  := 0x460
global ADDR_VEHICLE_X                       := 0x44
global ADDR_VEHICLE_Y                       := 0x48
global ADDR_VEHICLE_Z                       := 0x4C
global oAirplaneModels := [417, 425, 447, 460, 469, 476, 487, 488, 497, 511, 512, 513, 519, 520, 548, 553, 563, 577, 592, 593]
global oBikeModels := [481,509,510]
global ovehicleNames := ["автомобиля Landstalker","автомобиля Bravura","автомобиля Buffalo","автомобиля Linerunner","автомобиля Perrenial","автомобиля Sentinel","автомобиля Dumper","автомобиля Firetruck","автомобиля Trashmaster","автомобиля Stretch","автомобиля Manana","автомобиля Infernus","автомобиля Voodoo","автомобиля Pony","автомобиля Mool","автомобиля Cheetah","скорой помощи","автомобиля Левиафан","автомобиля Moonbeam","автомобиля Esperanto","такси","автомобиля Washington","автомобиля Bobcat","автомобиля Хоуп","автомобиля BF Injection","автомобиля Охотника","автомобиля Premier","Enforcer","автомобиля Securicar","автомобиля Banshee","автомобиля Predator","автобуса","танка","грузовика","автомобиля Hotknife","Трэйлера","автомобиля Previon","автобуса","такси","автомобиля Stallion","автомобиля Rumpo","автомобиля RC Bandit","автомобиля Romero","Packer","монстра","автомобиля Admiral","автомобиля Squalo","автомобиля Seasparrow","автомобиля Pizzaboy","автомобиля Tram","Trailer","автомобиля Turismo","автомобиля Speeder","Reefer","автомобиля Tropic","автомобиля Flatbed","автомобиля Yankee","автомобиля Caddy","автомобиля Solair","автомобиля Berkley'sRCVan","автомобиля Skimmer","мотоцикла PCJ-600","мопеда","мотоцикла Freeway","автомобиля RCBaron","автомобиля RCRaider","автомобиля Glendale","автомобиля Oceanic","мотоцикла Sanchez","автомобиля Sparrow","хаммера","квадроцикла","автомобиля Coastguard","автомобиля Dinghy","автомобиля Hermes","автомобиля Sabre","автомобиля Rustler","автомобиля ZR-350","автомобиля Walton","автомобиля Regina","автомобиля Comet","велосипеда BMX","автомобиля Burrito","автомобиля Camper","автомобиля Marquis","автомобиля Baggage","автомобиля Dozer","вертолёта Maverick","вертолёта NewsChopper","автомобиля Rancher","PoliceCar","автомобиля Virgo","автомобиля Greenwood","автомобиля Jetmax","автомобиля Hotring","автомобиля Sandking","автомобиля Blista Compact","Police Maverick","автомобиля Boxvillde","автомобиля Benson","автомобиля Mesa","RCGoblin","автомобиля Hotring Racer A","автомобиля Hotring Racer B","автомобиля Bloodring Banger","автомобиля Rancher","автомобиля Super GT","автомобиля Elegant","автомобиля Journey","велосипеда Bike","велосипеда MountainBike","автомобиля Beagle","автомобиля Cropduster","автомобиля Stunt","грузовика","грузовика","автомобиля Nebula","автомобиля Majestic","автомобиля Buccaneer","самолёта Shamal","самолёта Hydra","мотоцикла FCR-900","мотоцикла NRG-500","HPV1000","автомобиля CementTruck","эвакуатора","автомобиля Fortuna","автомобиля Cadrona","FBITruck","автомобиля Willard","автомобиля Forklift","автомобиля Tractor","комбайна","автомобиля Feltzer","автомобиля Remington","автомобиля Slamvan","автомобиля Blade","автомобиля Freight","автомобиля Streak","автомобиля Vortex","автомобиля Vincent","автомобиля Bullet","автомобиля Clover","автомобиля Sadler","Firetruck","автомобиля Hustler","автомобиля Intruder","автомобиля Primo","автомобиля Cargobob","автомобиля Tampa","Sunrise","автомобиля Merit","автомобиля Utility","автомобиля Nevada","автомобиля Yosemite","автомобиля Windsor","Монстра","Монстра","автомобиля Uranus","автомобиля Jester","автомобиля Sultan","автомобиля Stratum","автомобиля Elegy","Raindance","автомобиля RCTiger","автомобиля Flash","автомобиля Tahoma","автомобиля Savanna","автомобиля Bandito","автомобиля FreightFlat","автомобиля StreakCarriage","автомобиля Kart","автомобиля Mower","автомобиля Dune","автомобиля Sweeper","автомобиля Broadway","Tornado","AT-400","DFT-30","автомобиля Huntley","автомобиля Stafford","мотоцикла BF-400","фургона","Tug","Trailer","автомобиля Emperor","мотоцикла Wayfarer","автомобиля Euros","автомобиля продавца хот-догов","автомобиля Club","автомобиля FreightBox","автомобиля Trailer","Andromada","Dodo","RCCam","автомобиля Launch","PoliceCar","PoliceCar","PoliceCar","PoliceRanger","автомобиля Picador","S.W.A.T","автомобиля Alpha","автомобиля Phoenix","автомобиля GlendaleShit","автомобиля SadlerShit","автомобиля Luggage","автомобиля Luggage","автомобиля Stairs","автомобиля Boxville","Tiller","UtilityTrailer"]
global ovehicleNamesImpad := ["Landstalker","Bravura","Buffalo","Linerunner","Perrenial","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana","Infernus","Voodoo","Pony","Mool","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat","Хоуп","BF Injection","Hunter","Premier","Enforcer","Securicar","Banshee","Predator","Bus","Rhino","Barracks","Hotknife","Trailer","Previon","Bus","Taxi","Stallion","Rumpo","RC Bandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo","Speeder","Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkley'sRCVan","Skimmer","PCJ-600","Faggio","Freeway","RCBaron","RCRaider","Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR-350","Walton","Regina","Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","NewsChopper","Rancher","PoliceCar","Virgo","Greenwood","Jetmax","Hotring","Sandking","Blista Compact","Police Maverick","Boxvillde","Benson","Mesa","RCGoblin","Hotring Racer A","Hotring Racer B","Bloodring Banger","Rancher","Super GT","Elegant","Journey","Bike","MountainBike","Beagle","Cropduster","Stunt","Tanker","Roadtrain","Nebula","Majestic","Buccaneer","Shamal","Hydra","FCR-900","NRG-500","HPV1000","CementTruck","Towtruck","Fortuna","Cadrona","FBITruck","Willard","Forklift","Tractor","Combine Harvester","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent","Bullet","Clover","Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster","Monster","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RCTiger","Flash","Tahoma","Savanna","Bandito","FreightFlat","StreakCarriage","Kart","Mower","Dune","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley","Stafford","BF-400","Newsvan","Tug","Trailer","Emperor","Wayfarer","Euros","Hotdog","Club","FreightBox","Trailer","Andromada","Dodo","RCCam","Launch","PoliceCar","PoliceCar","PoliceCar","PoliceRanger","Picador","S.W.A.T","Alpha","Phoenix","GlendaleShit","SadlerShit","Luggage","Luggage","Stairs","Boxville","Tiller","UtilityTrailer"]
global oradiostationNames := ["Playback FM", "K Rose", "K-DST", "Bounce FM", "SF-UR", "Radio Los Santos", "Radio X", "CSR 103.9", "K-JAH West", "Master Sounds 98.3", "WCTR Talk Radio", "User Track Player", "Radio Off"]
global oweatherNames := ["EXTRASUNNY_LA", "SUNNY_LA", "EXTRASUNNY_SMOG_LA", "SUNNY_SMOG_LA", "CLOUDY_LA", "SUNNY_SF", "EXTRASUNNY_SF", "CLOUDY_SF", "RAINY_SF", "FOGGY_SF", "SUNNY_VEGAS", "EXTRASUNNY_VEGAS", "CLOUDY_VEGAS", "EXTRASUNNY_COUNTRYSIDE", "SUNNY_COUNTRYSIDE", "CLOUDY_COUNTRYSIDE", "RAINY_COUNTRYSIDE", "EXTRASUNNY_DESERT", "SUNNY_DESERT", "SANDSTORM_DESERT", "UNDERWATER", "EXTRACOLOURS_1", "EXTRACOLOURS_2"]
global color11namecars :=["черно-", "бело-", "голубо-", "красно-", "серо-", "лилово-", "оранжево-", "голубо-", "серо-", "серо-", "сине-", "серо-", "голубо-", "серо-", "серо-", "серо-", "зелено-", "красно-", "красно-", "серо-", "сине-", "малиново-", "малиново-", "серо-", "серо-", "серо-", "серо-", "серо-", "сине-", "серо-", "коричнево-", "коричнево-", "голубо-", "серо-", "серо-", "серо-", "черно-", "черно-", "серо-", "голубо-", "коричнево-", "серо-", "красно-", "красно-", "зелено-", "красно-", "зелено-","серо-", "серо-", "серо-", "серо-", "зелено-", "серо-", "сине-", "сине-", "коричнево-", "серо-", "коричнево-", "красно-", "сине-", "серо-", "коричнево-", "красно-", "серо-", "серо-", "желто-", "коричнево-", "голубо-", "желто-", "розово-", "красно-", "голубо-", "серо-", "серо-", "коричнево-", "черно-", "серо-", "коричнево-", "красно-", "сине-", "красно-", "коричнево-", "красно-", "зелено-", "коричнево-", "красно-", "зелено-", "голубо-", "красно-", "серо-", "светло-серо-", "сине-", "серо-", "голубо-", "сине-", "сине-", "серо-", "серо-", "серо-", "коричнево-", "серо-", "сине-", "коричнево-", "сине-", "коричнево-", "серо-", "голубо-", "серо-", "голубо-", "серо-", "коричнево-", "серо-", "голубо-", "коричнево-", "зелено-", "малиново-", "сине-", "красно-", "серо-", "коричнево-", "коричнево-", "красно-", "серо-", "желто-", "малиново-", "сине-", "розово-"]
global color12namecars := ["салатовый", "шоколадный", "голубой", "горчичный", "кремово-розовый", "черный", "фиолетовый", "светло-голубой", "лиловый", "ярко-салатовый", "бежевый", "лилово-фиолетовый", "молочный", "кремовый", "желтый", "пудровый", "лилово-пудровый", "бледно-салатовый", "бледно-розовый", "розовый", "серый", "серо-коричневый", "серый", "серо-салатовый", "голубой", "хакки", "светло-салатовый", "серо-голубой", "песочный", "светло-серый", "кирпичный", "коричневый", "темно-зеленый", "персиково-розовый", "темно-голубой", "морская волна", "темно-серый", "серо-голубой", "бледно-голубой", "фиалковый", "светлый шоколад", "бледно-лиловый", "бледно-пурпурный", "пурпурный", "грязный зеленый", "светлый шоколад", "светло-коричневый", "яркий персиковый", "бледно-фиолетовый", "бледно-пудровый", "бледно-розовый", "ягодный", "светло-горчичный", "темный персиковый", "темный бежевый", "светло-кирпичный", "бледно-розовый", "светло-серый","темно-зеленый", "зеленый", "светло-зеленый", "серо-зеленый", "чайная роза", "бледно-салатовый", "молочный", "белый", "яркожелтый", "бледно-желтый", "белый", "яичный", "серо-голубой", "хакки", "кремовый", "серо-синий", "серо-зеленый", "темно-серый", "металлик", "черно-синий", "черно-серый", "серый", "сизый", "серо-голубой", "темный серо-голубой", "фиолетовый", "кирпичный", "молочный", "желто-зеленый", "темный зеленый", "бежевый", "светло-голубой", "персиковый", "светло-оранжевый", "истинный розовый", "светло-желтый", "персиково-оранжевый", "темно-синий", "светлый шоколад", "хакки", "салатовый", "темно-зеленый", "кремово-желтый", "зеленый", "сливовый", "грязно-желтый", "лилово-розовый", "светло-малиновый", "темно-зеленый", "серо-зеленый", "темно-серый", "пудровый", "песочный", "кирпичный", "голубой", "желто-салатовый", "темно-малиновый", "бледно-зеленый", "шоколадный", "темно-зеленый", "серо-голубой", "серый", "светлый шоколад", "вишневый", "молочный", "светло-серый", "серый", "слоновая кость", "кремово-серый", "серо-синий"]
global color21namecars :=["черный", "белый", "голубой", "красный", "темно-серый", "лиловый", "оранжевый", "серо-голубой", "светло-серый", "серый", "серо-синий", "серый", "серо-голубой", "серый", "светло-серый", "светло-серый", "зеленый", "вишневый", "темно-малиновый", "светло-серый", "серо-синий", "бледно малиновый", "темно-малиновый", "светло-серый", "серый", "темно-серый", "светло-серый", "серый", "серо-синий", "светло-серый", "темно-коричневый", "коричневый", "светло-голубой", "серый", "серый", "серый", "темно-серый", "серо-зеленый", "сизый", "серо-голубой", "темно-коричневый", "серый", "бледно вишневый", "вишневый", "темно-зеленый", "коричнево-вишневый", "светлый хаки","серый", "светло-серый", "светло-серый", "серый", "зелено-голубой", "серый", "синий", "бледносиний", "какао", "светло-серый", "светлый хаки", "темно-вишневый", "серо-голубой", "светло-серый", "темный песочный", "темно-малиновый", "серый", "серый", "бледно салатовый", "темно коричневый", "серо-голубой", "светлый хаки", "какао с молоком", "бледно вишневый", "голубой", "темно-серый", "светло-серый", "темно-коричневый", "темно-синий", "светло-серый", "светлый хакки", "бледный вишневый", "синий", "бледно-малиновый", "мокко", "темно-вишневый", "темно-зеленый", "молочный шоколад", "малиновый", "светло-зеленый", "голубой", "бледновишневый", "светлый хакки", "светло-серый", "серо-синий", "серый", "голубой", "светло-сииний", "синий", "светло-серый", "серый", "темно-серый", "светлый хакки", "голубой", "темно-синий", "светлый хакки", "синий", "мокко", "серый", "темно-голубой", "песочный", "голубой", "темно-серый", "какао", "светло-серый", "голубой", "шоколадный", "хакки", "малиновый", "синий", "вишневый", "светло-серый", "какао", "мокко", "темно-вишневый", "темно-серый", "горчичный", "темно-малиновый", "синий", "розовый"]
global color22namecars := ["салатовый", "шоколадный", "голубой", "горчичный", "кремово-розовый", "черный", "фиолетовый", "светло-голубой", "лиловый", "ярко-салатовый", "бежевый", "лилово-фиолетовый", "молочный", "кремовый", "желтый", "пудровый", "лилово-пудровый", "бледно-салатовый", "бледно-розовый", "розовый", "серый", "серо-коричневый", "серый", "серо-салатовый", "голубой", "хакки", "светло-салатовый", "серо-голубой", "песочный", "светло-серый", "кирпичный", "коричневый", "темно-зеленый", "персиково-розовый", "темно-голубой", "морская волна", "темно-серый", "серо-голубой", "бледно-голубой", "фиалковый", "светлый шоколад", "бледно-лиловый", "бледно-пурпурный", "пурпурный", "грязный зеленый", "светлый шоколад", "светло-коричневый", "яркий персиковый", "бледно-фиолетовый", "бледно-пудровый", "бледно-розовый", "ягодный", "светло-горчичный", "темный персиковый", "темный бежевый", "светло-кирпичный", "бледно-розовый", "светло-серый","темно-зеленый", "зеленый", "светло-зеленый", "серо-зеленый", "чайная роза", "бледно-салатовый", "молочный", "белый", "яркожелтый", "бледно-желтый", "белый", "яичный", "серо-голубой", "хакки", "кремовый", "серо-синий", "серо-зеленый", "темно-серый", "металлик", "черно-синий", "черно-серый", "серый", "сизый", "серо-голубой", "темный серо-голубой", "фиолетовый", "кирпичный", "молочный", "желто-зеленый", "темный зеленый", "бежевый", "светло-голубой", "персиковый", "светло-оранжевый", "истинный розовый", "светло-желтый", "персиково-оранжевый", "темно-синий", "светлый шоколад", "хакки", "салатовый", "темно-зеленый", "кремово-желтый", "зеленый", "сливовый", "грязно-желтый", "лилово-розовый", "светло-малиновый", "темно-зеленый", "серо-зеленый", "темно-серый", "пудровый", "песочный", "кирпичный", "голубой", "желто-салатовый", "темно-малиновый", "бледно-зеленый", "шоколадный", "темно-зеленый", "серо-голубой", "серый", "светлый шоколад", "вишневый", "молочный", "светло-серый", "серый", "слоновая кость", "кремово-серый", "серо-синий"]
global ADDR_SAMP_INCHAT_PTR                 := 0x21a10c
global ADDR_SAMP_INCHAT_PTR_OFF             := 0x55
global ADDR_SAMP_USERNAME                   := 0x219A6F
global FUNC_SAMP_SENDCMD                    := 0x65c60
global FUNC_SAMP_SENDSAY                    := 0x57f0
global FUNC_SAMP_ADDTOCHATWND               := 0x64520
global ADDR_SAMP_CHATMSG_PTR                := 0x21a0e4
global FUNC_SAMP_SHOWGAMETEXT               := 0x9c2c0
global FUNC_SAMP_PLAYAUDIOSTR               := 0x62da0
global FUNC_SAMP_STOPAUDIOSTR               := 0x629a0
global DIALOG_STYLE_MSGBOX			        := 0
global DIALOG_STYLE_INPUT 			        := 1
global DIALOG_STYLE_LIST			        := 2
global DIALOG_STYLE_PASSWORD		        := 3
global DIALOG_STYLE_TABLIST			        := 4
global DIALOG_STYLE_TABLIST_HEADERS	        := 5
global SAMP_DIALOG_STRUCT_PTR				:= 0x21A0B8
global SAMP_DIALOG_PTR1_OFFSET				:= 0x1C
global SAMP_DIALOG_LINES_OFFSET 			:= 0x44C
global SAMP_DIALOG_INDEX_OFFSET				:= 0x443
global SAMP_DIALOG_BUTTON_HOVERING_OFFSET	:= 0x465
global SAMP_DIALOG_BUTTON_CLICKED_OFFSET	:= 0x466
global SAMP_DIALOG_PTR2_OFFSET 				:= 0x20
global SAMP_DIALOG_LINECOUNT_OFFSET			:= 0x150
global SAMP_DIALOG_OPEN_OFFSET				:= 0x28
global SAMP_DIALOG_STYLE_OFFSET				:= 0x2C
global SAMP_DIALOG_ID_OFFSET				:= 0x30
global SAMP_DIALOG_TEXT_PTR_OFFSET			:= 0x34
global SAMP_DIALOG_CAPTION_OFFSET			:= 0x40
global FUNC_SAMP_SHOWDIALOG				 	:= 0x6B9C0
global FUNC_SAMP_CLOSEDIALOG				:= 0x6C040
global FUNC_UPDATESCOREBOARD                := 0x8A10
global SAMP_INFO_OFFSET                     := 0x21A0F8
global ADDR_SAMP_CRASHREPORT 				:= 0x5CF2C
global SAMP_PPOOLS_OFFSET                   := 0x3CD
global SAMP_PPOOL_PLAYER_OFFSET             := 0x18
global SAMP_SLOCALPLAYERID_OFFSET           := 0x4
global SAMP_ISTRLEN_LOCALPLAYERNAME_OFFSET  := 0x1A
global SAMP_SZLOCALPLAYERNAME_OFFSET        := 0xA
global SAMP_PSZLOCALPLAYERNAME_OFFSET       := 0xA
global SAMP_PREMOTEPLAYER_OFFSET            := 0x2E
global SAMP_ISTRLENNAME___OFFSET            := 0x1C
global SAMP_SZPLAYERNAME_OFFSET             := 0xC
global SAMP_PSZPLAYERNAME_OFFSET            := 0xC
global SAMP_ILOCALPLAYERPING_OFFSET         := 0x26
global SAMP_ILOCALPLAYERSCORE_OFFSET        := 0x2A
global SAMP_IPING_OFFSET                    := 0x28
global SAMP_ISCORE_OFFSET                   := 0x24
global SAMP_ISNPC_OFFSET                    := 0x4
global SAMP_PLAYER_MAX                      := 1004
global SAMP_KILLSTAT_OFFSET                 := 0x21A0EC
global multVehicleSpeed_tick                := 0
global CheckpointCheck 						:= 0xC7DEEA
global rmaddrs 								:= [0xC7DEC8, 0xC7DECC, 0xC7DED0]
global SIZE_SAMP_CHATMSG                    := 0xFC
global hGTA                                 := 0x0
global dwGTAPID                             := 0x0
global dwSAMP                               := 0x0
global pMemory                              := 0x0
global pParam1                              := 0x0
global pParam2                              := 0x0
global pParam3                              := 0x0
global pParam4                              := 0x0
global pParam5                              := 0x0
global pInjectFunc                          := 0x0
global nZone                                := 1
global nCity                                := 1
global bInitZaC                             := 0
global iRefreshScoreboard                   := 0
global oScoreboardData                      := ""
global iRefreshHandles                      := 0
global iUpdateTick                          := 2500
WM_VSCROLL(wParam, lParam, msg, hwnd)
{
	static SIF_ALL:=0x17, SCROLL_STEP:=10
	bar := msg=0x115
	VarSetCapacity(si, 28, 0)
	NumPut(28, si, "UInt")
	NumPut(SIF_ALL, si, 4, "UInt")
	if !DllCall("GetScrollInfo", Ptr, hwnd, Int, bar, Ptr, &si)
		return
	VarSetCapacity(rect, 16)
	DllCall("GetClientRect", Ptr, hwnd, Ptr, &rect)
	new_pos := NumGet(si, 20, "UInt")
	action := wParam & 0xFFFF
	if action = 0
		new_pos -= SCROLL_STEP
	else if action = 1
		new_pos += SCROLL_STEP
	else if action = 2
		new_pos -= NumGet(rect, 12, "Int") - SCROLL_STEP
	else if action = 3
		new_pos += NumGet(rect, 12, "Int") - SCROLL_STEP
	else if (action = 5 || action = 4)
		new_pos := wParam>>16
	else if action = 6
		new_pos := NumGet(si, 8, "Int")
	else if action = 7
		new_pos := NumGet(si, 12, "Int")
	else
		return
	min := NumGet(si, 8, "Int")
	max := NumGet(si, 12, "Int") - NumGet(si, 16, "UInt")
	new_pos := new_pos > max ? max : new_pos
	new_pos := new_pos < min ? min : new_pos
	old_pos := NumGet(si, 20, "Int")
	y := old_pos-new_pos
	DllCall("ScrollWindow", Ptr, hwnd, Int, 0, Int, y, UInt, 0, UInt, 0)
	NumPut(new_pos, si, 20, "Int")
	DllCall("SetScrollInfo", Ptr, hwnd, Int, bar, Ptr, &si, Int, 1)
}
VSCROLL_To(hwnd, msg){
	WM_VSCROLL(msg, 0, WM_VSCROLL, hWnd)
}
WM_MOUSEWHEEL(hWnd, wp)
{
	global tabId
	if(tabId != 5)
		return
	WM_VSCROLL(wp>>16 & 0xFFFF < 0x7FFF ? SB_LINEUP : SB_LINEDOWN, 0, WM_VSCROLL, hWnd)
}
UpdateScrollBar(hGui, ScrollHeight)
{
	static SIF_RANGE := 0x1, SIF_PAGE := 0x2, SB_VERT := 1
	VarSetCapacity(si, 28, 0)
	NumPut(28, si)
	NumPut(SIF_RANGE | SIF_PAGE, si, 4)
	NumPut(ScrollHeight, si, 12)
	NumPut(GuiHeight, si, 16)
	DllCall("SetScrollInfo", Ptr, hGui, UInt, SB_VERT, Ptr, &si, Int, 1)
	ControlGetPos,, Top,,,, % "ahk_id " hGBs[1]
	if (Top = 114)
		return
	Top -= 114
	ControlGetPos,, y,, h,, % "ahk_id " hGBs[Blocks]
	bottom := y + h - 74
	if (top < 0 && bottom < GuiHeight)
	{
		y := (a := Abs(top)) > (b := GuiHeight-bottom) ? b : a
		DllCall("ScrollWindow", Ptr, hGui, Int, 0, Int, y, Ptr, 0, Ptr, 0)
	}
}
ReadIni(param1, param2)
{
	iniRead, Res, %iniFile%, %param1%, %param2%
	if(Res = "ERROR" || Res = "^" || Res = "!" || Res = "+" || Res = "#")
	{
		if(param1 = "settings")
			return 0
		else
			return
	}
	return Res
}
WriteIni(val, param1, param2)
{
	global
	iniWrite, %val%, %iniFile%, %param1%, %param2%
	return
}
addHotKey(varKey, Lab)
{
	global
	if(strlen(varKey) = 0 || RegExMatch(varKey,"^(\!|\#|\^|\+|ERROR)$"))
		return
	if(WarnKey(varKey))
	{
		HotKey, ~%varKey%, %Lab%
		HotKey, ~%varKey%, On
	}
	else
	{
		HotKey, $%varKey%, %Lab%
		HotKey, $%varKey%, On
	}
	return
}
delHotKey(vardKey)
{
	global
	if(strlen(vardKey) = 0 || RegExMatch(vardKey,"^(\!|\#|\^|\+|ERROR)$"))
		return
	if(WarnKey(vardKey))
		HotKey, ~%vardKey%, off
	else
		HotKey, $%vardKey%, off
	return
}
WarnKey(Key)
{
	if(RegExMatch(Key, "^(\+(vk|[0-9])|vk|[0-9])"))
		return 1
	else
		return 0
}
colorToStr(color)
{
	color += 0
	color >>= 8
	color &= 0xffffff
	SetFormat, IntegerFast, hex
	color += 0
	color .= ""
	StringTrimLeft, color, color, 2
	SetFormat, IntegerFast, d
	if(strlen(color) < 6)
	{
		count := 6-strlen(color)
		loop %count%
			color := "0" color
	}
	color :=  "{" color "}"
	return color
}
getPlayerColor(id)
{
	id += 0
	if(!checkHandles())
		return -1
	color := readDWORD(hGTA, dwSAMP + 0x216378 + 4*id)
	if(ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
		return -1
	}
	return color
}
GetKeysVK(Hotkey) {
	RegExMatch(Hotkey, "S)^([\^\+!]*)(.*?)$", K)
	if (StrLen(K2) = 1 && !Instr("1234567890-=", K2))
		return K1 . Format("vk{:X}", GetKeyVK(K2))
	return Hotkey
}
isRu()
{
	if(DllCall("GetKeyboardLayout", "Int", DllCall("GetWindowThreadProcessId", "Int", WinExist("A"), "Int", "0")) == 0x4190419)
		return 1
	else
		return 0
}
getChatLineEx(line) {
	if(!checkHandles())
		return -1
	dwPtr := dwSAMP + ADDR_SAMP_CHATMSG_PTR
	dwAddress := readDWORD(hGTA,dwPtr)
	if(ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
		return -1
	}
	chatLine := readString(hGTA, dwAddress + 0x152 + ( (99-line) * 0xFC), 252)
	if(ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
		return -1
	}
	ErrorLevel := ERROR_OK
	return chatLine
}
ClipPutText(Text, LocaleID=0x419)
{
	CF_TEXT:=1, CF_LOCALE:=16, GMEM_MOVEABLE:=2
	TextLen   :=StrLen(Text)
	HmemText  :=DllCall("GlobalAlloc", "UInt", GMEM_MOVEABLE, "UInt", TextLen+1)
	HmemLocale:=DllCall("GlobalAlloc", "UInt", GMEM_MOVEABLE, "UInt", 4)
	If(!HmemText || !HmemLocale)
	return
	PtrText   :=DllCall("GlobalLock",  "UInt", HmemText)
	PtrLocale :=DllCall("GlobalLock",  "UInt", HmemLocale)
	DllCall("msvcrt\memcpy", "UInt", PtrText, "Str", Text, "UInt", TextLen+1, "Cdecl")
	NumPut(LocaleID, PtrLocale+0)
	DllCall("GlobalUnlock",     "UInt", HmemText)
	DllCall("GlobalUnlock",     "UInt", HmemLocale)
	if not DllCall("OpenClipboard", "UInt", 0)
	{
		DllCall("GlobalFree", "UInt", HmemText)
		DllCall("GlobalFree", "UInt", HmemLocale)
		return
	}
	DllCall("EmptyClipboard")
	DllCall("SetClipboardData", "UInt", CF_TEXT,   "UInt", HmemText)
	DllCall("SetClipboardData", "UInt", CF_LOCALE, "UInt", HmemLocale)
	DllCall("CloseClipboard")
}
ClipGetText(CodePage=1251)
{
	CF_TEXT:=1, CF_UNICODETEXT:=13, Format:=0
	if not DllCall("OpenClipboard", "UInt", 0)
		return
	Loop
	{
		Format:=DllCall("EnumClipboardFormats", "UInt", Format)
		If(Format=0 || Format=CF_TEXT || Format=CF_UNICODETEXT)
		Break
	}
	If(Format=0) {
		DllCall("CloseClipboard")
		return
	}
	If(Format=CF_TEXT)
	{
		HmemText:=DllCall("GetClipboardData", "UInt", CF_TEXT)
		PtrText :=DllCall("GlobalLock",       "UInt", HmemText)
		TextLen :=DllCall("msvcrt\strlen",    "UInt", PtrText, "Cdecl")
		VarSetCapacity(Text, TextLen+1)
		DllCall("msvcrt\memcpy", "Str", Text, "UInt", PtrText, "UInt", TextLen+1, "Cdecl")
		DllCall("GlobalUnlock", "UInt", HmemText)
	}
	else If(Format=CF_UNICODETEXT)
	{
		HmemTextW:=DllCall("GetClipboardData", "UInt", CF_UNICODETEXT)
		PtrTextW :=DllCall("GlobalLock",       "UInt", HmemTextW)
		TextLen  :=DllCall("msvcrt\wcslen",    "UInt", PtrTextW, "Cdecl")
		VarSetCapacity(Text, TextLen+1)
		DllCall("WideCharToMultiByte", "UInt", CodePage, "UInt", 0, "UInt", PtrTextW
		, "Int", TextLen+1, "Str", Text, "Int", TextLen+1
		, "UInt", 0, "Int", 0)
		DllCall("GlobalUnlock", "UInt", HmemTextW)
	}
	DllCall("CloseClipboard")
	return Text
}
HexToDec(str)
{
	local newStr := ""
	static comp := {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, "a":10, "b":11, "c":12, "d":13, "e":14, "f":15}
	StringLower, str, str
	str := RegExReplace(str, "^0x|[^a-f0-9]+", "")
	Loop, % StrLen(str)
	newStr .= SubStr(str, (StrLen(str)-A_Index)+1, 1)
	newStr := StrSplit(newStr, "")
	local ret := 0
	for i,char in newStr
		ret += comp[char]*(16**(i-1))
	return ret
}
addChatMessageEx(Color, wText) {
	wText := "" wText
	if(!checkHandles())
		return false
	VarSetCapacity(data2, 4, 0)
	NumPut(HexToDec(Color),data2,0,"Int")
	Addrr := readDWORD(hGTA, dwSAMP+ADDR_SAMP_CHATMSG_PTR)
	VarSetCapacity(data1, 4, 0)
	NumPut(readDWORD(hGTA, Addrr + 0x12A), data1,0,"Int")
	WriteRaw(hGTA, Addrr + 0x12A, &data2, 4)
	dwFunc := dwSAMP + FUNC_SAMP_ADDTOCHATWND
	dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
	if(ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
		return false
	}
	callWithParams(hGTA, dwFunc, [["p", dwChatInfo], ["s", wText]], true)
	WriteRaw(hGTA, Addrr + 0x12A, &data1, 4)
	ErrorLevel := ERROR_OK
	return true
}
deg2rad(deg)
{
	rad := deg * .01745329252
	return rad
}
distance(lat1, lng1, lat2, lng2)
{
	lat1 := deg2rad(lat1)
	lng1 := deg2rad(lng1)
	lat2 := deg2rad(lat2)
	lng2 := deg2rad(lng2)
	delta_lat := (lat2 - lat1)
	delta_lng := (lng2 - lng1)
	return Round(6378137 * ACOS(COS(lat1) * COS(lat2) * COS(lng1 - lng2) + SIN(lat1) * SIN(lat2)))
}
GetReadLine(i)
{
	dwAddrr1 := readDWORD(hGTA, dwSAMP + SAMP_CHAT_INFO_OFFSET)
	ReadLine := dwAddrr1 + 0x1E2 + ( (99-i) * 0xFC)
	read := readString(hGTA, ReadLine, 144)
	return read
}
WaitChat(text, callFuncChatWait, timeout = 0)
{
	global
	if(!IsObject(ChatLine))
		ChatLine := Object()
	if(!IsObject(isWait))
		isWait := Object()
	if(!IsObject(stTime))
		stTime := Object()
	if(isWait[txt])
		return
	isWait[text] := true
	if(timeout > 0)
	{
		stTime[text]  := A_TickCount
	}
	dwAddrr1 := readDWORD(hGTA, dwSAMP +ADDR_SAMP_CHATMSG_PTR)
	Loop
	{
		if(!isWait[text])
			return
		if(A_TickCount - stTime[text] >= timeout  && timeout > 0)
		{
			ErrorLevel := 1
			isWait[text] := false
			%callFuncChatWait%(text, text, 1)
			return
		}
		i := 0
		loop 99
		{
			RLine := 0x132 + ((99 - i) * 0xFC) + 125
			Reading := readMem(hGTA, dwAddrr1 + RLine)
			if(ChatLine[text] = Reading)
				i := 0
			if(RegExMatch(GetChatLineEx(i), text, result))
			{
				ErrorLevel := 0
				VarSetCapacity(TimeTime, 4, 0)
				NumPut(A_Hour A_Min A_Sec,TimeTime,0,"Int")
				WriteRaw(hGTA, dwAddrr1 + RLine, &TimeTime, 4)
				ChatLine[text] := readMem(hGTA, dwAddrr1 + RLine)
				isWait[text] := false
				%callFuncChatWait%(result, text, 0)
				return
			}
			i++
		}
	}
	return
}
LoadIni()
{
	global
	DefHide := ReadIni("settings", "hide")
	OpenChatInT := ReadIni("settings", "ChatInT")
	KeyClist := ReadIni("keys", "KeyClist")
	KeyHelp := ReadIni("keys", "KeyHelp")
	KeyCuff := ReadIni("keys", "KeyCuff")
	KeyR := ReadIni("keys", "KeyR")
	KeySMS := ReadIni("keys", "KeySMS")
	KeySbros := ReadIni("keys", "KeySbros")
	KeyLec := ReadIni("keys", "KeyLec")
	KeyTazer := ReadIni("keys", "KeyTazer")
	KeyCput := ReadIni("keys", "KeyCput")
	KeyCeject := ReadIni("keys", "KeyCeject")
	KeyDeject := ReadIni("keys", "KeyDeject")
	KeyFollow := ReadIni("keys", "KeyFollow")
	KeyFrisk := ReadIni("keys", "KeyFrisk")
	KeyDoklad := ReadIni("keys", "KeyDoklad")
	KeyMegaphone := ReadIni("keys", "KeyMegaphone")
	STime := ReadIni("keys", "KeySTime")
	Arrest := ReadIni("keys", "KeyArrest")
	KeyNoga := ReadIni("keys", "KeyNoga")
	Keys := Object()
	Keys[KeyClist] := "gKeyClist"
	Keys[KeyHelp] := "gKeyHelp"
	Keys[KeyCuff] := "gKeyCuff"
	Keys[KeyR] := "gKeyR"
	Keys[KeyTazer] := "gKeyTazer"
	Keys[KeyCput] := "gKeyCput"
	Keys[KeyCeject] := "gKeyCeject"
	Keys[KeyDeject] := "gKeyDeject"
	Keys[KeyFollow] := "gKeyFollow"
	Keys[KeyFrisk] := "gKeyFrisk"
	Keys[KeyDoklad] := "gKeyDoklad"
	Keys[KeyMegaphone] := "gKeyMegaphone"
	Keys[KeySTime] := "gKeySTime"
	Keys[KeyArrest] := "gKeyArrest"
	Keys[KeyNoga] := "gKeyNoga"
	Keys[KeySMS] := "gKeySMS"
	return
}
LoadKeys()
{
	global
	LoadIni()
	for var, varr in Keys
	{
		addHotKey(var, varr)
	}
	return
}
unLoadKeys()
{
	global
	for var, varr in Keys
	{
		delHotKey(var)
	}
	return
}
HKToStr(HK) {
	Static LRPrefix := [["<^","LCtrl"],[">^","RCtrl"],["<!","LAlt"],[">!","RAlt"]
	,["<+","LShift"],[">+","RShift"],["<#","LWin"],[">#","RWin"]]
	, Prefix := [["^","Ctrl"],["!","Alt"],["+","Shift"],["#","Win"]]
	, EngSym := {"vkBB":"=","vkBC":",","vkBD":"-","vkBE":".","vkBF":"/","vkC0":"``","vkBA":"`;"
	,"vkDB":"[","vkDC":"\","vkDD":"]","vkDE":"'","vk41":"A","vk42":"B","vk43":"C"
	,"vk44":"D","vk45":"E","vk46":"F","vk47":"G","vk48":"H","vk49":"I","vk4A":"J"
	,"vk4B":"K","vk4C":"L","vk4D":"M","vk4E":"N","vk4F":"O","vk50":"P","vk51":"Q"
	,"vk52":"R","vk53":"S","vk54":"T","vk55":"U","vk56":"V","vk57":"W","vk58":"X"
,"vk59":"Y","vk5A":"Z"}
Local K, K1, K2, I, V, M, R
RegExMatch(HK, "S)^\s*([~\*\$\^\+!#<>]*)\{?(.*?)}?\s*$", K)
if (K2 = "")
	return ""
if InStr("|" K2, "|vk")
	K2 := K2 = "vkBF" ? "/" : (EngSym.HasKey(K2) ? EngSym[K2] : GetKeyName(K2))
if (K1 != "")
	For I, V in K1 ~= "[<>]" ? LRPrefix : Prefix
K1 := StrReplace(K1, V[1], "", R), R && (M .= V[2] "+")
return M . (StrLen(K2) = 1 ? Format("{:U}", K2) : K2)
}
getWeaponAmmo(ByRef Ammo := "", ByRef Clip := "", slot := -1)
{
if(!checkHandles())
	return -1
if(!CPed := readDWORD(hGTA, ADDR_CPED_PTR))
	return -1
if slot not between 0 and 12
{
	VarSetCapacity(slot, 1)
	DllCall("ReadProcessMemory", "UInt", hGTA, "UInt", CPed + 0x718, "Str", slot, "UInt", 1, "UInt*", 0)
	slot := NumGet(slot, 0, "short")
	if slot >= 12544
		slot -= 12544
}
struct := CPed + 0x5AC
VarSetCapacity(Ammo, 4)
VarSetCapacity(Clip, 4)
DllCall("ReadProcessMemory", "UInt", hGTA, "UInt", struct + (0x1C * slot), "Str", Ammo, "UInt", 4, "UInt*", 0)
DllCall("ReadProcessMemory", "UInt", hGTA, "UInt", struct + (0x1C * slot) - 0x4, "Str", Clip, "UInt", 4, "UInt*", 0)
Ammo := NumGet(Ammo, 0, "int")
Clip := NumGet(Clip, 0, "int")
return Ammo
}
GetCameraRotation() {
If(!checkHandles())
return -1
return readFloat(hGTA, 0xB6F178)
}
NightVision(value) {
If(!checkHandles())
return false
If(value)
writeMemory(hGTA, 0xC402B8, 0x1)
else writeMemory(hGTA, 0xC402B8, 0x0)
	}
setCarNitro() {
If(!checkHandles())
return -1
return writeMemory(hGTA, 0x969165, 0x1)
}
ThermalVision(value) {
If(!checkHandles())
return false
If(value)
writeMemory(hGTA, 0xC402B9, 0x1)
else writeMemory(hGTA, 0xC402B9, 0x0)
	}
UnderWaterDrive(value) {
If(!checkHandles())
return false
If(value)
writeMemory(hGTA, 0x6C2759, 0x1)
else writeMemory(hGTA, 0x6C2759, 0x0)
	}
WaterDrive(value) {
If(!checkHandles())
return false
If(value) {
	writeMemory(hGTA, 0x969152, 0x1)
	} else {
	writeMemory(hGTA, 0x969152, 0x0)
}
}
GetGravity() {
If(!checkHandles())
return -1
return readFloat(hGTA, 0x863984)
}
SetGravity(value) {
If(!checkHandles())
return -1
writeMemory(hGTA, 0x863984, value, 4, "float")
}
UnlockFps(status) {
if(!checkHandles())
	return false
if (status = 1) {
		dwSAMP := getModuleBaseAddress("samp.dll", hGTA)
	writeMemory(hGTA, dwSAMP + 0x9D9D0, 1347550997, 4, "UInt")
}
if (status = 0) {
		dwSAMP := getModuleBaseAddress("samp.dll", hGTA)
	writeMemory(hGTA, dwSAMP + 0x9D9D0, 4294417384, 4, "UInt")
}
return
}
AntiPause() {
if(!checkHandles())
	return false
writeBytes(hGTA, 0x747FB6, "01")
writeBytes(hGTA, 0x74805A, "01")
writeBytes(hGTA, 0x74542B, "90909090909090")
writeBytes(hGTA, 0x74542C, "90909090909090")
writeBytes(hGTA, 0x74542D, "909090909090")
return
}
WallHack(tog := -1)
{
if(!checkHandles())
	return -1
byte := readMem(hGTA, dwSAMP + 0x70F1A, 1, "byte")
if((tog == -1 && byte == 232) || tog == true || tog == 1) {
		writeBytes(hGTA, dwSAMP + 0x70F1A, "9090909090")
	writeBytes(hGTA, dwSAMP + 0x6FE0A, "9090909090")
	writeBytes(hGTA, dwSAMP + 0x70E24, "909090909090")
	writeBytes(hGTA, dwSAMP + 0x6FD14, "909090909090")
	return true
	} else if((tog == -1 && byte == 144) || !tog) {
	writeBytes(hGTA, dwSAMP + 0x70F1A, "E8B1AD0300")
	writeBytes(hGTA, dwSAMP + 0x6FE0A, "E8C1BE0300")
	writeBytes(hGTA, dwSAMP + 0x70E24, "0F8A71010000")
	writeBytes(hGTA, dwSAMP + 0x6FD14, "0F8A50010000")
	return false
}
return -1
}
getGameScreenWidthHeight() {
if(!checkHandles())
	return false
Width := readDword(hGTA, 0xC9C040)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return ""
}
Height := readDword(hGTA, 0xC9C044)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return ""
}
ErrorLevel := ERROR_OK
return [Width, Height]
}
GetWeaponIDforModel(model)
{
for iID, iModelId in oWeaponIdForModel
	if (iModelId == model)
	return iID
return 0
}
setDialogIndex(index)
{
dwPointer := getDialogStructPtr()
if (ErrorLevel || !dwPointer)
	return false
dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR2_OFFSET)
if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return false
}
return writeMemory(hGTA, dwPointer + 0x143, index - 1, 1, "Byte")
}
IsLineOfSightClear(startX,startY,startZ,endX,endY,endZ,bCheckBuildings, bCheckVehicles, bCheckPeds, bCheckObjects, bCheckDummies, bSeeThroughStuff, bIgnoreSomeObjectsForCamera) {
if(!checkHandles())
	return 0
dwFunc := 0x56A490
dwLen := 59
VarSetCapacity(injectData, dwLen, 0)
VarSetCapacity(vectors, 24, 0)
NumPut(startX, vectors, 0, "Float")
NumPut(startY, vectors, 4, "Float")
NumPut(startZ, vectors, 8, "Float")
NumPut(endX, vectors, 12, "Float")
NumPut(endY, vectors, 16, "Float")
NumPut(endZ, vectors, 20, "Float")
writeRaw(hGTA, pParam1, &vectors, 24)
NumPut(0x68, injectData, 0, "UChar")
NumPut(bIgnoreSomeObjectsForCamera, injectData, 1, "UInt")
NumPut(0x68, injectData, 5, "UChar")
NumPut(bSeeThroughStuff, injectData, 6, "UInt")
NumPut(0x68, injectData, 10, "UChar")
NumPut(bCheckDummies, injectData, 11, "UInt")
NumPut(0x68, injectData, 15, "UChar")
NumPut(bCheckObjects, injectData, 16, "UInt")
NumPut(0x68, injectData, 20, "UChar")
NumPut(bCheckPeds, injectData, 21, "UInt")
NumPut(0x68, injectData, 25, "UChar")
NumPut(bCheckVehicles, injectData, 26, "UInt")
NumPut(0x68, injectData, 30, "UChar")
NumPut(bCheckBuildings, injectData, 31, "UInt")
NumPut(0x68, injectData, 35, "UChar")
NumPut(pParam1+12, injectData, 36, "UInt")
NumPut(0x68, injectData, 40, "UChar")
NumPut(pParam1, injectData, 41, "UInt")
NumPut(0xE8, injectData, 45, "UChar")
offset := dwFunc - (pInjectFunc + 50)
NumPut(offset, injectData, 46, "UInt")
NumPut(0xA2, injectData, 50, "UChar")
NumPut(pParam2, injectData, 51, "UInt")
NumPut(0xC483, injectData, 55, "UShort")
NumPut(0x24, injectData, 57, "UChar")
NumPut(0xC3, injectData, 58, "UChar")
writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
if(ErrorLevel)
	return 0
hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
if(ErrorLevel)
	return 0
waitForSingleObject(hThread, 0xFFFFFFFF)
closeProcess(hThread)
return (readDWORD(hGTA, pParam2) ? 1 : 0)
}
IsPlayerVisible(ped)
{
If(!checkHandles())
return false
dwFunc := 0x536BC0
dwLen := 16
VarSetCapacity(injectData, dwLen, 0)
NumPut(0xB9, injectData, 0, "UChar")
NumPut(ped, injectData, 1, "UInt")
NumPut(0xE8, injectData, 5, "UChar")
offset := dwFunc - (pInjectFunc + 10)
NumPut(offset, injectData, 6, "Int")
NumPut(0xA2, injectData, 10, "UChar")
NumPut(pParam1, injectData, 11, "Int")
NumPut(0xC3, injectData, 15, "UChar")
writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
waitForSingleObject(hThread, 0xFFFFFFFF)
closeProcess(hThread)
return readMem(hGTA, pParam1, 1, "UChar")
}
getTargetPlayerHealth(player)
{
if(!checkHandles())
	return 0
if (player is integer) and (player >= 0) and (player <= 999)
	player := getPedById(player)
if(!player)
	return 0
return readMem(hGTA, player + 0x540, 2, "byte")
}
getTargetPlayerArmour(player)
{
if(!checkHandles())
	return 0
if (player is integer) and (player >= 0) and (player <= 999)
	player := getPedById(player)
if(!player)
	return 0
return readMem(hGTA, player + 0x548, 2, "byte")
}
getTargetPlayerWeaponModel(player)
{
if(!checkHandles())
	return 0
if (player is integer) and (player >= 0) and (player <= 999)
	player := getPedById(player)
if(!player)
	return 0
model := readMem(hGTA, player + 0x740, 2, "byte")
if(model == 65535)
	return 0
return model
}
CJ()
{
if(!checkHandles())
	return false
SIZE := 5
dwFunc := dwSAMP + 0x15860
offset := dwFunc - (pInjectFunc + SIZE)
VarSetCapacity(inject, SIZE + 1, 0)
NumPut(0xE8, inject, 0, "UChar")
NumPut(offset, inject, 1, "Int")
NumPut(0xC3, inject, 5, "UChar")
writeRaw(hGTA, pInjectFunc, &inject, SIZE + 1)
hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
waitForSingleObject(hThread, 0xFFFFFFFF)
closeProcess(hThread)
return true
}
getChatLineColor(line := 0, isHex := true) {
if(!checkHandles())
	return -1
dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
if ErrorLevel
	return -1
clAddress := dwAddress + 0x152 + ((99-line) * 0xFC) + 0xD4
if ErrorLevel
	return -1
color := readMem(hGTA, clAddress, 3, "byte")
if ErrorLevel
	return -1
if isHex
	return inttohex(color)
return color
}
setChatLineColor(color, line := 0) {
if(!checkHandles())
	return false
if color is not integer
{
	while(substr(color, 1, 1) == "0")
		color := substr(color, 2)
	color := "0x" color
	if strlen(color) != 8
		return false
} else if(color > 16777215)
return false
dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
if ErrorLevel
	return false
clAddress := dwAddress + 0x152 + ((99-line) * 0xFC) + 0xD4
if ErrorLevel
	return false
writeMemory(hGTA, clAddress, color, 3, "byte")
if ErrorLevel
	return false
sendinput {f7 3}
return true
}
getChatLineTimestamp(line := 0, unixtime := true) {
if(!checkHandles())
	return -1
dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
if ErrorLevel
	return -1
tsAddress := dwAddress + 0x152 + ((99-line) * 0xFC) - 0x20
if ErrorLevel
	return -1
timestamp := readMem(hGTA, tsAddress, 4, "int")
if ErrorLevel
	return -1
if unixtime
	return timestamp
s = 1970
s += timestamp,s
return [ substr(s, 9, 2) , substr(s, 11, 2) , substr(s, 13, 2) , substr(s, 7, 2) , substr(s, 5, 2) , substr(s, 1, 4) ]
}
setChatLineTimestamp(timestamp, line := 0) {
if(!checkHandles())
	return false
if timestamp is float
	timestamp := floor(timestamp)
if substr(timestamp, 1, 1) == "+" or substr(timestamp, 1, 1) == "-"
	timestamp := getChatLineTimestamp(line) + timestamp
if timestamp is not integer
	return false
dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
if ErrorLevel
	return false
tsAddress := dwAddress + 0x152 + ((99-line) * 0xFC) - 0x20
if ErrorLevel
	return false
writeMemory(hGTA, tsAddress, timestamp, 4, "int")
if ErrorLevel
	return -1
sendinput {f7 3}
return true
}
NOP_SetPlayerPos(tog := -1)
{
if(!checkHandles())
	return -1
dwAddress := dwSAMP+0x15970
byte := readMem(hGTA, dwAddress, 1, "byte")
if((tog == -1 && byte != 195) || tog == true || tog == 1)
{
	writeBytes(hGTA, dwAddress, "C390")
	return true
} else if((tog == -1 && byte == 195) || !tog)
{
	writeBytes(hGTA, dwAddress, "E910")
	return false
}
return -1
}
removeChatLine(line := 0)
{
if(!checkHandles())
	return false
if(!dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR))
	return false
loop % 100 - line
{
	a := ""
	dwLine := dwAddress + 0x132 + ( (99 - A_Index - line) * 0xFC )
	loop 0xFC
	{
		byte := substr(inttohex(Memory_ReadByte(hGTA, dwLine++)), 3)
		a .= (strlen(byte) == 1 ? "0" : "") byte
	}
	dwLine := dwAddress + 0x132 + ( (100 - A_Index - line) * 0xFC )
	writeBytes(hGTA, dwLine, a)
}
sendinput {f7 3}
return true
}
PrintLow(text, time) {
if(!checkHandles())
	return -1
dwFunc := 0x69F1E0
callwithparams(hGta, dwFunc, [["s",text], ["i", time], ["i", 1], ["i", 1]], true)
}
getChatState(state := -1)
{
if(!checkHandles())
	return false
dwAddr := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR) + 8
if state between 0 and 2
{
	writeByte(hGTA, dwAddr, state)
	sendinput {f7 3}
}
return Memory_ReadByte(hGTA, dwAddr)
}
GetBonePosition(ped,boneId){
callWithParamsBonePos(0x5E4280, [["i", ped],["i", pParamBonePos1],["i",boneId],["i", 1]], false, true)
return [readFloat(hGTA, pParamBonePos1), readFloat(hGTA, pParamBonePos1 + 4), readFloat(hGTA, pParamBonePos1 + 8)]
}
callWithParamsBonePos(dwFunc, aParams, bCleanupStack = true,  thiscall = false) {
validParams := 0
i := aParams.MaxIndex()
dwLen := i * 5 + 5 + 1
if(bCleanupStack)
	dwLen += 3
VarSetCapacity(injectData, i * 5 + 5 + 3 + 1, 0)
i_ := 1
while(i > 0) {
	if(aParams[i][1] != "") {
			dwMemAddress := 0x0
		if(aParams[i][1] == "p") {
				dwMemAddress := aParams[i][2]
			} else if(aParams[i][1] == "s") {
			if(i_>3)
				return false
			dwMemAddress := pParamBonePos%i_%
			writeString(hGTA,dwMemAddress, aParams[i][2])
			if(ErrorLevel)
				return false
			i_ += 1
			} else if(aParams[i][1] == "i") {
			dwMemAddress := aParams[i][2]
			} else {
			return false
		}
		NumPut((thiscall && i == 1 ? 0xB9 : 0x68), injectData, validParams * 5, "UChar")
		NumPut(dwMemAddress, injectData, validParams * 5 + 1, "UInt")
		validParams += 1
	}
	i -= 1
}
offset := dwFunc - ( pInjectFuncBonePos + validParams * 5 + 5 )
NumPut(0xE8, injectData, validParams * 5, "UChar")
NumPut(offset, injectData, validParams * 5 + 1, "Int")
if(bCleanupStack) {
		NumPut(0xC483, injectData, validParams * 5 + 5, "UShort")
	NumPut(validParams*4, injectData, validParams * 5 + 7, "UChar")
	NumPut(0xC3, injectData, validParams * 5 + 8, "UChar")
	} else {
	NumPut(0xC3, injectData, validParams * 5 + 5, "UChar")
}
writeRaw(hGTA, pInjectFuncBonePos, &injectData, dwLen)
if(ErrorLevel)
	return false
hThread := createRemoteThread(hGTA, 0, 0, pInjectFuncBonePos, 0, 0, 0)
if(ErrorLevel)
	return false
waitForSingleObject(hThread, 0xFFFFFFFF)
closeProcess(hThread)
return true
}
getVehicleMaxPassengers()
{
if(!checkHandles())
	return -1
if(!CVeh := readDWORD(hGTA, ADDR_VEHICLE_PTR))
	return -1
return readMem(hGTA, CVeh + 0x488, 1, "byte")
}
getVehiclePassenger(place)
{
if(!checkHandles())
	return -1
if(!CVeh := readDWORD(hGTA, ADDR_VEHICLE_PTR))
	return -1
return readDWORD(hGTA, CVeh + 0x460 + (place * 4))
}
getVehiclePassengerId(place)
{
CPed := getVehiclePassenger(place)
return getIdByPed(CPed)
}
getLastDamagePed(ByRef Ped := "", ByRef Weapon := "")
{
if(!checkHandles())
	return -1
if(!CPed := readDWORD(hGTA, ADDR_CPED_PTR))
	return -1
if(!dwPed := readDWORD(hGTA, CPed + 0x764))
	return -1
Ped := getIdByPed(dwPed)
Weapon := readMem(hGTA, CPed + 0x760, 4, "int")
return Ped
}
getKillStat(ByRef IsEnabled := "")
{
if(!checkHandles())
	return false
a := []
klist := readDWORD(hGTA, dwSAMP + 0x21A0EC)
isEnabled := readMem(hGTA, klist, 4, "int")
klist += 4
loop 5
{
	szKiller := readString(hGTA, klist, 25)
	szVictim := readString(hGTA, (klist += 25), 25)
	clKillerColor := inttohex(readMem(hGTA, (klist += 25), 4, "uint"))
	clVictimColor := inttohex(readMem(hGTA, (klist += 4), 4, "uint"))
	byteType := Memory_ReadByte(hGTA, (klist += 4))
	klist++
	a.Insert([szKiller, szVictim, clKillerColor, clVictimColor, byteType])
}
return a
}
setFireImmunity(state)
{
if(!checkHandles())
	return
writeMemory(hGTA, 0xB7CEE6, (state ? 1 : 0), 1, "byte")
}
setInfiniteRun(state)
{
if(!checkHandles())
	return
writeMemory(hGTA, 0xB7CEE4, (state ? 1 : 0), 1, "byte")
}
isMarkerSetup()
{
if(!checkHandles())
	return -1
return readMem(hGTA, 0xBA6774, 1, "byte")
}
multVehicleSpeed(MultValue := 1.01, SleepTime := 10, MaxSpeedX := 2.0, MaxSpeedY := 2.0)
{
if(multVehicleSpeed_tick + SleepTime > A_TickCount)
	return false
multVehicleSpeed_tick := A_TickCount
if(!checkHandles())
	return false
if(!dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR))
	return false
if(!MultValue)
{
	writeFloat(hGTA, dwAddr + ADDR_VEHICLE_X, 0.0)
	writeFloat(hGTA, dwAddr + ADDR_VEHICLE_Y, 0.0)
	return true
}
fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
if(abs(fSpeedX) <= MaxSpeedX)
	writeFloat(hGTA, dwAddr + ADDR_VEHICLE_X, fSpeedX * MultValue)
if(abs(fSpeedY) <= MaxSpeedY)
	writeFloat(hGTA, dwAddr + ADDR_VEHICLE_Y, fSpeedY * MultValue)
return true
}
togglekillstat(state)
{
if(!checkHandles())
	return false
dwKillptr := readDWORD(hGTA, dwSAMP + SAMP_KILLSTAT_OFFSET)
if(ErrorLevel || dwKillptr == 0) {
		ErrorLevel := ERROR_READ_MEMORY
	return false
}
writeBytes(hGTA, dwKillptr, state)
if(ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
	return -1
}
return true
}
setkillstatwidth(width)
{
if(!checkHandles())
	return false
dwKillptr := readDWORD(hGTA, dwSAMP + SAMP_KILLSTAT_OFFSET)
if(ErrorLevel || dwKillptr == 0) {
		ErrorLevel := ERROR_READ_MEMORY
	return false
}
writeBytes(hGTA, dwKillptr + 0x133, width)
if(ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
	return false
}
return true
}
movekillstat(x)
{
if(!checkHandles())
	return false
dwKillptr := readDWORD(hGTA, dwSAMP + SAMP_KILLSTAT_OFFSET)
if(ErrorLevel || dwKillptr == 0) {
		ErrorLevel := ERROR_READ_MEMORY
	return false
}
writeBytes(hGTA, dwKillptr + 0x12B, x)
if(ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
	return false
}
return true
}
setdistkillstat(int)
{
if(!checkHandles())
	return false
dwKillptr := readDWORD(hGTA, dwSAMP + SAMP_KILLSTAT_OFFSET)
if(ErrorLevel || dwKillptr == 0) {
		ErrorLevel := ERROR_READ_MEMORY
	return false
}
writeBytes(hGTA, dwKillptr + 0x12F, int)
if(ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
	return false
}
return true
}
getWeaponSlotById(id)
{
if id between 2 and 9
	slot := 1
if id between 10 and 15
	slot := 10
if id in 16,17,18,39
	slot := 8
if id between 22 and 24
	slot := 2
if id between 25 and 27
	slot := 3
if id in 28,29,32
	slot := 4
if id in 30,31
	slot := 5
if id in 33,34
	slot := 6
if id between 35 and 38
	slot := 7
if id == 40
	slot := 12
if id between 41 and 43
	slot := 9
if id between 44 and 46
	slot := 11
}
isPlayerCrouch()
{
if(!checkHandles())
	return -1
if(!CPed := readDWORD(hGTA, ADDR_CPED_PTR))
	return -1
state := readMem(hGTA, CPed + 0x46F, 1, "byte")
if(state == 132)
	return 1
if(state == 128)
	return 0
return -1
}
setDialogState(tog)
{
if(!checkHandles())
	return false
dwPointer := getDialogStructPtr()
if(ErrorLevel || !dwPointer)
	return false
writeMemory(hGTA, dwPointer + 0x28, (tog ? 1 : 0), 1, "byte")
if(!tog)
	Send {f6}{esc}
return true
}
toggleObjectDrawMode(tog := -1)
{
if(!checkHandles())
	return -1
byte := readMem(hGTA, dwSAMP + 0x69529, 1, "byte")
if((tog == -1 && byte == 15) || tog == true || tog == 1)
{
	writeBytes(hGTA, dwSAMP + 0x69529, "909090909090")
	return true
} else if((tog == -1 && byte == 144) || !tog)
{
	writeBytes(hGTA, dwSAMP + 0x69529, "0F84AE000000")
	Send {f6}{esc}
	return false
}
return -1
}
blurlevel(level := -1)
{
if(!checkHandles())
	return -1
if level between 0 and 255
	writeMemory(hGTA, 0x8D5104, level, 1, "byte")
blur := readMem(hGTA, 0x8D5104, 1, "byte")
return blur
}
toggleNoDamageByWeapon(tog := -1)
{
if(!checkHandles())
	return -1
byte := readMem(hGTA, 0x60A5BA, 1, "byte")
if((tog == -1 && byte == 216) || tog == true || tog == 1)
{
	writeBytes(hGTA, 0x60A5BA, "909090")
	return true
} else if((tog == -1 && byte == 144) || !tog)
{
	writeBytes(hGTA, 0x60A5BA, "D95E18")
	return false
}
addChatMessageEx(0xCC0000, "only for gta_sa.exe 1.0 us")
return -1
}
toggleInvulnerability(tog := -1)
{
if(!checkHandles())
	return -1
byte := readMem(hGTA, 0x60A5BA, 1, "byte")
if((tog == -1 && byte == 217) || tog == true || tog == 1)
{
	writeBytes(hGTA, 0x4B3314, "909090")
	return true
} else if((tog == -1 && byte == 144) || !tog)
{
	writeBytes(hGTA, 0x4B3314, "D86504")
	return false
}
addChatMessageEx(0xCC0000, "only for gta_sa.exe 1.0 us")
return -1
}
gmpatch()
{
if(!checkHandles())
	return false
a := writeMemory(hGTA, 0x4B35A0, 0x560CEC83, 4, "int")
b := writeMemory(hGTA, 0x4B35A4, 0xF18B, 2, "byte")
return (a && b)
}
toggleUnlimitedAmmo(tog := -1)
{
if(!checkHandles())
	return -1
byte := readMem(hGTA, 0x7428E6, 1, "byte")
if((tog == -1 && byte == 255) || tog == true || tog == 1)
{
	writeBytes(hGTA, 0x7428E6, "909090")
	return true
} else if((tog == -1 && byte == 144) || !tog)
{
	writeBytes(hGTA, 0x7428E6, "FF4E0C")
	return false
}
addChatMessageEx(0xCC0000, "only for gta_sa.exe 1.0 us")
return -1
}
toggleNoReload(tog := -1)
{
if(!checkHandles())
	return -1
byte := readMem(hGTA, 0x7428B0, 1, "byte")
if((tog == -1 && byte == 137) || tog == true || tog == 1)
{
	writeBytes(hGTA, 0x7428B0, "909090")
	return true
} else if((tog == -1 && byte == 144) || !tog)
{
	writeBytes(hGTA, 0x7428B0, "894608")
	return false
}
addChatMessageEx(0xCC0000, "only for gta_sa.exe 1.0 us")
return -1
}
toggleNoRecoil(tog := -1)
{
if(!checkHandles())
	return -1
byte := readMem(hGTA, 0x740450, 1, "byte")
if((tog == -1 && byte == 216) || tog == true || tog == 1)
{
	writeBytes(hGTA, 0x740450, "90909090909090909090")
	return true
} else if((tog == -1 && byte == 144) || !tog)
{
	writeBytes(hGTA, 0x740450, "D80D3C8B8500D84C241C")
	return false
}
addChatMessageEx(0xCC0000, "only for gta_sa.exe 1.0 us")
return -1
}
toggleAntiBikeFall(tog := -1)
{
if(!checkHandles())
	return -1
byte := readMem(hGTA, 0x4BA3B9, 1, "byte")
if((tog == -1 && byte == 15) || tog == true || tog == 1)
{
	writeBytes(hGTA, 0x4BA3B9, "E9A703000090")
	return true
} else if((tog == -1 && byte == 233) || !tog)
{
	writeBytes(hGTA, 0x4BA3B9, "0F84A6030000")
	return false
}
addChatMessageEx(0xCC0000, "only for gta_sa.exe 1.0 us")
return -1
}
toggleAntiCarEject(tog := -1)
{
if(!checkHandles())
	return -1
byte := readMem(hGTA, dwSAMP + 0x146E0, 1, "byte")
if((tog == -1 && byte == 233) || tog == true || tog == 1)
{
	writeBytes(hGTA, dwSAMP + 0x146E0, "C390909090")
	return true
} else if((tog == -1 && byte == 195) || !tog)
{
	writeBytes(hGTA, dwSAMP + 0x146E0, "E9D7722700")
	return false
}
return -1
}
toggleNoAnimations(tog := -1)
{
if(!checkHandles())
	return -1
byte := readMem(hGTA, dwSAMP + 0x16FA0, 1, "byte")
if((tog == -1 && byte == 85) || tog == true || tog == 1)
{
	writeMemory(hGTA, dwSAMP + 0x16FA0, 0xC3, 1, "byte")
	return true
} else if((tog == -1 && byte == 195) || !tog)
{
	writeMemory(hGTA, dwSAMP + 0x16FA0, 0x55, 1, "byte")
	return false
}
return -1
}
toggleMotionBlur(tog := -1)
{
if(!checkHandles())
	return -1
byte := readMem(hGTA, 0x704E8A, 1, "byte")
if((tog == -1 && byte == 144) || tog == true || tog == 1)
{
	writeBytes(hGTA, 0x704E8A, "E811E2FFFF")
	return true
} else if((tog == -1 && byte == 232) || !tog)
{
	writeBytes(hGTA, 0x704E8A, "9090909090")
	return false
}
addChatMessageEx(0xCC0000, "only for gta_sa.exe 1.0 us")
return -1
}
writeBytes(handle, address, bytes)
{
length := strlen(bytes) / 2
VarSetCapacity(toInject, length, 0)
Loop %length%
{
	byte := "0x" substr(bytes, ((A_Index - 1) * 2) + 1, 2)
	NumPut(byte, toInject, A_Index - 1, "uchar")
}
return writeRaw(handle, address, &toInject, length)
}
setPlayerFreeze(status) {
if(!checkHandles())
	return -1
dwCPed := readDWORD(hGTA, 0xB6F5F0)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
dwAddr := dwCPed + 0x42
writeString(hGTA, dwAddr, status)
if(ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return true
}
getPlayerAnim()
{
if(!checkHandles())
	return false
dwPointer := readDWORD(hGTA, dwSAMP + 0x13D190)
anim := readMem(hGTA, dwPointer + 0x2F4C, 2, "byte")
return anim
}
setPlayerHealth(amount) {
if(!checkHandles())
	return -1
dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
dwAddr := dwCPedPtr + ADDR_CPED_HPOFF
writeFloat(hGTA, dwAddr, amount)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return true
}
setPlayerArmor(amount) {
if(!checkHandles())
	return -1
dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
dwAddr := dwCPedPtr + ADDR_CPED_ARMOROFF
writeFloat(hGTA, dwAddr, amount)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return true
}
setVehicleHealth(amount) {
if(!checkHandles())
	return -1
dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
writeFloat(hGTA, dwAddr, amount)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return true
}
getDialogIndex() {
dwPointer := getDialogStructPtr()
if (ErrorLevel || !dwPointer)
	return false
dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR2_OFFSET)
if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
index := readMem(hGTA, dwPointer + 0x143, 1, "Byte")
if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return false
}
ErrorLevel := ERROR_OK
return index + 1
}
isDialogButtonSelected(btn := 1) {
dwPointer := getDialogStructPtr()
if (ErrorLevel || !dwPointer)
	return false
dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR2_OFFSET)
if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
offset := (btn == 1 ? 0x165 : 0x2C5)
sel := readMem(hGTA, dwPointer + offset, 1, "Byte")
if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return false
}
ErrorLevel := ERROR_OK
return sel
}
getServerHour() {
if(!checkHandles())
	return -1
dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
Hour := readMem(hGTA, 0xB70153, 1, "Int")
if (Hour <= 9) {
		FixHour = 0%Hour%
	return FixHour
}
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return Hour
}
getsexbyskin(skin)
{
if skin in 1,2,3,4,5,6,7,8,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,32,33,34,35,36,37,42,43,44,45,46,47,48,49,50,51,52,57,58,59,60,61,62,66,67,68,70,71,72,73,79,80,81,82,83,84,86,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,132,133,134,135,136,137,142,143,144,146,147,149,153,154,155,156,158,159,160,161,162,163,164,165,166,167,168,170,171,173,174,175,176,177,179,180,181,182,183,184,185,186,187,188,189,200,202,203,204,206,208,209,210,212,213,217,220,221,222,223,227,228,229,230,234,235,236,239,240,241,242,247,248,249,250,252,253,254,255,258,259,260,261,262,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,299,300,301,302,303,304,305,310,311
	return 1
if skin in 9,10,11,12,13,31,38,39,40,41,53,54,55,56,63,64,65,69,75,76,77,85,87,88,89,90,91,92,93,129,130,131,138,139,140,141,143,144,145,148,150,151,152,157,169,172,178,190,191,192,193,194,195,196,197,198,199,201,205,207,211,214,215,216,218,219,224,225,226,231,232,233,237,238,243,244,245,246,251,256,257,263,298,306,307,308,309
	return 2
else
	return 0
}
set_player_armed_weapon_to(weaponid)
{
c := getPlayerWeaponId()
WinGet, gtapid, List, GTA:SA:MP
SendMessage, 0x50,, 0x4090409,, GTA:SA:MP
Loop
{
	ControlSend,, {E down}, ahk_id %gtapid1%
	Sleep, 5
	ControlSend,, {E up}, ahk_id %gtapid1%
	if(getPlayerWeaponId() == c || getPlayerWeaponId() == weaponid)
		break
}
}
getZoneByName(zName, ByRef CurZone ) {
if ( bInitZaC == 0 )
{
	initZonesAndCities()
	bInitZaC := 1
}
Loop % nZone-1
{
	if (zone%A_Index%_name == zName)
	{
		ErrorLevel := ERROR_OK
		CurZone[1] := zone%A_Index%_name
		CurZone[2] := %A_Index%
		CurZone[3,1,1] := zone%A_Index%_x1
		CurZone[3,1,2] := zone%A_Index%_y1
		CurZone[3,1,3] := zone%A_Index%_z1
		CurZone[3,2,1] := zone%A_Index%_x2
		CurZone[3,2,2] := zone%A_Index%_y2
		CurZone[3,2,3] := zone%A_Index%_z2
		return true
	}
}
ErrorLevel := ERROR_ZONE_NOT_FOUND
return "Unknown"
}
getCenterPointToZone(zName, ByRef PointPos) {
getZoneByName(zName, CurZone)
PointPos[1] := 125 + CurZone[3,1,1]
PointPos[2] := 125 + CurZone[3,1,2]
return true
}
getDialogLineNumber() {
dwPointer := getDialogStructPtr()
if (ErrorLevel || !dwPointer)
	return 0
dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR2_OFFSET)
if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
count := readMem(hGTA, dwPointer + SAMP_DIALOG_LINENUMBER_OFFSET, 4, "UInt")
if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
return count//16777216+1
}
getServerMinute() {
if(!checkHandles())
	return -1
dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
Minute := readMem(hGTA, 0xB70152, 1, "Int")
if (Minute <= 9) {
		FixMinute = 0%Minute%
	return FixMinute
}
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return Minute
}
getCameraCoordinates() {
if(!checkHandles())
	return false
fX := readFloat(hGTA, 0xB6F9CC)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return ""
}
fY := readFloat(hGTA, 0xB6F9D0)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return ""
}
fZ := readFloat(hGTA, 0xB6F9D4)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return ""
}
ErrorLevel := ERROR_OK
return [fX, fY, fZ]
}
getPlayerPosById(dwId) {
dwId += 0
dwId := Floor(dwId)
if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
	return ""
if(iRefreshScoreboard+iUpdateTick > A_TickCount)
{
	if(oScoreboardData[dwId])
	{
		if(oScoreboardData[dwId].HasKey("PED"))
			return getPedCoordinates(oScoreboardData[dwId].PED)
		if(oScoreboardData[dwId].HasKey("MPOS"))
			return oScoreboardData[dwId].MPOS
	}
	return ""
}
if(!updateOScoreboardData())
	return ""
if(oScoreboardData[dwId])
{
	if(oScoreboardData[dwId].HasKey("PED"))
		return getPedCoordinates(oScoreboardData[dwId].PED)
	if(oScoreboardData[dwId].HasKey("MPOS"))
		return oScoreboardData[dwId].MPOS
}
return ""
}
HexToDecOne(Hex)
{
if (InStr(Hex, "0x") != 1)
	Hex := "0x" Hex
return, Hex + 0
}
HexToDecTwo(hex)
{
VarSetCapacity(dec, 66, 0)
, val := DllCall("msvcrt.dll\_wcstoui64", "Str", hex, "UInt", 0, "UInt", 16, "CDECL Int64")
, DllCall("msvcrt.dll\_i64tow", "Int64", val, "Str", dec, "UInt", 10, "CDECL")
return dec
}
hex2rgb(CR)
{
NumPut((InStr(CR, "#") ? "0x" SubStr(CR, 2) : "0x") SubStr(CR, -5), (V := "000000"))
return NumGet(V, 2, "UChar") "," NumGet(V, 1, "UChar") "," NumGet(V, 0, "UChar")
}
rgb2hex(R, G, B, H := 1)
{
static U := A_IsUnicode ? "_wcstoui64" : "_strtoui64"
static V := A_IsUnicode ? "_i64tow"    : "_i64toa"
rgb := ((R << 16) + (G << 8) + B)
H := ((H = 1) ? "#" : ((H = 2) ? "0x" : ""))
VarSetCapacity(S, 66, 0)
value := DllCall("msvcrt.dll\" U, "Str", rgb , "UInt", 0, "UInt", 10, "CDECL Int64")
DllCall("msvcrt.dll\" V, "Int64", value, "Str", S, "UInt", 16, "CDECL")
return H S
}
GetCoordsSamp(ByRef ResX, ByRef ResY)
{
MouseGetPos, PosX, PosY
PosXProc := PosX * 100 / A_ScreenWidth
PosYProc := PosY * 100 / A_ScreenHeight
ResX := PosXProc * 8
ResY := PosYProc * 6
}
getVehicleIdServer(address=0x13C298, datatype="int", length=4, offset=0)
{
if (isPlayerDriver() != "-1" or isPlayerInAnyVehicle() != "0")
{
	Process, Exist, gta_sa.exe
	PID_GTA := ErrorLevel
	VarSetCapacity(me32, 548, 0)
	NumPut(548, me32)
	snapMod := DllCall("CreateToolhelp32Snapshot", "Uint", 0x00000008, "Uint", PID_GTA)
	if (snapMod = -1)
		return 0
	if (DllCall("Module32First", "Uint", snapMod, "Uint", &me32))
	{
		Loop
		{
			if (!DllCall("lstrcmpi", "Str", "samp.dll", "UInt", &me32 + 32)) {
					DllCall("CloseHandle", "UInt", snapMod)
				key:= NumGet(&me32 + 20)
				WinGet, PID_SAMP, PID, GTA:SA:MP
				hwnd_samp := DllCall("OpenProcess","Uint",0x1F0FFF,"int",0,"int", PID_SAMP)
				VarSetCapacity(readvalue,length, 0)
				DllCall("ReadProcessMemory","Uint",hwnd_samp,"Uint",key+address+offset,"Str",readvalue,"Uint",length,"Uint *",0)
				finalvalue := NumGet(readvalue,0,datatype)
				DllCall("CloseHandle", "int", hwnd_samp)
				return finalvalue
			}
		}
		Until !DllCall("Module32Next", "Uint", snapMod, "UInt", &me32)
	}
	DllCall("CloseHandle", "Uint", snapMod)
}
else
	return 0
}
setPlayerName(playerid, newnick) {
if(!checkHandles() || !strlen(newnick))
	return 0
dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
dwAddress := readDWORD(hGTA, dwAddress + SAMP_PPOOLS_OFFSET)
if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
dwPlayers := readDWORD(hGTA, dwAddress + SAMP_PPOOL_PLAYER_OFFSET)
if(ErrorLevel || dwPlayers==0) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
dwRemoteplayer := readDWORD(hGTA, dwPlayers+SAMP_PREMOTEPLAYER_OFFSET+playerid*4)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
if(dwRemoteplayer==0)
	return 0
dwTemp := readMem(hGTA, dwRemoteplayer + SAMP_ISTRLENNAME___OFFSET, 4, "Int")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
sUsername := ""
if(dwTemp <= 0xf)
{
	sUsername := readString(hGTA, dwRemoteplayer+SAMP_SZPLAYERNAME_OFFSET, 16)
	if(ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
	writeString(hGTA, dwRemoteplayer+SAMP_SZPLAYERNAME_OFFSET, newnick)
}
else {
		dwAddress := readDWORD(hGTA, dwRemoteplayer + SAMP_PSZPLAYERNAME_OFFSET)
	if(ErrorLevel || dwAddress==0) {
			ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
	sUsername := readString(hGTA, dwAddress, 25)
	if(ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
	writeString(hGTA, dwAddress, newnick)
}
ErrorLevel := ERROR_OK
return 1
}
connect(IP) {
setIP(IP)
restartGameEx()
disconnectEx()
Sleep 1000
setrestart()
return
}
WriteProcessMemory(title,addresse,wert,size)
{
VarSetCapacity(idvar,32,0)
VarSetCapacity(processhandle,32,0)
VarSetCapacity(value, 32, 0)
NumPut(wert,value,0,Uint)
address=%addresse%
WinGet ,idvar,PID,%title%
processhandle:=DllCall("OpenProcess","Uint",0x38,"int",0,"int",idvar)
Bvar:=DllCall("WriteProcessMemory","Uint",processhandle,"Uint",address+0,"Uint",&value,"Uint",size,"Uint",0)
}
setCoordinates(x, y, z, Interior) {
if(!checkHandles())
	return False
dwAddress := readMem(hGTA, ADDR_SET_POSITION)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return False
}
dwAddress := readMem(hGTA, dwAddress + ADDR_SET_POSITION_OFFSET)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return False
}
Sleep 100
writeByte(hGTA, ADDR_SET_INTERIOR_OFFSET, Interior)
if(ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
	return False
}
writeFloat(hGTA, dwAddress + ADDR_SET_POSITION_X_OFFSET, x)
if(ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
	return False
}
writeFloat(hGTA, dwAddress + ADDR_SET_POSITION_Y_OFFSET, y)
if(ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
	return False
}
writeFloat(hGTA, dwAddress + ADDR_SET_POSITION_Z_OFFSET, z)
if(ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
	return False
}
return True
}
colorhud(colorhud)
{
VarSetCapacity(idvar,32,0)
VarSetCapacity(processhandle,32,0)
VarSetCapacity(value, 32, 0)
NumPut(colorhud,value,0,Uint)
address=0xBAB230
WinGet ,idvar,PID,GTA:SA:MP
processhandle:=DllCall("OpenProcess","Uint",0x38,"int",0,"int",idvar)
Bvar:=DllCall("WriteProcessMemory","Uint",processhandle,"Uint",address+0,"Uint",&value,"Uint","4","Uint",0)
}
setIP(IP) {
if(!checkHandles())
	return False
dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
	return False
}
writeString(hGTA, dwAddress + SAMP_SZIP_OFFSET, IP)
if(ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
	return False
}
return True
}
setUsername(Username) {
if(!checkHandles())
	return False
dwAddress := dwSAMP + ADDR_SAMP_USERNAME
writeString(hGTA, dwAddress, Username)
if(ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
	return False
}
ErrorLevel := ERROR_OK
return True
}
setChatLine(line, msg) {
if(!checkHandles())
	return -1
dwPtr := dwSAMP + ADDR_SAMP_CHATMSG_PTR
dwAddress := readDWORD(hGTA,dwPtr)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
writeString(hGTA, dwAddress + 0x152 + ( (99-line) * 0xFC), msg)
if(ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
	return -1
}
sendinput {f7 3}
ErrorLevel := ERROR_OK
return True
}
getTagNameDistance() {
if(!checkHandles())
	return -1
dwSAMPInfo := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
dwSAMPInfoSettings := readDWORD(hGTA, dwSAMPInfo + SAMP_INFO_SETTINGS_OFFSET)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
distance := readFloat(hGTA, dwSAMPInfoSettings + 0x27)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return distance
}
setTagNameDistance(status, distance) {
if(!checkHandles())
	return -1
status := status ? 1 : 0
dwSAMPInfo := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
dwSAMPInfoSettings := readDWORD(hGTA, dwSAMPInfo + SAMP_INFO_SETTINGS_OFFSET)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
writeByte(hGTA, dwSAMPInfoSettings + 0x38, 1)
if(ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
	return -1
}
writeByte(hGTA, dwSAMPInfoSettings + 0x2F, status)
if(ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
	return -1
}
writeFloat(hGTA, dwSAMPInfoSettings + 0x27, distance)
if(ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return
}
setTime(hour)
{
if(!checkHandles())
	return
VarSetCapacity(nop, 6, 0)
Loop 6 {
	NumPut(0x90, nop, A_INDEX-1, "UChar")
}
writeRaw(hGTA, 0x52D168, &nop, 6)
VarSetCapacity(time, 1, 0)
NumPut(hour, time, 0, "Int")
writeRaw(hGTA, 0xB70153, &time, 1)
}
setWeather(id)
{
if(!checkHandles())
	return
VarSetCapacity(weather, 1, 0)
NumPut(id, weather, 0, "Int")
writeRaw(hGTA, 0xC81320, &weather, 1)
if(ErrorLevel)
	return false
return true
}
getSkinID() {
if(!checkHandles())
	return -1
dwAddress := readDWORD(hGTA, 0xB6F3B8)
if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
id := readMem(hGTA, dwAddress + 0x22, 2, "UShort")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return id
}
getDialogTitle()
{
if(!checkHandles())
	return ""
dwAddress := readDWORD(hGTA, dwSAMP + 0x21A0B8)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return ""
}
text := readString(hGTA, dwAddress + 0x40, 128)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return ""
}
ErrorLevel := ERROR_OK
return text
}
setPlayerColor(id,color)
{
id += 0
color +=0
if(!checkHandles())
	return
VarSetCapacity(bla, 4, 0)
NumPut(color,bla,0,"UInt")
writeRaw(hGTA, dwSAMP + 0x216378 + 4*id, &bla, 4)
}
GetInterior()
{
dwAddress := readDWORD(hGTA, ADDR_SET_INTERIOR_OFFSET)
if (ErrorLevel || dwAddress == 0) {
		ErrorLevel := ERROR_READ_MEMORY
	return false
}
return true
}
getWeaponId()
{
If(!checkHandles())
return 0
c := readDWORD(hGTA, ADDR_CPED_PTR)
If(ErrorLevel) {
	ErrorLevel := ERROR_READ_MEMORY
	return 0
}
id := readMem(hGTA, c + 0x740)
If(ErrorLevel) {
	ErrorLevel := ERROR_READ_MEMORY
	return 0
}
return id
}
writeFloat(hProcess, dwAddress, wFloat) {
if(!hProcess) {
		ErrorLevel := ERROR_INVALID_HANDLE
	return false
}
wFloat := FloatToHex(wFloat)
dwRet := DllCall(   "WriteProcessMemory"
, "UInt", hProcess
, "UInt", dwAddress
, "UInt *", wFloat
, "UInt", 4
, "UInt *", 0)
ErrorLevel := ERROR_OK
return true
}
writeByte(hProcess, dwAddress, wInt) {
if(!hProcess) {
		ErrorLevel := ERROR_INVALID_HANDLE
	return false
}
wInt := IntToHex(wInt)
dwRet := DllCall(     "WriteProcessMemory"
, "UInt", hProcess
, "UInt", dwAddress
, "UInt *", wInt
, "UInt", 1
, "UInt *", 0)
}
FloatToHex(value) {
format := A_FormatInteger
	SetFormat, Integer, H
result := DllCall("MulDiv", Float, value, Int, 1, Int, 1, UInt)
SetFormat, Integer, %format%
return, result
}
IntToHex(int)
{
CurrentFormat := A_FormatInteger
SetFormat, integer, hex
int += 0
SetFormat, integer, %CurrentFormat%
return int
}
disconnectEx() {
if(!checkHandles())
	return 0
dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
dwAddress := readDWORD(hGTA, dwAddress + 0x3c9)
if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
ecx := dwAddress
dwAddress := readDWORD(hGTA, dwAddress)
if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
VarSetCapacity(injectData, 24, 0)
NumPut(0xB9, injectData, 0, "UChar")
NumPut(ecx, injectData, 1, "UInt")
NumPut(0xB8, injectData, 5, "UChar")
NumPut(dwAddress, injectData, 6, "UInt")
NumPut(0x68, injectData, 10, "UChar")
NumPut(0, injectData, 11, "UInt")
NumPut(0x68, injectData, 15, "UChar")
NumPut(500, injectData, 16, "UInt")
NumPut(0x50FF, injectData, 20, "UShort")
NumPut(0x08, injectData, 22, "UChar")
NumPut(0xC3, injectData, 23, "UChar")
writeRaw(hGTA, pInjectFunc, &injectData, 24)
if(ErrorLevel)
	return false
hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
if(ErrorLevel)
	return false
waitForSingleObject(hThread, 0xFFFFFFFF)
closeProcess(hThread)
return true
}
setrestart()
{
VarSetCapacity(old, 4, 0)
dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
NumPut(9,old,0,"Int")
writeRaw(hGTA, dwAddress + 957, &old, 4)
}
restartGameEx() {
if(!checkHandles())
	return -1
dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
dwFunc := dwSAMP + 0xA060
VarSetCapacity(injectData, 11, 0)
NumPut(0xB9, injectData, 0, "UChar")
NumPut(dwAddress, injectData, 1, "UInt")
NumPut(0xE8, injectData, 5, "UChar")
offset := dwFunc - (pInjectFunc + 10)
NumPut(offset, injectData, 6, "Int")
NumPut(0xC3, injectData, 10, "UChar")
writeRaw(hGTA, pInjectFunc, &injectData, 11)
if(ErrorLevel)
	return false
hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
if(ErrorLevel)
	return false
waitForSingleObject(hThread, 0xFFFFFFFF)
closeProcess(hThread)
return true
}
isPlayerInStreamById(player_id, radius := 150)
{
NAME := ""
check := []
p := getStreamedInPlayersInfo()
if (!p)
	return 0
For i, o in p
{
	if (Floor(getDist(getCoordinates(), o.POS)) <= radius)
	{
		NAME .= o.NAME ", "
	}
}
if (IsObject(player_id))
{
	for k, v in player_id
	{
		i := 0
		Loop, Parse, % NAME, % ",", % " ,.`n`r"
		{
			if (A_LoopField == getPlayerNameById(v))
			{
				i := 1
				break
			}
		}
		if (i)
			check[v] := i
		else
			check[v] := i
	}
	return check
}
else if (!IsObject(player_id))
{
	if (!getPlayerNameById(player_id))
		return 0
	i := 0
	Loop, Parse, % NAME, % ",", % " ,.`n`r"
	{
		if (A_LoopField == getPlayerNameById(player_id))
			return 1
	}
	return 0
}
}
IsSAMPAvailable() {
if(!checkHandles())
	return false
dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
if(dwChatInfo == 0 || dwChatInfo == "ERROR")
{
	return false
}
else
{
	return true
}
}
isInChat() {
if(!checkHandles())
	return -1
dwPtr := dwSAMP + ADDR_SAMP_INCHAT_PTR
dwAddress := readDWORD(hGTA, dwPtr) + ADDR_SAMP_INCHAT_PTR_OFF
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
dwInChat := readDWORD(hGTA, dwAddress)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
if(dwInChat > 0) {
		return true
	} else {
	return false
}
}
getUsername() {
if(!checkHandles())
	return ""
dwAddress := dwSAMP + ADDR_SAMP_USERNAME
sUsername := readString(hGTA, dwAddress, 25)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return ""
}
ErrorLevel := ERROR_OK
return sUsername
}
getId() {
s:=getUsername()
return getPlayerIdByName(s)
}
SendChat(wText) {
wText := "" wText
if(!checkHandles())
	return false
dwFunc:=0
if(SubStr(wText, 1, 1) == "/") {
		dwFunc := dwSAMP + FUNC_SAMP_SENDCMD
	} else {
	dwFunc := dwSAMP + FUNC_SAMP_SENDSAY
}
callWithParams(hGTA, dwFunc, [["s", wText]], false)
ErrorLevel := ERROR_OK
return true
}
ProcessReadMemory(address, processIDorName, type := "Int", numBytes := 4) {
VarSetCapacity(buf, numBytes, 0)
Process Exist, %processIDorName%
if !processID := ErrorLevel
	return -1
if !processHandle := DllCall("OpenProcess", "Int", 24, "UInt", 0, "UInt", processID, "Ptr")
	throw Exception("Failed to open process.`n`nError code:`t" . A_LastError)
result := DllCall("ReadProcessMemory", "Ptr", processHandle, "Ptr", address, "Ptr", &buf, "Ptr", numBytes, "PtrP", numBytesRead, "UInt")
if !DllCall("CloseHandle", "Ptr", processHandle, "UInt") && !result
	throw Exception("Failed to close process handle.`n`nError code:`t" . A_LastError)
if !result
	throw Exception("Failed to read process memory.`n`nError code:`t" . A_LastError)
if !numBytesRead
	throw Exception("Read 0 bytes from the`n`nprocess:`t" . processIDorName . "`naddress:`t" . address)
return (type = "Str")
? StrGet(&buf, numBytes)
: NumGet(buf, type)
}
ProcessWriteMemory(data, address, processIDorName, type := "Int", numBytes := 4) {
VarSetCapacity(buf, numBytes, 0)
(type = "Str")
? StrPut(data, &buf, numBytes)
: NumPut(data, buf, type)
Process Exist, %processIDorName%
if !processID := ErrorLevel
	return
if !processHandle := DllCall("OpenProcess", "Int", 40, "UInt", 0, "UInt", processID, "Ptr")
	throw Exception("Failed to open process.`n`nError code:`t" . A_LastError)
result := DllCall("WriteProcessMemory", "Ptr", processHandle, "Ptr", address, "Ptr", &buf, "Ptr", numBytes, "UInt", 0, "UInt")
if !DllCall("CloseHandle", "Ptr", processHandle, "UInt") && !result
	throw Exception("Failed to close process handle.`n`nError code:`t" . A_LastError)
if !result
	return
return result
}
addChatMessage(wText) {
wText := "" wText
if(!checkHandles())
	return false
dwFunc := dwSAMP + FUNC_SAMP_ADDTOCHATWND
dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return false
}
callWithParams(hGTA, dwFunc, [["p", dwChatInfo], ["s", wText]], true)
ErrorLevel := ERROR_OK
return true
}
showGameText(wText, dwTime, dwSize) {
wText := "" wText
dwTime += 0
dwTime := Floor(dwTime)
dwSize += 0
dwSize := Floor(dwSize)
if(!checkHandles())
	return false
dwFunc := dwSAMP + FUNC_SAMP_SHOWGAMETEXT
callWithParams(hGTA, dwFunc, [["s", wText], ["i", dwTime], ["i", dwSize]], false)
ErrorLevel := ERROR_OK
return true
}
playAudioStream(wUrl) {
wUrl := "" wUrl
if(!checkHandles())
	return false
dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR
patchRadio()
callWithParams(hGTA, dwFunc, [["s", wUrl], ["i", 0], ["i", 0], ["i", 0], ["i", 0], ["i", 0]], false)
unPatchRadio()
ErrorLevel := ERROR_OK
return true
}
stopAudioStream() {
if(!checkHandles())
	return false
dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR
patchRadio()
callWithParams(hGTA, dwFunc, [["i", 1]], false)
unPatchRadio()
ErrorLevel := ERROR_OK
return true
}
patchRadio()
{
if(!checkHandles())
	return false
VarSetCapacity(nop, 4, 0)
NumPut(0x90909090,nop,0,"UInt")
dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR
writeRaw(hGTA, dwFunc, &nop, 4)
writeRaw(hGTA, dwFunc+4, &nop, 1)
dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR
writeRaw(hGTA, dwFunc, &nop, 4)
writeRaw(hGTA, dwFunc+4, &nop, 1)
return true
}
unPatchRadio()
{
if(!checkHandles())
	return false
VarSetCapacity(old, 4, 0)
dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR
NumPut(0x74003980,old,0,"UInt")
writeRaw(hGTA, dwFunc, &old, 4)
NumPut(0x39,old,0,"UChar")
writeRaw(hGTA, dwFunc+4, &old, 1)
dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR
NumPut(0x74003980,old,0,"UInt")
writeRaw(hGTA, dwFunc, &old, 4)
NumPut(0x09,old,0,"UChar")
writeRaw(hGTA, dwFunc+4, &old, 1)
return true
}
blockChatInput() {
if(!checkHandles())
	return false
VarSetCapacity(nop, 2, 0)
dwFunc := dwSAMP + FUNC_SAMP_SENDSAY
NumPut(0x04C2,nop,0,"Short")
writeRaw(hGTA, dwFunc, &nop, 2)
dwFunc := dwSAMP + FUNC_SAMP_SENDCMD
writeRaw(hGTA, dwFunc, &nop, 2)
return true
}
unBlockChatInput() {
if(!checkHandles())
	return false
VarSetCapacity(nop, 2, 0)
dwFunc := dwSAMP + FUNC_SAMP_SENDSAY
NumPut(0xA164,nop,0,"Short")
writeRaw(hGTA, dwFunc, &nop, 2)
dwFunc := dwSAMP + FUNC_SAMP_SENDCMD
writeRaw(hGTA, dwFunc, &nop, 2)
return true
}
getServerName() {
if(!checkHandles())
	return -1
dwAdress := readMem(hGTA, dwSAMP + 0x21A0F8, 4, "int")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
if(!dwAdress)
	return -1
ServerName := readString(hGTA, dwAdress + 0x121, 200)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return ServerName
}
getServerIP() {
if(!checkHandles())
	return -1
dwAdress := readMem(hGTA, dwSAMP + 0x21A0F8, 4, "int")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
if(!dwAdress)
	return -1
ServerIP := readString(hGTA, dwAdress + 0x20, 100)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return ServerIP
}
getServerPort() {
if(!checkHandles())
	return -1
dwAdress := readMem(hGTA, dwSAMP + 0x21A0F8, 4, "int")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
if(!dwAdress)
	return -1
ServerPort := readMem(hGTA, dwAdress + 0x225, 4, "int")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return ServerPort
}
getWeatherID() {
if(!checkHandles())
	return -1
dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
WeatherID := readMem(hGTA, 0xC81320, 2, "byte")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return WeatherID
}
getWeatherName() {
if(isPlayerInAnyVehicle() == 0)
	return -1
if(id >= 0 && id < 23)
{
	return oweatherNames[id-1]
}
return ""
}
isTargetDriverbyId(dwId)
{
if(!checkHandles())
	return -1
dwPedPointer := getPedById(dwId)
dwAddrVPtr := getVehiclePointerByPed(dwPedPointer)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
dwVal := readDWORD(hGTA, dwAddrVPtr + ADDR_VEHICLE_DRIVER)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return (dwVal == dwPedPointer)
}
getTargetPed() {
if(!checkHandles())
	return 0
dwAddress := readDWORD(hGTA, 0xB6F3B8)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
if(!dwAddress)
	return 0
dwAddress := readDWORD(hGTA, dwAddress+0x79C)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
return dwAddress
}
calcScreenCoors(fX,fY,fZ)
{
if(!checkHandles())
	return false
dwM := 0xB6FA2C
m_11 := readFloat(hGTA, dwM + 0*4)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return false
}
m_12 := readFloat(hGTA, dwM + 1*4)
m_13 := readFloat(hGTA, dwM + 2*4)
m_21 := readFloat(hGTA, dwM + 4*4)
m_22 := readFloat(hGTA, dwM + 5*4)
m_23 := readFloat(hGTA, dwM + 6*4)
m_31 := readFloat(hGTA, dwM + 8*4)
m_32 := readFloat(hGTA, dwM + 9*4)
m_33 := readFloat(hGTA, dwM + 10*4)
m_41 := readFloat(hGTA, dwM + 12*4)
m_42 := readFloat(hGTA, dwM + 13*4)
m_43 := readFloat(hGTA, dwM + 14*4)
dwLenX := readDWORD(hGTA, 0xC17044)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return false
}
dwLenY := readDWORD(hGTA, 0xC17048)
frX := fZ * m_31 + fY * m_21 + fX * m_11 + m_41
frY := fZ * m_32 + fY * m_22 + fX * m_12 + m_42
frZ := fZ * m_33 + fY * m_23 + fX * m_13 + m_43
fRecip := 1.0/frZ
frX *= fRecip * dwLenX
frY *= fRecip * dwLenY
if(frX<=dwLenX && frY<=dwLenY && frZ>1)
	return [frX,frY,frZ]
}
ConvertCarColor(Color)
{
ArrayRGB := ["0xF5F5F5FF", "0x2A77A1FF", "0x840410FF", "0x263739FF", "0x86446EFF", "0xD78E10FF", "0x4C75B7FF", "0xBDBEC6FF", "0x5E7072FF", "0x46597AFF", "0x656A79FF", "0x5D7E8DFF", "0x58595AFF", "0xD6DAD6FF", "0x9CA1A3FF", "0x335F3FFF", "0x730E1AFF", "0x7B0A2AFF", "0x9F9D94FF", "0x3B4E78FF", "0x732E3EFF", "0x691E3BFF", "0x96918CFF", "0x515459FF", "0x3F3E45FF", "0xA5A9A7FF", "0x635C5AFF", "0x3D4A68FF", "0x979592FF", "0x421F21FF", "0x5F272BFF", "0x8494ABFF", "0x767B7CFF", "0x646464FF", "0x5A5752FF", "0x252527FF", "0x2D3A35FF", "0x93A396FF", "0x6D7A88FF", "0x221918FF", "0x6F675FFF", "0x7C1C2AFF", "0x5F0A15FF", "0x193826FF", "0x5D1B20FF", "0x9D9872FF", "0x7A7560FF", "0x989586FF", "0xADB0B0FF", "0x848988FF", "0x304F45FF", "0x4D6268FF", "0x162248FF", "0x272F4BFF", "0x7D6256FF", "0x9EA4ABFF", "0x9C8D71FF", "0x6D1822FF", "0x4E6881FF", "0x9C9C98FF", "0x917347FF", "0x661C26FF", "0x949D9FFF", "0xA4A7A5FF", "0x8E8C46FF", "0x341A1EFF", "0x6A7A8CFF", "0xAAAD8EFF", "0xAB988FFF", "0x851F2EFF", "0x6F8297FF", "0x585853FF", "0x9AA790FF", "0x601A23FF", "0x20202CFF", "0xA4A096FF", "0xAA9D84FF", "0x78222BFF", "0x0E316DFF", "0x722A3FFF", "0x7B715EFF", "0x741D28FF", "0x1E2E32FF", "0x4D322FFF", "0x7C1B44FF", "0x2E5B20FF", "0x395A83FF", "0x6D2837FF", "0xA7A28FFF", "0xAFB1B1FF", "0x364155FF", "0x6D6C6EFF", "0x0F6A89FF", "0x204B6BFF", "0x2B3E57FF", "0x9B9F9DFF", "0x6C8495FF", "0x4D8495FF", "0xAE9B7FFF", "0x406C8FFF", "0x1F253BFF", "0xAB9276FF", "0x134573FF", "0x96816CFF", "0x64686AFF", "0x105082FF", "0xA19983FF", "0x385694FF", "0x525661FF", "0x7F6956FF", "0x8C929AFF", "0x596E87FF", "0x473532FF", "0x44624FFF", "0x730A27FF", "0x223457FF", "0x640D1BFF", "0xA3ADC6FF", "0x695853FF", "0x9B8B80FF", "0x620B1CFF", "0x5B5D5EFF", "0x624428FF", "0x731827FF", "0x1B376DFF", "0xEC6AAEFF", "0x000000FF"]
ArrayRGBNew := ["0x177517FF", "0x210606FF", "0x125478FF", "0x452A0DFF", "0x571E1EFF", "0x010701FF", "0x25225AFF", "0x2C89AAFF", "0x8A4DBDFF", "0x35963AFF", "0xB7B7B7FF", "0x464C8DFF", "0x84888CFF", "0x817867FF", "0x817A26FF", "0x6A506FFF", "0x583E6FFF", "0x8CB972FF", "0x824F78FF", "0x6D276AFF", "0x1E1D13FF", "0x1E1306FF", "0x1F2518FF", "0x2C4531FF", "0x1E4C99FF", "0x2E5F43FF", "0x1E9948FF", "0x1E9999FF", "0x999976FF", "0x7C8499FF", "0x992E1EFF", "0x2C1E08FF", "0x142407FF", "0x993E4DFF", "0x1E4C99FF", "0x198181FF", "0x1A292AFF", "0x16616FFF", "0x1B6687FF", "0x6C3F99FF", "0x481A0EFF", "0x7A7399FF", "0x746D99FF", "0x53387EFF", "0x222407FF", "0x3E190CFF", "0x46210EFF", "0x991E1EFF", "0x8D4C8DFF", "0x805B80FF", "0x7B3E7EFF", "0x3C1737FF", "0x733517FF", "0x781818FF", "0x83341AFF", "0x8E2F1CFF", "0x7E3E53FF", "0x7C6D7CFF", "0x020C02FF", "0x072407FF", "0x163012FF", "0x16301BFF", "0x642B4FFF", "0x368452FF", "0x999590FF", "0x818D96FF", "0x99991EFF", "0x7F994CFF", "0x839292FF", "0x788222FF", "0x2B3C99FF", "0x3A3A0BFF", "0x8A794EFF", "0x0E1F49FF", "0x15371CFF", "0x15273AFF", "0x375775FF", "0x060820FF", "0x071326FF", "0x20394BFF", "0x2C5089FF", "0x15426CFF", "0x103250FF", "0x241663FF", "0x692015FF", "0x8C8D94FF", "0x516013FF", "0x090F02FF", "0x8C573AFF", "0x52888EFF", "0x995C52FF", "0x99581EFF", "0x993A63FF", "0x998F4EFF", "0x99311EFF", "0x0D1842FF", "0x521E1EFF", "0x42420DFF", "0x4C991EFF", "0x082A1DFF", "0x96821DFF", "0x197F19FF", "0x3B141FFF", "0x745217FF", "0x893F8DFF", "0x7E1A6CFF", "0x0B370BFF", "0x27450DFF", "0x071F24FF", "0x784573FF", "0x8A653AFF", "0x732617FF", "0x319490FF", "0x56941DFF", "0x59163DFF", "0x1B8A2FFF", "0x38160BFF", "0x041804FF", "0x355D8EFF", "0x2E3F5BFF", "0x561A28FF", "0x4E0E27FF", "0x706C67FF", "0x3B3E42FF", "0x2E2D33FF", "0x7B7E7DFF", "0x4A4442FF", "0x28344EFF"]
if (Color > 0) and (Color < 128)
	RGB := ArrayRGB[Color]
if (Color > 127) and (Color < 256)
{
	RGB := ArrayRGBNew[Color + 127]
}
StringLeft, RGBTemp, RGB, 8
StringRight, RGB, RGBTemp, 6
if Color = 0
	RGB := "000000"
return RGB
}
getPedById(dwId) {
dwId += 0
dwId := Floor(dwId)
if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
	return 0
if(iRefreshScoreboard+iUpdateTick > A_TickCount)
{
	if(oScoreboardData[dwId])
	{
		if(oScoreboardData[dwId].HasKey("PED"))
			return oScoreboardData[dwId].PED
	}
	return 0
}
if(!updateOScoreboardData())
	return 0
if(oScoreboardData[dwId])
{
	if(oScoreboardData[dwId].HasKey("PED"))
		return oScoreboardData[dwId].PED
}
return 0
}
getIdByPed(dwPed) {
dwPed += 0
dwPed := Floor(dwPed)
if(!dwPed)
	return -1
if(iRefreshScoreboard+iUpdateTick > A_TickCount)
{
	For i, o in oScoreboardData
	{
		if(o.HasKey("PED"))
		{
			if(o.PED==dwPed)
				return i
		}
	}
	return -1
}
if(!updateOScoreboardData())
	return -1
For i, o in oScoreboardData
{
	if(o.HasKey("PED"))
	{
		if(o.PED==dwPed)
			return i
	}
}
return -1
}
IsInAFK() {
res := ProcessReadMemory(0xBA6748 + 0x5C, "gta_sa.exe")
if (res==-1)
	return -1
WinGet, win, MinMax, GTA:SA:MP
if ((res=0) and (win=-1)) or res=1
	return 1
return 0
}
getStreamedInPlayersInfo() {
r:=[]
if(iRefreshScoreboard+iUpdateTick > A_TickCount)
{
	For i, o in oScoreboardData
	{
		if(o.HasKey("PED"))
		{
			p := getPedCoordinates(o.PED)
			if(p)
			{
				o.POS := p
				r[i] := o
			}
		}
	}
	return r
}
if(!updateOScoreboardData())
	return ""
For i, o in oScoreboardData
{
	if(o.HasKey("PED"))
	{
		p := getPedCoordinates(o.PED)
		if(p)
		{
			o.POS := p
			r[i] := o
		}
	}
}
return r
}
callFuncForAllStreamedInPlayers(cfunc,dist=0x7fffffff) {
cfunc := "" cfunc
dist += 0
if(!IsFunc(cfunc))
	return false
p := getStreamedInPlayersInfo()
if(!p)
	return false
if(dist<0x7fffffff)
{
	lpos := getCoordinates()
	if(!lpos)
		return false
	For i, o in p
	{
		if(dist>getDist(lpos,o.POS))
			%cfunc%(o)
	}
}
else
{
	For i, o in p
	%cfunc%(o)
}
return true
}
getDist(pos1,pos2) {
if(!pos1 || !pos2)
	return 0
return Sqrt((pos1[1]-pos2[1])*(pos1[1]-pos2[1])+(pos1[2]-pos2[2])*(pos1[2]-pos2[2])+(pos1[3]-pos2[3])*(pos1[3]-pos2[3]))
}
getClosestPlayerPed() {
dist := 0x7fffffff
p := getStreamedInPlayersInfo()
if(!p)
	return -1
lpos := getCoordinates()
if(!lpos)
	return -1
id := -1
For i, o in p
{
	t:=getDist(lpos,o.POS)
	if(t<dist)
	{
		dist := t
		id := i
	}
}
PED := getPedById(id)
return PED
}
getClosestPlayerId() {
dist := 0x7fffffff
p := getStreamedInPlayersInfo()
if(!p)
	return -1
lpos := getCoordinates()
if(!lpos)
	return -1
id := -1
For i, o in p
{
	t:=getDist(lpos,o.POS)
	if(t<dist)
	{
		dist := t
		id := i
	}
}
return id
}
CountOnlinePlayers() {
if(!checkHandles())
	return -1
dwOnline := readDWORD(hGTA, dwSAMP + 0x21A0B4)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
dwAddr := dwOnline + 0x4
OnlinePlayers := readDWORD(hGTA, dwAddr)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return OnlinePlayers
}
getPedCoordinates(dwPED) {
dwPED += 0
dwPED := Floor(dwPED)
if(!dwPED)
	return ""
if(!checkHandles())
	return ""
dwAddress := readDWORD(hGTA, dwPED + 0x14)
if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
	return ""
}
fX := readFloat(hGTA, dwAddress + 0x30)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return ""
}
fY := readFloat(hGTA, dwAddress + 0x34)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return ""
}
fZ := readFloat(hGTA, dwAddress + 0x38)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return ""
}
ErrorLevel := ERROR_OK
return [fX, fY, fZ]
}
getTargetPos(dwId) {
dwId += 0
dwId := Floor(dwId)
if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
	return ""
if(iRefreshScoreboard+iUpdateTick > A_TickCount)
{
	if(oScoreboardData[dwId])
	{
		if(oScoreboardData[dwId].HasKey("PED"))
			return getPedCoordinates(oScoreboardData[dwId].PED)
		if(oScoreboardData[dwId].HasKey("MPOS"))
			return oScoreboardData[dwId].MPOS
	}
	return ""
}
if(!updateOScoreboardData())
	return ""
if(oScoreboardData[dwId])
{
	if(oScoreboardData[dwId].HasKey("PED"))
		return getPedCoordinates(oScoreboardData[dwId].PED)
	if(oScoreboardData[dwId].HasKey("MPOS"))
		return oScoreboardData[dwId].MPOS
}
return ""
}
getTargetPlayerSkinIdByPed(dwPED) {
if(!checkHandles())
	return -1
dwAddr := dwPED + ADDR_CPED_SKINIDOFF
SkinID := readMem(hGTA, dwAddr, 2, "byte")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return SkinID
}
getTargetPlayerSkinIdById(dwId) {
if(!checkHandles())
	return -1
dwPED := getPedById(dwId)
dwAddr := dwPED + ADDR_CPED_SKINIDOFF
SkinID := readMem(hGTA, dwAddr, 2, "byte")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return SkinID
}
NearPlayerInCar(dist)
{
TempDist := 100000
if(!p := getStreamedInPlayersInfo())
	return false
if(!lpos := getCoordinates())
	return false
for i, o in p
{
	t := getDist(lpos, o.POS)
	if(t <= dist)
	{
		if(t < TempDist && t > 5 && isTargetInAnyVehiclebyId(o.ID))
			TempId := i, TempDist := t
	}
}
return TempId
}
getVehiclePointerByPed(dwPED) {
dwPED += 0
dwPED := Floor(dwPED)
if(!dwPED)
	return 0
if(!checkHandles())
	return 0
dwAddress := readDWORD(hGTA, dwPED + 0x58C)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
return dwAddress
}
getVehiclePointerById(dwId) {
if(!dwId)
	return 0
if(!checkHandles())
	return 0
dwPed_By_Id := getPedById(dwId)
dwAddress := readDWORD(hGTA, dwPed_By_Id + 0x58C)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
return dwAddress
}
isTargetInAnyVehicleByPed(dwPED)
{
if(!checkHandles())
	return -1
dwVehiclePointer := getVehiclePointerByPed(dwPedPointer)
if(dwVehiclePointer > 0)
{
	return 1
}
else if(dwVehiclePointer <= 0)
{
	return 0
}
else
{
	return -1
}
}
isTargetInAnyVehiclebyId(dwId)
{
if(!checkHandles())
	return -1
dwPedPointer := getPedById(dwId)
dwVehiclePointer := getVehiclePointerByPed(dwPedPointer)
if(dwVehiclePointer > 0)
{
	return 1
}
else if(dwVehiclePointer <= 0)
{
	return 0
}
else
{
	return -1
}
}
getTargetVehicleHealthByPed(dwPed) {
if(!checkHandles())
	return -1
dwVehPtr := getVehiclePointerByPed(dwPed)
dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
fHealth := readFloat(hGTA, dwAddr)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return Round(fHealth)
}
getTargetVehicleHealthById(dwId) {
if(!checkHandles())
	return -1
dwVehPtr := getVehiclePointerById(dwId)
dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
fHealth := readFloat(hGTA, dwAddr)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return Round(fHealth)
}
getTargetVehicleTypeByPed(dwPED) {
if(!checkHandles())
	return 0
dwAddr := getVehiclePointerByPed(dwPED)
if(!dwAddr)
	return 0
cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_TYPE, 1, "Char")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
if(!cVal)
{
	mid := getVehicleModelId()
	Loop % oAirplaneModels.MaxIndex()
	{
		if(oAirplaneModels[A_Index]==mid)
			return 5
	}
	return 1
}
else if(cVal==5)
	return 2
else if(cVal==6)
	return 3
else if(cVal==9)
{
	mid := getVehicleModelId()
	Loop % oBikeModels.MaxIndex()
	{
		if(oBikeModels[A_Index]==mid)
			return 6
	}
	return 4
}
return 0
}
WM_HELP(){
IniRead, vupd, %a_temp%/verlen.ini, UPD, v
IniRead, desupd, %a_temp%/verlen.ini, UPD, des
desupd := Utf8ToAnsi(desupd)
IniRead, updupd, %a_temp%/verlen.ini, UPD, upd
updupd := Utf8ToAnsi(updupd)
msgbox, , Список изменений версии %vupd%, %updupd%
return
}
getTargetVehicleTypeById(dwId) {
if(!checkHandles())
	return 0
dwAddr := getVehiclePointerById(dwId)
if(!dwAddr)
	return 0
cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_TYPE, 1, "Char")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
if(!cVal)
{
	mid := getVehicleModelId()
	Loop % oAirplaneModels.MaxIndex()
	{
		if(oAirplaneModels[A_Index]==mid)
			return 5
	}
	return 1
}
else if(cVal==5)
	return 2
else if(cVal==6)
	return 3
else if(cVal==9)
{
	mid := getVehicleModelId()
	Loop % oBikeModels.MaxIndex()
	{
		if(oBikeModels[A_Index]==mid)
			return 6
	}
	return 4
}
return 0
}
getTargetVehicleModelIdByPed(dwPED) {
if(!checkHandles())
	return 0
dwAddr := getVehiclePointerByPed(dwPED)
if(!dwAddr)
	return 0
sVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_MODEL, 2, "Short")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
return sVal
}
getTargetVehicleModelIdById(dwId) {
if(!checkHandles())
	return 0
dwAddr := getVehiclePointerById(dwId)
if(!dwAddr)
	return 0
sVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_MODEL, 2, "Short")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
return sVal
}
getTargetVehicleModelNameByPed(dwPED) {
id := getTargetVehicleModelIdByPed(dwPED)
if(id > 400 && id < 611)
{
	return ovehicleNames[id-399]
}
return ""
}
getTargetVehicleModelNameById(dwId) {
id := getTargetVehicleModelIdById(dwId)
if(id > 400 && id < 611)
{
	return ovehicleNames[id-399]
}
return ""
}
getTargetVehicleModelNameByIdDop(dwId) {
id := getTargetVehicleModelIdById(dwId)
if(id > 400 && id < 611)
{
	return ovehicleNamesImpad[id-399]
}
return ""
}
getTargetVehicleLightStateByPed(dwPED) {
if(!checkHandles())
	return -1
dwAddr := getVehiclePointerByPed(dwPED)
if(!dwAddr)
	return -1
dwVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_LIGHTSTATE, 1, "byte")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return (dwVal>0)
}
getTargetVehicleLightStateById(dwId) {
if(!checkHandles())
	return -1
dwAddr := getVehiclePointerById(dwId)
if(!dwAddr)
	return -1
dwVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_LIGHTSTATE, 1, "byte")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return (dwVal>0)
}
getTargetVehicleLockStateByPed(dwPED) {
if(!checkHandles())
	return -1
dwAddr := getVehiclePointerByPed(dwPED)
if(!dwAddr)
	return -1
dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DOORSTATE)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return (dwVal==2)
}
getTargetVehicleLockStateById(dwId) {
if(!checkHandles())
	return -1
dwAddr := getVehiclePointerById(dwId)
if(!dwAddr)
	return -1
dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DOORSTATE)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return (dwVal==2)
}
getTargetVehicleColor1byPed(dwPED) {
if(!checkHandles())
	return 0
dwAddr := getVehiclePointerByPed(dwPED)
if(!dwAddr)
	return 0
sVal := readMem(hGTA, dwAddr + 1076, 1, "byte")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
return sVal
}
getTargetVehicleColor1byId(dwId) {
if(!checkHandles())
	return 0
dwAddr := getVehiclePointerById(dwId)
if(!dwAddr)
	return 0
sVal := readMem(hGTA, dwAddr + 1076, 1, "byte")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
return sVal
}
getTargetVehicleColor2byPed(dwPED) {
if(!checkHandles())
	return 0
dwAddr := getVehiclePointerByPed(dwPED)
if(!dwAddr)
	return 0
sVal := readMem(hGTA, dwAddr + 1077, 1, "byte")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
return sVal
}
getTargetVehicleColor2byId(dwId) {
if(!checkHandles())
	return 0
dwAddr := getVehiclePointerById(dwId)
if(!dwAddr)
	return 0
sVal := readMem(hGTA, dwAddr + 1077, 1, "byte")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
return sVal
}
getTargetVehicleSpeedByPed(dwPED) {
if(!checkHandles())
	return -1
dwAddr := getVehiclePointerByPed(dwPED)
fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
fSpeedZ := readMem(hGTA, dwAddr + ADDR_VEHICLE_Z, 4, "float")
fVehicleSpeed :=  sqrt((fSpeedX * fSpeedX) + (fSpeedY * fSpeedY) + (fSpeedZ * fSpeedZ))
fVehicleSpeed := (fVehicleSpeed * 100) * 1.43
return fVehicleSpeed
}
getTargetVehicleSpeedById(dwId) {
if(!checkHandles())
	return -1
dwAddr := getVehiclePointerById(dwId)
fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
fSpeedZ := readMem(hGTA, dwAddr + ADDR_VEHICLE_Z, 4, "float")
fVehicleSpeed :=  sqrt((fSpeedX * fSpeedX) + (fSpeedY * fSpeedY) + (fSpeedZ * fSpeedZ))
fVehicleSpeed := (fVehicleSpeed * 100) * 1.43
return fVehicleSpeed
}
getPlayerNameById(dwId) {
dwId += 0
dwId := Floor(dwId)
if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
	return ""
if(iRefreshScoreboard+iUpdateTick > A_TickCount)
{
	if(oScoreboardData[dwId])
		return oScoreboardData[dwId].NAME
	return ""
}
if(!updateOScoreboardData())
	return ""
if(oScoreboardData[dwId])
	return oScoreboardData[dwId].NAME
return ""
}
getPlayerIdByName(wName) {
wName := "" wName
if(StrLen(wName) < 1 || StrLen(wName) > 24)
	return -1
if(iRefreshScoreboard+iUpdateTick > A_TickCount)
{
	For i, o in oScoreboardData
	{
		if(InStr(o.NAME,wName)==1)
			return i
	}
	return -1
}
if(!updateOScoreboardData())
	return -1
For i, o in oScoreboardData
{
	if(InStr(o.NAME,wName)==1)
		return i
}
return -1
}
getPlayerScoreById(dwId) {
dwId += 0
dwId := Floor(dwId)
if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
	return ""
if(iRefreshScoreboard+iUpdateTick > A_TickCount)
{
	if(oScoreboardData[dwId])
		return oScoreboardData[dwId].SCORE
	return ""
}
if(!updateOScoreboardData())
	return ""
if(oScoreboardData[dwId])
	return oScoreboardData[dwId].SCORE
return ""
}
getPlayerPingById(dwId) {
dwId += 0
dwId := Floor(dwId)
if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
	return -1
if(iRefreshScoreboard+iUpdateTick > A_TickCount)
{
	if(oScoreboardData[dwId])
		return oScoreboardData[dwId].PING
	return -1
}
if(!updateOScoreboardData())
	return -1
if(oScoreboardData[dwId])
	return oScoreboardData[dwId].PING
return -1
}
isNPCById(dwId) {
dwId += 0
dwId := Floor(dwId)
if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
	return -1
if(iRefreshScoreboard+iUpdateTick > A_TickCount)
{
	if(oScoreboardData[dwId])
		return oScoreboardData[dwId].ISNPC
	return -1
}
if(!updateOScoreboardData())
	return -1
if(oScoreboardData[dwId])
	return oScoreboardData[dwId].ISNPC
return -1
}
updateScoreboardDataEx() {
if(!checkHandles())
	return false
dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
	return false
}
dwFunc := dwSAMP + FUNC_UPDATESCOREBOARD
VarSetCapacity(injectData, 11, 0)
NumPut(0xB9, injectData, 0, "UChar")
NumPut(dwAddress, injectData, 1, "UInt")
NumPut(0xE8, injectData, 5, "UChar")
offset := dwFunc - (pInjectFunc + 10)
NumPut(offset, injectData, 6, "Int")
NumPut(0xC3, injectData, 10, "UChar")
writeRaw(hGTA, pInjectFunc, &injectData, 11)
if(ErrorLevel)
	return false
hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
if(ErrorLevel)
	return false
waitForSingleObject(hThread, 0xFFFFFFFF)
closeProcess(hThread)
return true
}
updateOScoreboardData() {
if(!checkHandles())
	return 0
oScoreboardData := []
if(!updateScoreboardDataEx())
	return 0
iRefreshScoreboard := A_TickCount
dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
dwAddress := readDWORD(hGTA, dwAddress + SAMP_PPOOLS_OFFSET)
if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
dwPlayers := readDWORD(hGTA, dwAddress + SAMP_PPOOL_PLAYER_OFFSET)
if(ErrorLevel || dwPlayers==0) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
wID := readMem(hGTA, dwPlayers + SAMP_SLOCALPLAYERID_OFFSET, 2, "Short")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
dwPing := readMem(hGTA, dwPlayers + SAMP_ILOCALPLAYERPING_OFFSET, 4, "Int")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
dwScore := readMem(hGTA, dwPlayers + SAMP_ILOCALPLAYERSCORE_OFFSET, 4, "Int")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
dwTemp := readMem(hGTA, dwPlayers + SAMP_ISTRLEN_LOCALPLAYERNAME_OFFSET, 4, "Int")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
sUsername := ""
if(dwTemp <= 0xf) {
		sUsername := readString(hGTA, dwPlayers + SAMP_SZLOCALPLAYERNAME_OFFSET, 16)
	if(ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
}
else {
		dwAddress := readDWORD(hGTA, dwPlayers + SAMP_PSZLOCALPLAYERNAME_OFFSET)
	if(ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
	sUsername := readString(hGTA, dwAddress, 25)
	if(ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
}
oScoreboardData[wID] := Object("NAME", sUsername, "ID", wID, "PING", dwPing, "SCORE", dwScore, "ISNPC", 0)
Loop, % SAMP_PLAYER_MAX
{
	i := A_Index-1
	dwRemoteplayer := readDWORD(hGTA, dwPlayers+SAMP_PREMOTEPLAYER_OFFSET+i*4)
	if(ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
	if(dwRemoteplayer==0)
		continue
	dwPing := readMem(hGTA, dwRemoteplayer + SAMP_IPING_OFFSET, 4, "Int")
	if(ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
	dwScore := readMem(hGTA, dwRemoteplayer + SAMP_ISCORE_OFFSET, 4, "Int")
	if(ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
	dwIsNPC := readMem(hGTA, dwRemoteplayer + SAMP_ISNPC_OFFSET, 4, "Int")
	if(ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
	dwTemp := readMem(hGTA, dwRemoteplayer + SAMP_ISTRLENNAME___OFFSET, 4, "Int")
	if(ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
	sUsername := ""
	if(dwTemp <= 0xf)
	{
		sUsername := readString(hGTA, dwRemoteplayer+SAMP_SZPLAYERNAME_OFFSET, 16)
		if(ErrorLevel) {
				ErrorLevel := ERROR_READ_MEMORY
			return 0
		}
	}
	else {
			dwAddress := readDWORD(hGTA, dwRemoteplayer + SAMP_PSZPLAYERNAME_OFFSET)
		if(ErrorLevel || dwAddress==0) {
				ErrorLevel := ERROR_READ_MEMORY
			return 0
		}
		sUsername := readString(hGTA, dwAddress, 25)
		if(ErrorLevel) {
				ErrorLevel := ERROR_READ_MEMORY
			return 0
		}
	}
	o := Object("NAME", sUsername, "ID", i, "PING", dwPing, "SCORE", dwScore, "ISNPC", dwIsNPC)
	oScoreboardData[i] := o
	dwRemoteplayerData := readDWORD(hGTA, dwRemoteplayer + 0x0)
	if(ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
	if(dwRemoteplayerData==0)
		continue
	dwAddress := readDWORD(hGTA, dwRemoteplayerData + 489)
	if(ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
	if(dwAddress)
	{
		ix := readMem(hGTA, dwRemoteplayerData + 493, 4, "Int")
		if(ErrorLevel) {
				ErrorLevel := ERROR_READ_MEMORY
			return 0
		}
		iy := readMem(hGTA, dwRemoteplayerData + 497, 4, "Int")
		if(ErrorLevel) {
				ErrorLevel := ERROR_READ_MEMORY
			return 0
		}
		iz := readMem(hGTA, dwRemoteplayerData + 501, 4, "Int")
		if(ErrorLevel) {
				ErrorLevel := ERROR_READ_MEMORY
			return 0
		}
		o.MPOS := [ix, iy, iz]
	}
	dwpSAMP_Actor := readDWORD(hGTA, dwRemoteplayerData + 0x0)
	if(ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
	if(dwpSAMP_Actor==0)
		continue
	dwPed := readDWORD(hGTA, dwpSAMP_Actor + 676)
	if(ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
	if(dwPed==0)
		continue
	o.PED := dwPed
	fHP := readFloat(hGTA, dwRemoteplayerData + 444)
	if(ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
	fARMOR := readFloat(hGTA, dwRemoteplayerData + 440)
	if(ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
	o.HP := fHP
	o.ARMOR := fARMOR
}
ErrorLevel := ERROR_OK
return 1
}
GetChatLine(Line, ByRef Output, timestamp=0, color=0){
chatindex := 0
FileRead, file, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
loop, Parse, file, `n, `r
{
	if(A_LoopField)
		chatindex := A_Index
}
loop, Parse, file, `n, `r
{
	if(A_Index = chatindex - line){
			output := A_LoopField
		break
	}
}
file := ""
if(!timestamp)
	output := RegExReplace(output, "U)^\[\d{2}:\d{2}:\d{2}\]")
if(!color)
	output := RegExReplace(output, "Ui)\{[a-f0-9]{6}\}")
return
}
getPlayerHealth() {
if(!checkHandles())
	return -1
dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
dwAddr := dwCPedPtr + ADDR_CPED_HPOFF
fHealth := readFloat(hGTA, dwAddr)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return Round(fHealth)
}
getPlayerArmor() {
if(!checkHandles())
	return -1
dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
dwAddr := dwCPedPtr + ADDR_CPED_ARMOROFF
fHealth := readFloat(hGTA, dwAddr)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return Round(fHealth)
}
getPlayerInteriorId() {
if(!checkHandles())
	return -1
iid := readMem(hGTA, ADDR_CPED_INTID, 4, "Int")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return iid
}
URIEncode(str, encoding := "UTF-8")
{
PrevFormat := A_FormatInteger
SetFormat, IntegerFast, H
VarSetCapacity(var, StrPut(str, encoding))
StrPut(str, &var, encoding)
While code := NumGet(Var, A_Index - 1, "UChar")
{
	bool := (code > 0x7F || code < 0x30 || code = 0x3D)
	UrlStr .= bool ? "%" . SubStr("0" . SubStr(code, 3), -1) : Chr(code)
}
SetFormat, IntegerFast, % PrevFormat
Return UrlStr
}
TextSeparator(ZText, arg) {
str := StrSplit(ZText, A_Space)
rtext := ""
ttext := ""
While (str.MaxIndex() != "") {
	if (strlen(str[1]) = arg) {
			rtext .= "" . str[1] . "`n"
		str.Remove(1)
		} else if (strlen(str[1]) < arg) {
		ttext := str[1]
		str.Remove(1)
		Loop {
			var := strlen(ttext) + strlen(str[1]) + 1
			if (var = arg) {
					rtext .= "" . ttext . " " . str1 . "`n"
				str.Remove(1)
				ttext := ""
				break
				} else if (var < arg) {
				ttext .= " " . str[1] . ""
				str.Remove(1)
				continue
				} else {
				rtext .= "" . ttext . "`n"
				ttext := ""
				break
			}
		}
		} else {
		return, false
	}
}
return, %rtext%
}
getPlayerSkinID() {
if(!checkHandles())
	return -1
dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
dwAddr := dwCPedPtr + ADDR_CPED_SKINIDOFF
SkinID := readMem(hGTA, dwAddr, 2, "byte")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return SkinID
}
getPlayerMoney() {
if(!checkHandles())
	return ""
money := readMem(hGTA, ADDR_CPED_MONEY, 4, "Int")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return ""
}
ErrorLevel := ERROR_OK
return money
}
getPlayerWanteds() {
if(!checkHandles())
	return -1
dwPtr := 0xB7CD9C
dwPtr := readDWORD(hGTA, dwPtr)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
Wanteds := readDWORD(hGTA, dwPtr)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return Wanteds
}
getPlayerWeaponId() {
if(!checkHandles())
	return 0
WaffenId := readMem(hGTA, 0xBAA410, 4, "byte")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
return WaffenId
}
getPlayerWeaponName() {
id := getPlayerWeaponId()
if(id >= 0 && id < 44)
{
	return oweaponNames[id+1]
}
return ""
}
getPlayerState() {
if(!checkHandles())
	return -1
dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
State := readDWORD(hGTA, dwCPedPtr + 0x530)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return State
}
IsPlayerInMenu() {
if(!checkHandles())
	return -1
IsInMenu := readMem(hGTA, 0xBA67A4, 4, "byte")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return IsInMenu
}
getPlayerMapPosX() {
if(!checkHandles())
	return -1
MapPosX := readFloat(hGTA, 0xBA67B8)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return MapPosX
}
getPlayerMapPosY() {
if(!checkHandles())
	return -1
MapPosY := readFloat(hGTA, 0xBA67BC)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return MapPosY
}
getPlayerMapZoom() {
if(!checkHandles())
	return -1
MapZoom := readFloat(hGTA, 0xBA67AC)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return MapZoom
}
IsPlayerFreezed() {
if(!checkHandles())
	return -1
dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
IPF := readMem(hGTA, dwGTA + 0x690495, 2, "byte")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return IPF
}
isPlayerInAnyVehicle()
{
if(!checkHandles())
	return -1
dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
return (dwVehPtr > 0)
}
isPlayerDriver() {
if(!checkHandles())
	return -1
dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
if(!dwAddr)
	return -1
dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DRIVER)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return (dwVal==dwCPedPtr)
}
getVehicleHealth() {
if(!checkHandles())
	return -1
dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
fHealth := readFloat(hGTA, dwAddr)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return Round(fHealth)
}
getVehicleType() {
if(!checkHandles())
	return 0
dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
if(!dwAddr)
	return 0
cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_TYPE, 1, "Char")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
if(!cVal)
{
	mid := getVehicleModelId()
	Loop % oAirplaneModels.MaxIndex()
	{
		if(oAirplaneModels[A_Index]==mid)
			return 5
	}
	return 1
}
else if(cVal==5)
	return 2
else if(cVal==6)
	return 3
else if(cVal==9)
{
	mid := getVehicleModelId()
	Loop % oBikeModels.MaxIndex()
	{
		if(oBikeModels[A_Index]==mid)
			return 6
	}
	return 4
}
return 0
}
getVehicleModelId() {
if(!checkHandles())
	return 0
dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
if(!dwAddr)
	return 0
sVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_MODEL, 2, "Short")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
return sVal
}
getVehicleModelName() {
id:=getVehicleModelId()
if(id > 400 && id < 611)
{
	return ovehicleNames[id-399]
}
return ""
}
getVehicleLightState() {
if(!checkHandles())
	return -1
dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
if(!dwAddr)
	return -1
dwVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_LIGHTSTATE, 1, "byte")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return (dwVal>0)
}
getVehicleEngineState() {
if(!checkHandles())
	return -1
dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
if(!dwAddr)
	return -1
cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_ENGINESTATE, 1, "Char")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return (cVal==24 || cVal==56 || cVal==88 || cVal==120)
}
getVehicleSirenState() {
if(!checkHandles())
	return -1
dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
if(!dwAddr)
	return -1
cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_SIRENSTATE, 1, "Char")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return (cVal==-48)
}
getVehicleLockState() {
if(!checkHandles())
	return -1
dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
if(!dwAddr)
	return -1
dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DOORSTATE)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return (dwVal==2)
}
getVehicleColor1() {
if(!checkHandles())
	return 0
dwAddr := readDWORD(hGTA, 0xBA18FC)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
if(!dwAddr)
	return 0
sVal := readMem(hGTA, dwAddr + 1076, 1, "byte")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
return sVal
}
getVehicleColor2() {
if(!checkHandles())
	return 0
dwAddr := readDWORD(hGTA, 0xBA18FC)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
if(!dwAddr)
	return 0
sVal := readMem(hGTA, dwAddr + 1077, 1, "byte")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
return sVal
}
timeconv(timeone){
if (timeone=="")
	return 00
if (StrLen(timeone)==1)
	timeone := "0"timeone
return timeone
}
getVehicleSpeed() {
if(!checkHandles())
	return -1
dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return ""
}
fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
fSpeedZ := readMem(hGTA, dwAddr + ADDR_VEHICLE_Z, 4, "float")
fVehicleSpeed :=  sqrt((fSpeedX * fSpeedX) + (fSpeedY * fSpeedY) + (fSpeedZ * fSpeedZ))
fVehicleSpeed := (fVehicleSpeed * 100) * 1.43
return fVehicleSpeed
}
getPlayerRadiostationID() {
if(!checkHandles())
	return -1
if(isPlayerInAnyVehicle() == 0)
	return -1
dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
RadioStationID := readMem(hGTA, dwGTA + 0x4CB7E1, 1, "byte")
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
return RadioStationID
}
getPlayerRadiostationName() {
if(isPlayerInAnyVehicle() == 0)
	return -1
id := getPlayerRadiostationID()
if(id == 0)
	return -1
if(id >= 0 && id < 14)
{
	return oradiostationNames[id]
}
return ""
}
setCheckpoint(fX, fY, fZ, fSize ) {
if(!checkHandles())
	return false
dwFunc := dwSAMP + 0x9D340
dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_INCHAT_PTR)
if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
	return false
}
VarSetCapacity(buf, 16, 0)
NumPut(fX, buf, 0, "Float")
NumPut(fY, buf, 4, "Float")
NumPut(fZ, buf, 8, "Float")
NumPut(fSize, buf, 12, "Float")
writeRaw(hGTA, pParam1, &buf, 16)
dwLen := 31
VarSetCapacity(injectData, dwLen, 0)
NumPut(0xB9, injectData, 0, "UChar")
NumPut(dwAddress, injectData, 1, "UInt")
NumPut(0x68, injectData, 5, "UChar")
NumPut(pParam1+12, injectData, 6, "UInt")
NumPut(0x68, injectData, 10, "UChar")
NumPut(pParam1, injectData, 11, "UInt")
NumPut(0xE8, injectData, 15, "UChar")
offset := dwFunc - (pInjectFunc + 20)
NumPut(offset, injectData, 16, "Int")
NumPut(0x05C7, injectData, 20, "UShort")
NumPut(dwAddress+0x24, injectData, 22, "UInt")
NumPut(1, injectData, 26, "UInt")
NumPut(0xC3, injectData, 30, "UChar")
writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
if(ErrorLevel)
	return false
hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
if(ErrorLevel)
	return false
waitForSingleObject(hThread, 0xFFFFFFFF)
closeProcess(hThread)
ErrorLevel := ERROR_OK
return true
}
disableCheckpoint()
{
if(!checkHandles())
	return false
dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_INCHAT_PTR)
if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
	return false
}
VarSetCapacity(enablecp, 4, 0)
NumPut(0,enablecp,0,"Int")
writeRaw(hGTA, dwAddress+0x24, &enablecp, 4)
ErrorLevel := ERROR_OK
return true
}
IsMarkerCreated(){
If(!checkHandles())
return false
active := readMem(hGTA, CheckpointCheck, 1, "byte")
If(!active)
return 0
else return 1
	}
CoordsFromRedmarker(){
if(!checkhandles())
	return false
for i, v in rmaddrs
	f%i% := readFloat(hGTA, v)
return [f1, f2, f3]
}
getCoordinates() {
if(!checkHandles())
	return ""
fX := readFloat(hGTA, ADDR_POSITION_X)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return ""
}
fY := readFloat(hGTA, ADDR_POSITION_Y)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return ""
}
fZ := readFloat(hGTA, ADDR_POSITION_Z)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return ""
}
ErrorLevel := ERROR_OK
return [fX, fY, fZ]
}
GetPlayerPos(ByRef fX,ByRef fY,ByRef fZ) {
if(!checkHandles())
	return 0
fX := readFloat(hGTA, ADDR_POSITION_X)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
fY := readFloat(hGTA, ADDR_POSITION_Y)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
fZ := readFloat(hGTA, ADDR_POSITION_Z)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
}
getDialogStructPtr() {
if (!checkHandles()) {
		ErrorLevel := ERROR_INVALID_HANDLE
	return false
}
dwPointer := readDWORD(hGTA, dwSAMP + SAMP_DIALOG_STRUCT_PTR)
if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return false
}
ErrorLevel := ERROR_OK
return dwPointer
}
isDialogOpen() {
dwPointer := getDialogStructPtr()
if (ErrorLevel || !dwPointer)
	return false
dwIsOpen := readMem(hGTA, dwPointer + SAMP_DIALOG_OPEN_OFFSET, 4, "UInt")
if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return false
}
ErrorLevel := ERROR_OK
return dwIsOpen ? true : false
}
getDialogStyle() {
dwPointer := getDialogStructPtr()
if (ErrorLevel || !dwPointer)
	return -1
style := readMem(hGTA, dwPointer + SAMP_DIALOG_STYLE_OFFSET, 4, "UInt")
if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return style
}
getDialogID() {
dwPointer := getDialogStructPtr()
if (ErrorLevel || !dwPointer)
	return -1
id := readMem(hGTA, dwPointer + SAMP_DIALOG_ID_OFFSET, 4, "UInt")
if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
return id
}
setDialogID(id) {
dwPointer := getDialogStructPtr()
if (ErrorLevel || !dwPointer)
	return false
writeMemory(hGTA, dwPointer + SAMP_DIALOG_ID_OFFSET, id, "UInt", 4)
if (ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
	return false
}
ErrorLevel := ERROR_OK
return true
}
getDialogCaption() {
dwPointer := getDialogStructPtr()
if (ErrorLevel || !dwPointer)
	return ""
text := readString(hGTA, dwPointer + SAMP_DIALOG_CAPTION_OFFSET, 64)
if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return ""
}
ErrorLevel := ERROR_OK
return text
}
getDialogTextSize(dwAddress) {
i := 0
Loop, 4096 {
	i := A_Index - 1
	byte := Memory_ReadByte(hGTA, dwAddress + i)
	if (!byte)
		break
}
return i
}
getDialogText() {
dwPointer := getDialogStructPtr()
if (ErrorLevel || !dwPointer)
	return ""
dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_TEXT_PTR_OFFSET)
if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return ""
}
text := readString(hGTA, dwPointer, 4096)
if (ErrorLevel) {
		text := readString(hGTA, dwPointer, getDialogTextSize(dwPointer))
	if (ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
		return ""
	}
}
ErrorLevel := ERROR_OK
return text
}
getDialogLineCount() {
dwPointer := getDialogStructPtr()
if (ErrorLevel || !dwPointer)
	return 0
dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR2_OFFSET)
if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
count := readMem(hGTA, dwPointer + SAMP_DIALOG_LINECOUNT_OFFSET, 4, "UInt")
if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
return count
}
getDialogLine__(index) {
if (getDialogLineCount > index)
	return ""
dwPointer := getDialogStructPtr()
if (ErrorLevel || !dwPointer)
	return ""
dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR1_OFFSET)
if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return ""
}
dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_LINES_OFFSET)
if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return ""
}
dwLineAddress := readDWORD(hGTA, dwPointer + (index - 1) * 0x4)
line := readString(hGTA, dwLineAddress, 128)
ErrorLevel := ERROR_OK
return line
}
getDialogLine(index) {
lines := getDialogLines()
if (index > lines.Length())
	return ""
if (getDialogStyle() == DIALOG_STYLE_TABLIST_HEADERS)
	index++
return lines[index]
}
getDialogLines() {
text := getDialogText()
if (text == "")
	return -1
lines := StrSplit(text, "`n")
return lines
}
getDialogLines__() {
count := getDialogLineCount()
dwPointer := getDialogStructPtr()
if (ErrorLevel || !dwPointer)
	return -1
dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR1_OFFSET)
if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_LINES_OFFSET)
if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
lines := []
Loop %count% {
	dwLineAddress := readDWORD(hGTA, dwPointer + (A_Index - 1) * 0x4)
	lines[A_Index] := readString(hGTA, dwLineAddress, 128)
}
ErrorLevel := ERROR_OK
return lines
}
showDialog(style, caption, text, button1, button2 := "", id := 1) {
style += 0
style := Floor(style)
id += 0
id := Floor(id)
caption := "" caption
text := "" text
button1 := "" button1
button2 := "" button2
if (id < 0 || id > 32767 || style < 0 || style > 5 || StrLen(caption) > 64 || StrLen(text) > 4096 || StrLen(button1) > 10 || StrLen(button2) > 10)
	return false
if (!checkHandles())
	return false
dwFunc := dwSAMP + FUNC_SAMP_SHOWDIALOG
sleep 200
dwAddress := readDWORD(hGTA, dwSAMP + SAMP_DIALOG_STRUCT_PTR)
if (ErrorLevel || !dwAddress) {
		ErrorLevel := ERROR_READ_MEMORY
	return false
}
writeString(hGTA, pParam5, caption)
if (ErrorLevel)
	return false
writeString(hGTA, pParam1, text)
if (ErrorLevel)
	return false
writeString(hGTA, pParam5 + 512, button1)
if (ErrorLevel)
	return false
writeString(hGTA, pParam5+StrLen(caption) + 1, button2)
if (ErrorLevel)
	return false
dwLen := 5 + 7 * 5 + 5 + 1
VarSetCapacity(injectData, dwLen, 0)
NumPut(0xB9, injectData, 0, "UChar")
NumPut(dwAddress, injectData, 1, "UInt")
NumPut(0x68, injectData, 5, "UChar")
NumPut(1, injectData, 6, "UInt")
NumPut(0x68, injectData, 10, "UChar")
NumPut(pParam5 + StrLen(caption) + 1, injectData, 11, "UInt")
NumPut(0x68, injectData, 15, "UChar")
NumPut(pParam5 + 512, injectData, 16, "UInt")
NumPut(0x68, injectData, 20, "UChar")
NumPut(pParam1, injectData, 21, "UInt")
NumPut(0x68, injectData, 25, "UChar")
NumPut(pParam5, injectData, 26, "UInt")
NumPut(0x68, injectData, 30, "UChar")
NumPut(style, injectData, 31, "UInt")
NumPut(0x68, injectData, 35, "UChar")
NumPut(id, injectData, 36, "UInt")
NumPut(0xE8, injectData, 40, "UChar")
offset := dwFunc - (pInjectFunc + 45)
NumPut(offset, injectData, 41, "Int")
NumPut(0xC3, injectData, 45, "UChar")
writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
if (ErrorLevel)
	return false
hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
if (ErrorLevel)
	return false
waitForSingleObject(hThread, 0xFFFFFFFF)
closeProcess(hThread)
return true
}
initZonesAndCities() {
AddCity("Las Venturas", 685.0, 476.093, -500.0, 3000.0, 3000.0, 500.0)
AddCity("San Fierro", -3000.0, -742.306, -500.0, -1270.53, 1530.24, 500.0)
AddCity("San Fierro", -1270.53, -402.481, -500.0, -1038.45, 832.495, 500.0)
AddCity("San Fierro", -1038.45, -145.539, -500.0, -897.546, 376.632, 500.0)
AddCity("Los Santos", 480.0, -3000.0, -500.0, 3000.0, -850.0, 500.0)
AddCity("Los Santos", 80.0, -2101.61, -500.0, 1075.0, -1239.61, 500.0)
AddCity("Tierra Robada", -1213.91, 596.349, -242.99, -480.539, 1659.68, 900.0)
AddCity("Red County", -1213.91, -768.027, -242.99, 2997.06, 596.349, 900.0)
AddCity("Flint County", -1213.91, -2892.97, -242.99, 44.6147, -768.027, 900.0)
AddCity("Whetstone", -2997.47, -2892.97, -242.99, -1213.91, -1115.58, 900.0)
AddZone("A-1", -3000.000000,2750.000000,-500,-2750.000000,3000.000000,500)
AddZone("A-2", -2750.000000,2750.000000,-500,-2500.000000,3000.000000,500)
AddZone("A-3", -2500.000000,2750.000000,-500,-2250.000000,3000.000000,500)
AddZone("A-4", -2250.000000,2750.000000,-500,-2000.000000,3000.000000,500)
AddZone("A-5", -2000.000000,2750.000000,-500,-1750.000000,3000.000000,500)
AddZone("A-6", -1750.000000,2750.000000,-500,-1500.000000,3000.000000,500)
AddZone("A-7", -1500.000000,2750.000000,-500,-1250.000000,3000.000000,500)
AddZone("A-8", -1250.000000,2750.000000,-500,-1000.000000,3000.000000,500)
AddZone("A-9", -1000.000000,2750.000000,-500,-750.000000,3000.000000,500)
AddZone("A-10", -750.000000,2750.000000,-500,-500.000000,3000.000000,500)
AddZone("A-11", -500.000000,2750.000000,-500,-250.000000,3000.000000,500)
AddZone("A-12", -250.000000,2750.000000,-500,0.000000,3000.000000,500)
AddZone("A-13", 0.000000,2750.000000,-500,250.000000,3000.000000,500)
AddZone("A-14", 250.000000,2750.000000,-500,500.000000,3000.000000,500)
AddZone("A-15", 500.000000,2750.000000,-500,750.000000,3000.000000,500)
AddZone("A-16", 750.000000,2750.000000,-500,1000.000000,3000.000000,500)
AddZone("A-17", 1000.000000,2750.000000,-500,1250.000000,3000.000000,500)
AddZone("A-18", 1250.000000,2750.000000,-500,1500.000000,3000.000000,500)
AddZone("A-19", 1500.000000,2750.000000,-500,1750.000000,3000.000000,500)
AddZone("A-20", 1750.000000,2750.000000,-500,2000.000000,3000.000000,500)
AddZone("A-21", 2000.000000,2750.000000,-500,2250.000000,3000.000000,500)
AddZone("A-22", 2250.000000,2750.000000,-500,2500.000000,3000.000000,500)
AddZone("A-23", 2500.000000,2750.000000,-500,2750.000000,3000.000000,500)
AddZone("A-24", 2750.000000,2750.000000,-500,3000.000000,3000.000000,500)
AddZone("Б-1", -3000.000000,2500.000000,-500,-2750.000000,2750.000000,500)
AddZone("Б-2", -2750.000000,2500.000000,-500,-2500.000000,2750.000000,500)
AddZone("Б-3", -2500.000000,2500.000000,-500,-2250.000000,2750.000000,500)
AddZone("Б-4", -2250.000000,2500.000000,-500,-2000.000000,2750.000000,500)
AddZone("Б-5", -2000.000000,2500.000000,-500,-1750.000000,2750.000000,500)
AddZone("Б-6", -1750.000000,2500.000000,-500,-1500.000000,2750.000000,500)
AddZone("Б-7", -1500.000000,2500.000000,-500,-1250.000000,2750.000000,500)
AddZone("Б-8", -1250.000000,2500.000000,-500,-1000.000000,2750.000000,500)
AddZone("Б-9", -1000.000000,2500.000000,-500,-750.000000,2750.000000,500)
AddZone("Б-10", -750.000000,2500.000000,-500,-500.000000,2750.000000,500)
AddZone("Б-11", -500.000000,2500.000000,-500,-250.000000,2750.000000,500)
AddZone("Б-12", -250.000000,2500.000000,-500,0.000000,2750.000000,500)
AddZone("Б-13", 0.000000,2500.000000,-500,250.000000,2750.000000,500)
AddZone("Б-14", 250.000000,2500.000000,-500,500.000000,2750.000000,500)
AddZone("Б-15", 500.000000,2500.000000,-500,750.000000,2750.000000,500)
AddZone("Б-16", 750.000000,2500.000000,-500,1000.000000,2750.000000,500)
AddZone("Б-17", 1000.000000,2500.000000,-500,1250.000000,2750.000000,500)
AddZone("Б-18", 1250.000000,2500.000000,-500,1500.000000,2750.000000,500)
AddZone("Б-19", 1500.000000,2500.000000,-500,1750.000000,2750.000000,500)
AddZone("Б-20", 1750.000000,2500.000000,-500,2000.000000,2750.000000,500)
AddZone("Б-21", 2000.000000,2500.000000,-500,2250.000000,2750.000000,500)
AddZone("Б-22", 2250.000000,2500.000000,-500,2500.000000,2750.000000,500)
AddZone("Б-23", 2500.000000,2500.000000,-500,2750.000000,2750.000000,500)
AddZone("Б-24", 2750.000000,2500.000000,-500,3000.000000,2750.000000,500)
AddZone("В-1", -3000.000000,2250.000000,-500,-2750.000000,2500.000000,500)
AddZone("В-2", -2750.000000,2250.000000,-500,-2500.000000,2500.000000,500)
AddZone("В-3", -2500.000000,2250.000000,-500,-2250.000000,2500.000000,500)
AddZone("В-4", -2250.000000,2250.000000,-500,-2000.000000,2500.000000,500)
AddZone("В-5", -2000.000000,2250.000000,-500,-1750.000000,2500.000000,500)
AddZone("В-6", -1750.000000,2250.000000,-500,-1500.000000,2500.000000,500)
AddZone("В-7", -1500.000000,2250.000000,-500,-1250.000000,2500.000000,500)
AddZone("В-8", -1250.000000,2250.000000,-500,-1000.000000,2500.000000,500)
AddZone("В-9", -1000.000000,2250.000000,-500,-750.000000,2500.000000,500)
AddZone("В-10", -750.000000,2250.000000,-500,-500.000000,2500.000000,500)
AddZone("В-11", -500.000000,2250.000000,-500,-250.000000,2500.000000,500)
AddZone("В-12", -250.000000,2250.000000,-500,0.000000,2500.000000,500)
AddZone("В-13", 0.000000,2250.000000,-500,250.000000,2500.000000,500)
AddZone("В-14", 250.000000,2250.000000,-500,500.000000,2500.000000,500)
AddZone("В-15", 500.000000,2250.000000,-500,750.000000,2500.000000,500)
AddZone("В-16", 750.000000,2250.000000,-500,1000.000000,2500.000000,500)
AddZone("В-17", 1000.000000,2250.000000,-500,1250.000000,2500.000000,500)
AddZone("В-18", 1250.000000,2250.000000,-500,1500.000000,2500.000000,500)
AddZone("В-19", 1500.000000,2250.000000,-500,1750.000000,2500.000000,500)
AddZone("В-20", 1750.000000,2250.000000,-500,2000.000000,2500.000000,500)
AddZone("В-21", 2000.000000,2250.000000,-500,2250.000000,2500.000000,500)
AddZone("В-22", 2250.000000,2250.000000,-500,2500.000000,2500.000000,500)
AddZone("В-23", 2500.000000,2250.000000,-500,2750.000000,2500.000000,500)
AddZone("В-24", 2750.000000,2250.000000,-500,3000.000000,2500.000000,500)
AddZone("Г-1", -3000.000000,2000.000000,-500,-2750.000000,2250.000000,500)
AddZone("Г-2", -2750.000000,2000.000000,-500,-2500.000000,2250.000000,500)
AddZone("Г-3", -2500.000000,2000.000000,-500,-2250.000000,2250.000000,500)
AddZone("Г-4", -2250.000000,2000.000000,-500,-2000.000000,2250.000000,500)
AddZone("Г-5", -2000.000000,2000.000000,-500,-1750.000000,2250.000000,500)
AddZone("Г-6", -1750.000000,2000.000000,-500,-1500.000000,2250.000000,500)
AddZone("Г-7", -1500.000000,2000.000000,-500,-1250.000000,2250.000000,500)
AddZone("Г-8", -1250.000000,2000.000000,-500,-1000.000000,2250.000000,500)
AddZone("Г-9", -1000.000000,2000.000000,-500,-750.000000,2250.000000,500)
AddZone("Г-10", -750.000000,2000.000000,-500,-500.000000,2250.000000,500)
AddZone("Г-11", -500.000000,2000.000000,-500,-250.000000,2250.000000,500)
AddZone("Г-12", -250.000000,2000.000000,-500,0.000000,2250.000000,500)
AddZone("Г-13", 0.000000,2000.000000,-500,250.000000,2250.000000,500)
AddZone("Г-14", 250.000000,2000.000000,-500,500.000000,2250.000000,500)
AddZone("Г-15", 500.000000,2000.000000,-500,750.000000,2250.000000,500)
AddZone("Г-16", 750.000000,2000.000000,-500,1000.000000,2250.000000,500)
AddZone("Г-17", 1000.000000,2000.000000,-500,1250.000000,2250.000000,500)
AddZone("Г-18", 1250.000000,2000.000000,-500,1500.000000,2250.000000,500)
AddZone("Г-19", 1500.000000,2000.000000,-500,1750.000000,2250.000000,500)
AddZone("Г-20", 1750.000000,2000.000000,-500,2000.000000,2250.000000,500)
AddZone("Г-21", 2000.000000,2000.000000,-500,2250.000000,2250.000000,500)
AddZone("Г-22", 2250.000000,2000.000000,-500,2500.000000,2250.000000,500)
AddZone("Г-23", 2500.000000,2000.000000,-500,2750.000000,2250.000000,500)
AddZone("Г-24", 2750.000000,2000.000000,-500,3000.000000,2250.000000,500)
AddZone("Д-1", -3000.000000,1750.000000,-500,-2750.000000,2000.000000,500)
AddZone("Д-2", -2750.000000,1750.000000,-500,-2500.000000,2000.000000,500)
AddZone("Д-3", -2500.000000,1750.000000,-500,-2250.000000,2000.000000,500)
AddZone("Д-4", -2250.000000,1750.000000,-500,-2000.000000,2000.000000,500)
AddZone("Д-5", -2000.000000,1750.000000,-500,-1750.000000,2000.000000,500)
AddZone("Д-6", -1750.000000,1750.000000,-500,-1500.000000,2000.000000,500)
AddZone("Д-7", -1500.000000,1750.000000,-500,-1250.000000,2000.000000,500)
AddZone("Д-8", -1250.000000,1750.000000,-500,-1000.000000,2000.000000,500)
AddZone("Д-9", -1000.000000,1750.000000,-500,-750.000000,2000.000000,500)
AddZone("Д-10", -750.000000,1750.000000,-500,-500.000000,2000.000000,500)
AddZone("Д-11", -500.000000,1750.000000,-500,-250.000000,2000.000000,500)
AddZone("Д-12", -250.000000,1750.000000,-500,0.000000,2000.000000,500)
AddZone("Д-13", 0.000000,1750.000000,-500,250.000000,2000.000000,500)
AddZone("Д-14", 250.000000,1750.000000,-500,500.000000,2000.000000,500)
AddZone("Д-15", 500.000000,1750.000000,-500,750.000000,2000.000000,500)
AddZone("Д-16", 750.000000,1750.000000,-500,1000.000000,2000.000000,500)
AddZone("Д-17", 1000.000000,1750.000000,-500,1250.000000,2000.000000,500)
AddZone("Д-18", 1250.000000,1750.000000,-500,1500.000000,2000.000000,500)
AddZone("Д-19", 1500.000000,1750.000000,-500,1750.000000,2000.000000,500)
AddZone("Д-20", 1750.000000,1750.000000,-500,2000.000000,2000.000000,500)
AddZone("Д-21", 2000.000000,1750.000000,-500,2250.000000,2000.000000,500)
AddZone("Д-22", 2250.000000,1750.000000,-500,2500.000000,2000.000000,500)
AddZone("Д-23", 2500.000000,1750.000000,-500,2750.000000,2000.000000,500)
AddZone("Д-24", 2750.000000,1750.000000,-500,3000.000000,2000.000000,500)
AddZone("Ж-1", -3000.000000,1500.000000,-500,-2750.000000,1750.000000,500)
AddZone("Ж-2", -2750.000000,1500.000000,-500,-2500.000000,1750.000000,500)
AddZone("Ж-3", -2500.000000,1500.000000,-500,-2250.000000,1750.000000,500)
AddZone("Ж-4", -2250.000000,1500.000000,-500,-2000.000000,1750.000000,500)
AddZone("Ж-5", -2000.000000,1500.000000,-500,-1750.000000,1750.000000,500)
AddZone("Ж-6", -1750.000000,1500.000000,-500,-1500.000000,1750.000000,500)
AddZone("Ж-7", -1500.000000,1500.000000,-500,-1250.000000,1750.000000,500)
AddZone("Ж-8", -1250.000000,1500.000000,-500,-1000.000000,1750.000000,500)
AddZone("Ж-9", -1000.000000,1500.000000,-500,-750.000000,1750.000000,500)
AddZone("Ж-10", -750.000000,1500.000000,-500,-500.000000,1750.000000,500)
AddZone("Ж-11", -500.000000,1500.000000,-500,-250.000000,1750.000000,500)
AddZone("Ж-12", -250.000000,1500.000000,-500,0.000000,1750.000000,500)
AddZone("Ж-13", 0.000000,1500.000000,-500,250.000000,1750.000000,500)
AddZone("Ж-14", 250.000000,1500.000000,-500,500.000000,1750.000000,500)
AddZone("Ж-15", 500.000000,1500.000000,-500,750.000000,1750.000000,500)
AddZone("Ж-16", 750.000000,1500.000000,-500,1000.000000,1750.000000,500)
AddZone("Ж-17", 1000.000000,1500.000000,-500,1250.000000,1750.000000,500)
AddZone("Ж-18", 1250.000000,1500.000000,-500,1500.000000,1750.000000,500)
AddZone("Ж-19", 1500.000000,1500.000000,-500,1750.000000,1750.000000,500)
AddZone("Ж-20", 1750.000000,1500.000000,-500,2000.000000,1750.000000,500)
AddZone("Ж-21", 2000.000000,1500.000000,-500,2250.000000,1750.000000,500)
AddZone("Ж-22", 2250.000000,1500.000000,-500,2500.000000,1750.000000,500)
AddZone("Ж-23", 2500.000000,1500.000000,-500,2750.000000,1750.000000,500)
AddZone("Ж-24", 2750.000000,1500.000000,-500,3000.000000,1750.000000,500)
AddZone("З-1", -3000.000000,1250.000000,-500,-2750.000000,1500.000000,500)
AddZone("З-2", -2750.000000,1250.000000,-500,-2500.000000,1500.000000,500)
AddZone("З-3", -2500.000000,1250.000000,-500,-2250.000000,1500.000000,500)
AddZone("З-4", -2250.000000,1250.000000,-500,-2000.000000,1500.000000,500)
AddZone("З-5", -2000.000000,1250.000000,-500,-1750.000000,1500.000000,500)
AddZone("З-6", -1750.000000,1250.000000,-500,-1500.000000,1500.000000,500)
AddZone("З-7", -1500.000000,1250.000000,-500,-1250.000000,1500.000000,500)
AddZone("З-8", -1250.000000,1250.000000,-500,-1000.000000,1500.000000,500)
AddZone("З-9", -1000.000000,1250.000000,-500,-750.000000,1500.000000,500)
AddZone("З-10", -750.000000,1250.000000,-500,-500.000000,1500.000000,500)
AddZone("З-11", -500.000000,1250.000000,-500,-250.000000,1500.000000,500)
AddZone("З-12", -250.000000,1250.000000,-500,0.000000,1500.000000,500)
AddZone("З-13", 0.000000,1250.000000,-500,250.000000,1500.000000,500)
AddZone("З-14", 250.000000,1250.000000,-500,500.000000,1500.000000,500)
AddZone("З-15", 500.000000,1250.000000,-500,750.000000,1500.000000,500)
AddZone("З-16", 750.000000,1250.000000,-500,1000.000000,1500.000000,500)
AddZone("З-17", 1000.000000,1250.000000,-500,1250.000000,1500.000000,500)
AddZone("З-18", 1250.000000,1250.000000,-500,1500.000000,1500.000000,500)
AddZone("З-19", 1500.000000,1250.000000,-500,1750.000000,1500.000000,500)
AddZone("З-20", 1750.000000,1250.000000,-500,2000.000000,1500.000000,500)
AddZone("З-21", 2000.000000,1250.000000,-500,2250.000000,1500.000000,500)
AddZone("З-22", 2250.000000,1250.000000,-500,2500.000000,1500.000000,500)
AddZone("З-23", 2500.000000,1250.000000,-500,2750.000000,1500.000000,500)
AddZone("З-24", 2750.000000,1250.000000,-500,3000.000000,1500.000000,500)
AddZone("И-1", -3000.000000,1000.000000,-500,-2750.000000,1250.000000,500)
AddZone("И-2", -2750.000000,1000.000000,-500,-2500.000000,1250.000000,500)
AddZone("И-3", -2500.000000,1000.000000,-500,-2250.000000,1250.000000,500)
AddZone("И-4", -2250.000000,1000.000000,-500,-2000.000000,1250.000000,500)
AddZone("И-5", -2000.000000,1000.000000,-500,-1750.000000,1250.000000,500)
AddZone("И-6", -1750.000000,1000.000000,-500,-1500.000000,1250.000000,500)
AddZone("И-7", -1500.000000,1000.000000,-500,-1250.000000,1250.000000,500)
AddZone("И-8", -1250.000000,1000.000000,-500,-1000.000000,1250.000000,500)
AddZone("И-9", -1000.000000,1000.000000,-500,-750.000000,1250.000000,500)
AddZone("И-10", -750.000000,1000.000000,-500,-500.000000,1250.000000,500)
AddZone("И-11", -500.000000,1000.000000,-500,-250.000000,1250.000000,500)
AddZone("И-12", -250.000000,1000.000000,-500,0.000000,1250.000000,500)
AddZone("И-13", 0.000000,1000.000000,-500,250.000000,1250.000000,500)
AddZone("И-14", 250.000000,1000.000000,-500,500.000000,1250.000000,500)
AddZone("И-15", 500.000000,1000.000000,-500,750.000000,1250.000000,500)
AddZone("И-16", 750.000000,1000.000000,-500,1000.000000,1250.000000,500)
AddZone("И-17", 1000.000000,1000.000000,-500,1250.000000,1250.000000,500)
AddZone("И-18", 1250.000000,1000.000000,-500,1500.000000,1250.000000,500)
AddZone("И-19", 1500.000000,1000.000000,-500,1750.000000,1250.000000,500)
AddZone("И-20", 1750.000000,1000.000000,-500,2000.000000,1250.000000,500)
AddZone("И-21", 2000.000000,1000.000000,-500,2250.000000,1250.000000,500)
AddZone("И-22", 2250.000000,1000.000000,-500,2500.000000,1250.000000,500)
AddZone("И-23", 2500.000000,1000.000000,-500,2750.000000,1250.000000,500)
AddZone("И-24", 2750.000000,1000.000000,-500,3000.000000,1250.000000,500)
AddZone("К-1", -3000.000000,750.000000,-500,-2750.000000,1000.000000,500)
AddZone("К-2", -2750.000000,750.000000,-500,-2500.000000,1000.000000,500)
AddZone("К-3", -2500.000000,750.000000,-500,-2250.000000,1000.000000,500)
AddZone("К-4", -2250.000000,750.000000,-500,-2000.000000,1000.000000,500)
AddZone("К-5", -2000.000000,750.000000,-500,-1750.000000,1000.000000,500)
AddZone("К-6", -1750.000000,750.000000,-500,-1500.000000,1000.000000,500)
AddZone("К-7", -1500.000000,750.000000,-500,-1250.000000,1000.000000,500)
AddZone("К-8", -1250.000000,750.000000,-500,-1000.000000,1000.000000,500)
AddZone("К-9", -1000.000000,750.000000,-500,-750.000000,1000.000000,500)
AddZone("К-10", -750.000000,750.000000,-500,-500.000000,1000.000000,500)
AddZone("К-11", -500.000000,750.000000,-500,-250.000000,1000.000000,500)
AddZone("К-12", -250.000000,750.000000,-500,0.000000,1000.000000,500)
AddZone("К-13", 0.000000,750.000000,-500,250.000000,1000.000000,500)
AddZone("К-14", 250.000000,750.000000,-500,500.000000,1000.000000,500)
AddZone("К-15", 500.000000,750.000000,-500,750.000000,1000.000000,500)
AddZone("К-16", 750.000000,750.000000,-500,1000.000000,1000.000000,500)
AddZone("К-17", 1000.000000,750.000000,-500,1250.000000,1000.000000,500)
AddZone("К-18", 1250.000000,750.000000,-500,1500.000000,1000.000000,500)
AddZone("К-19", 1500.000000,750.000000,-500,1750.000000,1000.000000,500)
AddZone("К-20", 1750.000000,750.000000,-500,2000.000000,1000.000000,500)
AddZone("К-21", 2000.000000,750.000000,-500,2250.000000,1000.000000,500)
AddZone("К-22", 2250.000000,750.000000,-500,2500.000000,1000.000000,500)
AddZone("К-23", 2500.000000,750.000000,-500,2750.000000,1000.000000,500)
AddZone("К-24", 2750.000000,750.000000,-500,3000.000000,1000.000000,500)
AddZone("Л-1", -3000.000000,500.000000,-500,-2750.000000,750.000000,500)
AddZone("Л-2", -2750.000000,500.000000,-500,-2500.000000,750.000000,500)
AddZone("Л-3", -2500.000000,500.000000,-500,-2250.000000,750.000000,500)
AddZone("Л-4", -2250.000000,500.000000,-500,-2000.000000,750.000000,500)
AddZone("Л-5", -2000.000000,500.000000,-500,-1750.000000,750.000000,500)
AddZone("Л-6", -1750.000000,500.000000,-500,-1500.000000,750.000000,500)
AddZone("Л-7", -1500.000000,500.000000,-500,-1250.000000,750.000000,500)
AddZone("Л-8", -1250.000000,500.000000,-500,-1000.000000,750.000000,500)
AddZone("Л-9", -1000.000000,500.000000,-500,-750.000000,750.000000,500)
AddZone("Л-10", -750.000000,500.000000,-500,-500.000000,750.000000,500)
AddZone("Л-11", -500.000000,500.000000,-500,-250.000000,750.000000,500)
AddZone("Л-12", -250.000000,500.000000,-500,0.000000,750.000000,500)
AddZone("Л-13", 0.000000,500.000000,-500,250.000000,750.000000,500)
AddZone("Л-14", 250.000000,500.000000,-500,500.000000,750.000000,500)
AddZone("Л-15", 500.000000,500.000000,-500,750.000000,750.000000,500)
AddZone("Л-16", 750.000000,500.000000,-500,1000.000000,750.000000,500)
AddZone("Л-17", 1000.000000,500.000000,-500,1250.000000,750.000000,500)
AddZone("Л-18", 1250.000000,500.000000,-500,1500.000000,750.000000,500)
AddZone("Л-19", 1500.000000,500.000000,-500,1750.000000,750.000000,500)
AddZone("Л-20", 1750.000000,500.000000,-500,2000.000000,750.000000,500)
AddZone("Л-21", 2000.000000,500.000000,-500,2250.000000,750.000000,500)
AddZone("Л-22", 2250.000000,500.000000,-500,2500.000000,750.000000,500)
AddZone("Л-23", 2500.000000,500.000000,-500,2750.000000,750.000000,500)
AddZone("Л-24", 2750.000000,500.000000,-500,3000.000000,750.000000,500)
AddZone("М-1", -3000.000000,250.000000,-500,-2750.000000,500.000000,500)
AddZone("М-2", -2750.000000,250.000000,-500,-2500.000000,500.000000,500)
AddZone("М-3", -2500.000000,250.000000,-500,-2250.000000,500.000000,500)
AddZone("М-4", -2250.000000,250.000000,-500,-2000.000000,500.000000,500)
AddZone("М-5", -2000.000000,250.000000,-500,-1750.000000,500.000000,500)
AddZone("М-6", -1750.000000,250.000000,-500,-1500.000000,500.000000,500)
AddZone("М-7", -1500.000000,250.000000,-500,-1250.000000,500.000000,500)
AddZone("М-8", -1250.000000,250.000000,-500,-1000.000000,500.000000,500)
AddZone("М-9", -1000.000000,250.000000,-500,-750.000000,500.000000,500)
AddZone("М-10", -750.000000,250.000000,-500,-500.000000,500.000000,500)
AddZone("М-11", -500.000000,250.000000,-500,-250.000000,500.000000,500)
AddZone("М-12", -250.000000,250.000000,-500,0.000000,500.000000,500)
AddZone("М-13", 0.000000,250.000000,-500,250.000000,500.000000,500)
AddZone("М-14", 250.000000,250.000000,-500,500.000000,500.000000,500)
AddZone("М-15", 500.000000,250.000000,-500,750.000000,500.000000,500)
AddZone("М-16", 750.000000,250.000000,-500,1000.000000,500.000000,500)
AddZone("М-17", 1000.000000,250.000000,-500,1250.000000,500.000000,500)
AddZone("М-18", 1250.000000,250.000000,-500,1500.000000,500.000000,500)
AddZone("М-19", 1500.000000,250.000000,-500,1750.000000,500.000000,500)
AddZone("М-20", 1750.000000,250.000000,-500,2000.000000,500.000000,500)
AddZone("М-21", 2000.000000,250.000000,-500,2250.000000,500.000000,500)
AddZone("М-22", 2250.000000,250.000000,-500,2500.000000,500.000000,500)
AddZone("М-23", 2500.000000,250.000000,-500,2750.000000,500.000000,500)
AddZone("М-24", 2750.000000,250.000000,-500,3000.000000,500.000000,500)
AddZone("Н-1", -3000.000000,0.000000,-500,-2750.000000,250.000000,500)
AddZone("Н-2", -2750.000000,0.000000,-500,-2500.000000,250.000000,500)
AddZone("Н-3", -2500.000000,0.000000,-500,-2250.000000,250.000000,500)
AddZone("Н-4", -2250.000000,0.000000,-500,-2000.000000,250.000000,500)
AddZone("Н-5", -2000.000000,0.000000,-500,-1750.000000,250.000000,500)
AddZone("Н-6", -1750.000000,0.000000,-500,-1500.000000,250.000000,500)
AddZone("Н-7", -1500.000000,0.000000,-500,-1250.000000,250.000000,500)
AddZone("Н-8", -1250.000000,0.000000,-500,-1000.000000,250.000000,500)
AddZone("Н-9", -1000.000000,0.000000,-500,-750.000000,250.000000,500)
AddZone("Н-10", -750.000000,0.000000,-500,-500.000000,250.000000,500)
AddZone("Н-11", -500.000000,0.000000,-500,-250.000000,250.000000,500)
AddZone("Н-12", -250.000000,0.000000,-500,0.000000,250.000000,500)
AddZone("Н-13", 0.000000,0.000000,-500,250.000000,250.000000,500)
AddZone("Н-14", 250.000000,0.000000,-500,500.000000,250.000000,500)
AddZone("Н-15", 500.000000,0.000000,-500,750.000000,250.000000,500)
AddZone("Н-16", 750.000000,0.000000,-500,1000.000000,250.000000,500)
AddZone("Н-17", 1000.000000,0.000000,-500,1250.000000,250.000000,500)
AddZone("Н-18", 1250.000000,0.000000,-500,1500.000000,250.000000,500)
AddZone("Н-19", 1500.000000,0.000000,-500,1750.000000,250.000000,500)
AddZone("Н-20", 1750.000000,0.000000,-500,2000.000000,250.000000,500)
AddZone("Н-21", 2000.000000,0.000000,-500,2250.000000,250.000000,500)
AddZone("Н-22", 2250.000000,0.000000,-500,2500.000000,250.000000,500)
AddZone("Н-23", 2500.000000,0.000000,-500,2750.000000,250.000000,500)
AddZone("Н-24", 2750.000000,0.000000,-500,3000.000000,250.000000,500)
AddZone("О-1", -3000.000000,-250.000000,-500,-2750.000000,0.000000,500)
AddZone("О-2", -2750.000000,-250.000000,-500,-2500.000000,0.000000,500)
AddZone("О-3", -2500.000000,-250.000000,-500,-2250.000000,0.000000,500)
AddZone("О-4", -2250.000000,-250.000000,-500,-2000.000000,0.000000,500)
AddZone("О-5", -2000.000000,-250.000000,-500,-1750.000000,0.000000,500)
AddZone("О-6", -1750.000000,-250.000000,-500,-1500.000000,0.000000,500)
AddZone("О-7", -1500.000000,-250.000000,-500,-1250.000000,0.000000,500)
AddZone("О-8", -1250.000000,-250.000000,-500,-1000.000000,0.000000,500)
AddZone("О-9", -1000.000000,-250.000000,-500,-750.000000,0.000000,500)
AddZone("О-10", -750.000000,-250.000000,-500,-500.000000,0.000000,500)
AddZone("О-11", -500.000000,-250.000000,-500,-250.000000,0.000000,500)
AddZone("О-12", -250.000000,-250.000000,-500,0.000000,0.000000,500)
AddZone("О-13", 0.000000,-250.000000,-500,250.000000,0.000000,500)
AddZone("О-14", 250.000000,-250.000000,-500,500.000000,0.000000,500)
AddZone("О-15", 500.000000,-250.000000,-500,750.000000,0.000000,500)
AddZone("О-16", 750.000000,-250.000000,-500,1000.000000,0.000000,500)
AddZone("О-17", 1000.000000,-250.000000,-500,1250.000000,0.000000,500)
AddZone("О-18", 1250.000000,-250.000000,-500,1500.000000,0.000000,500)
AddZone("О-19", 1500.000000,-250.000000,-500,1750.000000,0.000000,500)
AddZone("О-20", 1750.000000,-250.000000,-500,2000.000000,0.000000,500)
AddZone("О-21", 2000.000000,-250.000000,-500,2250.000000,0.000000,500)
AddZone("О-22", 2250.000000,-250.000000,-500,2500.000000,0.000000,500)
AddZone("О-23", 2500.000000,-250.000000,-500,2750.000000,0.000000,500)
AddZone("О-24", 2750.000000,-250.000000,-500,3000.000000,0.000000,500)
AddZone("П-1", -3000.000000,-500.000000,-500,-2750.000000,-250.000000,500)
AddZone("П-2", -2750.000000,-500.000000,-500,-2500.000000,-250.000000,500)
AddZone("П-3", -2500.000000,-500.000000,-500,-2250.000000,-250.000000,500)
AddZone("П-4", -2250.000000,-500.000000,-500,-2000.000000,-250.000000,500)
AddZone("П-5", -2000.000000,-500.000000,-500,-1750.000000,-250.000000,500)
AddZone("П-6", -1750.000000,-500.000000,-500,-1500.000000,-250.000000,500)
AddZone("П-7", -1500.000000,-500.000000,-500,-1250.000000,-250.000000,500)
AddZone("П-8", -1250.000000,-500.000000,-500,-1000.000000,-250.000000,500)
AddZone("П-9", -1000.000000,-500.000000,-500,-750.000000,-250.000000,500)
AddZone("П-10", -750.000000,-500.000000,-500,-500.000000,-250.000000,500)
AddZone("П-11", -500.000000,-500.000000,-500,-250.000000,-250.000000,500)
AddZone("П-12", -250.000000,-500.000000,-500,0.000000,-250.000000,500)
AddZone("П-13", 0.000000,-500.000000,-500,250.000000,-250.000000,500)
AddZone("П-14", 250.000000,-500.000000,-500,500.000000,-250.000000,500)
AddZone("П-15", 500.000000,-500.000000,-500,750.000000,-250.000000,500)
AddZone("П-16", 750.000000,-500.000000,-500,1000.000000,-250.000000,500)
AddZone("П-17", 1000.000000,-500.000000,-500,1250.000000,-250.000000,500)
AddZone("П-18", 1250.000000,-500.000000,-500,1500.000000,-250.000000,500)
AddZone("П-19", 1500.000000,-500.000000,-500,1750.000000,-250.000000,500)
AddZone("П-20", 1750.000000,-500.000000,-500,2000.000000,-250.000000,500)
AddZone("П-21", 2000.000000,-500.000000,-500,2250.000000,-250.000000,500)
AddZone("П-22", 2250.000000,-500.000000,-500,2500.000000,-250.000000,500)
AddZone("П-23", 2500.000000,-500.000000,-500,2750.000000,-250.000000,500)
AddZone("П-24", 2750.000000,-500.000000,-500,3000.000000,-250.000000,500)
AddZone("Р-1", -3000.000000,-750.000000,-500,-2750.000000,-500.000000,500)
AddZone("Р-2", -2750.000000,-750.000000,-500,-2500.000000,-500.000000,500)
AddZone("Р-3", -2500.000000,-750.000000,-500,-2250.000000,-500.000000,500)
AddZone("Р-4", -2250.000000,-750.000000,-500,-2000.000000,-500.000000,500)
AddZone("Р-5", -2000.000000,-750.000000,-500,-1750.000000,-500.000000,500)
AddZone("Р-6", -1750.000000,-750.000000,-500,-1500.000000,-500.000000,500)
AddZone("Р-7", -1500.000000,-750.000000,-500,-1250.000000,-500.000000,500)
AddZone("Р-8", -1250.000000,-750.000000,-500,-1000.000000,-500.000000,500)
AddZone("Р-9", -1000.000000,-750.000000,-500,-750.000000,-500.000000,500)
AddZone("Р-10", -750.000000,-750.000000,-500,-500.000000,-500.000000,500)
AddZone("Р-11", -500.000000,-750.000000,-500,-250.000000,-500.000000,500)
AddZone("Р-12", -250.000000,-750.000000,-500,0.000000,-500.000000,500)
AddZone("Р-13", 0.000000,-750.000000,-500,250.000000,-500.000000,500)
AddZone("Р-14", 250.000000,-750.000000,-500,500.000000,-500.000000,500)
AddZone("Р-15", 500.000000,-750.000000,-500,750.000000,-500.000000,500)
AddZone("Р-16", 750.000000,-750.000000,-500,1000.000000,-500.000000,500)
AddZone("Р-17", 1000.000000,-750.000000,-500,1250.000000,-500.000000,500)
AddZone("Р-18", 1250.000000,-750.000000,-500,1500.000000,-500.000000,500)
AddZone("Р-19", 1500.000000,-750.000000,-500,1750.000000,-500.000000,500)
AddZone("Р-20", 1750.000000,-750.000000,-500,2000.000000,-500.000000,500)
AddZone("Р-21", 2000.000000,-750.000000,-500,2250.000000,-500.000000,500)
AddZone("Р-22", 2250.000000,-750.000000,-500,2500.000000,-500.000000,500)
AddZone("Р-23", 2500.000000,-750.000000,-500,2750.000000,-500.000000,500)
AddZone("Р-24", 2750.000000,-750.000000,-500,3000.000000,-500.000000,500)
AddZone("С-1", -3000.000000,-1000.000000,-500,-2750.000000,-750.000000,500)
AddZone("С-2", -2750.000000,-1000.000000,-500,-2500.000000,-750.000000,500)
AddZone("С-3", -2500.000000,-1000.000000,-500,-2250.000000,-750.000000,500)
AddZone("С-4", -2250.000000,-1000.000000,-500,-2000.000000,-750.000000,500)
AddZone("С-5", -2000.000000,-1000.000000,-500,-1750.000000,-750.000000,500)
AddZone("С-6", -1750.000000,-1000.000000,-500,-1500.000000,-750.000000,500)
AddZone("С-7", -1500.000000,-1000.000000,-500,-1250.000000,-750.000000,500)
AddZone("С-8", -1250.000000,-1000.000000,-500,-1000.000000,-750.000000,500)
AddZone("С-9", -1000.000000,-1000.000000,-500,-750.000000,-750.000000,500)
AddZone("С-10", -750.000000,-1000.000000,-500,-500.000000,-750.000000,500)
AddZone("С-11", -500.000000,-1000.000000,-500,-250.000000,-750.000000,500)
AddZone("С-12", -250.000000,-1000.000000,-500,0.000000,-750.000000,500)
AddZone("С-13", 0.000000,-1000.000000,-500,250.000000,-750.000000,500)
AddZone("С-14", 250.000000,-1000.000000,-500,500.000000,-750.000000,500)
AddZone("С-15", 500.000000,-1000.000000,-500,750.000000,-750.000000,500)
AddZone("С-16", 750.000000,-1000.000000,-500,1000.000000,-750.000000,500)
AddZone("С-17", 1000.000000,-1000.000000,-500,1250.000000,-750.000000,500)
AddZone("С-18", 1250.000000,-1000.000000,-500,1500.000000,-750.000000,500)
AddZone("С-19", 1500.000000,-1000.000000,-500,1750.000000,-750.000000,500)
AddZone("С-20", 1750.000000,-1000.000000,-500,2000.000000,-750.000000,500)
AddZone("С-21", 2000.000000,-1000.000000,-500,2250.000000,-750.000000,500)
AddZone("С-22", 2250.000000,-1000.000000,-500,2500.000000,-750.000000,500)
AddZone("С-23", 2500.000000,-1000.000000,-500,2750.000000,-750.000000,500)
AddZone("С-24", 2750.000000,-1000.000000,-500,3000.000000,-750.000000,500)
AddZone("Т-1", -3000.000000,-1250.000000,-500,-2750.000000,-1000.000000,500)
AddZone("Т-2", -2750.000000,-1250.000000,-500,-2500.000000,-1000.000000,500)
AddZone("Т-3", -2500.000000,-1250.000000,-500,-2250.000000,-1000.000000,500)
AddZone("Т-4", -2250.000000,-1250.000000,-500,-2000.000000,-1000.000000,500)
AddZone("Т-5", -2000.000000,-1250.000000,-500,-1750.000000,-1000.000000,500)
AddZone("Т-6", -1750.000000,-1250.000000,-500,-1500.000000,-1000.000000,500)
AddZone("Т-7", -1500.000000,-1250.000000,-500,-1250.000000,-1000.000000,500)
AddZone("Т-8", -1250.000000,-1250.000000,-500,-1000.000000,-1000.000000,500)
AddZone("Т-9", -1000.000000,-1250.000000,-500,-750.000000,-1000.000000,500)
AddZone("Т-10", -750.000000,-1250.000000,-500,-500.000000,-1000.000000,500)
AddZone("Т-11", -500.000000,-1250.000000,-500,-250.000000,-1000.000000,500)
AddZone("Т-12", -250.000000,-1250.000000,-500,0.000000,-1000.000000,500)
AddZone("Т-13", 0.000000,-1250.000000,-500,250.000000,-1000.000000,500)
AddZone("Т-14", 250.000000,-1250.000000,-500,500.000000,-1000.000000,500)
AddZone("Т-15", 500.000000,-1250.000000,-500,750.000000,-1000.000000,500)
AddZone("Т-16", 750.000000,-1250.000000,-500,1000.000000,-1000.000000,500)
AddZone("Т-17", 1000.000000,-1250.000000,-500,1250.000000,-1000.000000,500)
AddZone("Т-18", 1250.000000,-1250.000000,-500,1500.000000,-1000.000000,500)
AddZone("Т-19", 1500.000000,-1250.000000,-500,1750.000000,-1000.000000,500)
AddZone("Т-20", 1750.000000,-1250.000000,-500,2000.000000,-1000.000000,500)
AddZone("Т-21", 2000.000000,-1250.000000,-500,2250.000000,-1000.000000,500)
AddZone("Т-22", 2250.000000,-1250.000000,-500,2500.000000,-1000.000000,500)
AddZone("Т-23", 2500.000000,-1250.000000,-500,2750.000000,-1000.000000,500)
AddZone("Т-24", 2750.000000,-1250.000000,-500,3000.000000,-1000.000000,500)
AddZone("У-1", -3000.000000,-1500.000000,-500,-2750.000000,-1250.000000,500)
AddZone("У-2", -2750.000000,-1500.000000,-500,-2500.000000,-1250.000000,500)
AddZone("У-3", -2500.000000,-1500.000000,-500,-2250.000000,-1250.000000,500)
AddZone("У-4", -2250.000000,-1500.000000,-500,-2000.000000,-1250.000000,500)
AddZone("У-5", -2000.000000,-1500.000000,-500,-1750.000000,-1250.000000,500)
AddZone("У-6", -1750.000000,-1500.000000,-500,-1500.000000,-1250.000000,500)
AddZone("У-7", -1500.000000,-1500.000000,-500,-1250.000000,-1250.000000,500)
AddZone("У-8", -1250.000000,-1500.000000,-500,-1000.000000,-1250.000000,500)
AddZone("У-9", -1000.000000,-1500.000000,-500,-750.000000,-1250.000000,500)
AddZone("У-10", -750.000000,-1500.000000,-500,-500.000000,-1250.000000,500)
AddZone("У-11", -500.000000,-1500.000000,-500,-250.000000,-1250.000000,500)
AddZone("У-12", -250.000000,-1500.000000,-500,0.000000,-1250.000000,500)
AddZone("У-13", 0.000000,-1500.000000,-500,250.000000,-1250.000000,500)
AddZone("У-14", 250.000000,-1500.000000,-500,500.000000,-1250.000000,500)
AddZone("У-15", 500.000000,-1500.000000,-500,750.000000,-1250.000000,500)
AddZone("У-16", 750.000000,-1500.000000,-500,1000.000000,-1250.000000,500)
AddZone("У-17", 1000.000000,-1500.000000,-500,1250.000000,-1250.000000,500)
AddZone("У-18", 1250.000000,-1500.000000,-500,1500.000000,-1250.000000,500)
AddZone("У-19", 1500.000000,-1500.000000,-500,1750.000000,-1250.000000,500)
AddZone("У-20", 1750.000000,-1500.000000,-500,2000.000000,-1250.000000,500)
AddZone("У-21", 2000.000000,-1500.000000,-500,2250.000000,-1250.000000,500)
AddZone("У-22", 2250.000000,-1500.000000,-500,2500.000000,-1250.000000,500)
AddZone("У-23", 2500.000000,-1500.000000,-500,2750.000000,-1250.000000,500)
AddZone("У-24", 2750.000000,-1500.000000,-500,3000.000000,-1250.000000,500)
AddZone("Ф-1", -3000.000000,-1750.000000,-500,-2750.000000,-1500.000000,500)
AddZone("Ф-2", -2750.000000,-1750.000000,-500,-2500.000000,-1500.000000,500)
AddZone("Ф-3", -2500.000000,-1750.000000,-500,-2250.000000,-1500.000000,500)
AddZone("Ф-4", -2250.000000,-1750.000000,-500,-2000.000000,-1500.000000,500)
AddZone("Ф-5", -2000.000000,-1750.000000,-500,-1750.000000,-1500.000000,500)
AddZone("Ф-6", -1750.000000,-1750.000000,-500,-1500.000000,-1500.000000,500)
AddZone("Ф-7", -1500.000000,-1750.000000,-500,-1250.000000,-1500.000000,500)
AddZone("Ф-8", -1250.000000,-1750.000000,-500,-1000.000000,-1500.000000,500)
AddZone("Ф-9", -1000.000000,-1750.000000,-500,-750.000000,-1500.000000,500)
AddZone("Ф-10", -750.000000,-1750.000000,-500,-500.000000,-1500.000000,500)
AddZone("Ф-11", -500.000000,-1750.000000,-500,-250.000000,-1500.000000,500)
AddZone("Ф-12", -250.000000,-1750.000000,-500,0.000000,-1500.000000,500)
AddZone("Ф-13", 0.000000,-1750.000000,-500,250.000000,-1500.000000,500)
AddZone("Ф-14", 250.000000,-1750.000000,-500,500.000000,-1500.000000,500)
AddZone("Ф-15", 500.000000,-1750.000000,-500,750.000000,-1500.000000,500)
AddZone("Ф-16", 750.000000,-1750.000000,-500,1000.000000,-1500.000000,500)
AddZone("Ф-17", 1000.000000,-1750.000000,-500,1250.000000,-1500.000000,500)
AddZone("Ф-18", 1250.000000,-1750.000000,-500,1500.000000,-1500.000000,500)
AddZone("Ф-19", 1500.000000,-1750.000000,-500,1750.000000,-1500.000000,500)
AddZone("Ф-20", 1750.000000,-1750.000000,-500,2000.000000,-1500.000000,500)
AddZone("Ф-21", 2000.000000,-1750.000000,-500,2250.000000,-1500.000000,500)
AddZone("Ф-22", 2250.000000,-1750.000000,-500,2500.000000,-1500.000000,500)
AddZone("Ф-23", 2500.000000,-1750.000000,-500,2750.000000,-1500.000000,500)
AddZone("Ф-24", 2750.000000,-1750.000000,-500,3000.000000,-1500.000000,500)
AddZone("Х-1", -3000.000000,-2000.000000,-500,-2750.000000,-1750.000000,500)
AddZone("Х-2", -2750.000000,-2000.000000,-500,-2500.000000,-1750.000000,500)
AddZone("Х-3", -2500.000000,-2000.000000,-500,-2250.000000,-1750.000000,500)
AddZone("Х-4", -2250.000000,-2000.000000,-500,-2000.000000,-1750.000000,500)
AddZone("Х-5", -2000.000000,-2000.000000,-500,-1750.000000,-1750.000000,500)
AddZone("Х-6", -1750.000000,-2000.000000,-500,-1500.000000,-1750.000000,500)
AddZone("Х-7", -1500.000000,-2000.000000,-500,-1250.000000,-1750.000000,500)
AddZone("Х-8", -1250.000000,-2000.000000,-500,-1000.000000,-1750.000000,500)
AddZone("Х-9", -1000.000000,-2000.000000,-500,-750.000000,-1750.000000,500)
AddZone("Х-10", -750.000000,-2000.000000,-500,-500.000000,-1750.000000,500)
AddZone("Х-11", -500.000000,-2000.000000,-500,-250.000000,-1750.000000,500)
AddZone("Х-12", -250.000000,-2000.000000,-500,0.000000,-1750.000000,500)
AddZone("Х-13", 0.000000,-2000.000000,-500,250.000000,-1750.000000,500)
AddZone("Х-14", 250.000000,-2000.000000,-500,500.000000,-1750.000000,500)
AddZone("Х-15", 500.000000,-2000.000000,-500,750.000000,-1750.000000,500)
AddZone("Х-16", 750.000000,-2000.000000,-500,1000.000000,-1750.000000,500)
AddZone("Х-17", 1000.000000,-2000.000000,-500,1250.000000,-1750.000000,500)
AddZone("Х-18", 1250.000000,-2000.000000,-500,1500.000000,-1750.000000,500)
AddZone("Х-19", 1500.000000,-2000.000000,-500,1750.000000,-1750.000000,500)
AddZone("Х-20", 1750.000000,-2000.000000,-500,2000.000000,-1750.000000,500)
AddZone("Х-21", 2000.000000,-2000.000000,-500,2250.000000,-1750.000000,500)
AddZone("Х-22", 2250.000000,-2000.000000,-500,2500.000000,-1750.000000,500)
AddZone("Х-23", 2500.000000,-2000.000000,-500,2750.000000,-1750.000000,500)
AddZone("Х-24", 2750.000000,-2000.000000,-500,3000.000000,-1750.000000,500)
AddZone("Ц-1", -3000.000000,-2250.000000,-500,-2750.000000,-2000.000000,500)
AddZone("Ц-2", -2750.000000,-2250.000000,-500,-2500.000000,-2000.000000,500)
AddZone("Ц-3", -2500.000000,-2250.000000,-500,-2250.000000,-2000.000000,500)
AddZone("Ц-4", -2250.000000,-2250.000000,-500,-2000.000000,-2000.000000,500)
AddZone("Ц-5", -2000.000000,-2250.000000,-500,-1750.000000,-2000.000000,500)
AddZone("Ц-6", -1750.000000,-2250.000000,-500,-1500.000000,-2000.000000,500)
AddZone("Ц-7", -1500.000000,-2250.000000,-500,-1250.000000,-2000.000000,500)
AddZone("Ц-8", -1250.000000,-2250.000000,-500,-1000.000000,-2000.000000,500)
AddZone("Ц-9", -1000.000000,-2250.000000,-500,-750.000000,-2000.000000,500)
AddZone("Ц-10", -750.000000,-2250.000000,-500,-500.000000,-2000.000000,500)
AddZone("Ц-11", -500.000000,-2250.000000,-500,-250.000000,-2000.000000,500)
AddZone("Ц-12", -250.000000,-2250.000000,-500,0.000000,-2000.000000,500)
AddZone("Ц-13", 0.000000,-2250.000000,-500,250.000000,-2000.000000,500)
AddZone("Ц-14", 250.000000,-2250.000000,-500,500.000000,-2000.000000,500)
AddZone("Ц-15", 500.000000,-2250.000000,-500,750.000000,-2000.000000,500)
AddZone("Ц-16", 750.000000,-2250.000000,-500,1000.000000,-2000.000000,500)
AddZone("Ц-17", 1000.000000,-2250.000000,-500,1250.000000,-2000.000000,500)
AddZone("Ц-18", 1250.000000,-2250.000000,-500,1500.000000,-2000.000000,500)
AddZone("Ц-19", 1500.000000,-2250.000000,-500,1750.000000,-2000.000000,500)
AddZone("Ц-20", 1750.000000,-2250.000000,-500,2000.000000,-2000.000000,500)
AddZone("Ц-21", 2000.000000,-2250.000000,-500,2250.000000,-2000.000000,500)
AddZone("Ц-22", 2250.000000,-2250.000000,-500,2500.000000,-2000.000000,500)
AddZone("Ц-23", 2500.000000,-2250.000000,-500,2750.000000,-2000.000000,500)
AddZone("Ц-24", 2750.000000,-2250.000000,-500,3000.000000,-2000.000000,500)
AddZone("Ч-1", -3000.000000,-2500.000000,-500,-2750.000000,-2250.000000,500)
AddZone("Ч-2", -2750.000000,-2500.000000,-500,-2500.000000,-2250.000000,500)
AddZone("Ч-3", -2500.000000,-2500.000000,-500,-2250.000000,-2250.000000,500)
AddZone("Ч-4", -2250.000000,-2500.000000,-500,-2000.000000,-2250.000000,500)
AddZone("Ч-5", -2000.000000,-2500.000000,-500,-1750.000000,-2250.000000,500)
AddZone("Ч-6", -1750.000000,-2500.000000,-500,-1500.000000,-2250.000000,500)
AddZone("Ч-7", -1500.000000,-2500.000000,-500,-1250.000000,-2250.000000,500)
AddZone("Ч-8", -1250.000000,-2500.000000,-500,-1000.000000,-2250.000000,500)
AddZone("Ч-9", -1000.000000,-2500.000000,-500,-750.000000,-2250.000000,500)
AddZone("Ч-10", -750.000000,-2500.000000,-500,-500.000000,-2250.000000,500)
AddZone("Ч-11", -500.000000,-2500.000000,-500,-250.000000,-2250.000000,500)
AddZone("Ч-12", -250.000000,-2500.000000,-500,0.000000,-2250.000000,500)
AddZone("Ч-13", 0.000000,-2500.000000,-500,250.000000,-2250.000000,500)
AddZone("Ч-14", 250.000000,-2500.000000,-500,500.000000,-2250.000000,500)
AddZone("Ч-15", 500.000000,-2500.000000,-500,750.000000,-2250.000000,500)
AddZone("Ч-16", 750.000000,-2500.000000,-500,1000.000000,-2250.000000,500)
AddZone("Ч-17", 1000.000000,-2500.000000,-500,1250.000000,-2250.000000,500)
AddZone("Ч-18", 1250.000000,-2500.000000,-500,1500.000000,-2250.000000,500)
AddZone("Ч-19", 1500.000000,-2500.000000,-500,1750.000000,-2250.000000,500)
AddZone("Ч-20", 1750.000000,-2500.000000,-500,2000.000000,-2250.000000,500)
AddZone("Ч-21", 2000.000000,-2500.000000,-500,2250.000000,-2250.000000,500)
AddZone("Ч-22", 2250.000000,-2500.000000,-500,2500.000000,-2250.000000,500)
AddZone("Ч-23", 2500.000000,-2500.000000,-500,2750.000000,-2250.000000,500)
AddZone("Ч-24", 2750.000000,-2500.000000,-500,3000.000000,-2250.000000,500)
AddZone("Ш-1", -3000.000000,-2750.000000,-500,-2750.000000,-2500.000000,500)
AddZone("Ш-2", -2750.000000,-2750.000000,-500,-2500.000000,-2500.000000,500)
AddZone("Ш-3", -2500.000000,-2750.000000,-500,-2250.000000,-2500.000000,500)
AddZone("Ш-4", -2250.000000,-2750.000000,-500,-2000.000000,-2500.000000,500)
AddZone("Ш-5", -2000.000000,-2750.000000,-500,-1750.000000,-2500.000000,500)
AddZone("Ш-6", -1750.000000,-2750.000000,-500,-1500.000000,-2500.000000,500)
AddZone("Ш-7", -1500.000000,-2750.000000,-500,-1250.000000,-2500.000000,500)
AddZone("Ш-8", -1250.000000,-2750.000000,-500,-1000.000000,-2500.000000,500)
AddZone("Ш-9", -1000.000000,-2750.000000,-500,-750.000000,-2500.000000,500)
AddZone("Ш-10", -750.000000,-2750.000000,-500,-500.000000,-2500.000000,500)
AddZone("Ш-11", -500.000000,-2750.000000,-500,-250.000000,-2500.000000,500)
AddZone("Ш-12", -250.000000,-2750.000000,-500,0.000000,-2500.000000,500)
AddZone("Ш-13", 0.000000,-2750.000000,-500,250.000000,-2500.000000,500)
AddZone("Ш-14", 250.000000,-2750.000000,-500,500.000000,-2500.000000,500)
AddZone("Ш-15", 500.000000,-2750.000000,-500,750.000000,-2500.000000,500)
AddZone("Ш-16", 750.000000,-2750.000000,-500,1000.000000,-2500.000000,500)
AddZone("Ш-17", 1000.000000,-2750.000000,-500,1250.000000,-2500.000000,500)
AddZone("Ш-18", 1250.000000,-2750.000000,-500,1500.000000,-2500.000000,500)
AddZone("Ш-19", 1500.000000,-2750.000000,-500,1750.000000,-2500.000000,500)
AddZone("Ш-20", 1750.000000,-2750.000000,-500,2000.000000,-2500.000000,500)
AddZone("Ш-21", 2000.000000,-2750.000000,-500,2250.000000,-2500.000000,500)
AddZone("Ш-22", 2250.000000,-2750.000000,-500,2500.000000,-2500.000000,500)
AddZone("Ш-23", 2500.000000,-2750.000000,-500,2750.000000,-2500.000000,500)
AddZone("Ш-24", 2750.000000,-2750.000000,-500,3000.000000,-2500.000000,500)
AddZone("Я-1", -3000.000000,-3000.000000,-500,-2750.000000,-2750.000000,500)
AddZone("Я-2", -2750.000000,-3000.000000,-500,-2500.000000,-2750.000000,500)
AddZone("Я-3", -2500.000000,-3000.000000,-500,-2250.000000,-2750.000000,500)
AddZone("Я-4", -2250.000000,-3000.000000,-500,-2000.000000,-2750.000000,500)
AddZone("Я-5", -2000.000000,-3000.000000,-500,-1750.000000,-2750.000000,500)
AddZone("Я-6", -1750.000000,-3000.000000,-500,-1500.000000,-2750.000000,500)
AddZone("Я-7", -1500.000000,-3000.000000,-500,-1250.000000,-2750.000000,500)
AddZone("Я-8", -1250.000000,-3000.000000,-500,-1000.000000,-2750.000000,500)
AddZone("Я-9", -1000.000000,-3000.000000,-500,-750.000000,-2750.000000,500)
AddZone("Я-10", -750.000000,-3000.000000,-500,-500.000000,-2750.000000,500)
AddZone("Я-11", -500.000000,-3000.000000,-500,-250.000000,-2750.000000,500)
AddZone("Я-12", -250.000000,-3000.000000,-500,0.000000,-2750.000000,500)
AddZone("Я-13", 0.000000,-3000.000000,-500,250.000000,-2750.000000,500)
AddZone("Я-14", 250.000000,-3000.000000,-500,500.000000,-2750.000000,500)
AddZone("Я-15", 500.000000,-3000.000000,-500,750.000000,-2750.000000,500)
AddZone("Я-16", 750.000000,-3000.000000,-500,1000.000000,-2750.000000,500)
AddZone("Я-17", 1000.000000,-3000.000000,-500,1250.000000,-2750.000000,500)
AddZone("Я-18", 1250.000000,-3000.000000,-500,1500.000000,-2750.000000,500)
AddZone("Я-19", 1500.000000,-3000.000000,-500,1750.000000,-2750.000000,500)
AddZone("Я-20", 1750.000000,-3000.000000,-500,2000.000000,-2750.000000,500)
AddZone("Я-21", 2000.000000,-3000.000000,-500,2250.000000,-2750.000000,500)
AddZone("Я-22", 2250.000000,-3000.000000,-500,2500.000000,-2750.000000,500)
AddZone("Я-23", 2500.000000,-3000.000000,-500,2750.000000,-2750.000000,500)
AddZone("Я-24", 2750.000000,-3000.000000,-500,3000.000000,-2750.000000,500)
}
calculateZone(posX, posY, posZ) {
if ( bInitZaC == 0 )
{
	initZonesAndCities()
	bInitZaC := 1
}
Loop % nZone-1
{
	if (posX >= zone%A_Index%_x1) && (posY >= zone%A_Index%_y1) && (posZ >= zone%A_Index%_z1) && (posX <= zone%A_Index%_x2) && (posY <= zone%A_Index%_y2) && (posZ <= zone%A_Index%_z2)
	{
		ErrorLevel := ERROR_OK
		return zone%A_Index%_name
	}
}
ErrorLevel := ERROR_ZONE_NOT_FOUND
return "Unknown"
}
calculateCity(posX, posY, posZ) {
if ( bInitZaC == 0 )
{
	initZonesAndCities()
	bInitZaC := 1
}
smallestCity := "Unknown"
currentCitySize := 0
smallestCitySize := 0
Loop % nCity-1
{
	if (posX >= city%A_Index%_x1) && (posY >= city%A_Index%_y1) && (posZ >= city%A_Index%_z1) && (posX <= city%A_Index%_x2) && (posY <= city%A_Index%_y2) && (posZ <= city%A_Index%_z2)
	{
		currentCitySize := ((city%A_Index%_x2 - city%A_Index%_x1) * (city%A_Index%_y2 - city%A_Index%_y1) * (city%A_Index%_z2 - city%A_Index%_z1))
		if (smallestCity == "Unknown") || (currentCitySize < smallestCitySize)
		{
			smallestCity := city%A_Index%_name
			smallestCitySize := currentCitySize
		}
	}
}
if(smallestCity == "Unknown") {
		ErrorLevel := ERROR_CITY_NOT_FOUND
	} else {
	ErrorLevel := ERROR_OK
}
return smallestCity
}
AddZone(sName, x1, y1, z1, x2, y2, z2) {
global
zone%nZone%_name := sName
zone%nZone%_x1 := x1
zone%nZone%_y1 := y1
zone%nZone%_z1 := z1
zone%nZone%_x2 := x2
zone%nZone%_y2 := y2
zone%nZone%_z2 := z2
nZone := nZone + 1
}
AddCity(sName, x1, y1, z1, x2, y2, z2) {
global
city%nCity%_name := sName
city%nCity%_x1 := x1
city%nCity%_y1 := y1
city%nCity%_z1 := z1
city%nCity%_x2 := x2
city%nCity%_y2 := y2
city%nCity%_z2 := z2
nCity := nCity + 1
}
IsPlayerInRangeOfPoint(_posX, _posY, _posZ, _posRadius)
{
GetPlayerPos(posX, posY, posZ)
X := posX -_posX
Y := posY -_posY
Z := posZ -_posZ
if(((X < _posRadius) && (X > -_posRadius)) && ((Y < _posRadius) && (Y > -_posRadius)) && ((Z < _posRadius) && (Z > -_posRadius)))
	return TRUE
return FALSE
}
IsPlayerInRangeOfPoint2D(_posX, _posY, _posRadius)
{
GetPlayerPos(posX, posY, posZ)
X := posX - _posX
Y := posY - _posY
if(((X < _posRadius) && (X > -_posRadius)) && ((Y < _posRadius) && (Y > -_posRadius)))
	return TRUE
return FALSE
}
getPlayerZone()
{
aktPos := getCoordinates()
return calculateZone(aktPos[1], aktPos[2], aktPos[3])
}
getPlayerCity()
{
aktPos := getCoordinates()
return calculateCity(aktPos[1], aktPos[2], aktPos[3])
}
AntiCrash(){
If(!checkHandles())
return false
cReport := ADDR_SAMP_CRASHREPORT
writeMemory(hGTA, dwSAMP + cReport, 0x90909090, 4)
cReport += 0x4
writeMemory(hGTA, dwSAMP + cReport, 0x90, 1)
cReport += 0x9
writeMemory(hGTA, dwSAMP + cReport, 0x90909090, 4)
cReport += 0x4
writeMemory(hGTA, dwSAMP + cReport, 0x90, 1)
}
writeMemory(hProcess,address,writevalue,length=4, datatype="int") {
if(!hProcess) {
		ErrorLevel := ERROR_INVALID_HANDLE
	return false
}
VarSetCapacity(finalvalue,length, 0)
NumPut(writevalue,finalvalue,0,datatype)
dwRet :=  DllCall(  "WriteProcessMemory"
,"Uint",hProcess
,"Uint",address
,"Uint",&finalvalue
,"Uint",length
,"Uint",0)
if(dwRet == 0) {
		ErrorLevel := ERROR_WRITE_MEMORY
	return false
}
ErrorLevel := ERROR_OK
return true
}
checkHandles() {
if(iRefreshHandles+500>A_TickCount)
	return true
iRefreshHandles:=A_TickCount
if(!refreshGTA() || !refreshSAMP() || !refreshMemory()) {
		return false
	} else {
	return true
}
return true
}
refreshGTA() {
newPID := getPID("GTA:SA:MP")
if(!newPID) {
	if(hGTA) {
			virtualFreeEx(hGTA, pMemory, 0, 0x8000)
		closeProcess(hGTA)
		hGTA := 0x0
	}
	dwGTAPID := 0
	hGTA := 0x0
	dwSAMP := 0x0
	pMemory := 0x0
	return false
}
if(!hGTA || (dwGTAPID != newPID)) {
		hGTA := openProcess(newPID)
	if(ErrorLevel) {
			dwGTAPID := 0
		hGTA := 0x0
		dwSAMP := 0x0
		pMemory := 0x0
		return false
	}
	dwGTAPID := newPID
	dwSAMP := 0x0
	pMemory := 0x0
	return true
}
return true
}
refreshSAMP() {
if(dwSAMP)
	return true
dwSAMP := getModuleBaseAddress("samp.dll", hGTA)
if(!dwSAMP)
	return false
return true
}
refreshMemory() {
if(!pMemory) {
		pMemory     := virtualAllocEx(hGTA, 6144, 0x1000 | 0x2000, 0x40)
	if(ErrorLevel) {
			pMemory := 0x0
		return false
	}
	pParam1     := pMemory
	pParam2     := pMemory + 1024
	pParam3     := pMemory + 2048
	pParam4     := pMemory + 3072
	pParam5     := pMemory + 4096
	pInjectFunc := pMemory + 5120
}
return true
}
getPID(szWindow) {
local dwPID := 0
WinGet, dwPID, PID, %szWindow%
return dwPID
}
openProcess(dwPID, dwRights = 0x1F0FFF) {
hProcess := DllCall("OpenProcess"
, "UInt", dwRights
, "int",  0
, "UInt", dwPID
, "Uint")
if(hProcess == 0) {
		ErrorLevel := ERROR_OPEN_PROCESS
	return 0
}
ErrorLevel := ERROR_OK
return hProcess
}
closeProcess(hProcess) {
if(hProcess == 0) {
		ErrorLevel := ERROR_INVALID_HANDLE
	return 0
}
dwRet := DllCall(    "CloseHandle"
, "Uint", hProcess
, "UInt")
ErrorLevel := ERROR_OK
}
getModuleBaseAddress(sModule, hProcess) {
if(!sModule) {
		ErrorLevel := ERROR_MODULE_NOT_FOUND
	return 0
}
if(!hProcess) {
		ErrorLevel := ERROR_INVALID_HANDLE
	return 0
}
dwSize = 1024*4
VarSetCapacity(hMods, dwSize)
VarSetCapacity(cbNeeded, 4)
dwRet := DllCall(    "Psapi.dll\EnumProcessModules"
, "UInt", hProcess
, "UInt", &hMods
, "UInt", dwSize
, "UInt*", cbNeeded
, "UInt")
if(dwRet == 0) {
		ErrorLevel := ERROR_ENUM_PROCESS_MODULES
	return 0
}
dwMods := cbNeeded / 4
i := 0
VarSetCapacity(hModule, 4)
VarSetCapacity(sCurModule, 260)
while(i < dwMods) {
		hModule := NumGet(hMods, i*4)
	DllCall("Psapi.dll\GetModuleFileNameEx"
	, "UInt", hProcess
	, "UInt", hModule
	, "Str", sCurModule
	, "UInt", 260)
	SplitPath, sCurModule, sFilename
	if(sModule == sFilename) {
			ErrorLevel := ERROR_OK
		return hModule
	}
	i := i + 1
}
ErrorLevel := ERROR_MODULE_NOT_FOUND
return 0
}
readString(hProcess, dwAddress, dwLen) {
if(!hProcess) {
		ErrorLevel := ERROR_INVALID_HANDLE
	return 0
}
VarSetCapacity(sRead, dwLen)
dwRet := DllCall(    "ReadProcessMemory"
, "UInt", hProcess
, "UInt", dwAddress
, "Str", sRead
, "UInt", dwLen
, "UInt*", 0
, "UInt")
if(dwRet == 0) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
if A_IsUnicode
	return __ansiToUnicode(sRead)
return sRead
}
readFloat(hProcess, dwAddress) {
if(!hProcess) {
		ErrorLevel := ERROR_INVALID_HANDLE
	return 0
}
VarSetCapacity(dwRead, 4)
dwRet := DllCall(    "ReadProcessMemory"
, "UInt",  hProcess
, "UInt",  dwAddress
, "Str",   dwRead
, "UInt",  4
, "UInt*", 0
, "UInt")
if(dwRet == 0) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
return NumGet(dwRead, 0, "Float")
}
readDWORD(hProcess, dwAddress) {
if(!hProcess) {
		ErrorLevel := ERROR_INVALID_HANDLE
	return 0
}
VarSetCapacity(dwRead, 4)
dwRet := DllCall(    "ReadProcessMemory"
, "UInt",  hProcess
, "UInt",  dwAddress
, "Str",   dwRead
, "UInt",  4
, "UInt*", 0)
if(dwRet == 0) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
return NumGet(dwRead, 0, "UInt")
}
readMem(hProcess, dwAddress, dwLen=4, type="UInt") {
if(!hProcess) {
		ErrorLevel := ERROR_INVALID_HANDLE
	return 0
}
VarSetCapacity(dwRead, dwLen)
dwRet := DllCall(    "ReadProcessMemory"
, "UInt",  hProcess
, "UInt",  dwAddress
, "Str",   dwRead
, "UInt",  dwLen
, "UInt*", 0)
if(dwRet == 0) {
		ErrorLevel := ERROR_READ_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
return NumGet(dwRead, 0, type)
}
writeString(hProcess, dwAddress, wString) {
if(!hProcess) {
		ErrorLevel := ERROR_INVALID_HANDLE
	return false
}
sString := wString
if A_IsUnicode
	sString := __unicodeToAnsi(wString)
dwRet := DllCall(    "WriteProcessMemory"
, "UInt", hProcess
, "UInt", dwAddress
, "Str", sString
, "UInt", StrLen(wString) + 1
, "UInt", 0
, "UInt")
if(dwRet == 0) {
		ErrorLEvel := ERROR_WRITE_MEMORY
	return false
}
ErrorLevel := ERROR_OK
return true
}
writeRaw(hProcess, dwAddress, pBuffer, dwLen) {
if(!hProcess) {
		ErrorLevel := ERROR_INVALID_HANDLE
	return false
}
dwRet := DllCall(    "WriteProcessMemory"
, "UInt", hProcess
, "UInt", dwAddress
, "UInt", pBuffer
, "UInt", dwLen
, "UInt", 0
, "UInt")
if(dwRet == 0) {
		ErrorLEvel := ERROR_WRITE_MEMORY
	return false
}
ErrorLevel := ERROR_OK
return true
}
Memory_ReadByte(process_handle, address) {
VarSetCapacity(value, 1, 0)
DllCall("ReadProcessMemory", "UInt", process_handle, "UInt", address, "Str", value, "UInt", 1, "UInt *", 0)
return, NumGet(value, 0, "Byte")
}
callWithParams(hProcess, dwFunc, aParams, bCleanupStack = true) {
if(!hProcess) {
		ErrorLevel := ERROR_INVALID_HANDLE
	return false
}
validParams := 0
i := aParams.MaxIndex()
dwLen := i * 5    + 5    + 1
if(bCleanupStack)
	dwLen += 3
VarSetCapacity(injectData, i * 5    + 5       + 3       + 1, 0)
i_ := 1
while(i > 0) {
	if(aParams[i][1] != "") {
			dwMemAddress := 0x0
		if(aParams[i][1] == "p") {
				dwMemAddress := aParams[i][2]
			} else if(aParams[i][1] == "s") {
			if(i_>3)
				return false
			dwMemAddress := pParam%i_%
			writeString(hProcess, dwMemAddress, aParams[i][2])
			if(ErrorLevel)
				return false
			i_ += 1
			} else if(aParams[i][1] == "i") {
			dwMemAddress := aParams[i][2]
			} else {
			return false
		}
		NumPut(0x68, injectData, validParams * 5, "UChar")
		NumPut(dwMemAddress, injectData, validParams * 5 + 1, "UInt")
		validParams += 1
	}
	i -= 1
}
offset := dwFunc - ( pInjectFunc + validParams * 5 + 5 )
NumPut(0xE8, injectData, validParams * 5, "UChar")
NumPut(offset, injectData, validParams * 5 + 1, "Int")
if(bCleanupStack) {
		NumPut(0xC483, injectData, validParams * 5 + 5, "UShort")
	NumPut(validParams*4, injectData, validParams * 5 + 7, "UChar")
	NumPut(0xC3, injectData, validParams * 5 + 8, "UChar")
	} else {
	NumPut(0xC3, injectData, validParams * 5 + 5, "UChar")
}
writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
if(ErrorLevel)
	return false
hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
if(ErrorLevel)
	return false
waitForSingleObject(hThread, 0xFFFFFFFF)
closeProcess(hThread)
return true
}
virtualAllocEx(hProcess, dwSize, flAllocationType, flProtect) {
if(!hProcess) {
		ErrorLevel := ERROR_INVALID_HANDLE
	return 0
}
dwRet := DllCall(    "VirtualAllocEx"
, "UInt", hProcess
, "UInt", 0
, "UInt", dwSize
, "UInt", flAllocationType
, "UInt", flProtect
, "UInt")
if(dwRet == 0) {
		ErrorLEvel := ERROR_ALLOC_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
return dwRet
}
virtualFreeEx(hProcess, lpAddress, dwSize, dwFreeType) {
if(!hProcess) {
		ErrorLevel := ERROR_INVALID_HANDLE
	return 0
}
dwRet := DllCall(    "VirtualFreeEx"
, "UInt", hProcess
, "UInt", lpAddress
, "UInt", dwSize
, "UInt", dwFreeType
, "UInt")
if(dwRet == 0) {
		ErrorLEvel := ERROR_FREE_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
return dwRet
}
createRemoteThread(hProcess, lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpThreadId) {
if(!hProcess) {
		ErrorLevel := ERROR_INVALID_HANDLE
	return 0
}
dwRet := DllCall(    "CreateRemoteThread"
, "UInt", hProcess
, "UInt", lpThreadAttributes
, "UInt", dwStackSize
, "UInt", lpStartAddress
, "UInt", lpParameter
, "UInt", dwCreationFlags
, "UInt", lpThreadId
, "UInt")
if(dwRet == 0) {
		ErrorLEvel := ERROR_ALLOC_MEMORY
	return 0
}
ErrorLevel := ERROR_OK
return dwRet
}
waitForSingleObject(hThread, dwMilliseconds) {
if(!hThread) {
		ErrorLevel := ERROR_INVALID_HANDLE
	return 0
}
dwRet := DllCall(    "WaitForSingleObject"
, "UInt", hThread
, "UInt", dwMilliseconds
, "UInt")
if(dwRet == 0xFFFFFFFF) {
		ErrorLEvel := ERROR_WAIT_FOR_OBJECT
	return 0
}
ErrorLevel := ERROR_OK
return dwRet
}
__ansiToUnicode(sString, nLen = 0) {
if !nLen
{
	nLen := DllCall("MultiByteToWideChar"
	, "Uint", 0
	, "Uint", 0
	, "Uint", &sString
	, "int",  -1
	, "Uint", 0
	, "int",  0)
}
VarSetCapacity(wString, nLen * 2)
DllCall("MultiByteToWideChar"
, "Uint", 0
, "Uint", 0
, "Uint", &sString
, "int",  -1
, "Uint", &wString
, "int",  nLen)
return wString
}
__unicodeToAnsi(wString, nLen = 0) {
pString := wString + 1 > 65536 ? wString : &wString
if !nLen
{
	nLen := DllCall("WideCharToMultiByte"
	, "Uint", 0
	, "Uint", 0
	, "Uint", pString
	, "int",  -1
	, "Uint", 0
	, "int",  0
	, "Uint", 0
	, "Uint", 0)
}
VarSetCapacity(sString, nLen)
DllCall("WideCharToMultiByte"
, "Uint", 0
, "Uint", 0
, "Uint", pString
, "int",  -1
, "str",  sString
, "int",  nLen
, "Uint", 0
, "Uint", 0)
return sString
}
Utf8ToAnsi(ByRef Utf8String, CodePage = 1251)
{
if (NumGet(Utf8String) & 0xFFFFFF) = 0xBFBBEF
	BOM = 3
else
	BOM = 0
UniSize := DllCall("MultiByteToWideChar", "UInt", 65001, "UInt", 0
, "UInt", &Utf8String + BOM, "Int", -1
, "Int", 0, "Int", 0)
VarSetCapacity(UniBuf, UniSize * 2)
DllCall("MultiByteToWideChar", "UInt", 65001, "UInt", 0
, "UInt", &Utf8String + BOM, "Int", -1
, "UInt", &UniBuf, "Int", UniSize)
AnsiSize := DllCall("WideCharToMultiByte", "UInt", CodePage, "UInt", 0
, "UInt", &UniBuf, "Int", -1
, "Int", 0, "Int", 0
, "Int", 0, "Int", 0)
VarSetCapacity(AnsiString, AnsiSize)
DllCall("WideCharToMultiByte", "UInt", CodePage, "UInt", 0
, "UInt", &UniBuf, "Int", -1
, "Str", AnsiString, "Int", AnsiSize
, "Int", 0, "Int", 0)
return AnsiString
}
IsPlayerConnected(player) {
if (player is integer) and player >= 0 and player <= 999
	return (getPlayerNameById(player) != "")
return (getPlayerIdByName(player) != -1)
}
getClosestPlayerIdCarNotCopFBI3() {
dist := 0x7fffffff
p := getStreamedInPlayersInfo()
if(!p)
	return -1
lpos := getCoordinates()
if(!lpos)
	return -1
id := -1
For i, o in p
if (getTargetPlayerSkinIdById(i)!="76" and getTargetPlayerSkinIdById(i)!="265" and getTargetPlayerSkinIdById(i)!="266" and getTargetPlayerSkinIdById(i)!="267" and getTargetPlayerSkinIdById(i)!="280" and getTargetPlayerSkinIdById(i)!="281" and getTargetPlayerSkinIdById(i)!="282" and getTargetPlayerSkinIdById(i)!="283" and getTargetPlayerSkinIdById(i)!="284" and getTargetPlayerSkinIdById(i)!="285" and getTargetPlayerSkinIdById(i)!="288" and getTargetPlayerSkinIdById(i)!="306" and getTargetPlayerSkinIdById(i)!="307" and getTargetPlayerSkinIdById(i)!="309" and getTargetPlayerSkinIdById(i)!="141" and getTargetPlayerSkinIdById(i)!="163" and getTargetPlayerSkinIdById(i)!="164" and getTargetPlayerSkinIdById(i)!="165" and getTargetPlayerSkinIdById(i)!="166" and getTargetPlayerSkinIdById(i)!="286"
	and getTargetPlayerSkinIdById(i)!="305")
{
	t:=getDist(lpos,o.POS)
	if(t<dist)
	{
		dist := t
		id := i
	}
}
return id
}
getClosestPlayerIdCarNotCopFBI() {
dist := 0x7fffffff
p := getStreamedInPlayersInfo()
if(!p)
{
	return -1
}
lpos := getCoordinates()
if(!lpos)
{
	return -1
}
id := -1
For i, o in p
if (getTargetPlayerSkinIdById(i)!="76" and getTargetPlayerSkinIdById(i)!="265" and getTargetPlayerSkinIdById(i)!="266" and getTargetPlayerSkinIdById(i)!="267" and getTargetPlayerSkinIdById(i)!="280" and getTargetPlayerSkinIdById(i)!="281" and getTargetPlayerSkinIdById(i)!="282" and getTargetPlayerSkinIdById(i)!="283" and getTargetPlayerSkinIdById(i)!="284" and getTargetPlayerSkinIdById(i)!="285" and getTargetPlayerSkinIdById(i)!="288" and getTargetPlayerSkinIdById(i)!="141" and getTargetPlayerSkinIdById(i)!="163" and getTargetPlayerSkinIdById(i)!="164" and getTargetPlayerSkinIdById(i)!="165" and getTargetPlayerSkinIdById(i)!="166" and getTargetPlayerSkinIdById(i)!="286" and getTargetPlayerSkinIdById(i)!="300"  and getTargetPlayerSkinIdById(i)!="301"  and getTargetPlayerSkinIdById(i)!="302"  and getTargetPlayerSkinIdById(i)!="303"  and getTargetPlayerSkinIdById(i)!="304"  and getTargetPlayerSkinIdById(i)!="305"  and getTargetPlayerSkinIdById(i)!="306"  and getTargetPlayerSkinIdById(i)!="307"  and getTargetPlayerSkinIdById(i)!="308"  and getTargetPlayerSkinIdById(i)!="309"  and getTargetPlayerSkinIdById(i)!="310")
{
	CarId := getTargetVehicleModelIdById(i)
	a1:=getMyPassengerId(0)
	a2:=getMyPassengerId(1)
	a3:=getMyPassengerId(2)
	a4:=getMyPassengerId(3)
	if (a1!=i && a2!=i && a3!=i && a4!=i)
	{
		t:=getDist(lpos,o.POS)
		if(t<dist)
		{
			dist := t
			id := i
		}
	}
}
return id
}
getClosestPlayerIdCarNotCopFBI2() {
dist := 0x7fffffff
p := getStreamedInPlayersInfo()
if(!p)
	return -1
lpos := getCoordinates()
if(!lpos)
	return -1
id := -1
For i, o in p
if (getTargetPlayerSkinIdById(i)!="76" and getTargetPlayerSkinIdById(i)!="265" and getTargetPlayerSkinIdById(i)!="266" and getTargetPlayerSkinIdById(i)!="267" and getTargetPlayerSkinIdById(i)!="280" and getTargetPlayerSkinIdById(i)!="281" and getTargetPlayerSkinIdById(i)!="282" and getTargetPlayerSkinIdById(i)!="283" and getTargetPlayerSkinIdById(i)!="284" and getTargetPlayerSkinIdById(i)!="285" and getTargetPlayerSkinIdById(i)!="288" and getTargetPlayerSkinIdById(i)!="141" and getTargetPlayerSkinIdById(i)!="163" and getTargetPlayerSkinIdById(i)!="164" and getTargetPlayerSkinIdById(i)!="165" and getTargetPlayerSkinIdById(i)!="166" and getTargetPlayerSkinIdById(i)!="286" and getTargetPlayerSkinIdById(i)!="300"  and getTargetPlayerSkinIdById(i)!="301"  and getTargetPlayerSkinIdById(i)!="302"  and getTargetPlayerSkinIdById(i)!="303"  and getTargetPlayerSkinIdById(i)!="304"  and getTargetPlayerSkinIdById(i)!="305"  and getTargetPlayerSkinIdById(i)!="306"  and getTargetPlayerSkinIdById(i)!="307"  and getTargetPlayerSkinIdById(i)!="308"  and getTargetPlayerSkinIdById(i)!="309"  and getTargetPlayerSkinIdById(i)!="310")
{
	if (isTargetInAnyVehicleById(i))
	{
		t:=getDist(lpos,o.POS)
		if(t<dist)
		{
			dist := t
			id := i
		}
	}
}
return id
}
getClosestPlayerIdCar() {
dist := 0x7fffffff
p := getStreamedInPlayersInfo()
if(!p)
	return -1
lpos := getCoordinates()
if(!lpos)
	return -1
id := -1
Driver := getMyPassengerId(0)
For i, o in p
{
	if(getTargetVehicleModelNameById(i)!="PoliceCar" and getTargetVehicleModelNameById(i)!="Police Maverick" and getTargetVehicleModelNameById(i)!="" and getTargetVehicleModelNameById(i)!="HPV1000" and getTargetVehicleModelNameById(i)!="Enforcer" && Driver!=i)
	{
		t:=getDist(lpos,o.POS)
		if (isTargetInAnyVehiclebyIdMod(i)==1)
		{
			if(t<dist)
			{
				dist := t
				id := i
			}
		}
	}
}
return id
}
isTargetInAnyVehiclebyIdMod(dwId)
{
if(!checkHandles())
	return -1
dwPedPointer := getPedById(dwId)
dwVehiclePointer := getVehiclePointerByPed(dwPedPointer)
dwVal := readDWORD(hGTA, dwVehiclePointer + ADDR_VEHICLE_DRIVER)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
if(dwPedPointer == dwVal)
{
	return 1
}
else if(dwPedPointer != dwVal)
{
	return 0
}
else
{
	return -1
}
}
GeneratorRandoma(length)
{
static	c
if	!c
	Loop, 26
c .=	(!c ? "" : "`n") Chr(A_Index + 96)
Loop %	length
{
	Random, n, 1, 1296
	Loop %	n
	Sort, c, Random
	str .=	SubStr(c,1,1)
}
return	str
}
isPlayerDriverMod() {
if(!checkHandles())
	return -1
dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
if(!dwAddr)
	return -1
dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DRIVER)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
t:=0
if (dwVal==dwCPedPtr)
{
	t:=1
}
return t
}
getClosestPlayerId1() {
dist := 0x7fffffff
p := getStreamedInPlayersInfo()
if(!p)
	return -1
lpos := getCoordinates()
if(!lpos)
	return -1
id := -1
For i, o in p
{
	if(getTargetVehicleModelNameById(i)!="PoliceCar" and getTargetVehicleModelNameById(i)!="Police Maverick" and getTargetVehicleModelNameById(i)!="" and getTargetVehicleModelNameById(i)!="HPV1000" and getTargetVehicleModelNameById(i)!="Enforcer")
	{
		t:=getDist(lpos,o.POS)
		if(t<dist)
		{
			dist := t
			id := i
		}
	}
}
return id
}
getClosestPlayerId2() {
dist := 0x7fffffff
p := getStreamedInPlayersInfo()
if(!p)
	return -1
lpos := getCoordinates()
if(!lpos)
	return -1
id := -1
For i, o in p
{
	if(getTargetVehicleModelNameById(i)!="PoliceCar" and getTargetVehicleModelNameById(i)!="Police Maverick" and getTargetVehicleModelNameById(i)!="" and getTargetVehicleModelNameById(i)!="HPV1000" and getTargetVehicleModelNameById(i)!="Enforcer")
	{
		t:=getDist(lpos,o.POS)
		if(t<dist and t<100)
		{
			dist := t
			id := i
		}
	}
}
return id
}
in_car_not_cop(id)
{
if(getTargetVehicleModelNameById(id)!="PoliceCar" and getTargetVehicleModelNameById(i)!="Police Maverick" and getTargetVehicleModelNameById(id)!="HPV1000" and getTargetVehicleModelNameById(id)!="Enforcer" and getTargetVehicleModelNameById(id)!="")
	return 1
else
	return 0
}
person_passenger(id,id2)
{
t:=getDist(getPedCoordinates(getPedById(id)),getPedCoordinates(getPedById(id2)))
if(3.2>t)
	return 1
else
	return -1
}
listrtextfordialog(files,pages,dialogstyle) {
listrtext := []
Loop, Read, %files%
{
	listrtext.Insert(A_LoopReadLine)
	textout .= listrtext[A_Index] "`n"
}
Sleep 400
showDialog(dialogstyle,pages, textout , "ОК", "Отмена")
phelptext := ""
return
}
getMyPassengerId(dwPlace) {
if(!checkHandles())
	return -1
if(dwPlace < 0 || dwPlace > 8)
	return 0
dwPlacePoint := [0x460, 0x464, 0x468, 0x46C, 0x470, 0x474, 0x478, 0x47C, 0x480]
dwPlaceAdr := dwPlacePoint[dwPlace + 1]
dwVehPtr := readDWORD(hGTA, 0xBA18FC)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
dwAddr := readDWORD(hGTA, dwVehPtr+dwPlaceAdr)
if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
	return -1
}
ErrorLevel := ERROR_OK
pasID := getIdByPed(dwAddr)
return pasID
}
getMyCarId() {
if (!checkHandles())
	return -1
dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
if (ErrorLevel || !dwVehPtr)
	return -1
if (!updateOVehicleData())
	return -1
for i, o in oVehiclePoolData {
		if (o.PTR == dwVehPtr)
		return o.ID
}
return -1
}
updateOVehicleData() {
RefreshVeh := 0
if (!checkHandles())
	return -1
if (RefreshVeh + 1000 > A_TickCount)
	return true
dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
dwAddress := readDWORD(hGTA, dwAddress + SAMP_PPOOLS_OFFSET)
stVehiclePool := readDWORD(hGTA, dwAddress + 0x1C)
if (!stVehiclePool)
	return -1
vehicleCount := readDWORD(hGTA, stVehiclePool + 0x0)
Loop, % 2000
{
	if (!readDWORD(hGTA, stVehiclePool + 0x3074 + (A_Index - 1) * 0x4))
		continue
	vehPtr := readDWORD(hGTA, stVehiclePool + 0x4FB4 + (A_Index - 1) * 0x4)
	if (!vehPtr)
		continue
	oVehiclePoolData.Push(Object("ID", A_Index - 1, "PTR", vehPTR))
	vehicleCount := vehicleCount-1
	if (vehicleCount < 1)
		break
}
RefreshVeh := A_TickCount
return true
}
SetKeyDelay, 0
settimer, BH
settimer, Time, 1000
global Version := "5.0"
global dx9_download := "http://raw.githubusercontent.com/EvolveRolePlay/Police/master/dx9_overlay.dll"
Menu, Tray, nostandard
Menu, Tray, deleteall
Menu, Tray, Add, Свернуть, goHideTray
Menu, tray, default, Свернуть
Menu, Tray, Add, Выход, GuiClose
Menu, Tray, Click, 1
Gui, Load:-caption -sysmenu +AlwaysOnTop +Border
Gui, Load:font, S16
Gui, Load:Add, Text, x0 y8 w200 h40 Center, Загрузка...
Gui, Load:Show, w200 h40
loop 10
{
	VarSetCapacity(SetRead%A_Index%, 4, 0)
	NumPut(A_Index+1000,SetRead%A_Index%,0,"Int")
}
RegRead, Adress, HKEY_CURRENT_USER, Software\SAMP, gta_sa_exe
RegExMatch(Adress, "(.*)gta\_sa\.exe", Adress)
global FailGame := Adress1
global iniFile := A_MyDocuments "\Police Dream\config.ini"
global Penal2 := A_MyDocuments "\Police Dream\Сервер №2\Уголовный Кодекс.txt"
global FedP2 := A_MyDocuments "\Police Dream\Сервер №2\Федеральное постановление.txt"
global Administrative2 := A_MyDocuments "\Police Dream\Сервер №2\Административный Кодекс.txt"
global Crib := A_MyDocuments "\Police Dream\Crib.txt"
global Penal1 := A_MyDocuments "\Police Dream\Сервер №1\Уголовный Кодекс.txt"
global FedP1 := A_MyDocuments "\Police Dream\Сервер №1\Федеральное постановление.txt"
global Administrative1 := A_MyDocuments "\Police Dream\Сервер №1\Административный Кодекс.txt"
global Lect := A_MyDocuments "\Police Dream\Лекции\Агитация в армиях.txt"
global bDir := A_MyDocuments "\Police Dream"
global S1 := A_MyDocuments "\Police Dream\Сервер №1"
global S2 := A_MyDocuments "\Police Dream\Сервер №2"
global Lec := A_MyDocuments "\Police Dream\Лекции"
global dx9 := A_scriptdir "\dx9_overlay.dll"
global Chatlog := A_MyDocuments "\GTA San Andreas User Files\SAMP\chatlog.txt"
global suini := A_MyDocuments "\Police Dream\su.txt"
RegRead, Adress, HKEY_CURRENT_USER, Software\SAMP, gta_sa_exe
RegExMatch(Adress, "(.*)gta\_sa\.exe", Adress)
global woGTA := Adress1
global KeySetList := Object()
KeySetList := ["Help", "Cuff", "Follow", "Tazer", "Cput", "Ceject", "Deject", "Frisk", "Clist", "Doklad", "Megaphone", "Noga", "SMS", "R", "EventYes", "EventNo", "STime", "Sbros", "Arrest"]
global BindCount := 202
global Saved := false, isError := false, LoadConnect := false, gRang := false
global Event := Object()
Event["TazerEn"] := true, Event["Fraction"] := false, Event["cmdc"] := false, Event["Clear"] := false, Event["FBISpy"] := false, Event["carinfo"] := false, Event["Authorization"] := false, Event["SuspectKeyActive"] := false, Event["tTime"] := true, Event["pred"] := false, Event["yourself"] := false, dostup := false, STazer := "{FF0000}OFF"
global WS_VSCROLL := 0x200000, SIZE_MINIMIZED := 1, SIF_RANGE := 0x1, SIF_PAGE := 0x2
, SB_VERT := 1, SB_LINEUP := 0, SB_LINEDOWN := 1, WM_VSCROLL := 0x115
IfNotExist, %bDir%
	FileCreateDir, %bDir%
IfNotExist, %S1%
	FileCreateDir, %S1%
IfNotExist, %S2%
	FileCreateDir, %S2%
IfNotExist, %Lec%
	FileCreateDir, %Lec%
IfNotExist, %dx9%
{
	FileInstall, dx9_overlay.dll, %A_scriptdir%\dx9_overlay.dll, 1
	UrlDownloadToFile, http://github.com/EvolveRolePlay/Police/raw/master/dx9_overlay.dll, %A_scriptdir%\dx9_overlay.dll
	IfNotExist, %A_scriptdir%\dx9_overlay.dll
	{
		msgbox, Отсутствует dx9_overlay.dll
		return
	}
}
if(!FileExist(iniFile))
	FileAppend,
(
[settings]
Rang=1
Fraction=0
isOpenT=1
Clist=19
Count=7
DeagleCount=2
ShotgunCount=2
MP5Count=2
M4A1Count=2
RifleCount=1
ArmourCount=1
SpecGunCount=1
isOpenHide=0
isAuthDuty=1
isStopM=1
isTake=0
isTakeKpz=0
isAutoEn=1
isKill=1
isRU=0
isBar=0
isAutoScreen=0
isArmyD=1
isWoman=0
isPass=0
isTakeKeys=0
isTazer=1
isGiveGuns=1
isTime=1
isDeagleCount=1
isShotgunCount=1
isMP5Count=0
isM4A1Count=1
isRifleCount=0
isArmourCount=1
isSpecGunCount=0
isTakeGun=1
Tag=[PA]:
Pass=
isChatFrisk=1
isMdc=0
isOffinarrested=1
isGmCar=1
isDeagleCount=1
isShotgunCount=1
ConnectServer=1
isDead=1
isHeal=1
Count=
[keys]
KeyTazer=Numpad1
KeyHelp=F10
KeyCuff=!3
KeyFollow=!4
KeyCput=!5
KeyCeject=!6
KeyDeject=Numpad7
KeyFrisk=!2
KeyClist=Numpad0
KeyDoklad=Numpad6
Keynarko=F12
KeyMegaphone=Numpad9
KeySTime=!0
KeyArrest=!F11
KeyNoga=Numpad5
KeySMS=!9
KeyR=NumpadSub
KeyEventYes=F1
KeyEventNo=F2
KeySbros=NumpadDot
[TextDraw]
TimeX=59
TimeY=566
TazerX=76
TazerY=438
TimeSize=10
TimeStyle=Times New Roman
TimeColor=696969
TazerSize=12
TazerStyle=Times New Roman
), %IniFile%
if(!FileExist(Crib))
	FileAppend,, %Crib%
if(!FileExist(suini))
	FileAppend,
(
Нанесение телесных повреждений - 2 года
Вооруженное нападение на гражданских - 3 года
Вооруженное нападение на гос - 6 лет, запрет на адвоката
Хулиганство - 1 год
Неадекватное поведение - 1 год
Попрошайничество - 1 год
Оскорбление - 2 года
Угон транспортного средства - 2 года
Неподчинение сотрудникам ПО - 1 год
Уход от сотрудников ПО - 2 года
Побег с места заключения - 6 лет
Ношение оружия без лицензии - 1 год и штраф в размере 2000$.
Изготовление нелегального оружия - 3 года и изъятие
Приобретение нелегального оружия - 3 года и изъятие
Продажа нелегального оружия - 3 года и изъятие
Хранение наркотиков - 3 года и изъятие
Хранение материалов - 3 года и изъятие
Употребление наркотиков - 3 года и изъятие
Порча чужого имущества - 1 год и штраф в размере 5000$
Уничтожение чужого имущества - 4 года и штраф в размере 15000$
Проникновение на охр. территорию - 2 года
Проникновение на част. территорию - 1 год
Вымогательство - 2 года
Угрозы - 1 год
Провокации - 2 года
Мошенничество - 2 года
Предложение интимных услуг - 1 год
Изнасилование гражданина - 3 год
Укрывательство преступлений - 2 года
Использование фальшивых документов - 1 год
Клевета на гос. лицо - 1 год
Клевета на гос. организации - 2 года
Покупка военной формы - 2 года форма подлежит изъятию.
Ношение военной формы - 2 года, форма подлежит изъятию.
Покупка ключей от камеры - 6 лет
Предложение взятки - 2 года
Совершение теракта - 6 лет, лишение всех лицензий
Организация нелегальных мероприятий - 2 года
Неуплата штрафа - 2 года
Игнорирование спец. сирен - 1 год
Превышение полномочий адвоката - 3 года
Агитация в день выборов – 6 лет
), %suini%
if(!FileExist(cprice))
	FileAppend,
(
От 1 до 2 LVL цена за выпуск: 1500
От 3 до 6 LVL цена за выпуск: 4000
От 7 до 13 LVL цена за выпуск: 8000
От 14 до 23 LVL цена за выпуск: 12000
От 24 до 35 LVL цена за выпуск: 15000
От 36 до 99 LVL цена за выпуск: 20000
), %cprice%
if(!FileExist(FedP2))
	FileAppend,
(
0.1 Федеральное Постановление - это нормативно-правовой акт, который был призван внести чёткие рамки в работу государственных организаций.
0.2 Федеральное Постановление издаётся Федеральным Бюро Расследований (далее ФБР) для Полицейских Департаментов (далее ПД) и военных частей (Далее Армия).
0.3 Федеральное Постановление может быть изменено Директором ФБР ( при участии следящего Администратора ) в любое время дня и ночи, его вступление в силу происходит через 48 часов после публикации.
0.4 Федеральное Постановление обязано выполняться всеми сотрудниками вышеупомянутых организаций.
0.5 Незнание Федерального Постановления не освобождает обвиняемого от ответственности.
1.1 Запрещается несанкционированное применение огнестрельного оружия против любого гражданского лица/сотрудника государственных организаций - увольнение.
1.2 Запрещается любое унижение чести и достоинства граждан вне зависимо от его социального или правового статуса - увольнение.
1.3 Запрещается применение насилия в отношении как граждан так и заключенных под стражу лиц - понижение.
2.1 Запрещается проникать на территорию FBI без получения официального пропуска от любого из агентов ФБР выше Мл.Агента - предупреждение / понижение.
2.1 Примечание: Мэру, Генералам армий, Шерифам разрешение не требуется.
2.2 Запрещается выдавать себя за любого государственного сотрудника - увольнение.
2.2 Исключение: Агенты ФБР во время ведения следственных действий под прикрытием.
2.3 Запрещается брать руководство операциями (теракты / похищения) без приказа ФБР - увольнение.
2.4 Запрещается неподчинение агенту ФБР в рамках его законных требований - понижение-увольнение.
2.4 Исключение: Агенты ФБР во время ведения следственных действий под прикрытием.
2.5 Запрещается оскорблять/угрожать/шантажировать агента ФБР - увольнение.
2.6 Запрещается оспаривать понижение/увольнение, выданное агентом ФБР/Мэром где-либо, кроме как в специальном разделе жалоб - понижение / увольнение.
2.7 Запрещается раскрывать личность агента ФБР, если тот находится под прикрытием - увольнение.
2.8 Запрещается вносить помехи в работу аттестационной комиссии от высших органов власти, проводящих любого рода проверки в государственных структурах - понижение.
2.9 Запрещается избегать проверки от ФБР - понижение.
2.9 Примечание: Агент имеет право вас вызвать в бюро и провести проверку. При отказе последует соответствующее наказание согласно пункту 2.9.
3.1 Запрещаются любые проявления неадекватного поведения и провокации - предупреждение / понижение / увольнение.
3.2 Запрещается нарушать правила строя - предупреждение / понижение.
3.3 Запрещается продажа любого государственного имущества (Ключи от камер/форма/фуры с боеприпасами) - увольнение + ЧС фракции.
3.4 Запрещается давать заведомо ложную информацию государственному сотруднику - увольнение.
3.5 Запрещается необоснованно требовать документы, а так же проводить обыск гражданских лиц - понижение.
3.6 Запрещается лишать права на адвоката (За исключением статьей "Уголовного Кодекса",предусматривающих лишение и наличия у вас доказательств) - понижение.
3.7 Запрещается государственным сотрудникам входить в сговоры с мафией/бандами - увольнение.
3.7 Исключение: Спец. операции (обязательный контроль старшего офицера).
3.8 Запрещается без разрешения/пропуска (самовольно) покидать часть/свой город - увольнение.
3.9 Запрещается носить форму не соответствующую занимаемой должности/званию - понижение.
3.9 Примечание: Соответствие формы и званий устанавливается руководителем организации.
3.10 Запрещается в рабочее время носить на себе вызывающие аксессуары - предупреждение / понижение.
3.11 Запрещается умышленно удалять с базы данных розыска - понижение / увольнение
3.11 Дополнение: Если вы ошиблись и можете доказать свою невиновность, вы должны сообщить об этом в департамент.
4.1 Запрещается снимать преступникам розыск без уведомления ФБР - понижение.
4.1 Исключение: Если розыск был выдан по ошибке и вы можете это доказать.
4.2 Запрещается выдавать розыск без весомой на то причины, по просьбе. Иными словами - не видя факта нарушения лично - понижение / увольнение.
4.3 Запрещается провоцировать кого-либо, не важно, какого рода провокации - понижение.
4.4 Запрещается использовать нецензурную брань, а также оскорбления - понижение / увольнение.
4.5 Запрещается в рабочее время заниматься своими делами ( игра в казино, участие в гонках, дерби, пейнтболе в рабочее время с 9:00 до 22:00 за исключением перерыв с 13:00 до 14:00 , и случаев, когда вышеупомянутые мероприятия были организованы Администрацией сервера) - предупреждение / понижение / увольнение.
4.5 Исключение: Разрешение со стороны руководства организации, выполнение служебных обязанностей (например, охрана авторынка) или тренировок под присмотром старшего офицерского состава.
4.6 Запрещается хранение и употребление наркотических веществ, а также хранение краденых материалов - увольнение.
4.6 Исключение: Сотрудники PD, сотрудники ФБР в целях спец. операций (с обязательным контролем старшего офицера).
4.7 Запрещается находиться в опасном районе вне спец. операций - увольнение.
4.7 Исключение: Спец. операция, Федеральный патруль,специальные отделы (обязательный контроль со стороны руководства организации).
4.8 Запрещается объявлять в розыск не по уголовному кодексу - предупреждение / понижение.
4.9 Запрещается неподчинение старшему по званию в рамках закона - понижение.
4.9 Исключение: Старшие по званию - в рамках одной организации.
4.10 Запрещается употреблять алкоголь в рабочее время - понижение.
4.11 Запрещается брать/давать взятки - увольнение.
4.12 Запрещается нарушать правила волны департамента - предупреждение / понижение.
4.13 Запрещается беспричинно обыскивать государственных сотрудников - понижение.
4.14 Запрещается лишать лицензии без весомых на то причин - компенсация стоимости лицензий за счёт отобравшего офицера + понижение.
4.14 Примечание: Если Вы увидели, что государственный сотрудник нарушил правила дорожного движения или в гражданской форме УК (где предусматривается изъятие лицензии), и у Вас есть доказательства, Вы имеете полное право забрать лицензию.
4.15 Запрещается нарушать субординацию при общении со старшими по званию - предупреждение / понижение.
4.16 Запрещается убийство в наручниках или эффектом электрошокера - понижение / увольнение.
4.16 Примечание: Разрешено использовать электрошокер в перестрелке, если она началась в Зелёной Зоне и у вас есть доказательства.
4.17 Запрещается нарушать законы штата, не важно в форме вы или нет - предупреждение / понижение / увольнение.
4.17 Исключение: Если у Вас есть доказательства, подтверждающие вашу полную либо частичную невиновность по фактам: самообороны себя и близких; защиты личного имущества; при выполнении служебного долга, но находясь не при исполнении служебных обязанностей ( не в форме ); приказ старшего по званию в рамках закона.
4.18 Запрещается нарушать общие правила Police - выговор / понижение / увольнение.
4.19 Запрещается неподчинение руководящему составу ФБР - увольнение.
4.20 Запрещается неподчинение Мэру в рамках закона Штата Evolve - увольнение.
4.21 Запрещается отдавать приказы Мэру - увольнение.
4.22 Запрещается отдавать приказы сотрудникам ФБР - увольнение.
5.1 Сотрудник ФБР имеет право сменить наказание на дисциплинарное взыскание в виде предупреждения.
5.2 Cотрудник Армии или ПД обязан сделать выводы о своей вине и постараться более не нарушать ФП.
5.3 Смена наказания осуществляется агентом ФБР, исходя из его здравого смысла и опыта. Выдача предупреждений за пункты, которые так или иначе способны пошатнуть государственную безопасность - запрещены.
5.4 Сотрудник имеет право получить только одно предупреждение, при последующих нарушениях следуют более тяжкие наказания.
5.5 Пункты, предусматривающие выбор вида наказания, подразумевают применение одного из них по усмотрению выдающего наказание, в зависимости от тяжести нарушения и наличия активных предупреждений, либо нарушений в прошлом.
), %FedP2%
if(!FileExist(Penal2))
	FileAppend,
(
1. Избиение, нанесение телесных повреждений.
1.1 За избиение или нанесение телесных повреждений, преступнику присваивается 2 уровень розыска.
1.1 [ Удары ножом, битой, лопатой, кулаком и ногой. ]
2. Вооружённое нападение, использование огнестрельного оружия.
2.1 За вооружённое нападение на гражданских, преступнику присваивается 3 уровень розыска + изъятие лицензии на оружие.
2.2 За вооружённое нападение на гос.сотрудников, преступнику присваивается 6 уровень розыска + изъятие лицензии на оружие + запрет на выход под залог [ООП].
2.2 [ Розыск выдаётся за использование огнестрельного оружия с целью нанесения физического вреда или повреждения/уничтожения имущества. ]
2.2 В рамках самообороны разрешено использовать оружие, но только при условии наличия соответствующей лицензии. Если лицензии нет, обороняющийся всё равно задерживается по статье за "Ношение оружия без лицензии". ]
3. Убийство.
3.1 За убийство или заказ убийства, преступнику присваивается 3 уровень розыска.
3.2 За убийство военнослужащего при исполнении, преступнику присваивается 4 уровень розыска.
3.3 За убийство полицейского при исполнении, преступнику присваивается 5 уровень розыска.
3.4 За убийство агента ФБР при исполнении, преступнику присваивается 6 уровень розыска.
4. Хулиганство, попрошайничество.
4.1 За хулиганство и неадекватное поведение в общественных местах, преступнику присваивается 1 уровень розыска.
4.1 [ К хулиганству приравнивается любое нарушение общественного порядка: Стояние на крыше автомобиля, нахождение на крыше остановки, ложный вызов на экстренную линию, флуд в любой чат одним и тем же сообщением.
4.1 Если человек толкает пустую машину с проезжей части на обочину, это не считается хулиганством. ]
4.2 За попрошайничество в общественных местах, преступнику присваивается 1 уровень розыска.
5. Оскорбление.
5.1 За оскорбление в любой форме, преступнику присваивается 2 уровень розыска.
5.1 [ Оскорбление – это любая попытка перехода на личности в общении, например обращение – "мусор" в отношении представителя силовых структур. Так же оскорблением можно считать затрагивание расы, национальности [Ниггер, макаронник, узкоглазый и т.п.].
5.1 В случае если оскорбления идут в крайне неадекватной форме, при задержании следует ставить запрет на рассмотрение дела о выпуске под залог [Запрет права на адвоката].
6. Угон транспортного средства.
6.1 За угон транспортного средства, преступнику присваивается 2 уровень розыска.
6.1 [ Угон считается угоном лишь тогда, когда преступник сдвинулся с места находясь за рулем транспорта – в иных случаях следует задерживать за "Проникновение", в зависимости от ситуации ограничиваясь предупреждением.
6.1 Если угон происходит через взлом авто, так же следует обвинять в порче имущества. ]
7. Неподчинение, попытка скрыться от полиции, побег.
7.1 За неподчинение правоохранительным органам, преступнику присваивается 1 уровень розыска.
7.1 [ Неподчинением следует считать отказ или игнорирование законных требований офицера, как пример: Отказ покинуть салон авто или отказ покинуть место проведения тренировки гос. служащих.
7.1 Отказ оплачивать штраф или подписывать протокол о задержании неподчинением не является! ]
7.2 За попытку скрыться от сотрудников правоохранительных органов, преступнику присваивается 2 уровень розыска.
7.3 За побег из тюрьмы при помощи ключей от камер [/escape], преступнику присваивается 6 уровень розыска и запрет на выход под залог [ООП].
7.3 [ Ключи подвергаются изъятию из инвентаря лишь при 3 и выше уровне розыска [Общее кол-во зв. по действующим статьям] и за офф от ареста.
7.3 При проведении рейдов на ОПГ, у членов ОПГ розыск уже изначально 6+, так как рейд проводится после проведённого расследования против данной ОПГ.
7.3 Помните, ключи – как и лицензии, являются предметом ценности, за злоупотребление полномочиями и командами, будет следовать наказание вплоть до увольнения с занесением в ЧС гос. структур. ]
8. Соучастие в преступлении.
8.1 За соучастие в преступлении, преступнику присваивается тоже же наказание, что и организатору.
8.1 [ Пример: Таксист везёт пассажира, если оскорбляет пассажир, а водитель пытается скрыться от погони, заместо того чтобы содействовать задержанию – он соучастник.
8.1 Однако если водитель оскорбляет, а невинный пассажир едет рядом, то пассажир соучастником не является, так как он не причастен к преступлению.
8.1 Не следует путать с содействием преступлению, если пассажир к примеру подсказывает водителю как/куда ехать или например провоцирует офицеров своими криками, то это такое же соучастие. ]
9. Оружие.
9.1 За ношение оружия в открытом виде, кроме гос. служащих находящихся при исполнении служебных обязанностей – оружие изымается.
9.2 За ношение оружия без лицензии, преступнику присваивается 1 уровень розыска и штраф в размере 2000$.
9.3 За изготовление оружие нелегальным способом, его приобретение или его продажу, преступнику присваивается 3 уровень розыска с последующим изъятием оружия и/или материалов.
9.3 [ Нелегальным способом является изготовление оружия из материалов в гетто. Легальный способ – покупка у NPC в АММО. ]
10. Наркотики и материалы.
10.1 За хранение или перевозку наркотиков, преступнику присваивается 3 уровень розыска с изъятием наркотических веществ.
10.2 За хранение или перевозку материалов, преступнику присваивается 3 уровень розыска с изъятием материалов.
10.3 За употребление наркотиков, преступнику присваивается 3 уровень розыска с последующим изъятием наркотических веществ.
10.3 [ Отыгровки навроде – "/me съел конфету", с целью употребить наркотик и избежать наказание – НЕ являются адекватной РП-отыгровкой.
10.3 Если вы видите в чате "Nick_Name употребил(а) наркотик", то смело задерживайте преступника, при обязательном условии что это происходит прямо на ваших глазах и вы напрямую видите персонаж игрока.
10.3 При употреблении наркотических веществ, розыск следует так же выдавать и за их хранение. ]
10.4 За употребление наркотических веществ гос. служащим, сотрудник увольняется из организации и получает 3 уровень розыска.
10.5 За рекламу/продажу/покупку наркотиков или материалов, преступнику присваивается 2 уровень розыска и изъятие наркотиков/материалов.
10.6 За изготовление наркотиков/психотропных веществ, присваивается 3 уровень розыска.
10.6 [ Относится так же к выращиванию "марихуаны" на фермах. Обвинению подлежат все фермеры, заместители и хозяева фермы Простые работники обвинению не подлежат. ]
11. Уничтожение и повреждение имущества.
11.1 За повреждение чужого имущества, преступнику присваивается 1 уровень розыска и штраф в размере 5000$
11.2 За уничтожение чужого имущества, преступнику присваивается 4 уровень розыска, штраф в размере 15000$ и полная выплата компенсации за нанесённый ущерб.
11.2 [ Уничтожением является любое действие, после которого предмет взорвался или исчез [Перевернули, утопили, расстреляли и т.д.]
12. Проникновение на запретную территорию.
12.1 За проникновение на охраняемую территорию, преступнику присваивается 2 уровень розыска.
12.1 [ Территории воинских частей и формирований, офис ФБР, участки SAPD, второй и выше этажи мэрии, места тренировок - розыск следует выдавать после повторного нарушения границы. Пробивание блок постов, проникновение на территории находящиеся под оцеплением силами правопорядка - розыск следует выдавать сразу же, после нарушения границы.
12.1 Если преступник совершил правонарушение на территории, то розыск следует выдавать так же и по этой статье (оскорбил и уехал, испортил имущество, угнал т/с и т.д.). ].
12.2 За проникновение на частную территорию, преступнику присваивается 1 уровень розыска.
12.2 [ Проникновение в транспорт является незаконным, если оно осуществляется без согласия владельца/арендатора данного транспорта.
12.2 Крыша SFN так же является частной территорией ].
13. Бандитизм.
13.1 За ограбление граждан или организаций, преступнику присваивается 3 уровень розыска с последующим изъятием награбленного имущества.
13.1 [ При ограблениях на форму, материалы или наркотики, розыск следует выдавать так же и за хранение. ]
13.2 За вымогательство, обвиняемому присваивается 2 уровень розыска.
13.2 [ "– Механик, либо ты сейчас отдаёшь нам все свои деньги, либо мы покромсаем твоё корыто до состояния металлолома!", "– У меня есть док-ва твоего самовола, либо ты сейчас платишь мне 50000$, либо я на это пожалуюсь и тебя уволят!" – примеры оснований для обвинений в вымогательстве. ]
13.3 За угрозы, обвиняемому присваивается 1 уровень розыска.
13.3 [ Угрозы наподобие "Тебя понизят/уволят/занесут в ЧС гос. структур" – наказываются по этой статье, но если гражданин к примеру говорит "Я буду жаловаться!" – это не является основанием. ]
13.4 За провокации, обвиняемому присваивается 2 уровень розыска.
13.4 [ Выкрики подобно "– Давай! Стреляй, или ты боишься?!", оскорбительные жесты вроде "/me показал средний палец", "/me плюнул в лицо" и т.п. – примеры оснований для обвинений в провокации. ]
13.5 За мошенничество, обвиняемому присваивается 2 уровень розыска.
13.5 [ Пример: Таксист на арендованном гос. авто с включенным счётчиком [/fare] вымогает деньги/чаевые наперёд, а при отказе их дать – высаживает из авто. Подобное является мошенничеством и за это следует задерживать.
13.5 "– Хочешь расскажу, как взламывать банкомат? Заплати деньги и скажу." – NonRP-мошенничество, в этой ситуации обязательно сообщите в репорт администрации. ]
13.6 За попытку взлома/взлом базы данных полиции, преступнику присваивается 1 уровень розыска.
14. Проституция и изнасилование.
14.1 За предложение интимных услуг, преступнику присваивается 1 уровень розыска.
14.2 За изнасилование преступнику присваивается 3 уровень розыска.
15. Дача ложных показаний, использование фальшивых документов.
15.1 За укрывательство преступлений/преступников/фактов/улик и прочей важной для следствия информации или за дачу ложных показаний, преступнику присваивается 2 уровень розыска.
15.2 За использование фальшивых документов или удостоверений, присваивается 1 уровень розыска.
16. Клевета.
16.1 За клевету на гражданское или государственное лицо, присваивается 1 уровень розыска.
16.2 За клевету на государственные и частные организации, присваивается 2 уровень розыска.
17. Покупка, продажа и хранение военной формы.
17.1 За продажу военного имущества, военный подлежит увольнению, занесению в черный список армии, так же ему присваивается 3 уровень розыска.
17.2 За покупку военной формы, преступнику присваивается 2 уровень розыска, форма подлежит изъятию.
17.3 За хранение/ношение купленной или ворованной военной формы, преступнику присваивается 2 уровень розыска, форма подлежит изъятию.
17.3 [ Или хранение, или ношение – это одно и тоже преступление и при задержании обвинение следует выдавать лишь по одному виду статьи. ]
18. Покупка, кража и продажа ключей от камер.
18.1 За покупку/продажу/кражу ключей от камеры, преступнику присваивается 6 уровень розыска.
19. Коррупция.
19.1 За предложение взятки, преступнику присваивается 2 уровень розыска.
19.2 За принятие взятки, гос. сотрудник несет наказание в виде присвоения 2 уровня розыска и увольнения.
19.2 [ Чтобы офицер понёс наказание за коррупцию, вы должны предоставить руководству РП-доказательства, к примеру: Запись диктофона или видео с видеорегистратора, с полагающейся РП-отыгровкой.
19.2 Полиции запрещается полностью манипулировать ситуацией, не оставляя жертвам ни единого шанса, за бредовые махинации вроде "/me изъял все предметы для видеосъёмки, диктофон, часы и т.п.", будет следовать наказание за PowerGaming. ]
20. Терроризм и взятие в заложники.
20.1 За совершение теракта, захват зданий и помещений, преступнику присваивается 6 уровень розыска, лишение всех лицензий и запрет на выход под залог [ООП].
20.1 [ Террористический акт — совершение взрыва, поджога или иных действий, устрашающих население и создающих опасность гибели человека, посеяв страх и неуверенность в его несокрушимости среди населения.
20.1 Стрельба в воздух среди населения, стрельба в людей, взрывы – считается терактом. Вооруженное нападение на одного человека, террористическим актом не является. ]
20.2 За похищение или взятие в заложники граждан или гос. сотрудников, преступнику присваивается 4 уровень розыска, изъятие лицензии на оружие и запрет на выход под залог [ООП].
21. Нелегальные мероприятия/организации. Митинги.
21.1 За организацию нелегальных мероприятий/митингов (Без согласия мэра, премьер-министра или шерифа окрестности, которое стало местом проведения), организаторам присваивается 2 уровень розыска.
21.2 За создание нелегальных организаций (Без согласия мэра или премьер-министра), организаторы и работники получают наказание в виде 3 уровня розыска.
22. Браконьерство.
22.1 За рыбалку без лицензии [Браконьерство], преступнику присваивается 1 уровень розыска.
23. Неуплата штрафа.
23.1 За неуплату штрафа, преступнику присваивается 2 уровень розыска.
24. Игнорирование спец.сирен.
24.1 За игнорирование специальных сирен при движении государственного транспорта, преступнику присваивается 1 уровень розыска.
Раздел II
1. Неординарные ситуации.
1.1 За уход в "АФК" на 30 с лишним секунд или за офф от ареста, преступнику присваивается 6 уровень розыска с причиной: "Уход" и запрет на выход под залог [ООП].
1.2 За превышение полномочий адвоката [освобождение ООП], адвокату присваивается 3 уровень розыска и запрет на выход под залог [Данное деяние приравнивается к соучастию ООП].
1.2 [ Освобожденный преступник задерживается по статье за побег с места заключения (статья 7.3) ].
1.3 За агитацию в день выборов – присваивается 6 уровень розыска и запрет на выход под залог [ООП].
1.3 [ Запрещена агитация путём подачи объявлений, в эфирах радио, в публичных выступлениях, выкриках и СМС-рассылке. ]
2. Судебные разбирательства.
2.1 За уклонение от участия в судебном разбирательстве, преступнику присваивается 3 уровень розыска и запрет на выход под залог [ООП], так же происходит понижение/увольнение из организации, если он там состоит, если это невозможно, то ему присваивается штраф устанавливаемый судом.
2.2 За отказ в выплате денежной компенсации, преступнику присваивается 2 уровень розыска и запрет на выход под залог [ООП], так же происходит понижение/увольнение из организации, если он там состоит, если это невозможно, то ему присваивается штраф устанавливаемый судом.
2.3 За уклонение от уголовного наказания [АФК/выход из игры/неоправданный неактив и т.п.], преступнику присваивается 3 уровень розыска и запрет на выход под залог [ООП], так же происходит понижение/увольнение из организации, если он там состоит, если же это невозможно, то ему присваивается штраф устанавливаемый судом.
2.4 За нарушение порядка на судебном заседании [Касается всех участников процесса, включая судебную комиссию], преступнику присваивается 2 уровень розыска и запрет на выход под залог [ООП], так же если не удается задержать нарушителя, то добавляется статья 2.3.
3. Получение лицензии нелегальным способом.
3.1 За ведение бизнеса без лицензии преступнику присваивается 1 уровень розыска и штраф в размере 100.000$.
), %Penal2%
if(!FileExist(Administrative2))
	FileAppend,
(
{FFFFFF}Статья 1. Сотрудники органов правопорядка в праве аннулировать административное нарушение гражданина, в случае явки с повинной или отсутствия сопротивления сотрудникам правоохранительных органов.
Статья 2. Отказ от уплаты штрафа наказывается в соответствии со статьей 13.1 действующего Уголовного Кодекса.
Статья 3. Максимальная установленная сумма штрафа составляет 5000 вирт, в случае превышения упомянутой суммы сотрудником правоохранительных органов, он будет привлечен к ответственности за злоупотребление служебными полномочиями.
Статья 4. 4.1. Нарушение ценовой политики предусмотренной Федеральным Антимонопольным Законом наказывается штрафом в размере 100.000 вирт в первый раз и 300.000 в случае повторного нарушения.
Статья 4. 4.2. Открытие бизнеса без соответствующей лицензии наказывается штрафом в размере 300.000 вирт.
Статья 4. 4.3. Отказ от выплаты штрафов, предусмотренных Статьей 4 Кодекса об Административных Правонарушениях наказывается в соответствии с Статьей 24 действующего Уголовного Кодекса.
Статья 5. 5.1. Хранение наркотических веществ в размере до 5 грамм наказывается штрафом в размере 5000 вирт и изъятием веществ.
Статья 6. 6.1. Заведомо ложный вызов сотрудников государственных организаций наказывается штрафом в размере 5000 вирт.
Статья 7. 7.1. Движение по встречной полосе наказывается изъятием водительского удостоверения.
Статья 8. 8.1. Самовольное оставление места ДТП наказывается штрафом в размере 5000 вирт.
Статья 8. 8.2. Смена положения автомобиля после ДТП до приезда сотрудников полиции наказывается штрафом в размере 1000 вирт.
Статья 9. 9.1. Нарушение установленных правил парковки наказывается штрафом в размере 5000 вирт.
Статья 9. 9.2. Оставление автомобиля посреди проезжей части наказывается изъятием водительского удостоверения.
Статья 10. 10.1. Умышленное создание аварийной ситуации наказывается изъятием водительского удостоверения.
Статья 10. 10.2. Нанесение вреда здоровью гражданина в случае нарушения правил дорожного движения наказывается изъятием водительского удостоверения.
Статья 10. 10.3. Управление транспортным средством в состоянии алкогольного или наркотического опьянения наказывается штрафом в размере 5000 вирт.
Статья 10. 10.4. Непредумышленное создание аварийной ситуации наказывается штрафом в размере 1000 вирт.
Статья 11. 11.1. Движение по тротуарам, обочинам, зелёным насаждениям наказывается штрафом в размере 5000 вирт.
Статья 12. 12.1. Умышленное создание пешеходом аварийных ситуаций наказывается штрафом в размере 5000 вирт.
Статья 12. 12.2. Непредумышленное создание пешеходом аварийных ситуаций наказывается штрафом в размере 1000 вирт.
), %Administrative2%
if(!FileExist(Penal1))
	FileAppend,
(
1. Избиение, нанесение телесных повреждений.
1.1 За избиение или нанесение телесных повреждений, преступнику присваивается 2 уровень розыска.
1.1 [ Удары ножом, битой, лопатой, кулаком и ногой. ]
2. Вооружённое нападение, использование огнестрельного оружия.
2.1 За вооружённое нападение на гражданских, преступнику присваивается 3 уровень розыска + изъятие лицензии на оружие.
2.2 За вооружённое нападение на гос.сотрудников, преступнику присваивается 6 уровень розыска + изъятие лицензии на оружие + запрет на выход под залог [ООП].
2.2 [ Розыск выдаётся за использование огнестрельного оружия с целью нанесения физического вреда или повреждения/уничтожения имущества. ]
2.2 В рамках самообороны разрешено использовать оружие, но только при условии наличия соответствующей лицензии. Если лицензии нет, обороняющийся всё равно задерживается по статье за "Ношение оружия без лицензии". ]
3. Убийство.
3.1 За убийство или заказ убийства, преступнику присваивается 3 уровень розыска.
3.2 За убийство военнослужащего при исполнении, преступнику присваивается 4 уровень розыска.
3.3 За убийство полицейского при исполнении, преступнику присваивается 5 уровень розыска.
3.4 За убийство агента ФБР при исполнении, преступнику присваивается 6 уровень розыска.
4. Хулиганство, попрошайничество.
4.1 За хулиганство и неадекватное поведение в общественных местах, преступнику присваивается 1 уровень розыска.
4.1 [ К хулиганству приравнивается любое нарушение общественного порядка: Стояние на крыше автомобиля, нахождение на крыше остановки, ложный вызов на экстренную линию, флуд в любой чат одним и тем же сообщением.
4.1 Если человек толкает пустую машину с проезжей части на обочину, это не считается хулиганством. ]
4.2 За попрошайничество в общественных местах, преступнику присваивается 1 уровень розыска.
5. Оскорбление.
5.1 За оскорбление в любой форме, преступнику присваивается 2 уровень розыска.
5.1 [ Оскорбление – это любая попытка перехода на личности в общении, например обращение – "мусор" в отношении представителя силовых структур. Так же оскорблением можно считать затрагивание расы, национальности [Ниггер, макаронник, узкоглазый и т.п.].
5.1 В случае если оскорбления идут в крайне неадекватной форме, при задержании следует ставить запрет на рассмотрение дела о выпуске под залог [Запрет права на адвоката].
6. Угон транспортного средства.
6.1 За угон транспортного средства, преступнику присваивается 2 уровень розыска.
6.1 [ Угон считается угоном лишь тогда, когда преступник сдвинулся с места находясь за рулем транспорта – в иных случаях следует задерживать за "Проникновение", в зависимости от ситуации ограничиваясь предупреждением.
6.1 Если угон происходит через взлом авто, так же следует обвинять в порче имущества. ]
7. Неподчинение, попытка скрыться от полиции, побег.
7.1 За неподчинение правоохранительным органам, преступнику присваивается 1 уровень розыска.
7.1 [ Неподчинением следует считать отказ или игнорирование законных требований офицера, как пример: Отказ покинуть салон авто или отказ покинуть место проведения тренировки гос. служащих.
7.1 Отказ оплачивать штраф или подписывать протокол о задержании неподчинением не является! ]
7.2 За попытку скрыться от сотрудников правоохранительных органов, преступнику присваивается 2 уровень розыска.
7.3 За побег из тюрьмы при помощи ключей от камер [/escape], преступнику присваивается 6 уровень розыска и запрет на выход под залог [ООП].
7.3 [ Ключи подвергаются изъятию из инвентаря лишь при 3 и выше уровне розыска [Общее кол-во зв. по действующим статьям] и за офф от ареста.
7.3 При проведении рейдов на ОПГ, у членов ОПГ розыск уже изначально 6+, так как рейд проводится после проведённого расследования против данной ОПГ.
7.3 Помните, ключи – как и лицензии, являются предметом ценности, за злоупотребление полномочиями и командами, будет следовать наказание вплоть до увольнения с занесением в ЧС гос. структур. ]
8. Соучастие в преступлении.
8.1 За соучастие в преступлении, преступнику присваивается тоже же наказание, что и организатору.
8.1 [ Пример: Таксист везёт пассажира, если оскорбляет пассажир, а водитель пытается скрыться от погони, заместо того чтобы содействовать задержанию – он соучастник.
8.1 Однако если водитель оскорбляет, а невинный пассажир едет рядом, то пассажир соучастником не является, так как он не причастен к преступлению.
8.1 Не следует путать с содействием преступлению, если пассажир к примеру подсказывает водителю как/куда ехать или например провоцирует офицеров своими криками, то это такое же соучастие. ]
9. Оружие.
9.1 За ношение оружия в открытом виде, кроме гос. служащих находящихся при исполнении служебных обязанностей – оружие изымается.
9.2 За ношение оружия без лицензии, преступнику присваивается 1 уровень розыска и штраф в размере 2000$.
9.3 За изготовление оружие нелегальным способом, его приобретение или его продажу, преступнику присваивается 3 уровень розыска с последующим изъятием оружия и/или материалов.
9.3 [ Нелегальным способом является изготовление оружия из материалов в гетто. Легальный способ – покупка у NPC в АММО. ]
10. Наркотики и материалы.
10.1 За хранение или перевозку наркотиков, преступнику присваивается 3 уровень розыска с изъятием наркотических веществ.
10.2 За хранение или перевозку материалов, преступнику присваивается 3 уровень розыска с изъятием материалов.
10.3 За употребление наркотиков, преступнику присваивается 3 уровень розыска с последующим изъятием наркотических веществ.
10.3 [ Отыгровки навроде – "/me съел конфету", с целью употребить наркотик и избежать наказание – НЕ являются адекватной РП-отыгровкой.
10.3 Если вы видите в чате "Nick_Name употребил(а) наркотик", то смело задерживайте преступника, при обязательном условии что это происходит прямо на ваших глазах и вы напрямую видите персонаж игрока.
10.3 При употреблении наркотических веществ, розыск следует так же выдавать и за их хранение. ]
10.4 За употребление наркотических веществ гос. служащим, сотрудник увольняется из организации и получает 3 уровень розыска.
10.5 За рекламу/продажу/покупку наркотиков или материалов, преступнику присваивается 2 уровень розыска и изъятие наркотиков/материалов.
10.6 За изготовление наркотиков/психотропных веществ, присваивается 3 уровень розыска.
10.6 [ Относится так же к выращиванию "марихуаны" на фермах. Обвинению подлежат все фермеры, заместители и хозяева фермы Простые работники обвинению не подлежат. ]
11. Уничтожение и повреждение имущества.
11.1 За повреждение чужого имущества, преступнику присваивается 1 уровень розыска и штраф в размере 5000$
11.2 За уничтожение чужого имущества, преступнику присваивается 4 уровень розыска, штраф в размере 15000$ и полная выплата компенсации за нанесённый ущерб.
11.2 [ Уничтожением является любое действие, после которого предмет взорвался или исчез [Перевернули, утопили, расстреляли и т.д.]
12. Проникновение на запретную территорию.
12.1 За проникновение на охраняемую территорию, преступнику присваивается 2 уровень розыска.
12.1 [ Территории воинских частей и формирований, офис ФБР, участки SAPD, второй и выше этажи мэрии, места тренировок - розыск следует выдавать после повторного нарушения границы. Пробивание блок постов, проникновение на территории находящиеся под оцеплением силами правопорядка - розыск следует выдавать сразу же, после нарушения границы.
12.1 Если преступник совершил правонарушение на территории, то розыск следует выдавать так же и по этой статье (оскорбил и уехал, испортил имущество, угнал т/с и т.д.). ].
12.2 За проникновение на частную территорию, преступнику присваивается 1 уровень розыска.
12.2 [ Проникновение в транспорт является незаконным, если оно осуществляется без согласия владельца/арендатора данного транспорта.
12.2 Крыша SFN так же является частной территорией ].
13. Бандитизм.
13.1 За ограбление граждан или организаций, преступнику присваивается 3 уровень розыска с последующим изъятием награбленного имущества.
13.1 [ При ограблениях на форму, материалы или наркотики, розыск следует выдавать так же и за хранение. ]
13.2 За вымогательство, обвиняемому присваивается 2 уровень розыска.
13.2 [ "– Механик, либо ты сейчас отдаёшь нам все свои деньги, либо мы покромсаем твоё корыто до состояния металлолома!", "– У меня есть док-ва твоего самовола, либо ты сейчас платишь мне 50000$, либо я на это пожалуюсь и тебя уволят!" – примеры оснований для обвинений в вымогательстве. ]
13.3 За угрозы, обвиняемому присваивается 1 уровень розыска.
13.3 [ Угрозы наподобие "Тебя понизят/уволят/занесут в ЧС гос. структур" – наказываются по этой статье, но если гражданин к примеру говорит "Я буду жаловаться!" – это не является основанием. ]
13.4 За провокации, обвиняемому присваивается 2 уровень розыска.
13.4 [ Выкрики подобно "– Давай! Стреляй, или ты боишься?!", оскорбительные жесты вроде "/me показал средний палец", "/me плюнул в лицо" и т.п. – примеры оснований для обвинений в провокации. ]
13.5 За мошенничество, обвиняемому присваивается 2 уровень розыска.
13.5 [ Пример: Таксист на арендованном гос. авто с включенным счётчиком [/fare] вымогает деньги/чаевые наперёд, а при отказе их дать – высаживает из авто. Подобное является мошенничеством и за это следует задерживать.
13.5 "– Хочешь расскажу, как взламывать банкомат? Заплати деньги и скажу." – NonRP-мошенничество, в этой ситуации обязательно сообщите в репорт администрации. ]
13.6 За попытку взлома/взлом базы данных полиции, преступнику присваивается 1 уровень розыска.
14. Проституция и изнасилование.
14.1 За предложение интимных услуг, преступнику присваивается 1 уровень розыска.
14.2 За изнасилование преступнику присваивается 3 уровень розыска.
15. Дача ложных показаний, использование фальшивых документов.
15.1 За укрывательство преступлений/преступников/фактов/улик и прочей важной для следствия информации или за дачу ложных показаний, преступнику присваивается 2 уровень розыска.
15.2 За использование фальшивых документов или удостоверений, присваивается 1 уровень розыска.
16. Клевета.
16.1 За клевету на гражданское или государственное лицо, присваивается 1 уровень розыска.
16.2 За клевету на государственные и частные организации, присваивается 2 уровень розыска.
17. Покупка, продажа и хранение военной формы.
17.1 За продажу военного имущества, военный подлежит увольнению, занесению в черный список армии, так же ему присваивается 3 уровень розыска.
17.2 За покупку военной формы, преступнику присваивается 2 уровень розыска, форма подлежит изъятию.
17.3 За хранение/ношение купленной или ворованной военной формы, преступнику присваивается 2 уровень розыска, форма подлежит изъятию.
17.3 [ Или хранение, или ношение – это одно и тоже преступление и при задержании обвинение следует выдавать лишь по одному виду статьи. ]
18. Покупка, кража и продажа ключей от камер.
18.1 За покупку/продажу/кражу ключей от камеры, преступнику присваивается 6 уровень розыска.
19. Коррупция.
19.1 За предложение взятки, преступнику присваивается 2 уровень розыска.
19.2 За принятие взятки, гос. сотрудник несет наказание в виде присвоения 2 уровня розыска и увольнения.
19.2 [ Чтобы офицер понёс наказание за коррупцию, вы должны предоставить руководству РП-доказательства, к примеру: Запись диктофона или видео с видеорегистратора, с полагающейся РП-отыгровкой.
19.2 Полиции запрещается полностью манипулировать ситуацией, не оставляя жертвам ни единого шанса, за бредовые махинации вроде "/me изъял все предметы для видеосъёмки, диктофон, часы и т.п.", будет следовать наказание за PowerGaming. ]
20. Терроризм и взятие в заложники.
20.1 За совершение теракта, захват зданий и помещений, преступнику присваивается 6 уровень розыска, лишение всех лицензий и запрет на выход под залог [ООП].
20.1 [ Террористический акт — совершение взрыва, поджога или иных действий, устрашающих население и создающих опасность гибели человека, посеяв страх и неуверенность в его несокрушимости среди населения.
20.1 Стрельба в воздух среди населения, стрельба в людей, взрывы – считается терактом. Вооруженное нападение на одного человека, террористическим актом не является. ]
20.2 За похищение или взятие в заложники граждан или гос. сотрудников, преступнику присваивается 4 уровень розыска, изъятие лицензии на оружие и запрет на выход под залог [ООП].
21. Нелегальные мероприятия/организации. Митинги.
21.1 За организацию нелегальных мероприятий/митингов (Без согласия мэра, премьер-министра или шерифа окрестности, которое стало местом проведения), организаторам присваивается 2 уровень розыска.
21.2 За создание нелегальных организаций (Без согласия мэра или премьер-министра), организаторы и работники получают наказание в виде 3 уровня розыска.
22. Браконьерство.
22.1 За рыбалку без лицензии [Браконьерство], преступнику присваивается 1 уровень розыска.
23. Неуплата штрафа.
23.1 За неуплату штрафа, преступнику присваивается 2 уровень розыска.
24. Игнорирование спец.сирен.
24.1 За игнорирование специальных сирен при движении государственного транспорта, преступнику присваивается 1 уровень розыска.
Раздел II
1. Неординарные ситуации.
1.1 За уход в "АФК" на 30 с лишним секунд или за офф от ареста, преступнику присваивается 6 уровень розыска с причиной: "Уход" и запрет на выход под залог [ООП].
1.2 За превышение полномочий адвоката [освобождение ООП], адвокату присваивается 3 уровень розыска и запрет на выход под залог [Данное деяние приравнивается к соучастию ООП].
1.2 [ Освобожденный преступник задерживается по статье за побег с места заключения (статья 7.3) ].
1.3 За агитацию в день выборов – присваивается 6 уровень розыска и запрет на выход под залог [ООП].
1.3 [ Запрещена агитация путём подачи объявлений, в эфирах радио, в публичных выступлениях, выкриках и СМС-рассылке. ]
2. Судебные разбирательства.
2.1 За уклонение от участия в судебном разбирательстве, преступнику присваивается 3 уровень розыска и запрет на выход под залог [ООП], так же происходит понижение/увольнение из организации, если он там состоит, если это невозможно, то ему присваивается штраф устанавливаемый судом.
2.2 За отказ в выплате денежной компенсации, преступнику присваивается 2 уровень розыска и запрет на выход под залог [ООП], так же происходит понижение/увольнение из организации, если он там состоит, если это невозможно, то ему присваивается штраф устанавливаемый судом.
2.3 За уклонение от уголовного наказания [АФК/выход из игры/неоправданный неактив и т.п.], преступнику присваивается 3 уровень розыска и запрет на выход под залог [ООП], так же происходит понижение/увольнение из организации, если он там состоит, если же это невозможно, то ему присваивается штраф устанавливаемый судом.
2.4 За нарушение порядка на судебном заседании [Касается всех участников процесса, включая судебную комиссию], преступнику присваивается 2 уровень розыска и запрет на выход под залог [ООП], так же если не удается задержать нарушителя, то добавляется статья 2.3.
3. Получение лицензии нелегальным способом.
3.1 За ведение бизнеса без лицензии преступнику присваивается 1 уровень розыска и штраф в размере 100.000$.
), %Penal1%
if(!FileExist(FedP1))
	FileAppend,
(
ПРЕАМБУЛА
Вступительная часть.
0.1 Федеральное Постановление - это нормативно-правовой акт, который был призван внести чёткие рамки в работу государственных организаций.
0.2 Федеральное Постановление издаётся Федеральным Бюро Расследований (далее ФБР) для Полицейских Департаментов (далее ПД) и военных частей (Далее Армия).
0.3 Федеральное Постановление может быть изменено Директором ФБР ( при участии следящего Администратора ) в любое время дня и ночи, его вступление в силу происходит через 48 часов после публикации.
0.4 Федеральное Постановление обязано выполняться всеми сотрудниками вышеупомянутых организаций.
0.5 Незнание Федерального Постановления не освобождает обвиняемого от ответственности.
ГЛАВА НОМЕР ОДИН
Преступления против общественности.
1.1 Запрещается несанкционированное применение огнестрельного оружия против любого гражданского лица/сотрудника государственных организаций - увольнение.
1.2 Запрещается любое унижение чести и достоинства граждан вне зависимо от его социального или правового статуса - увольнение.
1.3 Запрещается применение насилия в отношении как граждан так и заключенных под стражу лиц - понижение.
1.3 Постановление в отношении сотрудников Федерального Бюро Расследований и Мэрии.
2.1 Запрещается проникать на территорию FBI без получения официального пропуска от любого из агентов ФБР выше Мл.Агента - предупреждение / понижение.
2.1 Примечание: Мэру, Генералам армий, Шерифам разрешение не требуется.
2.2 Запрещается выдавать себя за любого государственного сотрудника - увольнение.
2.2 Исключение: Агенты ФБР во время ведения следственных действий под прикрытием.
2.3 Запрещается брать руководство операциями (теракты / похищения) без приказа ФБР - увольнение.
2.4 Запрещается неподчинение агенту ФБР в рамках его законных требований - понижение - увольнение.
2.4 Исключение: Агенты ФБР во время ведения следственных действий под прикрытием.
2.5 Запрещается оскорблять/угрожать/шантажировать агента ФБР - увольнение.
2.6 Запрещается оспаривать понижение/увольнение, выданное агентом ФБР/Мэром где-либо, кроме как в специальном разделе жалоб - понижение / увольнение.
2.7 Запрещается раскрывать личность агента ФБР, если тот находится под прикрытием - увольнение.
2.8 Запрещается вносить помехи в работу аттестационной комиссии от высших органов власти, проводящих любого рода проверки в государственных структурах - понижение.
2.9 Запрещается избегать проверки от ФБР - понижение.
2.9 Примечание: Агент имеет право вас вызвать в бюро и провести проверку. При отказе последует соответствующее наказание согласно пункту 2.9.
ГЛАВА НОМЕР ТРИ
Постановление в отношении Полицейских Департаментов и Армий.
3.1 Запрещаются любые проявления неадекватного поведения и провокации - предупреждение / понижение / увольнение.
3.2 Запрещается нарушать правила строя - предупреждение / понижение.
3.3 Запрещается продажа любого государственного имущества (Ключи от камер/форма/фуры с боеприпасами) - увольнение + ЧС фракции.
3.4 Запрещается давать заведомо ложную информацию государственному сотруднику - увольнение.
3.5 Запрещается необоснованно требовать документы, а так же проводить обыск гражданских лиц - понижение.
3.6 Запрещается лишать права на адвоката (За исключением статьей "Уголовного Кодекса",предусматривающих лишение и наличия у вас доказательств) - понижение.
3.7 Запрещается государственным сотрудникам входить в сговоры с мафией/бандами - увольнение.
3.7 Исключение: Спец. операции (обязательный контроль старшего офицера).
3.8 Запрещается без разрешения/пропуска (самовольно) покидать часть/свой город - увольнение.
3.9 Запрещается носить форму не соответствующую занимаемой должности/званию - понижение.
3.9 Примечание: Соответствие формы и званий устанавливается руководителем организации.
3.10 Запрещается в рабочее время носить на себе вызывающие аксессуары - предупреждение / понижение.
3.11 Запрещается умышленно удалять с базы данных розыска - понижение / увольнение
3.11 Дополнение: Если вы ошиблись и можете доказать свою невиновность, вы должны сообщить об этом в департамент.
ГЛАВА НОМЕР ЧЕТЫРЕ
Преступления государственных сотрудников против норм Устава, и других правовых документов.
4.1 Запрещается снимать преступникам розыск без уведомления ФБР - понижение.
4.1 Исключение: Если розыск был выдан по ошибке и вы можете это доказать.
4.2 Запрещается выдавать розыск без весомой на то причины, по просьбе. Иными словами - не видя факта нарушения лично - понижение / увольнение.
4.3 Запрещается провоцировать кого-либо, не важно, какого рода провокации - понижение.
4.4 Запрещается использовать нецензурную брань, а также оскорбления во все чаты - понижение / увольнение.
4.5 Запрещается в рабочее время заниматься своими делами ( игра в казино, участие в гонках, дерби, пейнтболе в рабочее время с 9:00 до 22:00 за исключением перерыв с 13:00 до 14:00 , и случаев, когда вышеупомянутые мероприятия были организованы Администрацией сервера) - предупреждение / понижение / увольнение.
4.5 Исключение: Разрешение со стороны руководства организации, выполнение служебных обязанностей (например, охрана авторынка) или тренировок под присмотром старшего офицерского состава.
4.6 Запрещается хранение и употребление наркотических веществ, а также хранение краденых материалов - увольнение.
4.6 Исключение: Сотрудники PD, сотрудники ФБР в целях спец. операций (с обязательным контролем старшего офицера).
4.7 Запрещается находиться в опасном районе вне спец. операций - увольнение.
4.7 Исключение: Спец. операция, Федеральный патруль,специальные отделы (обязательный контроль со стороны руководства организации).
4.8 Запрещается объявлять в розыск не по уголовному кодексу - предупреждение / понижение.
4.9 Запрещается неподчинение старшему по званию в рамках закона - понижение.
4.9 Исключение: Старшие по званию - в рамках одной организации.
4.10 Запрещается употреблять алкоголь в рабочее время - понижение.
4.11 Запрещается брать/давать взятки - увольнение.
4.12 Запрещается нарушать правила волны департамента - понижение.
4.13 Запрещается беспричинно обыскивать государственных сотрудников - понижение.
4.14 Запрещается лишать лицензии без весомых на то причин - компенсация стоимости лицензий за счёт отобравшего офицера + понижение.
4.14 Примечание: Если Вы увидели, что государственный сотрудник нарушил правила дорожного движения или в гражданской форме УК (где предусматривается изъятие лицензии), и у Вас есть доказательства, Вы имеете полное право забрать лицензию.
4.15 Запрещается нарушать субординацию при общении со старшими по званию - предупреждение / понижение.
4.16 Запрещается убийство в наручниках или эффектом электрошокера - понижение / увольнение.
4.16 Примечание: Разрешено использовать электрошокер в перестрелке, если она началась в Зелёной Зоне и у вас есть доказательства.
4.17 Запрещается нарушать законы штата, не важно в форме вы или нет - предупреждение / понижение / увольнение.
4.17 Исключение: Если у Вас есть доказательства, подтверждающие вашу полную либо частичную невиновность по фактам: самообороны себя и близких; защиты личного имущества; при выполнении служебного долга, но находясь не при исполнении служебных обязанностей ( не в форме ); приказ старшего по званию в рамках закона.
4.18 Запрещается неподчинение руководящему составу ФБР - увольнение.
4.19 Запрещается неподчинение Мэру в рамках закона Штата Evolve - увольнение.
4.20 Запрещается отдавать приказы Мэру - увольнение.
4.21 Запрещается отдавать приказы сотрудникам ФБР - увольнение.
ГЛАВА НОМЕР ПЯТЬ
Дополнительное положение.
5.1 Сотрудник ФБР имеет право сменить наказание на дисциплинарное взыскание в виде предупреждения.
5.2 Cотрудник Армии или ПД обязан сделать выводы о своей вине и постараться более не нарушать ФП.
5.3 Смена наказания осуществляется агентом ФБР, исходя из его здравого смысла и опыта. Выдача предупреждений за пункты, которые так или иначе способны пошатнуть государственную безопасность - запрещены.
5.4 Сотрудник имеет право получить только одно предупреждение, при последующих нарушениях следуют более тяжкие наказания.
5.5 Пункты, предусматривающие выбор вида наказания, подразумевают применение одного из них по усмотрению выдающего наказание, в зависимости от тяжести нарушения и наличия активных предупреждений, либо нарушений в прошлом.
), %FedP1%
if(!FileExist(Administrative1))
	FileAppend,
(
{FFFFFF}0.0 Езда без включенных фар.
0.1 За езду без фар дальнего света [/clist 33], нарушителю следует наказание в виде предупреждения и лекции от полиции.
Сотрудники гос. структур имеют право выключать фары при необходимости. ]
1.1 Езда по встречной полосе.
1.2 Езда по встречной: штраф в размере [LVL x 500$], в случае же неуплаты штрафа – изъятие водительских прав и задержание по статье за неуплату штрафов.
1.2 [ Объезд по встречной полосе не считается нарушением, если он стал следствием из-за действий и нарушения ПДД другим водителем ]
2.0 Превышение скорости.
2.1 Превышение скорости: штраф в размере [LVL x 500$].
3.0 Наезд на пешехода.
3.1 Наезд на пешехода: 2 уровень розыска + изъятие водительских прав.
4.0 Парковка в неположенном месте.
4.1 Парковка в неположенном месте наземным транспортным средством: изъятие водительских прав.
4.2 Парковка в неположенном месте воздушным транспортным средством: изъятие лицензии пилота.
5.0 ДТП, уход с места ДТП.
5.1 Виновник ДТП: штраф в размере [LVL x 500$], выплата материального ущерба.
5.2 Покидание места ДТП: 3 уровень розыска, штраф в размере [LVL x 500$] + изъятие прав.
6.0 Управление транспортным средством в нетрезвом состоянии.
6.1 Управление ТС в наркотическом или алкогольном опьянении: 1 уровень розыска + изъятие прав.
7.0 Создание аварийной ситуации.
7.1 Создание аварийной ситуации [АФК на дороге будучи водителем авто, намеренная помеха движению, подрезания]: Изъятие прав и штраф [LVL x 500$].
7.1 [ Запрещается изымать водительские права, пока человек находится в АФК ]
8.0 Движение в неположенном месте.
8.1 Движение по тротуарам, обочинам и ж/д путям: штраф в размере [LVL x 500$], в случае же неуплаты штрафа – изъятие водительских прав и задержание по статье за неуплату штрафов.
2-я часть – для пешеходов:
10.1 Создание аварийной ситуации [АФК на дороге, ходьба по проезжей части, перегораживание движения и намеренные прыжки под машину]:
10.1 [ Для людей проживающих в штате от 1 до 2-х лет : давать предупреждение, при повторном нарушении выписывать штраф. Для людей проживающих в штате от 3-ех лет: выписывать штраф. Штраф [LVL x 250]. ]
), %Administrative1%
if(!FileExist(Lect))
	FileAppend,
(
Приветствую Всех, уважаемые военнослужащие.
К вам прибыли сотрудники полицейского департамента г.Los-Santos. 
С интересной новостью. Прошу минуточку внимания. 
Сейчас я Вам расскажу почему стоит выбрать именно наш полицейский департамент.
При достижении звания Младший Сержант. 
В нашем департаменте Вас ожидает высокооплачиваемая зарплата, хорошие премии... 
Внеочередное повышение, при выявлении Вас в качестве "Лучшего сотрудника недели". 
А так же, у нас есть преимущество среди остальных полицейских департаментов. 
Ведь только у нас Вы сможете получить свой первый и собственный домик. 
Всё что от Вас требуется - это только лишь достижение звания Лейтенанта. 
Кроме того, у нас есть система ачивок. За которые можно тоже заработать не плохие деньги.
Среди всех полицейских департаментов, только лишь у нас самый дружный коллектив. 
В нашем департаменте присутствуют такие отделы - Patrul Service, Higway Police, Детективы, SWAT. 
Для того чтобы перевестись в полицейский департамент г.Los-Santos, требуется лишь...
Иметь звание Младшего Сержанта, иметь лицензию на оружие, умение обращаться с оружием. 
Не иметь проблем с законом и не состоять в Чёрном Списке полицейского департамента. 
Если Вы подходите по всем критериям и у Вас есть желание работать в нашем коллективе...
То можете после моей лекции сказать об этом мне.
У кого-нибудь есть какие-либо вопросы? Или кто-то желает на перевод к нам?
), %Lect%
global tabId := 1, isExit := false, isReading := false, StopHudTime := false, NumberPre := "0", IdInCar := "-1", rpatrul := "1", InitialNearbyCarHP := "-1", stop := "0", pr := "0"
global isBind := Object()
global offLine := 248
SetTimer, readChat, 30
LoadIniFile()
LoadBinds()
if(!Rang)
	Rang := 1
LoadIniFile()
{
	global
	Rang := ReadIni("settings", "Rang")
	Fraction := ReadIni("settings", "Fraction")
	DeagleCount := ReadIni("settings", "DeagleCount")
	ShotgunCount := ReadIni("settings", "ShotgunCount")
	MP5Count := ReadIni("settings", "MP5Count")
	M4A1Count := ReadIni("settings", "M4A1Count")
	ArmourCount := ReadIni("settings", "ArmourCount")
	RifleCount := ReadIni("settings", "RifleCount")
	SpecGunCount := ReadIni("settings", "SpecGunCount")
	xCount := ReadIni("settings", "Count")
	Clist := ReadIni("settings", "Clist")
	Tag := ReadIni("settings", "Tag")
	Pass := ReadIni("settings", "Pass")
	isChatFrisk := ReadIni("settings", "isChatFrisk")
	isOpenT := ReadIni("settings", "isOpenT")
	isOpenHide := ReadIni("settings", "isOpenHide")
	isMdc := ReadIni("settings", "isMdc")
	isGmCar := ReadIni("settings", "isGmCar")
	isDead := ReadIni("settings", "isDead")
	isHeal := ReadIni("settings", "isHeal")
	isOffinarrested := ReadIni("settings", "isOffinarrested")
	isAuthDuty := ReadIni("settings", "isAuthDuty")
	isTake := ReadIni("settings", "isTake")
	isTakeKpz := ReadIni("settings", "isTakeKpz")
	isTakeKeys := ReadIni("settings", "isTakeKeys")
	isStopM := ReadIni("settings", "isStopM")
	isAutoEn := ReadIni("settings", "isAutoEn")
	isKill := ReadIni("settings", "isKill")
	isTakeGun := ReadIni("settings", "isTakeGun")
	isTazer := ReadIni("settings", "isTazer")
	isRU := ReadIni("settings", "isRU")
	isBar := ReadIni("settings", "isBar")
	isAutoScreen := ReadIni("settings", "isAutoScreen")
	isWoman := ReadIni("settings", "isWoman")
	isGiveGuns := ReadIni("settings", "isGiveGuns")
	isTime := ReadIni("settings", "isTime")
	isPass := ReadIni("settings", "isPass")
	isDeagleCount := ReadIni("settings", "isDeagleCount")
	isShotgunCount := ReadIni("settings", "isShotgunCount")
	isMP5Count := ReadIni("settings", "isMP5Count")
	isM4A1Count := ReadIni("settings", "isM4A1Count")
	isRifleCount := ReadIni("settings", "isRifleCount")
	isSpecGunCount := ReadIni("settings", "isSpecGunCount")
	isArmourCount := ReadIni("settings", "isArmourCount")
	cServerID := ReadIni("settings", "ConnectServer")
	if(cServerID != 1 && cServerID != 2 && cServerID != 3)
		cServerID := 1
	RegRead, UserName, HKEY_CURRENT_USER, Software\SAMP, PlayerName
	for fIndex, nKey in KeySetList
	{
		Key%nKey% := ReadIni("keys", "Key" nKey)
		gKey := Key%nKey%
		if(strlen(Key%nKey%))
		{
			if(!isBind["Key" gKey])
				isBind["Key" gKey] := true
		}
	}
	loop %BindCount%
	{
		BindSTR := ReadIni("binds", "Bind" A_Index)
		if(!strlen(BindSTR))
			continue
		if(!RegExMatch(BindSTR, "^\[KEY\:\[(.*)\]\]\[MSG\:\[(.*)\]\]\[ENTER\:\[(.*)\]\]\[RETEXT\:\[(.*)\]\]\[SLEEP\:\[(.*)\]\]$", rBind))
			continue
		KeyBinds%A_Index% := rBind1
		BindMessage%A_Index% := rBind2
		BindEnter%A_Index% := rBind3
		BindRetext%A_Index% := rBind4
		BindSleep%A_Index% := rBind5
		if(!strlen(BindEnter%A_Index%))
			BindEnter%A_Index% := 0
		if(!strlen(BindRetext%A_Index%))
			BindRetext%A_Index% := 0
		if(!strlen(BindSleep%A_Index%))
			BindSleep%A_Index% := 0
		gKey := KeyBinds%A_Index%
		if(strlen(gKey))
		{
			if(!isBind["Key" gKey])
				isBind["Key" gKey] := true
			if(!isBind["bKey" gKey])
				isBind["bKey" gKey] := true
		}
	}
	return
}
if (isTazer || isTime)
{
	PATH_OVERLAY := RelToAbs(A_ScriptDir, "dx9_overlay.dll")
	hModule := DllCall("LoadLibrary", Str, PATH_OVERLAY)
	Init_func 				:= DllCall("GetProcAddress", UInt, hModule, Str, "Init")
	SetParam_func 			:= DllCall("GetProcAddress", UInt, hModule, Str, "SetParam")
	TextCreate_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextCreate")
	TextDestroy_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextDestroy")
	TextSetShadow_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextSetShadow")
	TextSetShown_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextSetShown")
	TextSetColor_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextSetColor")
	TextSetPos_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextSetPos")
	TextSetString_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextSetString")
	TextUpdate_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextUpdate")
	BoxCreate_func 			:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxCreate")
	BoxDestroy_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxDestroy")
	BoxSetShown_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxSetShown")
	BoxSetBorder_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxSetBorder")
	BoxSetBorderColor_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxSetBorderColor")
	BoxSetColor_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxSetColor")
	BoxSetHeight_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxSetHeight")
	BoxSetPos_func			:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxSetPos")
	BoxSetWidth_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxSetWidth")
	LineCreate_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "LineCreate")
	LineDestroy_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "LineDestroy")
	LineSetShown_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "LineSetShown")
	LineSetColor_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "LineSetColor")
	LineSetWidth_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "LineSetWidth")
	LineSetPos_func			:= DllCall("GetProcAddress", UInt, hModule, Str, "LineSetPos")
	ImageCreate_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "ImageCreate")
	ImageDestroy_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "ImageDestroy")
	ImageSetShown_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "ImageSetShown")
	ImageSetAlign_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "ImageSetAlign")
	ImageSetPos_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "ImageSetPos")
	ImageSetRotation_func	:= DllCall("GetProcAddress", UInt, hModule, Str, "ImageSetRotation")
	DestroyAllVisual_func	:= DllCall("GetProcAddress", UInt, hModule, Str, "DestroyAllVisual")
	ShowAllVisual_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "ShowAllVisual")
	HideAllVisual_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "HideAllVisual")
	GetFrameRate_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "GetFrameRate")
	GetScreenSpecs_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "GetScreenSpecs")
	SetCalculationRatio_func:= DllCall("GetProcAddress", UInt, hModule, Str, "SetCalculationRatio")
	SetOverlayPriority_func := DllCall("GetProcAddress", UInt, hModule, Str, "SetOverlayPriority")
	Init()
	{
		global Init_func
		res := DllCall(Init_func)
		return res
	}
	SetParam(str_Name, str_Value)
	{
		global SetParam_func
		res := DllCall(SetParam_func, Str, str_Name, Str, str_Value)
		return res
	}
	TextCreate(Font, fontsize, bold, italic, x, y, color, text, shadow, show)
	{
		global TextCreate_func
		res := DllCall(TextCreate_func,Str,Font,Int,fontsize,UChar,bold,UChar,italic,Int,x,Int,y,UInt,color,Str,text,UChar,shadow,UChar,show)
		return res
	}
	TextDestroy(id)
	{
		global TextDestroy_func
		res := DllCall(TextDestroy_func,Int,id)
		return res
	}
	TextSetShadow(id, shadow)
	{
		global TextSetShadow_func
		res := DllCall(TextSetShadow_func,Int,id,UChar,shadow)
		return res
	}
	TextSetShown(id, show)
	{
		global TextSetShown_func
		res := DllCall(TextSetShown_func,Int,id,UChar,show)
		return res
	}
	TextSetColor(id,color)
	{
		global TextSetColor_func
		res := DllCall(TextSetColor_func,Int,id,UInt,color)
		return res
	}
	TextSetPos(id,x,y)
	{
		global TextSetPos_func
		res := DllCall(TextSetPos_func,Int,id,Int,x,Int,y)
		return res
	}
	TextSetString(id,Text)
	{
		global TextSetString_func
		res := DllCall(TextSetString_func,Int,id,Str,Text)
		return res
	}
	TextUpdate(id,Font,Fontsize,bold,italic)
	{
		global TextUpdate_func
		res := DllCall(TextUpdate_func,Int,id,Str,Font,int,Fontsize,UChar,bold,UChar,italic)
		return res
	}
	BoxCreate(x,y,width,height,Color,show)
	{
		global BoxCreate_func
		res := DllCall(BoxCreate_func,Int,x,Int,y,Int,width,Int,height,UInt,Color,UChar,show)
		return res
	}
	BoxDestroy(id)
	{
		global BoxDestroy_func
		res := DllCall(BoxDestroy_func,Int,id)
		return res
	}
	BoxSetShown(id,Show)
	{
		global BoxSetShown_func
		res := DllCall(BoxSetShown_func,Int,id,UChar,Show)
		return res
	}
	BoxSetBorder(id,height,Show)
	{
		global BoxSetBorder_func
		res := DllCall(BoxSetBorder_func,Int,id,Int,height,Int,Show)
		return res
	}
	BoxSetBorderColor(id,Color)
	{
		global BoxSetBorderColor_func
		res := DllCall(BoxSetBorderColor_func,Int,id,UInt,Color)
		return res
	}
	BoxSetColor(id,Color)
	{
		global BoxSetColor_func
		res := DllCall(BoxSetColor_func,Int,id,UInt,Color)
		return res
	}
	BoxSetHeight(id,height)
	{
		global BoxSetHeight_func
		res := DllCall(BoxSetHeight_func,Int,id,Int,height)
		return res
	}
	BoxSetPos(id,x,y)
	{
		global BoxSetPos_func
		res := DllCall(BoxSetPos_func,Int,id,Int,x,Int,y)
		return res
	}
	BoxSetWidth(id,width)
	{
		global BoxSetWidth_func
		res := DllCall(BoxSetWidth_func,Int,id,Int,width)
		return res
	}
	LineCreate(x1,y1,x2,y2,width,color,show)
	{
		global LineCreate_func
		res := DllCall(LineCreate_func,Int,x1,Int,y1,Int,x2,Int,y2,Int,Width,UInt,color,UChar,show)
		return res
	}
	LineDestroy(id)
	{
		global LineDestroy_func
		res := DllCall(LineDestroy_func,Int,id)
		return res
	}
	LineSetShown(id,show)
	{
		global LineSetShown_func
		res := DllCall(LineSetShown_func,Int,id,UChar,show)
		return res
	}
	LineSetColor(id,color)
	{
		global LineSetColor_func
		res := DllCall(LineSetColor_func,Int,id,UInt,color)
		return res
	}
	LineSetWidth(id, width)
	{
		global LineSetWidth_func
		res := DllCall(LineSetWidth_func,Int,id,Int,width)
		return res
	}
	LineSetPos(id,x1,y1,x2,y2)
	{
		global LineSetPos_func
		res := DllCall(LineSetPos_func,Int,id,Int,x1,Int,y1,Int,x2,Int,y2)
		return res
	}
	ImageCreate(path, x, y, rotation, align, show)
	{
		global ImageCreate_func
		res := DllCall(ImageCreate_func, Str, path, Int, x, Int, y, Int, rotation, Int, align, UChar, show)
		return res
	}
	ImageDestroy(id)
	{
		global ImageDestroy_func
		res := DllCall(ImageDestroy_func,Int,id)
		return res
	}
	ImageSetShown(id,show)
	{
		global ImageSetShown_func
		res := DllCall(ImageSetShown_func,Int,id,UChar,show)
		return res
	}
	ImageSetAlign(id,align)
	{
		global ImageSetAlign_func
		res := DllCall(ImageSetAlign_func,Int,id,Int,align)
		return res
	}
	ImageSetPos(id, x, y)
	{
		global ImageSetPos_func
		res := DllCall(ImageSetPos_func,Int,id,Int,x, Int, y)
		return res
	}
	ImageSetRotation(id, rotation)
	{
		global ImageSetRotation_func
		res := DllCall(ImageSetRotation_func,Int,id,Int, rotation)
		return res
	}
	DestroyAllVisual()
	{
		global DestroyAllVisual_func
		res := DllCall(DestroyAllVisual_func)
		return res
	}
	ShowAllVisual()
	{
		global ShowAllVisual_func
		res := DllCall(ShowAllVisual_func)
		return res
	}
	HideAllVisual()
	{
		global HideAllVisual_func
		res := DllCall(HideAllVisual_func )
		return res
	}
	GetFrameRate()
	{
		global GetFrameRate_func
		res := DllCall(GetFrameRate_func )
		return res
	}
	GetScreenSpecs(ByRef width, ByRef height)
	{
		global GetScreenSpecs_func
		res := DllCall(GetScreenSpecs_func, IntP, width, IntP, height)
		return res
	}
	SetCalculationRatio(width, height)
	{
		global SetCalculationRatio_func
		res := DllCall(SetCalculationRatio_func, Int, width, Int, height)
		return res
	}
	SetOverlayPriority(id, priority)
	{
		global SetOverlayPriority_func
		res := DllCall(SetOverlayPriority_func, Int, id, Int, priority)
		return res
	}
	RelToAbs(root, dir, s = "\") {
		pr := SubStr(root, 1, len := InStr(root, s, "", InStr(root, s . s) + 2) - 1)
		, root := SubStr(root, len + 1), sk := 0
		if InStr(root, s, "", 0) = StrLen(root)
			StringTrimRight, root, root, 1
		if InStr(dir, s, "", 0) = StrLen(dir)
			StringTrimRight, dir, dir, 1
		Loop, Parse, dir, %s%
		{
			if A_LoopField = ..
				StringLeft, root, root, InStr(root, s, "", 0) - 1
			else if A_LoopField =
				root =
			else if A_LoopField != .
				Continue
			StringReplace, dir, dir, %A_LoopField%%s%
		}
		Return, pr . root . s . dir
	}
	SetParam("use_window", "1")
	SetParam("window", "GTA:SA:MP")
}
SaveIniFile()
{
	global
	unLoadBinds()
	GuiControlGet, eRang, Main:
	GuiControlGet, eRang, gMainSettings:
	GuiControlGet, eFraction, gMainSettings:
	GuiControlGet, zFraction, ChooseFraction:
	GuiControlGet, zecServerID, ChooseFraction:
	GuiControlGet, eDeagleCount, gMainSettings:
	GuiControlGet, exCount, gMainSettings:
	GuiControlGet, eShotgunCount, gMainSettings:
	GuiControlGet, eMP5Count, gMainSettings:
	GuiControlGet, eM4A1Count, gMainSettings:
	GuiControlGet, eRifleCount, gMainSettings:
	GuiControlGet, eArmourCount, gMainSettings:
	GuiControlGet, eSpecGunCount, gMainSettings:
	GuiControlGet, eClist, guiMainMenu:
	GuiControlGet, eAUseDrugs, guiMainMenu:
	GuiControlGet, eisChatFrisk, gMainSettings:
	GuiControlGet, eisTake, gMainSettings:
	GuiControlGet, eisTakeKpz, gMainSettings:
	GuiControlGet, eisTakeKeys, gMainSettings:
	GuiControlGet, eisPass, gMainSettings:
	GuiControlGet, eisDeagleCount, gMainSettings:
	GuiControlGet, eisShotgunCount, gMainSettings:
	GuiControlGet, eisMP5Count, gMainSettings:
	GuiControlGet, eisM4A1Count, gMainSettings:
	GuiControlGet, eisRifleCount, gMainSettings:
	GuiControlGet, eisArmourCount, gMainSettings:
	GuiControlGet, eisSpecGunCount, gMainSettings:
	GuiControlGet, eTag, gMainSettings:
	GuiControlGet, ePass, gMainSettings:
	GuiControlGet, eisOpenT, guiMainMenu:
	GuiControlGet, ecServerID, % (LoadConnect?"LoadConnect:":"guiMainMenu:")
	if(LoadConnect)
		GuiControl, guiMainMenu:Choose, ecServerID, %ecServerID%
	GuiControlGet, egeoOpen, guiMainMenu:
	WriteIni(eRang, "settings", "Rang")
	WriteIni(eFraction, "settings", "Fraction")
	WriteIni(eDeagleCount, "settings", "DeagleCount")
	WriteIni(eShotgunCount, "settings", "ShotgunCount")
	WriteIni(eMp5Count, "settings", "MP5Count")
	WriteIni(eM4A1Count, "settings", "M4A1Count")
	WriteIni(eRifleCount, "settings", "RifleCount")
	WriteIni(eArmourCount, "settings", "ArmourCount")
	WriteIni(eSpecGunCount, "settings", "SpecGunCount")
	WriteIni(eisChatFrisk, "settings", "isChatFrisk")
	WriteIni(eisTake, "settings", "isTake")
	WriteIni(eisTakeKpz, "settings", "isTakeKpz")
	WriteIni(eisTakeKeys, "settings", "isTakeKeys")
	WriteIni(ecServerID, "settings", "ConnectServer")
	WriteIni(eisOpenT, "settings", "isOpenT")
	WriteIni(eClist, "settings", "Clist")
	WriteIni(eTag, "settings", "Tag")
	WriteIni(ePass, "settings", "Pass")
	cServerID := ecServerID
	if(eClist > 33)
	{
		GuiControl, , eClist, 33
		eClist := 33
		clist := eClist
		showError("Номер клиста не может превышать 33")
		WriteIni(eClist, "settings", "Clist")
	}
	GuiControlGet, eisOpenHide, guiMainMenu:
	WriteIni(eisOpenHide, "settings", "isOpenHide")
	GuiControlGet, eisAuthDuty, guiMainMenu:
	WriteIni(eisAuthDuty, "settings", "isAuthDuty")
	GuiControlGet, eIsMdc, gMainSettings:
	WriteIni(eIsMdc, "settings", "IsMdc")
	GuiControlGet, eisGmCar, guiMainMenu:
	WriteIni(eisGmCar, "settings", "isGmCar")
	GuiControlGet, eisDead, guiMainMenu:
	WriteIni(eisDead, "settings", "isDead")
	GuiControlGet, eisHeal, guiMainMenu:
	WriteIni(eisHeal, "settings", "isHeal")
	GuiControlGet, eisOffinarrested, guiMainMenu:
	WriteIni(eisOffinarrested, "settings", "isOffinarrested")
	GuiControlGet, eisStopM, gMainSettings:
	WriteIni(eisStopM, "settings", "isStopM")
	GuiControlGet, eisAutoEn, gMainSettings:
	WriteIni(eisAutoEn, "settings", "isAutoEn")
	GuiControlGet, eisKill, gMainSettings:
	WriteIni(eisKill, "settings", "isKill")
	GuiControlGet, eisTakeGun, guiMainMenu:
	WriteIni(eisTakeGun, "settings", "isTakeGun")
	GuiControlGet, eisBar, gMainSettings:
	WriteIni(eisBar, "settings", "isBar")
	GuiControlGet, eisRU, gMainSettings:
	WriteIni(eisRU, "settings", "isRU")
	GuiControlGet, eisAutoScreen, gMainSettings:
	WriteIni(eisAutoScreen, "settings", "isAutoScreen")
	GuiControlGet, eisWoman, gMainSettings:
	WriteIni(eisWoman, "settings", "isWoman")
	GuiControlGet, eisGiveGuns, gMainSettings:
	WriteIni(eisGiveGuns, "settings", "isGiveGuns")
	GuiControlGet, eisTazer, gMainSettings:
	WriteIni(eisTazer, "settings", "isTazer")
	GuiControlGet, eisTime, gMainSettings:
	WriteIni(eisTime, "settings", "isTime")
	GuiControlGet, eisPass, gMainSettings:
	WriteIni(eisPass, "settings", "isPass")
	GuiControlGet, eisDeagleCount, gMainSettings:
	WriteIni(eisDeagleCount, "settings", "isDeagleCount")
	GuiControlGet, eisShotgunCount, gMainSettings:
	WriteIni(eisShotgunCount, "settings", "isShotgunCount")
	GuiControlGet, eisMP5Count, gMainSettings:
	WriteIni(eisMP5Count, "settings", "isMP5Count")
	GuiControlGet, eisM4A1Count, gMainSettings:
	WriteIni(eisM4A1Count, "settings", "isM4A1Count")
	GuiControlGet, eisRifleCount, gMainSettings:
	WriteIni(eisRifleCount, "settings", "isRifleCount")
	GuiControlGet, eisArmourCount, gMainSettings:
	WriteIni(eisArmourCount, "settings", "isArmourCount")
	GuiControlGet, eisSpecGunCount, gMainSettings:
	WriteIni(eisSpecGunCount, "settings", "isSpecGunCount")
	for fIndex, nKey in KeySetList
	{
		tKey := "eKey" nKey
		GuiControlGet, gKey, guiMainMenu: , %tKey%
		gKey := GetKeysVK(gKey)
		if(RegExMatch(gKey,"^(\!|\#|\^|\+)$"))
		{
			OldKey := Key%nKey%
			GuiControl, guiMainMenu:, %tKey%, %OldKey%
			continue
		}
		oKey := Key%nKey%
		if(isBind["Key" gKey] && gKey != oKey && strlen(gKey))
		{
			showError("Клавиша " HKToStr(gKey) " уже используется")
			OldKey := Key%nKey%
			GuiControl, , %tKey%, %OldKey%
			continue
		}
		if(isBind["Key" oKey])
			isBind["Key" oKey] := false
		if(!isBind["Key" gKey])
			isBind["Key" gKey] := true
		WriteIni(gKey, "keys", "Key" nKey)
	}
	LoadIniFile()
	LoadBinds()
	return
}
LoadBinds()
{
	global
	for fIndex, nKey in KeySetList
	{
		addHotKey(Key%nKey%, "gKey" nKey)
	}
	loop %BindCount%
	{
		nKey := KeyBinds%A_Index%
		if(!strlen(nKey))
			continue
		addHotKey(KeyBinds%A_Index%, "gKeyBinds")
	}
	return
}
unLoadBinds()
{
	global
	for fIndex, nKey in KeyList
	{
		delHotKey(Key%nKey%)
	}
	for fIndex, nKey in KeySetList
	{
		delHotKey(Key%nKey%)
	}
	loop %BindCount%
	{
		nKey := KeyBinds%A_Index%
		if(!strlen(nKey))
			continue
		delHotKey(KeyBinds%A_Index%)
	}
	return
}
Gui, ChooseFraction:Font, S8
Gui, ChooseFraction:-SysMenu
Gui, ChooseFraction:Add, Text, x10 y3 h18, Организация
Gui, ChooseFraction:Add, DropDownList, xp+106 yp-3 w103 AltSubmit Choose%Fraction% vzFraction gLoadFraction, LSPD|SFPD|LVPD|FBI
Gui, ChooseFraction:Add, Text, xp-106 yp+30 C424242, Выберите сервер:
Gui, ChooseFraction:+DelimiterTab
Gui, ChooseFraction:Add, DropDownList, xp+2 yp+14 w209 AltSubmit vzecServerID Choose%cServerID% gLoadFraction, Evolve-Rp.Ru | Server: 01 | Client 0.3.7`tEvolve-Rp.Ru `| Server: 02 | Client 0.3.7`tEvolve-Rp.Ru `| Server: 03 | Client 0.3.7
Gui, ChooseFraction:+DelimiterDefault
Gui, ChooseFraction:Font, S8
Gui, ChooseFraction:Add, Text, x46 y80 h30 0x11
Gui, ChooseFraction:Add, Text, x47 y80 w135 0x10
Gui, ChooseFraction:Add, Text, xp+131 yp h30 0x11
Gui, ChooseFraction:Add, Text, xp-131 yp+27 w135 0x10
Gui, ChooseFraction:Font, S12
Gui, ChooseFraction:Add, Text, Center xp+1 yp-24 h23 w129 c000000 ggoReload, Подтвердить
Gui, LoadConnect:Font, S8
Gui, LoadConnect:-SysMenu
Gui, LoadConnect:Add, Text, x5 y1 C424242, Введите никнейм:
Gui, LoadConnect:Add, Edit, xp+2 yp+14 w140 h18 veUserName C424242, %UserName%
Gui, LoadConnect:Add, Text, xp+145 yp w16 h19 0x12
Gui, LoadConnect:Add, Text, xp+1 yp+2 gSetOldNick Center C424242 w13 h15, X
Gui, LoadConnect:Add, Text, xp-148 yp+16 C424242, Выберите сервер:
Gui, LoadConnect:+DelimiterTab
Gui, LoadConnect:Add, DropDownList, xp+2 yp+14 w200 AltSubmit vecServerID Choose%cServerID% gSave, Evolve-Rp.Ru | Server: 01 | Client 0.3.7`tEvolve-Rp.Ru `| Server: 02 | Client 0.3.7`tEvolve-Rp.Ru `| Server: 03 | Client 0.3.7
Gui, LoadConnect:+DelimiterDefault
Gui, LoadConnect:Font, S8
Gui, LoadConnect:Add, Text, x5 y70 h30 0x11
Gui, LoadConnect:Add, Text, x6 y70 w135 0x10
Gui, LoadConnect:Add, Text, xp+131 yp h30 0x11
Gui, LoadConnect:Add, Text, xp-131 yp+27 w135 0x10
Gui, LoadConnect:Font, S12
Gui, LoadConnect:Add, Text, Center xp+1 yp-24 h23 w129 c000000 ggoConnect , Подключиться
Gui, LoadConnect:Font, S8
Gui, LoadConnect:Add, Text, x141 y70 h30 0x11
Gui, LoadConnect:Add, Text, x142 y70 w135 0x10
Gui, LoadConnect:Add, Text, xp+131 yp h30 0x11
Gui, LoadConnect:Add, Text, xp-131 yp+27 w135 0x10
Gui, LoadConnect:Font, S12
Gui, LoadConnect:Add, Text, Center xp+1 yp-24 h24 w129 c000000 ggoNoConnect , Закрыть
Gui, Main:+hwndhGui
Gui, Main:Font, S14
Gui, Main:Add, Text, Center x0 y0 w640 h31 Disabled ,
Gui, Main:Add, Text, x12 y2 w300 vvarMainMenu , Главное меню
Gui, Main:Add, Text,  x3 y29 w152 h2 0x10 vbline1
Gui, Main:Add, Text, x288 y2 h31 0x11 vline2 Hidden
Gui, Main:Add, Text, x136 y29 w156 h2 0x10 vbline2
Gui, Main:Add, Text, Hidden x304 y2 w154 h2 0x10 vhline3
Gui, Main:Add, Text, x385 y2 h31 0x11 vline3 Hidden
Gui, Main:Add, Text, x289 y29 w154 h2 0x10 vbline3
Gui, Main:Font, S14
Gui, Main:Font, S8
Gui, Main:Add, Text, x535 y2 h31 0x11 vline4
Gui, Main:Font, S14
Gui, Main:Add, Text, Center x537 y2 h26 w80 ggoMenu vvarMenu, Меню
Gui, Main:Font, S8
Gui, Main:Add, Text, x461 y29 w165 h73 vmFon Hidden,
Gui, Main:Add, Text, x440 y29 w99 h2 0x10
Gui, Main:Add, Text, x535 y29 w90 h2 0x10 vbline4
Gui, Main:Add, Text, x461 y30 h122 0x11 vline5 Hidden
Gui, Main:Add, Text, x466 y53 w155 0x10 vbline5 Hidden
Gui, Main:Add, Text, x466 y76 w155 0x10 vbline6 Hidden
Gui, Main:Add, Text, x466 y100 w155 0x10 vbline7 Hidden
Gui, Main:Add, Text, x466 y124 w155 0x10 vbline8 Hidden
Gui, Main:Add, Text, x461 y148 w165 0x10 vbline9 Hidden
Gui, Main:Add, Text, x623 y2 h150 0x11 vline6 Hidden
Gui, Main:Font, S12
Gui, Main:Add, Text, Center x463 y31 w159 h22 ggoMenuSettings vgMainSettings Hidden, Настройки
Gui, Main:Add, Text, Center x463 y54 w159 h22 ggoHideTray vgMenuHideKey Hidden, Свернуть в трей
Gui, Main:Add, Text, Center x463 y78 w159 h22 ggoReload vgMenuVK Hidden, Перезапустить
Gui, Main:Add, Text, Center x463 y102 w159 h22 ggoVk vgMenuReloadKey Hidden, Разработчик
Gui, Main:Add, Text, Center x463 y126 w159 h22 gGuiClose vgMenuCloseKey Hidden, Выйти
Gui, Main:Font, S8
Gui, guiMainMenu:+parent%hGui% -Caption
Gui, guiMainMenu:Font, S8
Gui, guiMainMenu:Add, GroupBox, x12 y33 w300 h440 C000000, Системные бинды
Gui, guiMainMenu:Add, Hotkey, xp+7 yp+18 w100 h18 veKeyTazer gSave, %KeyTazer%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, Сменить тип патронов
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyCuff gSave, %KeyCuff%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, Надеть наручники на преступника
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyFollow gSave, %KeyFollow%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, Вести преступника за собой
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyCput gSave, %KeyCput%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, Посадить преступника в машину
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyCeject gSave, %KeyCeject%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, Вытащить преступника в участок
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyArrest gSave, %KeyArrest%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, Арест преступника
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyDeject gSave, %KeyDeject%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, Вытащить преступника из авто
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyHelp gSave, %KeyHelp%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, Вызвать подкрепление
Active := ((Fraction="1" || Fraction="2" || Fraction="3") && Rang < 4?" Disabled":"")
aFBI := (Fraction="4"?" Disabled":"")
Gui, guiMainMenu:Add, Hotkey,%Active% xp-106 yp+18 w100 h18 veKeyFrisk gSave, %KeyFrisk%
Gui, guiMainMenu:Add, Text,%Active% xp+106 yp+3 h18 vtKeyFrisk, Обыскать человека
Gui, guiMainMenu:Add, Hotkey,%Active% xp-106 yp+18 w100 h18 veKeyNarko gSave, %KeyNarko%
Gui, guiMainMenu:Add, Text,%Active% xp+106 yp+3 h18 vtKeyNarko, Изъять запрещенку в КПЗ
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyClist gSave, %KeyClist%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18 vtKeyClist, Сменить клист
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyDoklad gSave, %KeyDoklad%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18 vtKeyDoklad, Сделать доклад
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyMegaphone gSave, %KeyMegaphone%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, Сообщения в мегафон о остановке
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeySbros gSave, %KeySbros%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, Сбросить захваченную цель
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeySTime gSave, %KeySTime%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18 vtKeySTime, Показать время
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyNoga gSave, %KeyNoga%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, Схватить преступника за ногу
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeySMS gSave, %KeySMS%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, Ответить на последнее SMS
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyR gSave, %KeyR%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, Использовать рацию
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyEventYes gSave, %KeyEventYes%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, Подтвердить действие
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyEventNo gSave, %KeyEventNo%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, Отменить действие
Gui, guiMainMenu:Add, GroupBox, x317 y33 w300 h144 c000000, Основные настройки
Gui, guiMainMenu:Add, Text, xp+8 yp+18 vtClist, Цвет на дежурстве:
Gui, guiMainMenu:Add, Edit, xp+103 yp-2 Limit3 Number w30 h18 veClist gSave, %Clist%
Gui, guiMainMenu:Add, Checkbox, xp-103 yp+18 checked%isAuthDuty% veisAuthDuty gSave , Автоматически включать цвет при начале работы
Gui, guiMainMenu:Add, Checkbox, xp yp+18 checked%isDead% veisDead gSave, Автоматически включать цвет при смерти
Gui, guiMainMenu:Add, Checkbox, xp yp+18 checked%isOffinarrested% veisOffinarrested gSave, Включить проверку на выход при аресте
Gui, guiMainMenu:Add, Checkbox, xp yp+18 checked%isGmCar% veisGmCar gSave  , Включить проверку на клео починку авто
Gui, guiMainMenu:Add, Checkbox, xp yp+18 checked%isOpenHide% veisOpenHide gSave , Скрывать окно настроек в трей при запуске
Gui, guiMainMenu:Add, Checkbox, xp yp+18 checked%isOpenT% veisOpenT gSave, Открывать чат независимо от раскладки [Кнопка T]
Gui, guiMainMenu:Font, S8
Gui, guiMainMenu:Add, Text, x12 y476 h30 0x11
Gui, guiMainMenu:Add, Text, x13 y476 w148 0x10
Gui, guiMainMenu:Add, Text, xp+144 yp h30 0x11
Gui, guiMainMenu:Add, Text, xp-145 yp+27 w149 0x10
Gui, guiMainMenu:Font, S12
Gui, guiMainMenu:Add, Text, Center xp+2 yp-25 h24 w143 c000000 ggoUserSet , Биндер
Gui, guiMainMenu:Font, S8
Gui, guiMainMenu:Add, Text, x163 y476 h30 0x11
Gui, guiMainMenu:Add, Text, x164 y476 w150 0x10
Gui, guiMainMenu:Add, Text, xp+146 yp h30 0x11
Gui, guiMainMenu:Add, Text, xp-147 yp+27 w151 0x10
Gui, guiMainMenu:Font, S12
Gui, guiMainMenu:Add, Text, Center xp+2 yp-25 h24 w143 c424242 gopenIni, Версия: %Version%
Gui, guiMainMenu:Font, S8
Gui, guiMainMenu:Add, GroupBox, x317 y176 w300 h85 C424242, Быстрое подключение к серверу
Gui, guiMainMenu:Add, Text, xp+6 yp+13 C424242, Введите никнейм:
Gui, guiMainMenu:Add, Edit, xp+2 yp+14 w140 h18 veUserName C424242, %UserName%
Gui, guiMainMenu:Add, Text, xp+145 yp w16 h19 0x12
Gui, guiMainMenu:Add, Text, xp+1 yp+2 gSetOldNick Center C424242 w13 h15, X
Gui, guiMainMenu:Add, Text, xp-148 yp+16 C424242, Выберите сервер:
Gui, guiMainMenu:+DelimiterTab
Gui, guiMainMenu:Add, DropDownList, xp+2 yp+14 w230 AltSubmit vecServerID Choose%cServerID% gSave, Evolve-Rp.Ru | Server: 01 | Client 0.3.7`tEvolve-Rp.Ru `| Server: 02 | Client 0.3.7`tEvolve-Rp.Ru `| Server: 03 | Client 0.3.7
Gui, guiMainMenu:+DelimiterDefault
Gui, guiMainMenu:Font, S8
Gui, guiMainMenu:Add, Text, x317 y260 h30 0x11
Gui, guiMainMenu:Add, Text, xp+298 yp h30 0x11
Gui, guiMainMenu:Add, Text, xp-298 yp+27 w303 0x10
Gui, guiMainMenu:Font, S12
Gui, guiMainMenu:Add, Text, Center xp+2 yp-25 h24 w295 c000000 ggoConnect , Подключиться
Gui, guiMainMenu:Font, S8
Gui, guiMainMenu:Add, GroupBox, x317 y288 w300 h185 C424242, Информация
Gui, guiMainMenu:Add, Text, xp+7 yp+14 w285, `n `     Программа полностью бесплатная и имеет открытый исходный код`n`nВК разработчика программы - vk.com/69cucumber69`n`nНиже представлен список команд, которые присутствуют в данном скрипте. `n`nТакже вы можете вывести весь список при помощи команды - /pdhelp
Gui, guiMainMenu:Add, Text, xp-7 yp+174 h30 0x11
Gui, guiMainMenu:Add, Text, xp+1 yp w302 0x10
Gui, guiMainMenu:Add, Text, xp+298 yp h30 0x11
Gui, guiMainMenu:Add, Text, xp-299 yp+27 w303 0x10
Gui, guiMainMenu:Font, S12
Gui, guiMainMenu:Add, Text, Center xp+3 yp-25 h24 w295 Center c000000 ggoHelpACMD vverHelpACMD, Посмотреть список команд
Gui, gMainSettings:+parent%hGui% -Caption
Gui, gMainSettings:Font, S8
Gui, gMainSettings:Add, GroupBox, x12 y33 w300 h114 C000000, Основная информация
Gui, gMainSettings:Add, Text, xp+15 yp+20 h18, Тег в рации
Gui, gMainSettings:Add, Edit, xp+106 yp w100 h18 veTag gSave, %Tag%
Gui, gMainSettings:Add, Text, xp-106 yp+20 h18, Пароль
AutoPass := (!isPass?" Disabled":"")
Gui, gMainSettings:Add, Edit,%AutoPass% xp+106 yp w100 h18 vePass gSave, %Pass%
Gui, gMainSettings:Add, Text, xp-106 yp+20 h18, Организация
Gui, gMainSettings:Add, DropDownList, xp+106 yp w100 AltSubmit Choose%Fraction% veFraction gReFraction, LSPD|SFPD|LVPD|FBI
Gui, gMainSettings:Add, Text, xp-106 yp+20 h18, Звание
if (fraction!="4")
	Gui, gMainSettings:Add, DropDownList, %aArmy% xp+106 yp w100 AltSubmit Choose%Rang% veRang gReRang, Кадет|Офицер|Мл.Сержант|Сержант|Прапорщик|Ст.Прапорщик|Мл.Лейтенант|Лейтенант|Ст.Лейтенант|Капитан|Майор|Подполковник|Полковник|Шериф
else
	Gui, gMainSettings:Add, DropDownList, xp+106 yp w100 AltSubmit Choose%Rang% veRang gReRang, Стажер|Дежурный|Мл.Агент|Агент DEA|Агент CID|Глава DEA|Глава CID|Инспектор|Зам.Директора|Директора
Gui, gMainSettings:Add, GroupBox,%aMedic% %aArmy% x12 y146 w300 h60 C000000, Обыск заключенных в КПЗ
Gui, gMainSettings:Add, Checkbox,%Active% %aMedic% %aArmy% xp+8 yp+18 checked%isTakeKpz% veisTakeKpz gSave , Забирать нарко/маты/оружие при обыске в КПЗ
Gui, gMainSettings:Add, Checkbox,%Active% %aMedic% %aArmy% xp yp+18 checked%isTakeKeys% veisTakeKeys gSave , Изъятие ключей от камеры с РП отыгровкой
GunsCount := (xCount > 6?" Disabled":"")
Gui, gMainSettings:Add, GroupBox,%aMedic%  x12 y205 w300 h170 C000000, Автокомплект оружия
if (isDeagleCount && isGiveGuns)
{
	Gui, gMainSettings:Add, DropDownList,%aMedic%  xp+116 yp+20 w100 AltSubmit Choose%DeagleCount% veDeagleCount gReGuns, Одна обойма|Две обоймы
	Gui, gMainSettings:Add, Checkbox,%aMedic%  xp-96 yp checked%isDeagleCount% veisDeagleCount gReGuns , Desert Eagle
}
else
{
	Gui, gMainSettings:Add, DropDownList,%GunsCount% %aMedic%  xp+116 yp+20 w100 AltSubmit Choose%DeagleCount% veDeagleCount gReGuns, Одна обойма|Две обоймы
	Gui, gMainSettings:Add, Checkbox,%GunsCount% %aMedic%  xp-96 yp checked%isDeagleCount% veisDeagleCount gReGuns , Desert Eagle
}
if (isShotgunCount && isGiveGuns)
{
	Gui, gMainSettings:Add, DropDownList, %aMedic%  xp+96 yp+20 w100 AltSubmit Choose%ShotgunCount% veShotgunCount gReGuns, Одна обойма|Две обоймы
	Gui, gMainSettings:Add, Checkbox, %aMedic%  xp-96 yp checked%isShotgunCount% veisShotgunCount gReGuns , Shotgun
}
else
{
	Gui, gMainSettings:Add, DropDownList,%GunsCount% %aMedic%  xp+96 yp+20 w100 AltSubmit Choose%ShotgunCount% veShotgunCount gReGuns, Одна обойма|Две обоймы
	Gui, gMainSettings:Add, Checkbox,%GunsCount% %aMedic%  xp-96 yp checked%isShotgunCount% veisShotgunCount gReGuns , Shotgun
}
if (isMP5Count && isGiveGuns)
{
	Gui, gMainSettings:Add, DropDownList, %aMedic%  xp+96 yp+20 w100 AltSubmit Choose%MP5Count% veMP5Count gReGuns, Одна обойма|Две обоймы
	Gui, gMainSettings:Add, Checkbox, %aMedic%  xp-96 yp checked%isMP5Count% veisMP5Count gReGuns , MP5
}
else
{
	Gui, gMainSettings:Add, DropDownList, %GunsCount% %aMedic%  xp+96 yp+20 w100 AltSubmit Choose%MP5Count% veMP5Count gReGuns, Одна обойма|Две обоймы
	Gui, gMainSettings:Add, Checkbox,%GunsCount% %aMedic%  xp-96 yp checked%isMP5Count% veisMP5Count gReGuns , MP5
}
if (isM4A1Count && isGiveGuns)
{
	Gui, gMainSettings:Add, DropDownList, %aMedic%  xp+96 yp+20 w100 AltSubmit Choose%M4A1Count% veM4A1Count gReGuns, Одна обойма|Две обоймы
	Gui, gMainSettings:Add, Checkbox, %aMedic%  xp-96 yp checked%isM4A1Count% veisM4A1Count gReGuns , M4A1
}
else
{
	Gui, gMainSettings:Add, DropDownList, %GunsCount% %aMedic%  xp+96 yp+20 w100 AltSubmit Choose%M4A1Count% veM4A1Count gReGuns, Одна обойма|Две обоймы
	Gui, gMainSettings:Add, Checkbox,%GunsCount% %aMedic%  xp-96 yp checked%isM4A1Count% veisM4A1Count gReGuns , M4A1
}
if (isRifleCount && isGiveGuns)
{
	Gui, gMainSettings:Add, DropDownList,%aMedic%  xp+96 yp+20 w100 AltSubmit Choose%RifleCount% veRifleCount gReGuns, Одна обойма|Две обоймы
	Gui, gMainSettings:Add, Checkbox,%aMedic%  xp-96 yp checked%isRifleCount% veisRifleCount gReGuns , Rifle
}
else
{
	Gui, gMainSettings:Add, DropDownList, %GunsCount% %aMedic%  xp+96 yp+20 w100 AltSubmit Choose%RifleCount% veRifleCount gReGuns, Одна обойма|Две обоймы
	Gui, gMainSettings:Add, Checkbox,%GunsCount% %aMedic%  xp-96 yp checked%isRifleCount% veisRifleCount gReGuns , Rifle
}
if (isArmourCount && isGiveGuns && ArmourCount="1")
{
	Gui, gMainSettings:Add, DropDownList, %aMedic%  xp+96 yp+20 w100 AltSubmit Choose%ArmourCount% veArmourCount gReGuns, Взять|Не брать
	Gui, gMainSettings:Add, Checkbox, %aMedic%  xp-96 yp checked%isArmourCount% veisArmourCount gReGuns , Броня
}
else
{
	Gui, gMainSettings:Add, DropDownList, %GunsCount% %aMedic%  xp+96 yp+20 w100 AltSubmit Choose%ArmourCount% veArmourCount gReGuns, Взять|Не брать
	Gui, gMainSettings:Add, Checkbox,%GunsCount% %aMedic%  xp-96 yp checked%isArmourCount% veisArmourCount gReGuns , Броня
}
if (isSpecGunCount && isGiveGuns && SpecGunCount="1")
{
	Gui, gMainSettings:Add, DropDownList, %aMedic%  xp+96 yp+20 w100 AltSubmit Choose%SpecGunCount% veSpecGunCount gReGuns, Взять|Не брать
	Gui, gMainSettings:Add, Checkbox, %aMedic%  xp-96 yp checked%isSpecGunCount% veisSpecGunCount gReGuns , Спец. Оружие
}
else
{
	Gui, gMainSettings:Add, DropDownList, %GunsCount% %aMedic%  xp+96 yp+20 w100 AltSubmit Choose%SpecGunCount% veSpecGunCount gReGuns, Взять|Не брать
	Gui, gMainSettings:Add, Checkbox,%GunsCount% %aMedic%  xp-96 yp checked%isSpecGunCount% veisSpecGunCount gReGuns , Спец.Оружие
}
Gui, gMainSettings:Add, GroupBox, x317 y33 w300 h275 c000000, Настройки
Gui, gMainSettings:Add, Checkbox,%Active% %aMedic% %aArmy% xp+8 yp+18 checked%isChatFrisk% veisChatFrisk gSave , Выводить информацию при обыске в чат
Gui, gMainSettings:Add, Checkbox,%aMedic% %aArmy% xp yp+18 checked%isMdc% veisMdc gSave , Отыгровка при изменении типа патронов
Gui, gMainSettings:Add, Checkbox,%aMedic% %aArmy% xp yp+18 checked%isStopM% veisStopM gSave , Выводить ник, уровень, фракцию игрока после /m
Gui, gMainSettings:Add, Checkbox,%Active% %aMedic% %aArmy% xp yp+18 checked%isTake% veisTake gSave , Забирать наркотики/материалы при обыске
Gui, gMainSettings:Add, Checkbox, xp yp+18 checked%isAutoEn% veisAutoEn gSave , Автоматически заводить двигатель
Gui, gMainSettings:Add, Checkbox,%aMedic% %aArmy% xp yp+18 checked%isKill% veisKill gSave , Быстрый запрет дела
Gui, gMainSettings:Add, Checkbox, xp yp+18 checked%isRU% veisRU gSave , Всегда русская раскладка при открытии чата
Gui, gMainSettings:Add, Checkbox, xp yp+18 checked%isPass% veisPass gSave gRePass, Автоматически вводить пароль при входе в игру
Gui, gMainSettings:Add, Checkbox,%aMedic% %aArmy% xp yp+18 checked%isTazer% veisTazer gSave , Включить HUD Tazer
Gui, gMainSettings:Add, Checkbox, xp yp+18 checked%isTime% veisTime gSave , Включить HUD Time
Gui, gMainSettings:Add, Checkbox,%aMedic% %aArmy% xp yp+18 checked%isGiveGuns% veisGiveGuns gReGuns, Автокомплект оружия
Gui, gMainSettings:Add, Checkbox, xp yp+18 checked%isWoman% veisWoman gSave , Отыгровки от женского лица
Gui, gMainSettings:Add, Checkbox, xp yp+18 checked%isAutoScreen% veisAutoScreen gSave , Автоматически делать скриншот при повышении
Gui, gMainSettings:Add, Checkbox, xp yp+18 checked%isBar% veisBar gSave , Включить HUD Patrul
Gui, gMainSettings:Font, S8
Gui, gMainSettings:Add, Text, x12 y380 h30 0x11
Gui, gMainSettings:Add, Text, x13 y380 w148 0x10
Gui, gMainSettings:Add, Text, xp+144 yp h30 0x11
Gui, gMainSettings:Add, Text, xp-145 yp+27 w149 0x10
Gui, gMainSettings:Font, S12
Gui, gMainSettings:Add, Text, Center xp+2 yp-25 h24 w143 c000000 ggoSettingsMenuInBind , Биндер
Gui, gMainSettings:Font, S8
Gui, gMainSettings:Add, Text, x163 y380 h30 0x11
Gui, gMainSettings:Add, Text, x164 y380 w150 0x10
Gui, gMainSettings:Add, Text, xp+146 yp h30 0x11
Gui, gMainSettings:Add, Text, xp-147 yp+27 w151 0x10
Gui, gMainSettings:Font, S12
Gui, gMainSettings:Add, Text, Center xp+2 yp-25 h24 w143 c424242 gopenIni, Версия: %Version%
Gui, gMainSettings:Font, S8
Gui, gMainSettings:Add, Text, x317 y380 h30 0x11
Gui, gMainSettings:Add, Text, x318 y380 w300 0x10
Gui, gMainSettings:Add, Text, xp+296 yp h30 0x11
Gui, gMainSettings:Add, Text, xp-297 yp+27 w301 0x10
Gui, gMainSettings:Font, S12
Gui, gMainSettings:Add, Text, Center xp+2 yp-24 w295 h23 ggoSettingsMenuInSub , Вернуться на главную
Gui, helpCMD: -SysMenu
Gui, helpCMD:Add, GroupBox, x4 y1 w494 h415 C424242, Информация
Gui, helpCMD:Font, S8 c424242
Gui, helpCMD:Add, Text, xp+5 yp+14 w474
Gui, helpCMD:Font, S8 cDefault
Gui, helpCMD:Add, Text, x15 yp+5, - /yk - Открыть таблицу с Уголовным Кодексом
Gui, helpCMD:Add, Text, xp yp+15, - /fyk [слово] - Найти все статьи из УК с данным словом (чувствителен к регистру)
Gui, helpCMD:Add, Text, xp yp+15, - /ak - Открыть таблицу с Административным Кодексом
Gui, helpCMD:Add, Text, xp yp+15, - /fak [слово] - Найти все статьи из АК с данным словом (чувствителен к регистру)
Gui, helpCMD:Add, Text, xp yp+15, - /fp - Открыть таблицу с Федеральным Постановлением
Gui, helpCMD:Add, Text, xp yp+15, - /ffp [слово] - Найти все статьи из ФП с данным словом (чувствителен к регистру)
Gui, helpCMD:Add, Text, xp yp+15, - /lecture - Прочитать лецию
Gui, helpCMD:Add, Text, xp yp+15, - /stoplecture - Остановить лекцию
Gui, helpCMD:Add, Text, xp yp+15, - /dzap [ID] - SMS адвокату с запрещенными делами
Gui, helpCMD:Add, Text, xp yp+15, - /zap [ID] [причина] - Запретить дело на рассмотрение адвокатам
Gui, helpCMD:Add, Text, xp yp+15, - /setweather [ID погоды] - Сменить погоду
Gui, helpCMD:Add, Text, xp yp+15, - /roz [ID] - Выводит информацию о нарушениях преступника
Gui, helpCMD:Add, Text, xp yp+15, - /tkey [причина] - Попросить разрешение в рацию взять ключ от камеры
Gui, helpCMD:Add, Text, xp yp+15, - /cchat - Очистить чат
Gui, helpCMD:Add, Text, xp yp+15, - /rlogs - Диалоговое окно с последними сообщениями в рацию
Gui, helpCMD:Add, Text, xp yp+15, - /dlogs - Диалоговое окно с последними сообщениями в департамент
Gui, helpCMD:Add, Text, xp yp+15, - /sulogs - Диалоговое окно с последними объявлениями в розыск
Gui, helpCMD:Add, Text, xp yp+15, - /ffind [Текст] - Найти сообщения в чате содержащие данный текст (20 последних)
Gui, helpCMD:Add, Text, xp yp+15, - /kit - Временно включить/отключить автокомплект
Gui, helpCMD:Add, Text, xp yp+15, - /tazerset - Изменить местоположение Tazer HUD
Gui, helpCMD:Add, Text, xp yp+15, - /tazersetoff - Отключить изменение местоположения Tazer HUD
Gui, helpCMD:Add, Text, xp yp+15, - /timeset - Изменить местоположение Time HUD
Gui, helpCMD:Add, Text, xp yp+15, - /timesetoff - Отключить изменение местоположения Time HUD
Gui, helpCMD:Add, Text, xp yp+15, - /fraction - Выводит в диалоговое окно список участников организации
Gui, helpCMD:Add, Text, xp yp+15, - /z id - открыть диалоговое окно со списком статей
Gui, helpCMD:Add, Text, xp yp+15, - /z id статья - выдаёт розыск по номеру статьи. Редактировать статьи можно в файле su.txt
Gui, helpCMD:Font, S8 с000000
Gui, helpCMD:Add, Text, x4 y420 h30 0x11
Gui, helpCMD:Add, Text, x5 y420 w494 0x10
Gui, helpCMD:Add, Text, xp+490 yp h30 0x11
Gui, helpCMD:Add, Text, xp-490 yp+27 w494 0x10
Gui, helpCMD:Font, S12
Gui, helpCMD:Add, Text, Center xp+2 yp-24 w475 h23 C000000 ggoSettingsMenuInHelp, Закрыть справку по командам
Gui, helpCMD:Font, S8
Gui, guiUserSetKey:+parent%hGui% -Caption +hwndrKeys
Gui, guiUserSetKey:Add, Text, x0 y31 h17 w640 ,
Gui, guiUserSetKey:Add, Text, x10 y33 C424242 , Клавиша
Gui, guiUserSetKey:Add, Text, x117 y33 C424242 , Сообщение
Gui, guiUserSetKey:Add, Text, x480 y33 C424242 , Задержка
Gui, guiUserSetKey:Add, Text, x540 y33 C424242 , Очищать
Gui, guiUserSetKey:Add, Text, x588 y33 C424242 , Ввод
Gui, guiUserSetKey:Add, Text, Center x0 y477 w640 h40 Disabled ,
Gui, guiUserSetKey:Font, S12
Gui, guiUserSetKey:Add, Text, x6 y477 h30 0x11
Gui, guiUserSetKey:Add, Text, x7 y477 w151 0x10
Gui, guiUserSetKey:Add, Text, xp+147 yp h30 0x11
Gui, guiUserSetKey:Add, Text, xp-148 yp+27 w152 0x10
Gui, guiUserSetKey:Font, S12
Gui, guiUserSetKey:Add, Text, Center xp+2 yp-24 w146 h23 gSaveBinds, Сохранить
Gui, guiUserSetKey:Font, S12
Gui, guiUserSetKey:Add, Text, x157 y477 h30 0x11
Gui, guiUserSetKey:Add, Text, x158 y477 w161 0x10
Gui, guiUserSetKey:Add, Text, xp+157 yp h30 0x11
Gui, guiUserSetKey:Add, Text, xp-158 yp+27 w162 0x10
Gui, guiUserSetKey:Font, S12
Gui, guiUserSetKey:Add, Text, Center xp+2 yp-24 w146 h23 gHelpKeys, `  Ключи / Справка
Gui, guiUserSetKey:Font, S8
Gui, guiUserSetKey:Add, Text, x320 y477 h30 0x11
Gui, guiUserSetKey:Add, Text, x321 y477 w301 0x10
Gui, guiUserSetKey:Add, Text, xp+297 yp h30 0x11
Gui, guiUserSetKey:Add, Text, xp-298 yp+27 w302 0x10
Gui, guiUserSetKey:Font, S12
Gui, guiUserSetKey:Add, Text, Center xp+2 yp-24 w295 h23 ggoMainMenuSub , Вернуться на главную
Gui, guiUserSetKey:Font, S8
Gui, guiUserSet:+parent%rKeys% -Caption +hwndhScroll
Gui, guiUserSet:Font, S8
Gui, guiUserSet:Add, Text, x10 y28 Hidden,
loop %BindCount%
{
	Gui, guiUserSet:Add, Hotkey, xp yp+20 w100 h18 veKeyBinds%A_Index%, % KeyBinds%A_Index%
}
Gui, guiUserSet:Add, Text, x117 y28 Hidden,
loop %BindCount%
{
	Gui, guiUserSet:Add, Edit, xp yp+20 w365 h18 veBindMessage%A_Index%, % BindMessage%A_Index%
}
Gui, guiUserSet:Add, Text, x489 y30 Hidden,
loop %BindCount%
{
	Gui, guiUserSet:Add, Edit, xp yp+20 w40 h18 veBindSleep%A_Index%, % BindSleep%A_Index%
}
Gui, guiUserSet:Add, Text, x556 y30 Hidden,
loop %BindCount%
{
	isChecked := "checked" BindRetext%A_Index%
	isDisapled := (BindEnter%A_Index%?" Disabled":"")
	Gui, guiUserSet:Add, Checkbox, xp yp+20 veBindRetext%A_Index% %isChecked%%isDisapled%, `
}
Gui, guiUserSet:Add, Text, x594 y30 Hidden,
loop %BindCount%
{
	isChecked := "checked" BindEnter%A_Index%
	Gui, guiUserSet:Add, Checkbox, xp yp+20 veBindEnter%A_Index% gActiveRetext %isChecked%, `
}
ScrollSize := BindCount*18
OnMessage(0x115, "WM_VSCROLL")
OnMessage(0x20A, Func("WM_MOUSEWHEEL").Bind(hScroll))
UpdateScrollBar(hScroll, ScrollSize)
VSCROLL_To(hScroll, SB_Bottom)
Gui, ghelpKeys: -SysMenu
Gui, ghelpKeys:Add, GroupBox, x4 y1 w494 h397 C424242, Информация
Gui, ghelpKeys:Font, S8 c424242
Gui, ghelpKeys:Add, Text, xp+7 yp+15 w482, `    Используйте один или несколько ключей для получения инфомации или же установке курсора в нужное место.`n    Пример:`n  /su <DriverId> 2 Неподчинение
Gui, ghelpKeys:Add, Text, xp+5 yp+57 w474 0x10
Gui, ghelpKeys:Font, S8 cDefault
Gui, ghelpKeys:Add, Text, x15 yp+5, - <cur> - Установить курсор в указаное место (Не более одного раза)
Gui, ghelpKeys:Add, Text, xp yp+15, - <SmsID> - ID последнего кто написал вам SMS
Gui, ghelpKeys:Add, Text, xp yp+15, - <SmsNick> - Ник последнего кто написал вам SMS
Gui, ghelpKeys:Add, Text, xp yp+15, - <SmsToId> - ID последнего кому вы написали в SMS
Gui, ghelpKeys:Add, Text, xp yp+15, - <SmsToNick> - Ник последнего кому вы написали в SMS
Gui, ghelpKeys:Add, Text, xp yp+15, - <SuId> - ID которому выдали последний розыск
Gui, ghelpKeys:Add, Text, xp yp+15, - <SuNick> - Ник которому выдали последний розыск
Gui, ghelpKeys:Add, Text, xp yp+15, - <SuRpNick> - RP Ник которому выдали последний розыск
Gui, ghelpKeys:Add, Text, xp yp+15, - <KillRpNick> - Ник последнего посаженного игрока арест киллом
Gui, ghelpKeys:Add, Text, xp yp+15, - <ArrestRpNick> - Ник последнего арестованного игрока
Gui, ghelpKeys:Add, Text, xp yp+15, - <DriverId> - ID водителя ТС за которым идёт погоня
Gui, ghelpKeys:Add, Text, xp yp+15, - <DriverRpName> - Ник водителя ТС за которым идёт погоня
Gui, ghelpKeys:Add, Text, xp yp+15, - <TargetId> - ID игрока захваченным треугольником
Gui, ghelpKeys:Add, Text, xp yp+15, - <TargetRpName> - Ник игрока захваченным треугольником
Gui, ghelpKeys:Add, Text, xp yp+15, - <MyId> - Текущий ид вашего персонажа
Gui, ghelpKeys:Add, Text, xp yp+15, - <Zona> - Текущий квадрат в котором вы находитесь
Gui, ghelpKeys:Add, Text, xp yp+15, - <Tag> - Ваш тег в рацию (Указывается в настройках)
Gui, ghelpKeys:Add, Text, xp yp+15, - <ModelCar> - Имя модели авто за которой идёт погоня
Gui, ghelpKeys:Add, Text, xp yp+15, - <Nap> - Указывает напарников на посту / в автомобиле
Gui, ghelpKeys:Add, Text, xp yp+15, - <SF> - Отправляет сообщение в чат не через память GTA
Gui, ghelpKeys:Add, Text, xp yp+15, - <Screen> - Сделать скриншот
Gui, ghelpKeys:Font, S8 с000000
Gui, ghelpKeys:Add, Text, x4 y401 h30 0x11
Gui, ghelpKeys:Add, Text, x5 y401 w494 0x10
Gui, ghelpKeys:Add, Text, xp+490 yp h30 0x11
Gui, ghelpKeys:Add, Text, xp-490 yp+27 w494 0x10
Gui, ghelpKeys:Font, S12
Gui, ghelpKeys:Add, Text, Center xp+2 yp-24 w475 h23 C000000 ggoMainMenuInHelp, Закрыть справку по ключам
Gui, ghelpKeys:Font, S8
Gui, guiError:-caption -sysmenu +AlwaysOnTop +Border
Gui, guiError:font, S10
Gui, guiError:Add, Text, x4 y4 w200, Ошибка
Gui, guiError:font, S8
Gui, guiError:Add, Text, x0 yp+22 w230 Center verrorText, Произошла непредвиденая ошибка
Gui, Saved:-caption -sysmenu +AlwaysOnTop +Border
Gui, Saved:font, S14
Gui, Saved:Add, Text, x0 y2 w200 Center, Сохранено
Gui, Saved:font, S8
Gui, Saved:Add, Text, x0 yp+25 w200 Center, Изменения были приняты
ShowSaved()
{
	global
	if(Saved)
		return
	if(isError)
		gosub, ErrorHide
	Saved := true
	Gui, Saved:Show, w200 h45
	SetTimer, SavedOff, 5000
	return
}
showError(msg)
{
	global
	if(isError)
		return
	if(Saved)
		gosub, SavedOff
	isError := true
	GuiControl, guiError:, errorText, %msg%
	Gui, guiError:Show, w230 h45
	SetTimer, ErrorHide, 5000
	return
}
Gui, Load:Destroy
Gui, guiMainMenu:Show, x0 y0
if(isOpenHide)
{
	tHide := " Hide"
	Hidded := false
	gosub, goHideTray
	Process, Exist, gta_sa.exe
	if(!ErrorLevel)
	{
		Gui, LoadConnect:Show, w278 h100, Подключение к серверу
		LoadConnect := true
	}
} else tHide := ""
if (Fraction="0")
{
	tChooseFraction := true
	Gui, Main:Hide
	Gui, ChooseFraction:Show, w230 h116, Выберите фракцию
	Return
}
Gui, Main:Show,%tHide% w625 h509, Police Dream for Evolve Role Play
TrayTip, Police Dream, Нажмите на иконку программы чтобы показать или скрыть интерфейс с настройками, 3
OnMessage(0x201, "WM_LBUTTONDOWN")
updateOScoreboardData()
return
goNoConnect:
LoadConnect := false
Gui, LoadConnect:Destroy
return
openIni:
if(A_GuiEvent != "DoubleClick")
	return
Run, %iniFile%
return
ActiveRetext:
loop %BindCount%
{
	GuiControlGet, eBindEnter%A_Index%, guiUserSet:
	if(eBindEnter%A_Index%)
		GuiControl, Enable 0, eBindRetext%A_Index%
	else
		GuiControl, Enable 1, eBindRetext%A_Index%
}
return
SaveBinds:
ShowSaved()
loop %BindCount%
{
	GuiControlGet, eKeyBinds%A_Index%, guiUserSet:
	nKey := KeyBinds%A_Index%
	gKey := eKeyBinds%A_Index%
	gKey := GetKeysVK(gKey)
	if(RegExMatch(gKey,"^(\!|\#|\^|\+)$"))
		continue
	if(isBind["Key" gKey] &&  gKey != nKey && strlen(gKey) && !isBind["bKey" gKey])
	{
		showError("Клавиша " HKToStr(gKey) " уже используется")
		OldKey := nKey
		GuiControl, guiUserSet:, eKeyBinds%A_Index%, %OldKey%
		continue
	}
	if(isBind["Key" nKey])
		isBind["Key" nKey] := false
	if(isBind["bKey" nKey])
		isBind["bKey" nKey] := false
	if(!isBind["Key" gKey])
		isBind["Key" gKey] := true
	if(!isBind["bKey" gKey])
		isBind["bKey" gKey] := true
	GuiControlGet, eBindMessage%A_Index%, guiUserSet:
	GuiControlGet, eBindEnter%A_Index%, guiUserSet:
	GuiControlGet, eBindRetext%A_Index%, guiUserSet:
	GuiControlGet, eBindSleep%A_Index%, guiUserSet:
	BindMessage%A_Index% := eBindMessage%A_Index%
	BindEnter%A_Index% := eBindEnter%A_Index%
	BindRetext%A_Index% := eBindRetext%A_Index%
	BindSleep%A_Index% := eBindSleep%A_Index%
	WriteIni("[KEY:[" GetKeysVK(eKeyBinds%A_Index%) "]][MSG:[" eBindMessage%A_Index% "]][ENTER:[" eBindEnter%A_Index% "]][RETEXT:[" eBindRetext%A_Index% "]][SLEEP:[" eBindSleep%A_Index% "]]", "binds", "Bind" A_Index)
}
SaveIniFile()
return
goMainMenuSub:
if(tabId != 1)
	tabId := 1
else return
	gosub, ErrorHide
gosub, SavedOff
GuiControl, Main:, varMainMenu, Главное меню
Gui, guiMainMenu:Show, x0 y0
Gui, guiUserSet:Hide
Gui, guiUserSetKey:Hide
Gui, gMainSettings:Hide
Gui, Main:+LastFound
WinMove, , , , , 631, 536
return
ErrorHide:
SetTimer, ErrorHide, off
if(!isError)
	return
isError := false
Gui, guiError:Hide
return
SavedOff:
SetTimer, SavedOff, off
if(!Saved)
	return
Saved := false
Gui, Saved:Hide
return
SetOldNick:
RegRead, UserName, HKEY_CURRENT_USER, Software\SAMP, PlayerName
GuiControlGet, eUserName, % (LoadConnect?"LoadConnect:":"guiMainMenu:")
if(UserName = eUserName)
	return
GuiControl, , eUserName, %UserName%
return
#If
#if LoadConnect
~*Enter::
LoadConnect := false
Gui, LoadConnect:Destroy
gosub, goConnect
return
#If
#IfWinActive GTA:SA:MP
goConnect:
gosub, ErrorHide
gosub, SavedOff
if(LoadConnect)
{
	GuiControlGet, eUserName, LoadConnect:
	GuiControlGet, ecServerID, LoadConnect:
	LoadConnect := false
	Gui, LoadConnect:Destroy
	} else {
	GuiControlGet, eUserName, guiMainMenu:
	GuiControlGet, ecServerID, guiMainMenu:
}
if(strlen(eUserName) < 3)
{
	GuiControl, % (LoadConnect?"LoadConnect:":"guiMainMenu:"), "eUserName", "PlayerName"
	showError("Укажите корректный никнейм")
	return
}
if(strlen(Pass) < 6 && isPass)
{
	showError("Введите валидный пароль")
	return
}
if(cServerID != ecServerID)
{
	cServerID := ecServerID
	WriteIni(ecServerID, "settings", "ConnectServer")
}
if(cServerID = 1)
	connectIP := "185.169.134.67:7777"
else if(cServerID = 2)
	connectIP := "185.169.134.68:7777"
else if(cServerID = 3)
	connectIP := "185.169.134.91:7777"
else return
	RegRead, UserName, HKEY_CURRENT_USER, Software\SAMP, PlayerName
if(UserName != eUserName)
{
	UserName := eUserName
	RegWrite, REG_SZ, HKEY_CURRENT_USER, Software\SAMP, PlayerName, %eUserName%
}
RegRead, Adress, HKEY_CURRENT_USER, Software\SAMP, gta_sa_exe
RegExMatch(Adress, "(.*)gta\_sa\.exe", Adress)
Process, Exist, gta_sa.exe
if(ErrorLevel)
	return
Adress1 .= "samp.exe"
Process, Exist, samp.exe
if(ErrorLevel)
	Process, Close, samp.exe
Event["hTime"] := false
Event["Tazer"] := false
Run, %Adress1% %connectIP%
return
WM_LBUTTONDOWN() {
	global
	if(isError)
		gosub, ErrorHide
	if(Saved)
		gosub, SavedOff
	if(gMenuOpen)
	{
		gGui := A_GuiControl
		if(gGui != "gMenuHideKey" && gGui != "gMenuCloseKey" && gGui != "gMenuReloadKey" && gGui != "gMainSettings" && gGui != "gMenuVK")
		{
			gMenuOpen := 1
			Gosub goMenu
		}
	}
	return
}
LoadConnectGuiEscape:
LoadConnect := false
Gui, LoadConnect:Destroy
return
goSettingsMenuInSub:
if(tabId != 2)
	tabId := 2
else return
	gosub, ErrorHide
gosub, SavedOff
GuiControl, Main:, varMainMenu, Главное меню
Gui, guiMainMenu:Show, x0 y0
Gui, guiUserSet:Hide
Gui, guiUserSetKey:Hide
Gui, gMainSettings:Hide
Gui, Main:+LastFound
WinMove, , , , , 631, 536
return
goSettingsMenuInBind:
if(tabId != 2)
	tabId := 2
else return
	gosub, ErrorHide
gosub, SavedOff
GuiControl, Main:, varMainMenu, Биндер
Gui, guiUserSetKey:Show, x0 y0
Gui, guiUserSet:Show, x0 y0
Gui, gMainSettings:Hide
Gui, Main:+LastFound
WinMove, , , , , 631, 536
return
goUserSet:
gosub, ErrorHide
gosub, SavedOff
tabId := 5
GuiControl, Main:, varMainMenu, Биндер
Gui, guiUserSetKey:Show, x0 y0
Gui, guiUserSet:Show, x0 y0
Gui, guiMainMenu:Hide
Gui, Main:+LastFound
return
goMenu:
if(!gMenuOpen)
{
	GuiControl, Main:Enable 0, varMenu
	GuiControl, Main:Hide, bline4
	GuiControl, Main:Show, bline5
	GuiControl, Main:Show, mFon
	GuiControl, Main:Show, bline6
	GuiControl, Main:Show, bline7
	GuiControl, Main:Show, bline8
	GuiControl, Main:Show, bline9
	GuiControl, Main:Show, line5
	GuiControl, Main:Show, line6
	GuiControl, Main:Show, gMenuHideKey
	GuiControl, Main:Show, gMainSettings
	GuiControl, Main:Show, gMenuReloadKey
	GuiControl, Main:Show, gMenuVK
	GuiControl, Main:Show, gMenuCloseKey
	} else {
	GuiControl, Main:Enable 1, varMenu
	GuiControl, Main:Show, bline4
	GuiControl, Main:Hide, bline5
	GuiControl, Main:Hide, mFon
	GuiControl, Main:Hide, bline6
	GuiControl, Main:Hide, bline7
	GuiControl, Main:Hide, bline8
	GuiControl, Main:Hide, bline9
	GuiControl, Main:Hide, line5
	GuiControl, Main:Hide, line6
	GuiControl, Main:Hide, gMenuHideKey
	GuiControl, Main:Hide, gMainSettings
	GuiControl, Main:Hide, gMenuReloadKey
	GuiControl, Main:Hide, gMenuVK
	GuiControl, Main:Hide, gMenuCloseKey
}
gMenuOpen := !gMenuOpen
return
goHelpACMD:
gosub, ErrorHide
gosub, SavedOff
Gui, helpCMD:Show, w500 h452, Полный список команд
return
HelpKeys:
gosub, ErrorHide
gosub, SavedOff
Gui, ghelpKeys:Show, w500 h433, Ключи / Справка
return
goReload:
gosub, ErrorHide
gosub, SavedOff
Reload
return
goMenuSettings:
if(tabId != 10)
	tabId := 10
else return
	gosub, ErrorHide
gosub, SavedOff
GuiControl, Main:, varMainMenu, Настройки
gosub, goMenu
Gui, guiSubSet:Hide
Gui, guiMainMenu:Hide
Gui, gMainSettings:Show, x0 y0
Gui, Main:+LastFound
WinMove, , , , , 631, 440
Gui, guiMainMenu:Hide
return
goVk:
run, http://vk.com/69cucumber69
return
goHideTray:
if(Hidded)
{
	Menu, Tray, Rename, Развернуть, Свернуть
	Menu, tray, default, Свернуть
	Gui, Main:Show
	} else {
	Menu, Tray, Rename, Свернуть, Развернуть
	Menu, tray, default, Развернуть
	gMenuOpen := 1
	Gosub, goMenu
	Gui, Main:Hide
}
Hidded := !Hidded
return
GuiClose:
MainGuiClose:
isExit := true
unLoadBinds()
SetTimer, readChat, off
Gui, guiMainMenu:Destroy
Gui, guiSetMenu:Destroy
Gui, Main:Destroy
ExitApp
return
readChat:
i := 0
if(!checkHandles() || isExit || isReading)
	return
isReading := true
isRead1001 := false
isRead1002 := false
isRead1003 := false
isRead1004 := false
isRead1005 := false
isRead1006 := false
isRead1007 := false
isRead1008 := false
isRead1009 := false
isRead1010 := false
isRead1011 := false
isRead1012 := false
isRead1013 := false
isRead1014 := false
isRead1015 := false
isRead1016 := false
isRead1017 := false
isRead1018 := false
dwAddrr1 := readDWORD(hGTA, dwSAMP+ADDR_SAMP_CHATMSG_PTR)
loop 99
{
	i := A_Index-1
	if(isExit)
		break
	ChatLine := 0x132 + ((99 - i) * 0xFC) + offLine
	ChatLineText := GetChatLineEx(i)
	if(!strlen(ChatLineText))
		continue
	gRead := readMem(hGTA, dwAddrr1 + ChatLine)
	isRead%gRead% := true
	if(gRead = 1001 || gRead = 1002 || gRead = 1003 || gRead = 1004 || gRead = 1005 || gRead = 1006 || gRead = 1007 || gRead = 1008 || gRead = 1009 || gRead = 1010 || gRead = 1011 || gRead = 1012 || gRead = 1013 || gRead = 1014 || gRead = 1015 || gRead = 1016 || gRead = 1017 || gRead = 1018)
		continue
	if(!isRead1001 && RegExMatch(ChatLineText, "SMS: (?<Text>.*). Получатель: (?<Nick>.*)\[(?<ID>\d+)\]", smsto))
	{
		isRead1001 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		gLastSmsToId := smstoID
		gLastSmstoNick := smstoNick
		continue
	}
	if(!isRead1002 && isAutoEn && RegExMatch(ChatLineText, "Чтобы завести двигатель нажмите клавишу",AutoEn))
	{
		isRead1002 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		Interior := getPlayerInteriorId()
		dClose:
		if (isDialogOpen())
			goto, dClose
		if (isInChat())
			Send, {F6}
		Send {vk32 down}
		Sleep 100
		Send {vk32 up}
		continue
	}
	if(!isRead1003 && isKill && RegExMatch(ChatLineText, "Вы посадили в тюрьму (?<Nick>.*) на (?<Time>\d+) секунд", arrest) || RegExMatch(ChatLineText, "Вы посадили преступника на (?<Time>\d+) секунд!", Kill))
	{
		isRead1003 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		if (!isKill)
			Continue
		gLastKillNick := NearbyPlayerRPName
		gLastKillRpNick := RegExReplace(gLastArrestNick, "_", " ")
		settimer, Offinarrest, off
		KillError := isPlayerInStreamById(NearbyPlayerID,100)
		if((strlen(arrestNick) >= 3) || (gLastKillNick != "" && KillError))
		{
			gLastArrestNick := arrestNick
			NickArrested := arrestNick
			gLastArrestRpNick := RegExReplace(gLastArrestNick, "_", " ")
			if (arrestTime="3000" || arrestTime="3600")
			{
				Event["RpName"] := gLastArrestRPNick
				Event["Active"] := true
				Event["time"] := A_TickCount + 30000
				Event["reason"] := "ООП"
				if (((cServerID="1" && Rang < 6) || (cServerID="2" && Rang < 6)) && Fraction!="4")
					Event["chat"] := "/r " Tag " Дело " Event["RpName"] " рассмотрению не подлежит - " Event["reason"] "."
				else if (cServerID="1" && (Rang >= 6 || Fraction="4"))
					Event["chat"] := "/d Mayor, дело " Event["RpName"] " рассмотрению не подлежит - " Event["reason"] "."
				else if (cServerID="2" && (Rang >= 6 || Fraction="4"))
					Event["chat"] := "/d [City Hall] Дело " Event["RpName"] " рассмотрению не подлежит - " Event["reason"] "."
			}
			if (KillTime)
			{
				Event["RpName"] := gLastKillNick
				NickArrested := gLastKillNick
				Event["Active"] := true
				Event["time"] := A_TickCount + 30000
				Event["reason"] := "ООП"
				if (((cServerID="1" && Rang < 6) || (cServerID="2" && Rang < 6)) && Fraction!="4")
					Event["chat"] := "/r " Tag " Дело " Event["RpName"] " рассмотрению не подлежит - " Event["reason"] "."
				else if (cServerID="1" && (Rang >= 6 || Fraction="4"))
					Event["chat"] := "/d Mayor, дело " Event["RpName"] " рассмотрению не подлежит - " Event["reason"] "."
				else if (cServerID="2" && (Rang >= 6 || Fraction="4"))
					Event["chat"] := "/d [City Hall] Дело " Event["RpName"] " рассмотрению не подлежит - " Event["reason"] "."
			}
			if (Event["Active"] && arrestTime="3000" || arrestTime="3600" || KillTime)
			{
				if (cServerID="2" && (arrestTime="3000" || arrestTime="3600"))
					Continue
				AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Запретить рассмотрение дела {ffc801}" Event["RpName"] " {FFFFFF}по причине: {ffc801}" Event["reason"])
				Sleep 50
				AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Подтвердить действие: {ffc801}" HKToStr(KeyEventYes) "{FFFFFF} | Отменить действие:{ffc801} "HKToStr(KeyEventNo))
			}
		}
		continue
	}
	if(!isRead1004 && RegExMatch(ChatLineText, "Рабочий день начат", FDuty))
	{
		isRead1004 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		if(isAuthDuty && strlen(Clist))
			SendChat("/clist " Clist)
		continue
	}
	if(!isRead1005 && RegExMatch(ChatLineText, "SMS: (?<Text>.*). Отправитель: (?<Nick>.*)\[(?<ID>\d+)\]", sms))
	{
		isRead1005 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		gLastSmsID := smsID
		gLastSmsNICK := smsNick
		gLastSmsText := smsText
		continue
	}
	if(!isRead1006 && RegExMatch(ChatLineText, "" getUsername() " схватил преступника за ногу {(.*)\} (.*)", CuffWater))
	{
		isRead1006 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		zek := getClosestPlayerIdCarNotCopFBI3()
		if (CuffWater2="[Удачно]")
		{
			Sleep 1200
			SendChat("/cuff "zek)
		}
		if (CuffWater2="[Неудачно]")
		{
			Sleep 1200
			SendChat("/do Преступник вырвался.")
		}
		continue
	}
	if(!isRead1007 && RegExMatch(ChatLineText, "Добро пожаловать на Evolve Role Play", UpDate))
	{
		isRead1007 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		authorization := 0
		STazer := "{FF0000}OFF"
		connected:
		if (isPass)
		{
			if (authorization="10")
			{
				AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Произошла ошибка. Введите пароль в ручную.")
				return
			}
			if (isDialogOpen())
				SendInput, %Pass%{Enter}
			else
			{
				Sleep 250
				authorization++
				gosub, connected
			}
		}
		continue
	}
	if(!isRead1008 && RegExMatch(ChatLineText, "(.*) (?<Name>[A-Z][a-z]*)_(?<Family>[A-Z][a-z]*): (.*)Можно взять ключи от камеры по причине - (?<Reason>.*)\?", tKey))
	{
		isRead1008 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		Event["Name"] := tKeyName
		Event["Family"] := tKeyFamily
		Event["reason"] := tKeyReason
		Event["ZNick"] := "" Event["Name"] "_" Event["Family"] ""
		if (Rang >= 11 && (getUsername() != Event["ZNick"]))
		{
			Event["Active"] := true
			Event["time"] := A_TickCount + 30000
			Event["chat"] := "/r " Tag " " Event["Name"] ", можешь взять новый ключ от камеры."
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Полицейский {ffc801}" Event["Name"] " " Event["Family"] " {FFFFFF}хочет взять ключи от камеры, по причине: {ffc801}" Event["reason"] "")
			Sleep 50
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Подтвердить действие: {ffc801}" HKToStr(KeyEventYes) "{FFFFFF} | Отменить действие:{ffc801} "HKToStr(KeyEventNo))
		}
		continue
	}
	if(!isRead1009 && RegExMatch(ChatLineText, "(.*) (?<SName>[A-Z][a-z]*)_(?<SFamily>[A-Z][a-z]*): (.*)можешь взять новый ключ от камеры.", tKey))
	{
		isRead1009 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		Event["SName"] := tKeySName
		Event["SFamily"] := tKeySFamily
		Event["PNick"] := "" Event["Name"] "_" Event["Family"] ""
		if (getUsername() = Event["PNick"])
		{
			Event["Name"] := False
			Event["Family"] := False
			SendChat("/takekeys " Event["reason"] " | "Event["SFamily"])
		}
		continue
	}
	if(!isRead1010 && RegExMatch(ChatLineText, "(.*) (?<SName>[A-Z][a-z]*)_(?<SFamily>[A-Z][a-z]*): (.*) (Дело|дело) (.*) рассмотрению не подлежит - (.*).", rZap) && isKill)
	{
		isRead1010 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead4, 4)
		Event["SName"] := rZapSName
		Event["SFamily"] := rZapSFamily
		Event["rZapReason"] := rZap7
		Event["PNick"] := "" Event["SName"] "_" Event["SFamily"] ""
		if (RegExMatch(ChatLineText, "(.*)\[(Army|Police|FBI|Mayor|Instructors|Medic)(.*)") && rZap6=Event["RpName"] && Event["RpName"]!="" && getUsername() != Event["PNick"])
		{
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Рассмотрение дела {ffc801}" Event["RpName"] " {FFFFFF}было запрещено уже другим офицером!")
			Event["Active"] := false
			Event["RpName"] := ""
			continue
		}
		if (RegExMatch(ChatLineText, "(.*)\[(Army|Police|FBI|Mayor|Instructors|Medic)(.*)"))
			continue
		Event["RpName"] := RegExReplace(rZap6, "_", " ")
		if (getUsername() = Event["PNick"])
			continue
		if (cServerID="1" && (Rang >= 6 || Fraction="4"))
			Event["chat"] := "/d Mayor, дело " Event["RpName"] " рассмотрению не подлежит - " Event["rZapReason"]"."
		if (cServerID="2" && (Rang >= 6 || Fraction="4"))
			Event["chat"] := "/d [City Hall] Дело " Event["RpName"] " рассмотрению не подлежит - " Event["rZapReason"]"."
		if (cServerID="1" && (Rang >= 6 || Fraction="4")) || (cServerID="2" && (Rang >= 6 || Fraction="4"))
		{
			Event["Active"] := true
			Event["time"] := A_TickCount + 30000
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Запретить рассмотрение дела {ffc801}" Event["RpName"] " {FFFFFF}по причине: {ffc801}" Event["rZapReason"])
			Sleep 50
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Подтвердить действие: {ffc801}" HKToStr(KeyEventYes) "{FFFFFF} | Отменить действие:{ffc801} "HKToStr(KeyEventNo))
		}
		continue
	}
	if(!isRead1011 && RegExMatch(ChatLineText, "Вы взяли под конвой"))
	{
		isRead1011 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		Sleep 1200
		if (isWoman)
			SendChat("/me повела преступника за собой")
		else
			SendChat("/me повёл преступника за собой")
		continue
	}
	if(!isRead1012 && RegExMatch(ChatLineText, "Вы перестали конвоировать игрока"))
	{
		isRead1012 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		Sleep 1200
		if (isWoman)
			SendChat("/me остановила преступника")
		else
			SendChat("/me остановил преступника")
		continue
	}
	if(!isRead1013 && (RegExMatch(ChatLineText, "Посылать объявление можно раз в 10 секунд!") || RegExMatch(ChatLineText, "Не флуди!")))
	{
		isRead1013 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		if(Event["OStime"] > A_TickCount)
		{
			Event["Active"] := true
			Event["time"] := A_TickCount + 30000
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Произошла ошибка при запрете дела {ffc801}" Event["RpName"] " {FFFFFF}попробуйте еще раз!")
			Sleep 50
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Подтвердить действие: {ffc801}" HKToStr(KeyEventYes) "{FFFFFF} | Отменить действие:{ffc801} "HKToStr(KeyEventNo))
		}
		continue
	}
	if(!isRead1014 && RegExMatch(ChatLineText, "Вы поменяли пули на (.*)", tazer))
	{
		isRead1014 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		tazer := tazer1
		if (Event["TazerEn"] && isTazer)
		{
			IniRead, xTazer, % iniFile, TextDraw, TazerX
			IniRead, yTazer, % iniFile, TextDraw, TazerY
			IniRead, TStyle, % iniFile, TextDraw, TazerStyle
			IniRead, TSize, % iniFile, TextDraw, TazerSize
			sTazer := Tazer = "резиновые" ? "{32CD32}ON" : "{FF0000}OFF"
			if (!Event["Tazer"])
			{
				text_overlays := TextCreate(TStyle, TSize, true, false, xTazer, yTazer, 0xFFFFFFFF, "Tazer: "sTazer, true, true)
				Event["Tazer"] := true
			}
			else
			{
				TextSetString(text_overlays, "Tazer: "sTazer)
				TextUpdate(text_overlays, "Times New Roman", 12, true, false)
			}
		}
		continue
	}
	if(!isRead1015 && RegExMatch(ChatLineText, "([A-Za-z0-9\[\]\_\$\.]+)\: Переодел(ся|ась) (.*)", spy) && Fraction="4" && Rang>=6)
	{
		isRead1015 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		updateOScoreboardData()
		spycount := "0"
		Event["spyNick"] := spy1
		Event["spyId"] := getPlayerIdByName(spy1)
		if (RegExMatch(spy3, "(лабор|мед|Лабор|Мед)"))
			spyid := "4"
		else if (RegExMatch(spy3, "(Граждан|граждан)"))
			spyid := "1"
		else if (RegExMatch(spy3, "(Полицей|полиц)"))
			spyid := "2"
		else if (RegExMatch(spy3, "(Армейск|армейск|армию|Армию)"))
			spyid := "3"
		else if (RegExMatch(spy3, "(Мэр|мэр)"))
			spyid := "5"
		else if (RegExMatch(spy3, "(Автошкол|автошкол)"))
			spyid := "6"
		else if (RegExMatch(spy3, "(Новост|новост)"))
			spyid := "7"
		else if (RegExMatch(spy3, "(LCN|lcn|ЛКН|лкн|La Cosa Nostra|la cosa nostra)"))
			spyid := "8"
		else if (RegExMatch(spy3, "(Yakuza|yakuza|Якудза|якудза)"))
			spyid := "9"
		else if (RegExMatch(spy3, "(РМ|PM|Русская Мафия|русская|русской|Русская|Русской)"))
			spyid := "10"
		else if (RegExMatch(spy3, "(Rifa|rifa|Рифа|рифа)"))
			spyid := "11"
		else if (RegExMatch(spy3, "(Grove|grove|Грув|грув|Groove|groove)"))
			spyid := "12"
		else if (RegExMatch(spy3, "(Ballas|ballas|Баллас|баллас|Балас|балас)"))
			spyid := "13"
		else if (RegExMatch(spy3, "(Vagos|vagos|Вагос|вагос)"))
			spyid := "14"
		else if (RegExMatch(spy3, "(Aztec|aztec|Ацтек|ацтек)"))
			spyid := "15"
		else if (RegExMatch(spy3, "(Байкер|байкер|biker|Biker)"))
			spyid := "16"
		else if (RegExMatch(spy3, "агент"))
			spyid := "17"
		if (spyid!="" && Event["spyId"]!="" && Event["spyId"]!="-1")
		{
			if (spyid="1")
				spyinfo := "Гражданского"
			if (spyid="2")
				spyinfo := "Полицейского"
			if (spyid="3")
				spyinfo := "Военного"
			if (spyid="4")
				spyinfo := "Медика"
			if (spyid="5")
				spyinfo := "Мэрии"
			if (spyid="6")
				spyinfo := "Автошколы"
			if (spyid="7")
				spyinfo := "Новостей"
			if (spyid="8")
				spyinfo := "LCN"
			if (spyid="9")
				spyinfo := "Yakuza"
			if (spyid="10")
				spyinfo := "Русская Мафия"
			if (spyid="11")
				spyinfo := "Rifa"
			if (spyid="12")
				spyinfo := "Grove Street"
			if (spyid="13")
				spyinfo := "Ballas"
			if (spyid="14")
				spyinfo := "Vagos"
			if (spyid="15")
				spyinfo := "Aztec"
			if (spyid="16")
				spyinfo := "Байкеров"
			if (spyid="17")
				spyinfo := "Агента"
			Event["FBISpy"] := true
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Выдать Агенту {ffc801}" Event["spyNick"] " {FFFFFF}маскировку: {ffc801}" spyinfo)
			Sleep 50
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Подтвердить действие: {ffc801}" HKToStr(KeyEventYes) "{FFFFFF} | Отменить действие:{ffc801} "HKToStr(KeyEventNo))
		}
		if (Event["spyId"]="" && Event["spyId"]="-1")
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Произошла ошибка, выдайте маскировку вручную!")
		continue
	}
	if(!isRead1016 && RegExMatch(ChatLineText, "" getUsername() " ключи совпадают с ключами от камеры (.*)", keytry))
	{
		isRead1016 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		if (Event["SuspectKeyActive"])
		{
			Sleep 4000
			if (keytry1="{63C600} [Удачно]")
			{
				SendChat("/take "Event["SuspectKey"])
				ifrisk := "0"
					qgw := "0"
				qkolvostrok := getDialogLineCount()
				qlines := getDialogLines()
				Sleep 400
				if (ifrisk="5")
					Return
				if (isDialogOpen() && ifrisk!="5")
				{
					while qkolvostrok >= qgw
					{
						qgw++
						if (RegExMatch(qlines[qgw],"F	Ключи	(\d+)"))
						{
							setDialogIndex(qgw - 1)
							SendInput {Enter}
							Sleep 300
							SendInput {ESC}
						}
					}
				}
			}
			else
				SendChat("/do Ключи не совпадают.")
		}
		continue
	}
	if(!isRead1017 && RegExMatch(ChatLineText, "(.*) (?<SName>[A-Z][a-z]*)_(?<SFamily>[A-Z][a-z]*):(.*) (Дело|дело) № (\d+) чистосердечное признание.", cl))
	{
		isRead1017 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead4, 4)
		if (!isPlayerInAnyVehicle())
			continue
		Event["clId"] := cl6
		Event["clNick"] := getPlayerNameById(cl6)
		if (Event["clNick"]=getId())
			continue
		Event["Clear"] := true
		Event["time"] := A_TickCount + 30000
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Очистить уровни розыска {ffc801}" RegExReplace(Event["clNick"], "_", " ") " {FFFFFF}по причине: {ffc801}чистосердечное.")
		Sleep 50
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Подтвердить действие: {ffc801}" HKToStr(KeyEventYes) "{FFFFFF} | Отменить действие:{ffc801} "HKToStr(KeyEventNo))
		continue
	}
	if(!isRead1018 && RegExMatch(ChatLineText, "\[Clear\] (.*) удалил из розыскиваемых (.*)", clear))
	{
		isRead1018 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead4, 4)
		if (&& Event["Clear"] && Event["clNick"]=clear2 && getusername()!=clear1)
		{
			Event["Clear"] := false
			Event["clNick"] := ""
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Розыск у игрока{ffc801}" RegExReplace(Event["clNick"], "_", " ") " {FFFFFF}был очищен уже другим офицером!")
		}
		continue
	}
}
isReading := false
return
Save:
SaveIniFile()
return
ReGuns:
SaveIniFile()
xCount := "0"
DeagleCount := "0"
ShotgunCount := "0"
MP5Count := "0"
M4A1Count := "0"
RifleCount := "0"
ArmourCount := "0"
SpecGunCount := "0"
GuiControlGet, eDeagleCount
if (isDeagleCount)
	DeagleCount := eDeagleCount
GuiControlGet, eShotgunCount
if (isShotgunCount)
	ShotgunCount := eShotgunCount
GuiControlGet, eMP5Count
if (isMP5Count)
	MP5Count := eMP5Count
GuiControlGet, eM4A1Count
if (isM4A1Count)
	M4A1Count := eM4A1Count
GuiControlGet, eRifleCount
if (isRifleCount)
	RifleCount := eRifleCount
GuiControlGet, eArmourCount
if (isArmourCount && eArmourCount="1")
	ArmourCount := eArmourCount
GuiControlGet, eSpecGunCount
if (isSpecGunCount && eSpecGunCount="1")
	SpecGunCount := eSpecGunCount
xCount := DeagleCount+ShotgunCount+MP5Count+M4A1Count+RifleCount+ArmourCount+SpecGunCount
if (isGiveGuns)
{
	GuiControl, gMainSettings:Enable 1, eDeagleCount
	GuiControl, gMainSettings:Enable 1, eisDeagleCount
	GuiControl, gMainSettings:Enable 1, eShotgunCount
	GuiControl, gMainSettings:Enable 1, eisShotgunCount
	GuiControl, gMainSettings:Enable 1, eMP5Count
	GuiControl, gMainSettings:Enable 1, eisMP5Count
	GuiControl, gMainSettings:Enable 1, eM4A1Count
	GuiControl, gMainSettings:Enable 1, eisM4A1Count
	GuiControl, gMainSettings:Enable 1, eRifleCount
	GuiControl, gMainSettings:Enable 1, eisRifleCount
	GuiControl, gMainSettings:Enable 1, eArmourCount
	GuiControl, gMainSettings:Enable 1, eisArmourCount
	GuiControl, gMainSettings:Enable 1, eSpecGunCount
	GuiControl, gMainSettings:Enable 1, eisSpecGunCount
}
else
{
	GuiControl, gMainSettings:Enable 0, eDeagleCount
	GuiControl, gMainSettings:Enable 0, eisDeagleCount
	GuiControl, gMainSettings:Enable 0, eShotgunCount
	GuiControl, gMainSettings:Enable 0, eisShotgunCount
	GuiControl, gMainSettings:Enable 0, eMP5Count
	GuiControl, gMainSettings:Enable 0, eisMP5Count
	GuiControl, gMainSettings:Enable 0, eM4A1Count
	GuiControl, gMainSettings:Enable 0, eisM4A1Count
	GuiControl, gMainSettings:Enable 0, eRifleCount
	GuiControl, gMainSettings:Enable 0, eisRifleCount
	GuiControl, gMainSettings:Enable 0, eArmourCount
	GuiControl, gMainSettings:Enable 0, eisArmourCount
	GuiControl, gMainSettings:Enable 0, eSpecGunCount
	GuiControl, gMainSettings:Enable 0, eisSpecGunCount
}
if (xCount > "6")
{
	if (!isDeagleCount)
	{
		GuiControl, gMainSettings:Enable 0, eDeagleCount
		GuiControl, gMainSettings:Enable 0, eisDeagleCount
	}
	if (!isShotgunCount)
	{
		GuiControl, gMainSettings:Enable 0, eShotgunCount
		GuiControl, gMainSettings:Enable 0, eisShotgunCount
	}
	if (!isMP5Count)
	{
		GuiControl, gMainSettings:Enable 0, eMP5Count
		GuiControl, gMainSettings:Enable 0, eisMP5Count
	}
	if (!isM4A1Count)
	{
		GuiControl, gMainSettings:Enable 0, eM4A1Count
		GuiControl, gMainSettings:Enable 0, eisM4A1Count
	}
	if (!isRifleCount)
	{
		GuiControl, gMainSettings:Enable 0, eRifleCount
		GuiControl, gMainSettings:Enable 0, eisRifleCount
	}
	if (!isArmourCount || (isArmourCount && eArmourCount="2"))
	{
		GuiControl, gMainSettings:Enable 0, eArmourCount
		GuiControl, gMainSettings:Enable 0, eisArmourCount
	}
	if (!isSpecGunCount || (isSpecGunCount && eSpecGunCount="2"))
	{
		GuiControl, gMainSettings:Enable 0, eSpecGunCount
		GuiControl, gMainSettings:Enable 0, eisSpecGunCount
	}
}
else
{
	GuiControl, gMainSettings:Enable 1, eDeagleCount
	GuiControl, gMainSettings:Enable 1, eisDeagleCount
	GuiControl, gMainSettings:Enable 1, eShotgunCount
	GuiControl, gMainSettings:Enable 1, eisShotgunCount
	GuiControl, gMainSettings:Enable 1, eMP5Count
	GuiControl, gMainSettings:Enable 1, eisMP5Count
	GuiControl, gMainSettings:Enable 1, eM4A1Count
	GuiControl, gMainSettings:Enable 1, eisM4A1Count
	GuiControl, gMainSettings:Enable 1, eRifleCount
	GuiControl, gMainSettings:Enable 1, eisRifleCount
	GuiControl, gMainSettings:Enable 1, eArmourCount
	GuiControl, gMainSettings:Enable 1, eisArmourCount
	GuiControl, gMainSettings:Enable 1, eSpecGunCount
	GuiControl, gMainSettings:Enable 1, eisSpecGunCount
}
IniWrite, % xCount, % iniFile, settings, Count
SaveIniFile()
Return
ReFraction:
GuiControlGet, eFraction
Fraction := eFraction
SaveIniFile()
WriteIni(1, "settings", "Rang")
gosub, ErrorHide
gosub, SavedOff
Reload
return
LoadFraction:
GuiControlGet, zFraction
Fraction := zFraction
GuiControlGet, zecServerID
zServer := zecServerID
WriteIni(zFraction, "settings", "Fraction")
WriteIni(zServer, "settings", "ConnectServer")
WriteIni(1, "settings", "Rang")
return
RePass:
GuiControlGet, ePass
if (!isPass)
	GuiControl, gMainSettings:Enable 1, ePass
else
	GuiControl, gMainSettings:Enable 0, ePass
SaveIniFile()
return
ReRang:
GuiControlGet, eRang
Rang := eRang
if(Rang < 4 && (Fraction="1" || Fraction="2" || Fraction="3"))
{
	GuiControl, guiMainMenu:Enable 0, eKeyNarko
	GuiControl, guiMainMenu:Enable 0, tKeyNarko
	GuiControl, guiMainMenu:Enable 0, eKeyFrisk
	GuiControl, guiMainMenu:Enable 0, tKeyFrisk
	GuiControl, gMainSettings:Enable 0, eisChatFrisk
	GuiControl, gMainSettings:Enable 0, eisTake
	GuiControl, gMainSettings:Enable 0, eisTakeKpz
	GuiControl, gMainSettings:Enable 0, eisTakeKeys
}
else if((Rang >= 4 && (Fraction="1" || Fraction="2" || Fraction="3")) || Fraction="4")
{
	GuiControl, guiMainMenu:Enable 1, eKeyNarko
	GuiControl, guiMainMenu:Enable 1, tKeyNarko
	GuiControl, guiMainMenu:Enable 1, eKeyFrisk
	GuiControl, guiMainMenu:Enable 1, tKeyFrisk
	GuiControl, gMainSettings:Enable 1, eisChatFrisk
	GuiControl, gMainSettings:Enable 1, eisTake
	GuiControl, gMainSettings:Enable 1, eisTakeKpz
	GuiControl, gMainSettings:Enable 1, eisTakeKeys
}
SaveIniFile()
return
goSettingsMenuInHelp:
gosub, ErrorHide
gosub, SavedOff
Gui, helpCMD:Hide
return
goMainMenuInHelp:
gosub, ErrorHide
gosub, SavedOff
Gui, ghelpKeys:Hide
return
gKeyBinds:
ThisHK := A_ThisHotKey
StringTrimLeft, aKey, ThisHK, 1
loop %BindCount%
{
	if(aKey = KeyBinds%A_Index%)
		HotkeyEvent(KeyBinds%A_Index%, BindMessage%A_Index%, BindEnter%A_Index%, BindRetext%A_Index%, BindSleep%A_Index%)
}
return
HotkeyEvent(bKey, bMessage, isEnter, isRetext, isSleep)
{
	global
	If((isInChat() || isDialogOpen()) && WarnKey(bKey))
	return
	local localMessage := ""
	Event["ActiveSF"] := false
	Event["ActiveScreen"] := false
	localMessage := RegExReplace(bMessage, "(\<SmsID\>)", gLastSmsID)
	localMessage := RegExReplace(localMessage, "(\<SmsNick\>)", gLastSmsNICK)
	localMessage := RegExReplace(localMessage, "(\<SmsToId\>)", gLastSmsToId)
	localMessage := RegExReplace(localMessage, "(\<SmsToNick\>)", gLastSmstoNick)
	localMessage := RegExReplace(localMessage, "(\<SuId\>)", gLastWantedId)
	localMessage := RegExReplace(localMessage, "(\<SuNick\>)", gLastWantedNick)
	localMessage := RegExReplace(localMessage, "(\<SuRpNick\>)", gLastWantedRpNick)
	localMessage := RegExReplace(localMessage, "(\<KillRpNick\>)", gLastKillRpNick)
	localMessage := RegExReplace(localMessage, "(\<ArrestRpNick\>)", gLastArrestRpNick)
	localMessage := RegExReplace(localMessage, "(\<DriverId\>)", gLastDriverId)
	localMessage := RegExReplace(localMessage, "(\<DriverRpName\>)", gLastDriverRpName)
	localMessage := RegExReplace(localMessage, "(\<TargetId\>)", gLastTargetId)
	localMessage := RegExReplace(localMessage, "(\<TargetRpName\>)", gLastTargetRpName)
	localMessage := RegExReplace(localMessage, "(\<MyId\>)", gMyId)
	localMessage := RegExReplace(localMessage, "(\<Tag\>)", Tag)
	localMessage := RegExReplace(localMessage, "(\<ModelCar\>)", gModelCar)
	gStrLen := strlen(localMessage)
	if(!gStrLen)
		return
	cur := inStr(localMessage, "<cur>")
	if(cur > 0)
	{
		localMessage := RegExReplace(localMessage, "\<cur\>", "", curCount)
		leftKey := "{left " (gStrLen-cur)-(strlen("<cur>")*curCount)+1 "}"
	}
	
	if (inStr(localMessage, "<Zona>"))
	{
		gosub, gZona
		localMessage := RegExReplace(localMessage, "(\<Zona\>)", Zona)
	}
	if (inStr(localMessage, "<SF>"))
	{
		Event["ActiveSF"] := true
		localMessage := RegExReplace(localMessage, "(\<SF\>)", "")
	}
	if (inStr(localMessage, "<Screen>"))
	{
		Event["ActiveScreen"] := true
		localMessage := RegExReplace(localMessage, "(\<Screen\>)", "")
	}
	else
		leftKey := ""
	reMess := ""
	if(isEnter && !Event["ActiveSF"])
		SendChat(localMessage)
	else
	{
		localMessage := RegExReplace(localMessage, "\{(.*)\}", "{{}$1{}}")
		localMessage := RegExReplace(localMessage, "\!", "{!}")
		localMessage := RegExReplace(localMessage, "\#", "{#}")
		localMessage := RegExReplace(localMessage, "\^", "{^}")
		localMessage := RegExReplace(localMessage, "\+", "{+}")
		if(!isInChat() && !isDialogOpen())
		{
			keyF6 := "{F6}"
		} else keyF6 := ""
		if(isRetext)
			Retext := "{ctrl down}{SC1E}{ctrl up}{BackSpace}"
		else
			Retext := ""
		if(!strlen(localMessage))
			return
		SendMessage, 0x50,, 0x4190419,, A
		SendInput, %keyF6%%Retext%%localMessage%%leftKey%
		if Event["ActiveSF"]
			SendInput {Enter}
	}
	if Event["ActiveScreen"]
	{
		Sleep 500
		SendInput {F8}
	}
	ZTime := isSleep*1000
	Sleep %ZTime%
	return
}
gKeyClist:
if ((isInChat() || isDialogOpen()) && WarnKey(KeyClist)) ||(isDialogOpen())
	return
SendChat("/clist " Clist)
Sleep 1200
updateOScoreboardData()
colorname := getPlayerColor(getId())
col :=colorToStr(colorname)
addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] " col "Цвет ника был изменён")
return
gKeyCuff:
if ((isInChat() || isDialogOpen()) && WarnKey(KeyCuff)) ||(isDialogOpen())
	return
if (gLastTargetId!="-1" && gLastTargetId!="")
{
	if (isWoman)
		SendChat("/me заломала руки преступника и сняла наручники с поясного держателя")
	else
		SendChat("/me заломал руки преступника и снял наручники с поясного держателя")
	Sleep 1200
	SendChat("/cuff "gLastTargetId)
}
else
	AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Цель не захвачена")
return
gKeyFollow:
if ((isInChat() || isDialogOpen()) && WarnKey(KeyFollow)) ||(isDialogOpen())
	return
if (gLastTargetId!="-1" && gLastTargetId!="")
	SendChat("/follow "gLastTargetId)
else
	AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Цель не захвачена")
return
gKeyTazer:
if ((isInChat() || isDialogOpen()) && WarnKey(KeyTazer)) ||(isDialogOpen())
	return
SendChat("/tazer")
if (IsMdc)
{
	Sleep 1200
	if (isWoman)
		SendChat("/me сменила тип патронов в обойме")
	else
		SendChat("/me сменил тип патронов в обойме")
}
return
Time:
if (!isTime && !isTazer)
{
	StopHudTime := true
	DestroyAllVisual()
	Event["hTime"] := false
	Event["Tazer"] := false
	settimer, time, off
	Return
}
if (WinActive("GTA:SA:MP"))
{
	IniRead, Style, % iniFile, TextDraw, TimeStyle
	IniRead, Color, % iniFile, TextDraw, TimeColor
	IniRead, Size, % iniFile, TextDraw, TimeSize
	IniRead, xTime, % iniFile, TextDraw, TimeX
	IniRead, yTime, % iniFile, TextDraw, TimeY
	date := A_DD "." A_MM "." A_YYYY "  " A_Hour ":" A_Min ":" A_Sec
	if (!Event["hTime"])
	{
		IniRead, xTazer, % iniFile, TextDraw, TazerX
		IniRead, yTazer, % iniFile, TextDraw, TazerY
		IniRead, TStyle, % iniFile, TextDraw, TazerStyle
		IniRead, TSize, % iniFile, TextDraw, TazerSize
		DestroyAllVisual()
		if (Event["TazerEn"] && (isTime || isTazer))
		{
			if (isTazer && fraction!="6" && fraction!="7" && fraction!="8")
			{
				text_overlays := TextCreate(TStyle, TSize, true, false, xTazer, yTazer, 0xFFFFFFFF, "Tazer: "Stazer, true, true)
				Event["Tazers"] := false
			}
			if (isTime)
			{
				text_overlay := TextCreate(Style, Size, true, false, xTime, yTime, "0xFF"Color, date, true, true)
				Event["Times"] := false
			}
		}
		Event["hTime"] := true
		Event["Tazer"] := true
	}
	else
		if (isTime)
	{
		TextSetString(text_overlay, "" . date)
		TextUpdate(text_overlay, Style, Size, true, false)
	}
	else if (!isTime && !Event["Times"])
	{
		Event["Times"] := true
		Event["hTime"] := false
		Event["TazerEn"] := true
	}
	else if (!isTazer && !Event["Tazers"])
	{
		Event["Tazers"] := true
		Event["hTime"] := false
		Event["TazerEn"] := true
	}
}
Return
BH:
{
	if ((isTime || isTazer) && StopHudTime)
	{
		StopHudTime := false
		settimer, time, 1000
	}
	if (!WinActive("GTA:SA:MP"))
	{
		Process, Exist, gta_sa.exe
		if(!ErrorLevel)
		{
			Event["hTime"] := false
			Event["Tazer"] := false
		}
	}
	if (gMyId!=getId() && getId()!="" && getId()!="-1")
		gMyId := getId()
	if (getTargetPed()!="-1" && getTargetPed()!="")
		NearbyPlayerID := getIdByPed(getTargetPed())
	if (!getPlayerHealth() && isDead)
	{
		Sleep 6000
		SendChat("/clist " Clist)
		Sleep 1200
		updateOScoreboardData()
		colorname := getPlayerColor(getId())
		col :=colorToStr(colorname)
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] " col "Цвет ника был изменён")
	}
	if (isDialogOpen() && getDialogCaption()="Взять оружие" && isGiveGuns && Event["kit"] < A_TickCount && getDialogID() != "5226")
	{
		if (isArmourCount)
		{
			ccount := "0"
			dcount := "0"
			armourdialog:
			Sleep 250
			if (dcount="5")
				Return
			if (isDialogOpen() && dcount!="5")
			{
				if (ArmourCount="1")
					setDialogIndex(6)
				SendInput {Enter}
				ccount ++
			}
			else
			{
				dcount++
				sleep 250
				goto, armourdialog
			}
		}
		if (isDeagleCount)
		{
			ccount := "0"
			dcount := "0"
			DeagleDialog:
			Sleep 250
			if (dcount="5")
				Return
			if (isDialogOpen() && dcount!="5")
			{
				setDialogIndex(1)
				SendInput {Enter}
				ccount ++
				if (DeagleCount="2" && ccount!="2")
				{
					goto, DeagleDialog
				}
			}
			else
			{
				dcount++
				sleep 250
				goto, DeagleDialog
			}
		}
		if (isShotgunCount)
		{
			ccount := "0"
			dcount := "0"
			ShotDialog:
			Sleep 250
			if (dcount="5")
				Return
			if (isDialogOpen() && dcount!="5")
			{
				setDialogIndex(2)
				SendInput {Enter}
				ccount ++
				if (ShotgunCount="2" && ccount!="2")
				{
					goto, ShotDialog
				}
			}
			else
			{
				dcount++
				sleep 250
				goto, ShotDialog
			}
		}
		if (isMP5Count)
		{
			ccount := "0"
			dcount := "0"
			MP5Dialog:
			Sleep 250
			if (dcount="5")
				Return
			if (isDialogOpen() && dcount!="5")
			{
				setDialogIndex(3)
				SendInput {Enter}
				ccount ++
				if (MP5Count="2" && ccount!="2")
					goto, MP5Dialog
			}
			else
			{
				dcount++
				sleep 250
				goto, MP5Dialog
			}
		}
		if (isM4A1Count)
		{
			ccount := "0"
			dcount := "0"
			M4A1Dialog:
			Sleep 250
			if (dcount="5")
				Return
			if (isDialogOpen() && dcount!="5")
			{
				setDialogIndex(4)
				SendInput {Enter}
				ccount ++
				if (M4A1Count="2" && ccount!="2")
					goto, M4A1Dialog
			}
			else
			{
				dcount++
				sleep 250
				goto, M4A1Dialog
			}
		}
		if (isRifleCount)
		{
			ccount := "0"
			dcount := "0"
			RifleDialog:
			Sleep 250
			if (dcount="5")
				Return
			if (isDialogOpen() && dcount!="5")
			{
				setDialogIndex(5)
				SendInput {Enter}
				ccount ++
				if (RifleCount="2" && ccount!="2")
					goto, RifleDialog
			}
			else
			{
				dcount++
				sleep 250
				goto, RifleDialog
			}
		}
		if (isSpecGunCount)
		{
			ccount := "0"
			dcount := "0"
			SpecGundialog:
			Sleep 250
			if (dcount="5")
				Return
			if (isDialogOpen() && dcount!="5")
			{
				if (SpecGunCount="1")
					setDialogIndex(7)
				SendInput {Enter}
				ccount ++
			}
			else
			{
				dcount++
				sleep 250
				goto, SpecGundialog
			}
		}
		dcount := "0"
		DOpen:
		if (isDialogOpen())
		{
			Sleep 250
			SendInput {ESC down}
			Event["kit"] := A_TickCount + 5000
		}
		else if (dcount!="5")
		{
			dcount++
			goto, DOpen
		}
		return
	}
	if (NearbyPlayerID!="-1" && NearbyPlayerID!="")
	{
		vak := getIdByPed(getTargetPed())
		gLastTargetId := vak
		NearbyPlayerName := getPlayerNameById(vak)
		gLastTarget := NearbyPlayerName
		NearbyPlayerRPName := RegExReplace(NearbyPlayerName, "_", " ")
		NearbyPlayerID := vak
		gLastTargetRpName := NearbyPlayerRPName
		lvl := getPlayerScoreById(NearbyPlayerID)
		idskin := getTargetPlayerSkinIdById(NearbyPlayerID)
		if (idskin="102" || idskin="103" || idskin="104" || idskin="195" || idskin="21")
			org := "{CC00FF}The Ballas Gang"
		else if (idskin="105" || idskin="106" || idskin="107" || idskin="269" || idskin="270" || idskin="271" || idskin="86" || idskin="149" || idskin="297")
			org := "{009900}Grove Street Gang"
		else if (idskin="108" || idskin="109" || idskin="110" || idskin="190" || idskin="47")
			org := "{FFCD00}Los Santos Vagos"
		else if (idskin="114" || idskin="115" || idskin="116" || idskin="48" || idskin="44" || idskin="41" || idskin="292")
			org := "{00CCFF}Varios Los Aztecas"
		else if (idskin="173" || idskin="174" || idskin="175" || idskin="193" || idskin="226" || idskin="30" || idskin="119")
			org := "{008B8B}Rifa"
		else if (idskin="191" || idskin="252" || idskin="287" || idskin="61" || idskin="179" || idskin="255")
			org := "{008000}Army"
		else if (idskin="57" || idskin="98" || idskin="147" || idskin="150" || idskin="187" || idskin="216")
			org := "{4682B4}Мэрия"
		else if (idskin="59" || idskin="172" || idskin="189" || idskin="240")
			org := "{4169E1}Автошкола"
		else if (idskin="201" || idskin="247" || idskin="248" || idskin="254" || idskin="248" || idskin="298")
			org := "{FF0000}Байкеры"
		else if (idskin="272" || idskin="112" || idskin="125" || idskin="214" || idskin="111" || idskin="126")
			org := "{808080}Русская мафия"
		else if (idskin="113" || idskin="124" || idskin="214" || idskin="223")
			org := "{DAA520}La Cosa Nostra"
		else if (idskin="120" || idskin="123" || idskin="169" || idskin="186")
			org := "{FF0000}Yakuza"
		else if (idskin="211" || idskin="217" || idskin="250" || idskin="261")
			org := "{008080}News"
		else if (idskin="70" || idskin="219" || idskin="274" || idskin="275"  || idskin="276" || idskin="70")
			org := "{800000}Медики"
		else
			org := "{FFFFFF}Гражданский"
		if (isOffinarrested)
			settimer, Offinarrest
	}
	else
		NearbyPlayerID := vak
}
return
Offinarrest:
{
	Choto := isPlayerInStreamById(NearbyPlayerID,1000)
	Suspect := getPlayerNameById(NearbyPlayerID)
	if (Suspect=" " || Suspect="")
		return
	if (!Choto && !Event["pActive"])
	{
		Event["pActive"] := true
		Event["pTime"] := A_TickCount + 30000
	}
	if ((!Choto && Event["pTime"] < A_TickCount && Event["pActive"]))
	{
		settimer, Offinarrest, off
		Event["pActive"] := false
		return
	}
	if (Choto && Event["pActive"])
		Event["pActive"] := false
	if (Suspect!=NearbyPlayerName)
	{
		Poffinarrest := NearbyPlayerName
		AddChatMessageEx("FF0000","{FF0000}___________________ВНИМАНИЕ_________________________")
		AddChatMessageEx("ffc801","")
		AddChatMessageEx("ffc801","Подозреваемый {FF0000}" NearbyPlayerName " [" NearbyPlayerID "]{ffc801} вышел из игры")
		AddChatMessageEx("ffc801","Лет в штате: {FFFFFF}"lvl)
		AddChatMessageEx("ffc801","Организация: "org)
		Sleep 50
		AddChatMessageEx("FF0000","{FF0000}_______________________________________________________")
		settimer, Offinarrest, off
	}
}
return
Caroff:
{
	CarSuspect := getPlayerNameById(IdInCar)
	Choto := isPlayerInStreamById(IdInCar,1000)
	if (CarSuspect="" or CarSuspect=" ")
		return
	if (!Choto && !Event["oActive"])
	{
		Event["oActive"] := true
		Event["oTime"] := A_TickCount + 30000
	}
	if ((!Choto && Event["oTime"] < A_TickCount && Event["oActive"]))
	{
		Event["oActive"] := false
		settimer, Caroff, off
		settimer, CleoRepair, off
		return
	}
	if (Choto && Event["oActive"])
		Event["oActive"] := false
	if (CarSuspect!=NamePlayer)
	{
		if (Poffinarrest=NamePlayer)
		{
			settimer, Caroff, off
			settimer, CleoRepair, off
			Return
		}
		AddChatMessageEx("FF0000","{FF0000}___________________ВНИМАНИЕ_________________________")
		AddChatMessageEx("ffc801","")
		AddChatMessageEx("ffc801","Подозреваемый {FF0000}" NamePlayer " [" IdInCar "]{ffc801} вышел из игры")
		AddChatMessageEx("ffc801","Лет в штате: {FFFFFF}"lvl)
		AddChatMessageEx("ffc801","Организация: "org)
		Sleep 50
		AddChatMessageEx("FF0000","{FF0000}_______________________________________________________")
		settimer, Caroff, off
		settimer, CleoRepair, off
	}
}
return
CleoRepair:
{
	InitialNearbyCarHP := NearbyCarHP
	NearbyCarHP := getTargetVehicleHealthById(IdInCar)
	DPlayer := isTargetDriverbyId(IdInCar)
	if (isGmCar)
	{
		if (DPlayer="0")
		{
			settimer, CleoRepair, off
			return
		}
		if (NearbyCarHP > InitialNearbyCarHP && NearbyCarHP!="-1" && InitialNearbyCarHP!="" && InitialNearbyCarHP!="-1" && InitialNearbyCarHP >= "300")
		{
			AddChatMessageEx("FF0000","{FF0000}___________________ВНИМАНИЕ_________________________")
			AddChatMessageEx("ffc801","")
			AddChatMessageEx("ffc801","Подозреваемый {FF0000}" NamePlayer " [" IdInCar "]{ffc801} использовал клео починку")
			addChatMessageEx("ffc801","Было HP: {FF0000}" InitialNearbyCarHP "{ffc801} | Стало HP: {FF0000}"NearbyCarHP)
			AddChatMessageEx("ffc801","Лет в штате: {FFFFFF}"lvl)
			AddChatMessageEx("ffc801","Организация: "org)
			Sleep 50
			AddChatMessageEx("FF0000","{FF0000}_______________________________________________________")
		}
	}
	else
		settimer, CleoRepair, off
}
return
gKeyCput:
if ((isInChat() || isDialogOpen()) && WarnKey(KeyCput)) ||(isDialogOpen())
	return
if (isPlayerDriverMod()==1)
{
	dzp := getClosestPlayerIdCarNotCopFBI()
	CarId := getVehicleModelId()
	a1:=getMyPassengerId(0)
	a2:=getMyPassengerId(1)
	a3:=getMyPassengerId(2)
	a4:=getMyPassengerId(3)
	if (dzp!="-1")
	{
		if (CarId="523" || CarId="521")
		{
			if (a2="-1")
			{
				if (isWoman)
					SendChat("/me посадила преступника на заднее сиденье мотоцикла")
				else
					SendChat("/me посадил преступника на заднее сиденье мотоцикла")
				Sleep 1200
				SendChat("/cput " dzp " 1")
			}
			else
				AddChatMessageEx("{FFFFFF}"," {ffc801}[Police Dream] {FFFFFF}В транспортном средстве нет места для преступника")
		}
		else if (CarId="599" || CarId="415")
		{
			if (a2="-1")
			{
				if (isWoman)
					SendChat("/me открыла дверь и посадила преступника в автомобиль")
				else
					SendChat("/me открыл дверь и посадил преступника в автомобиль")
				Sleep 1200
				SendChat("/cput " dzp " 1")
			}
			else
				AddChatMessageEx("{FFFFFF}"," {ffc801}[Police Dream]{FFFFFF} В транспортном средстве нет места для преступника")
		}
		else  if (CarId="596" || CarId="560" || CarId="597" || CarId="598" || CarId="490")
		{
			if (isWoman)
				SendChat("/me открыла дверь служебного автомобиля и посадила преступника на сиденье")
			else
				SendChat("/me открыл дверь служебного автомобиля и посадил преступника на сиденье")
			Sleep 1200
			if (a4="-1")
				SendChat("/cput " dzp " 3")
			else if (a3="-1")
				SendChat("/cput " dzp " 2")
			else if (a2="-1")
				SendChat("/cput " dzp " 1")
			else
				AddChatMessageEx("{FFFFFF}"," {ffc801}[Police Dream]{FFFFFF} В транспортном средстве нет места для преступника")
		}
		else if (CarId="427")
		{
			if (isWoman)
				SendChat("/me открыла дверь бобика и посадила преступника")
			else
				SendChat("/me открыл дверь бобика и посадил преступника")
			Sleep 1200
			if (a4="-1")
				SendChat("/cput " dzp " 3")
			else if (a3="-1")
				SendChat("/cput " dzp " 2")
			else if (a2="-1")
				SendChat("/cput " dzp " 1")
			else
				AddChatMessageEx("{FFFFFF}"," {ffc801}[Police Dream]{FFFFFF} В транспортном средстве нет места для преступника")
		}
		else if (CarId="497")
		{
			if (isWoman)
				SendChat("/me открыла дверь вертолёта и посадила преступника на сиденье")
			else
				SendChat("/me открыл дверь вертолёта и посадил преступника на сиденье")
			Sleep 1200
			if (a4="-1")
				SendChat("/cput " dzp " 3")
			else if (a3="-1")
				SendChat("/cput " dzp " 2")
			else if (a2="-1")
				SendChat("/cput " dzp " 1")
			else
				AddChatMessageEx("{FFFFFF}"," {ffc801}[Police Dream]{FFFFFF} В транспортном средстве нет места для преступника")
		}
		else
			AddChatMessageEx("{FFFFFF}"," {ffc801}[Police Dream]{FFFFFF} Данное авто не является служебным ")
	}
	else
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Рядом нет игрока")
}
else
	AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} Необходимо находится за рулём")
return
gKeyCeject:
if ((isInChat() || isDialogOpen()) && WarnKey(KeyCeject)) ||(isDialogOpen())
	return
CarId := getVehicleModelId()
dzp:=getClosestPlayerIdCarNotCopFBI2()
if (dzp!="-1")
{
	if (CarId="523" || CarId="521")
	{
		if (isWoman)
			SendChat("/me помогла преступнику слезть с мотоцикла")
		else
			SendChat("/me помог преступнику слезть с мотоцикла")
	}
	else if (CarId="599" || CarId="415")
	{
		if (isWoman)
			SendChat("/me открыла дверь Rancher'a и вытащила преступника из автомобиля")
		else
			SendChat("/me открыл дверь Rancher'a и вытащил преступника из автомобиля")
	}
	else  if (CarId="596" || CarId="560" || CarId="597" || CarId="598" || CarId="490")
	{
		if (isWoman)
			SendChat("/me открыла дверь служебного автомобиля и вытащила подозреваемого")
		else
			SendChat("/me открыл дверь служебного автомобиля и вытащил подозреваемого")
	}
	else if (CarId="427")
	{
		if (isWoman)
			SendChat("/me открыла дверь бобика и проводила преступника до участка")
		else
			SendChat("/me открыл дверь бобика и проводил преступника до участка")
	}
	else if (CarId="497")
	{
		if (isWoman)
			SendChat("/me вытащила преступника из вертолета")
		else
			SendChat("/me вытащил преступника из вертолета")
	}
	Sleep 1200
	SendChat("/ceject "dzp)
}
else
	AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} Рядом нет игрока в авто")
return

gKeyDeject:
if ((isInChat() || isDialogOpen()) && WarnKey(KeyDeject)) ||(isDialogOpen())
	return
targ := getClosestPlayerIdCarNotCopFBI3()
if (targ!="-1")
	ModellCar:=getTargetVehicleModelIdById(targ)
name:=getPlayerNameById(targ)
StringReplace, RPName, Name, _, %A_Space%, All
if (getTargetVehicleModelNameById(targ)="PoliceMaverick" || getTargetVehicleModelNameById(targ)=="Maverick")
	if (isWoman)
	SendChat("/me открыла дверцу и помогла вылезти из вертолета")
else
	SendChat("/me открыл дверцу и помог вылезти из вертолета")
else if (ModellCar="461" || ModellCar="523" || ModellCar="463" || ModellCar="468" || ModellCar="521" || ModellCar="522" || ModellCar="581" || ModellCar="586")
	if (isWoman)
	SendChat("/me стащила нарушителя с мотоцикла")
else
	SendChat("/me стащил нарушителя с мотоцикла")
else if (ModellCar="448" || ModellCar="462")
	if (isWoman)
	SendChat("/me стащила нарушителя с мопеда")
else
	SendChat("/me стащил нарушителя с мопеда")
else if (ModellCar="471")
	if (isWoman)
	SendChat("/me стащила нарушителя с квадроцикла")
else
	SendChat("/me стащил нарушителя с квадроцикла")
else if (ModellCar="481" || ModellCar="509" || ModellCar="510")
	if (isWoman)
	SendChat("/me стащила нарушителя с велосипеда")
else
	SendChat("/me стащил нарушителя с велосипеда")
else
{
	if (isWoman)
		SendChat("/me разбила стекло прикладом оружия и вытащила преступника из автомобиля")
	else
		SendChat("/me разбил стекло прикладом оружия и вытащил преступника из автомобиля")
}
if(!isInChat() && !isDialogOpen())
	SendInput, {F6}
SendInput, ^{SC1E}{BackSpace}
SendInput, /deject{Space}
return
gKeyFrisk:
if ((isInChat() || isDialogOpen()) && WarnKey(KeyFrisk)) ||(isDialogOpen())
	return
if (Rang < 4 && Fraction!="4")
{
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Данная команда доступна с Сержанта[4]")
	return
}
zFrisk := 0
if (gLastTargetId!="-1" && gLastTargetId!="")
{
	if (isWoman)
		SendChat("/me надела перчатки")
	else
		SendChat("/me надел перчатки")
	if (cServerID="2")
		Sleep 1200
	else
	{
		Random Rando, 4000, 8000
		Sleep %Rando%
	}
	SendChat("/frisk "gLastTargetId)
	Text := ""
}
else
{
	AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} Цель не захвачена")
	return
}
Name := getPlayerNameById(gLastTargetId)
gNick := RegExReplace(Name, "_", " ")
frisk:
Sleep 250
if (zFrisk="3")
{
	AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Попробуйте обыскать еще раз")
	return
}
If(isDialogOpen())
{
	Text := getDialogText()
	RegExMatch(Text,"A	Наркотики	([0-9]*)",narko)
	RegExMatch(Text,"B	Материалы	([0-9]*)",mati)
	RegExMatch(Text,"F	Ключи	([0-9]*)",keyss)
	RegExMatch(Text,"P	Оружие	([0-9]*)",gun)
	RegExMatch(Text,"K	Водительские права	([0-9]*)",prava)
	RegExMatch(Text,"O	Лицензия на оружие	([0-9]*)",lgun)
	if (isChatFrisk)
	{
		AddChatMessageEx("FFFFFF","{0000FF}________________________________________________")
		AddChatMessageEx("FFFFFF","{ffc801}")
		AddChatMessageEx("FFFFFF","{ffc801}Личные вещи {FF0000}" gNick "{ffc801}")
		if (narko1!="")
			AddChatMessageEx("FFFFFF","{FF0000}Наркотики: "narko1)
		if (mati1!="")
			AddChatMessageEx("FFFFFF","{FF0000}Материалы: "mati1)
		if (keyss1!="")
			AddChatMessageEx("FFFFFF","{FF0000}Ключи от камер: "keyss1)
		if (gun1!="")
		{
			if (gun1="1")
			{
				idskin := getTargetPlayerSkinIdById(gLastTargetId)
				if (idskin="102" || idskin="103" || idskin="104" || idskin="195" || idskin="105" || idskin="106" || idskin="107" || idskin="269" || idskin="270" || idskin="271" || idskin="108" || idskin="109" || idskin="110" || idskin="190" || idskin="114" || idskin="115" || idskin="116" || idskin="173" || idskin="174" || idskin="175" || idskin="193" || idskin="226" || idskin="30" || idskin="201" || idskin="247" || idskin="248" || idskin="254" || idskin="248" || idskin="298" || idskin="272" || idskin="112" || idskin="125" || idskin="214" || idskin="111" || idskin="113" || idskin="124" || idskin="214" || idskin="223" || idskin="120" || idskin="123" || idskin="169" || idskin="186" || idskin="211" || idskin="217" || idskin="250" || idskin="261")
					AddChatMessageEx("FFFFFF","{ffc801}Холодное оружие")
				else
					AddChatMessageEx("FFFFFF","{FF0000}Огнестрельное оружие")
			}
			else
				AddChatMessageEx("FFFFFF","{FF0000}Огнестрельное оружие")
		}
		if (prava1!="")
			AddChatMessageEx("FFFFFF","{32CD32}Водительское удостоверение")
		if (lgun1!="")
			AddChatMessageEx("FFFFFF","{32CD32}Лицензия на оружие")
		sleep 50
		AddChatMessageEx("FFFFFF","{0000FF}________________________________________________")
		If(isDialogOpen() && !isTake)
		SendInput {ESC}
	}
	if ((narko1!="" || mati1!="") && isTake)
	{
		Sleep 250
		If(isDialogOpen())
		{
			if (narko1!="" && mati1!="")
			{
				Sleep 250
				SendInput {Up 20}{Enter}
				Sleep 250
				SendInput {Up 20}{Enter}
			}
			else
				SendInput {Up 20}{Enter}
			Sleep 150
			SendInput {Esc}
			Sleep 1000
			if (isWoman)
				SendChat("/me достала из кармана пакет для улик и положила найденные предметы")
			else
				SendChat("/me достал из кармана пакет для улик и положил найденные предметы")
		}
		else
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Попробуйте обыскать еще раз")
	}
}
else
{
	zFrisk++
	Goto, frisk
}
return
gZona:
o:=Object()
o:=GetCoordinates()
Zona := CalculateZone(o[1],o[2],o[3])
Return
gKeyDoklad:
if ((isInChat() || isDialogOpen()) && WarnKey(KeyDoklad)) ||(isDialogOpen())
	return
o:=Object()
o:=GetCoordinates()
Zona := CalculateZone(o[1],o[2],o[3])
City := getPlayerCity()
Interior := getPlayerInteriorId()
s := -1
f := 0
q := 0
Jurisdiction := ""
AllName := ""
AllSuspect := ""
post := ""
kv:=getPlayerZone()
if(Fraction="1")
{
	if (City!="Los Santos" && Zona="А-1" || Zona="А-2" || Zona="А-3" || Zona="Б-1" || Zona="Б-2" || Zona="Б-3" || Zona="В-1" || Zona="В-2" || Zona="В-3" || Zona="Г-1" || Zona="Г-2" || Zona="Г-3" || Zona="Д-2" || Zona="Ж-2" || Zona="Ж-3" || Zona="Р-1" || Zona="Р-2" || Zona="Р-3" || Zona="Р-4" || Zona="Р-5" || Zona="Р-6" || Zona="Р-7" || Zona="Р-8" || Zona="С-1" || Zona="С-2" || Zona="С-3" || Zona="С-4" || Zona="С-5" || Zona="С-6" || Zona="С-7" || Zona="С-8" || Zona="Т-1" || Zona="Т-2" || Zona="Т-3" || Zona="Т-4" || Zona="Т-5" || Zona="Т-6" || Zona="Т-7" || Zona="Т-8" || Zona="У-1" || Zona="У-2" || Zona="У-3" || Zona="У-4" || Zona="У-5" || Zona="У-6" || Zona="У-7" || Zona="У-8" || Zona="Ф-1" || Zona="Ф-2" || Zona="Ф-3" || Zona="Ф-4" || Zona="Ф-5" || Zona="Ф-6" || Zona="Ф-7" || Zona="Ф-8" || Zona="Х-1" || Zona="Х-2" || Zona="Х-3" || Zona="Х-4" || Zona="Х-5" || Zona="Х-6" || Zona="Х-7" || Zona="Х-8" || Zona="Ц-1" || Zona="Ц-2" || Zona="Ц-3" || Zona="Ц-4" || Zona="Ц-5" || Zona="Ц-6" || Zona="Ц-7" || Zona="Ц-8" || Zona="Ч-1" || Zona="Ч-2" || Zona="Ч-3" || Zona="Ч-4" || Zona="Ч-5" || Zona="Ч-6" || Zona="Ч-7" || Zona="Ч-8" || Zona="Ш-1" || Zona="Ш-2" || Zona="Ш-3" || Zona="Ш-4" || Zona="Ш-5" || Zona="Ш-6" || Zona="Ш-7" || Zona="Ш-8" || Zona="Я-1" || Zona="Я-2" || Zona="Я-3" || Zona="Я-4" || Zona="Я-5" || Zona="Я-6" || Zona="Я-7" || Zona="Я-8" || Zona="О-9" || Zona="П-9" || Zona="С-9" || Zona="Т-9" ||  City="San Fierro")
		Jurisdiction := "SFPD"
	else if (City!="Los Santos" && Zona="А-4" || Zona="А-5" || Zona="А-6" || Zona="А-7" || Zona="А-8" || Zona="А-9" || Zona="А-10" || Zona="А-11" || Zona="А-12" || Zona="А-13" || Zona="А-14" || Zona="А-15" || Zona="А-16" || Zona="Б-4" || Zona="Б-5" || Zona="Б-6" || Zona="Б-7" || Zona="Б-8" || Zona="Б-9" || Zona="Б-10" || Zona="Б-11" || Zona="Б-12" || Zona="Б-13" || Zona="Б-14" || Zona="Б-15" || Zona="Б-16" || Zona="В-4" || Zona="В-5" || Zona="В-6" || Zona="В-7" || Zona="В-8" || Zona="В-9" || Zona="В-10" || Zona="В-11" || Zona="В-12" || Zona="В-13" || Zona="В-14" || Zona="В-15" || Zona="В-16" || Zona="Г-4" || Zona="Г-5" || Zona="Г-6" || Zona="Г-7" || Zona="Г-8" || Zona="Г-9" || Zona="Г-10" || Zona="Г-11" || Zona="Г-12" || Zona="Г-13" || Zona="Г-14" || Zona="Г-15" || Zona="Г-16" || Zona="Д-6" || Zona="Д-7" || Zona="Д-8" || Zona="Д-9" || Zona="Д-10" || Zona="Д-11" || Zona="Д-12" || Zona="Д-13" || Zona="Д-14" || Zona="Д-15" || Zona="Д-16" || Zona="Ж-7" || Zona="Ж-8" || Zona="Ж-9" || Zona="Ж-10" || Zona="Ж-11" || Zona="Ж-12" || Zona="Ж-13" || Zona="Ж-14" || Zona="Ж-15" || Zona="Ж-16" || Zona="З-8" || Zona="З-9" || Zona="З-10" || Zona="З-11" || Zona="З-12" || Zona="З-13" || Zona="З-14" || Zona="З-15" || Zona="З-16" || Zona="И-8" || Zona="И-9" || Zona="И-10" || Zona="И-11" || Zona="И-12" || Zona="И-13" || Zona="И-14" || Zona="И-15" || Zona="И-16" || Zona="К-8" || Zona="К-9" || Zona="К-10" || Zona="К-11" || Zona="К-12" || Zona="К-13" || Zona="К-14" || Zona="К-15" || Zona="К-16" || Zona="Л-8" || Zona="Л-9" || Zona="Л-10" || Zona="Л-11" || Zona="Л-12" || Zona="Л-13" || Zona="Л-14" || Zona="Л-15" || Zona="Л-16" || Zona="М-9" || Zona="М-10" || Zona="М-11" || Zona="М-12" || Zona="М-13" || Zona="М-14" || Zona="М-15" || Zona="М-16" || Zona="М-19" || Zona="Н-19" || Zona="О-19" || Zona="М-24"  || City="Las Venturas")
		Jurisdiction := "LVPD"
}
if(Fraction="2")
{
	if (City!="San Fierro" && Zona="Н-9" || Zona="Н-10" || Zona="Н-11" || Zona="Н-12" || Zona="Н-13" || Zona="Н-14" || Zona="Н-15" || Zona="Н-16" || Zona="Н-17" || Zona="Н-18" || Zona="Н-19" || Zona="Н-20" || Zona="Н-21" || Zona="Н-22" || Zona="Н-23" || Zona="Н-24" || Zona="О-9" || Zona="О-10" || Zona="О-11" || Zona="О-12" || Zona="О-13" || Zona="О-14" || Zona="О-15" || Zona="О-16" || Zona="О-17" || Zona="О-18" || Zona="О-19" || Zona="О-20" || Zona="О-21" || Zona="О-22" || Zona="О-23" || Zona="О-24" || Zona="П-9" || Zona="П-10" || Zona="П-11" || Zona="П-12" || Zona="П-13" || Zona="П-14" || Zona="П-15" || Zona="П-16" || Zona="П-17" || Zona="П-18" || Zona="П-19" || Zona="П-20" || Zona="П-21" || Zona="П-22" || Zona="П-23" || Zona="П-24" || Zona="Р-9" || Zona="Р-10" || Zona="Р-11" || Zona="Р-12" || Zona="Р-13" || Zona="Р-14" || Zona="Р-15" || Zona="Р-16" || Zona="Р-17" || Zona="Р-18" || Zona="Р-19" || Zona="Р-20" || Zona="Р-21" || Zona="Р-22" || Zona="Р-23" || Zona="Р-24" || Zona="С-9" || Zona="С-10" || Zona="С-11" || Zona="С-12" || Zona="С-13" || Zona="С-14" || Zona="С-15" || Zona="С-16" || Zona="С-17" || Zona="С-18" || Zona="С-19" || Zona="С-20" || Zona="С-21" || Zona="С-22" || Zona="С-23" || Zona="С-24" || Zona="Т-9" || Zona="Т-10" || Zona="Т-11" || Zona="Т-12" || Zona="Т-13" || Zona="Т-14" ||  Zona="У-9" || Zona="У-10" || Zona="У-11" || Zona="У-12" || Zona="У-13" || Zona="Ф-9" || Zona="Ф-10" || Zona="Ф-11" || Zona="Ф-12" || Zona="Ф-13" || Zona="Х-9" || Zona="Х-10" || Zona="Х-11" || Zona="Х-12" || Zona="Х-13" || Zona="Ц-9" || Zona="Ц-10" || Zona="Ц-11" || Zona="Ц-12" || Zona="Ц-13" || Zona="Ч-9" || Zona="Ч-10" || Zona="Ч-11" || Zona="Ч-12" || Zona="Ч-13" || Zona="Ш-9" || Zona="Ш-10" || Zona="Ш-11" || Zona="Ш-12" || Zona="Ш-13" || Zona="Я-9" || Zona="Я-10" || Zona="Я-11" || Zona="Я-12" || Zona="Я-13" || Zona="С-8" || City="Los Santos")
		Jurisdiction := "LSPD"
	else if (City!="San Fierro" && Zona="А-4" || Zona="А-5" || Zona="А-6" || Zona="А-7" || Zona="А-8" || Zona="А-9" || Zona="А-10" || Zona="А-11" || Zona="А-12" || Zona="А-13" || Zona="А-14" || Zona="А-15" || Zona="А-16" || Zona="Б-4" || Zona="Б-5" || Zona="Б-6" || Zona="Б-7" || Zona="Б-8" || Zona="Б-9" || Zona="Б-10" || Zona="Б-11" || Zona="Б-12" || Zona="Б-13" || Zona="Б-14" || Zona="Б-15" || Zona="Б-16" || Zona="В-4" || Zona="В-5" || Zona="В-6" || Zona="В-7" || Zona="В-8" || Zona="В-9" || Zona="В-10" || Zona="В-11" || Zona="В-12" || Zona="В-13" || Zona="В-14" || Zona="В-15" || Zona="В-16" || Zona="Г-4" || Zona="Г-5" || Zona="Г-6" || Zona="Г-7" || Zona="Г-8" || Zona="Г-9" || Zona="Г-10" || Zona="Г-11" || Zona="Г-12" || Zona="Г-13" || Zona="Г-14" || Zona="Г-15" || Zona="Г-16" || Zona="Д-6" || Zona="Д-7" || Zona="Д-8" || Zona="Д-9" || Zona="Д-10" || Zona="Д-11" || Zona="Д-12" || Zona="Д-13" || Zona="Д-14" || Zona="Д-15" || Zona="Д-16" || Zona="Ж-7" || Zona="Ж-8" || Zona="Ж-9" || Zona="Ж-10" || Zona="Ж-11" || Zona="Ж-12" || Zona="Ж-13" || Zona="Ж-14" || Zona="Ж-15" || Zona="Ж-16" || Zona="З-8" || Zona="З-9" || Zona="З-10" || Zona="З-11" || Zona="З-12" || Zona="З-13" || Zona="З-14" || Zona="З-15" || Zona="З-16" || Zona="И-8" || Zona="И-9" || Zona="И-10" || Zona="И-11" || Zona="И-12" || Zona="И-13" || Zona="И-14" || Zona="И-15" || Zona="И-16" || Zona="К-8" || Zona="К-9" || Zona="К-10" || Zona="К-11" || Zona="К-12" || Zona="К-13" || Zona="К-14" || Zona="К-15" || Zona="К-16" || Zona="Л-8" || Zona="Л-9" || Zona="Л-10" || Zona="Л-11" || Zona="Л-12" || Zona="Л-13" || Zona="Л-14" || Zona="Л-15" || Zona="Л-16" || Zona="М-9" || Zona="М-10" || Zona="М-11" || Zona="М-12" || Zona="М-13" || Zona="М-14" || Zona="М-15" || Zona="М-16" || Zona="М-19" || Zona="Н-19" || Zona="О-19" || Zona="М-24"  || | Zona="И-7" || Zona="И-8" || Zona="К-7" || Zona="К-8" ||  City="Las Venturas")
		Jurisdiction := "LVPD"
}
if(Fraction="3")
{
	if (City!="Las Venturas" && Zona="Н-9" || Zona="Н-10" || Zona="Н-11" || Zona="Н-12" || Zona="Н-13" || Zona="Н-14" || Zona="Н-15" || Zona="Н-16" || Zona="Н-17" || Zona="Н-18" || Zona="Н-19" || Zona="Н-20" || Zona="Н-21" || Zona="Н-22" || Zona="Н-23" || Zona="Н-24" || Zona="О-9" || Zona="О-10" || Zona="О-11" || Zona="О-12" || Zona="О-13" || Zona="О-14" || Zona="О-15" || Zona="О-16" || Zona="О-17" || Zona="О-18" || Zona="О-19" || Zona="О-20" || Zona="О-21" || Zona="О-22" || Zona="О-23" || Zona="О-24" || Zona="П-9" || Zona="П-10" || Zona="П-11" || Zona="П-12" || Zona="П-13" || Zona="П-14" || Zona="П-15" || Zona="П-16" || Zona="П-17" || Zona="П-18" || Zona="П-19" || Zona="П-20" || Zona="П-21" || Zona="П-22" || Zona="П-23" || Zona="П-24" || Zona="Р-9" || Zona="Р-10" || Zona="Р-11" || Zona="Р-12" || Zona="Р-13" || Zona="Р-14" || Zona="Р-15" || Zona="Р-16" || Zona="Р-17" || Zona="Р-18" || Zona="Р-19" || Zona="Р-20" || Zona="Р-21" || Zona="Р-22" || Zona="Р-23" || Zona="Р-24" || Zona="С-9" || Zona="С-10" || Zona="С-11" || Zona="С-12" || Zona="С-13" || Zona="С-14" || Zona="С-15" || Zona="С-16" || Zona="С-17" || Zona="С-18" || Zona="С-19" || Zona="С-20" || Zona="С-21" || Zona="С-22" || Zona="С-23" || Zona="С-24" || Zona="Т-9" || Zona="Т-10" || Zona="Т-11" || Zona="Т-12" || Zona="Т-13" || Zona="Т-14" ||  Zona="У-9" || Zona="У-10" || Zona="У-11" || Zona="У-12" || Zona="У-13" || Zona="Ф-9" || Zona="Ф-10" || Zona="Ф-11" || Zona="Ф-12" || Zona="Ф-13" || Zona="Х-9" || Zona="Х-10" || Zona="Х-11" || Zona="Х-12" || Zona="Х-13" || Zona="Ц-9" || Zona="Ц-10" || Zona="Ц-11" || Zona="Ц-12" || Zona="Ч-9" || Zona="Ч-10" || Zona="Ч-11" || Zona="Ч-12" || Zona="Ш-9" || Zona="Ш-10" || Zona="Ш-11" || Zona="Ш-12" || Zona="Я-9" || Zona="Я-10" || Zona="Я-11" || Zona="Я-12"  Zona="Л-14" || Zona="М-15" || Zona="Л-19" || Zona="Л-20" || Zona="М-19" || Zona="Л-24" || Zona="М-24" || Zona="М-12" City="Los Santos")
		Jurisdiction := "LSPD"
	else if (City!="Las Venturas" && Zona="А-1" || Zona="А-2" || Zona="А-3" || Zona="Б-1" || Zona="Б-2" || Zona="Б-3" || Zona="В-1" || Zona="В-2" || Zona="В-3" || Zona="Г-1" || Zona="Г-2" || Zona="Г-3" || Zona="Д-2" || Zona="Ж-2" || Zona="Ж-3" || Zona="Р-1" || Zona="Р-2" || Zona="Р-3" || Zona="Р-4" || Zona="Р-5" || Zona="Р-6" || Zona="Р-7" || Zona="Р-8" || Zona="С-1" || Zona="С-2" || Zona="С-3" || Zona="С-4" || Zona="С-5" || Zona="С-6" || Zona="С-7" || Zona="С-8" || Zona="Т-1" || Zona="Т-2" || Zona="Т-3" || Zona="Т-4" || Zona="Т-5" || Zona="Т-6" || Zona="Т-7" || Zona="Т-8" || Zona="У-1" || Zona="У-2" || Zona="У-3" || Zona="У-4" || Zona="У-5" || Zona="У-6" || Zona="У-7" || Zona="У-8" || Zona="Ф-1" || Zona="Ф-2" || Zona="Ф-3" || Zona="Ф-4" || Zona="Ф-5" || Zona="Ф-6" || Zona="Ф-7" || Zona="Ф-8" || Zona="Х-1" || Zona="Х-2" || Zona="Х-3" || Zona="Х-4" || Zona="Х-5" || Zona="Х-6" || Zona="Х-7" || Zona="Х-8" || Zona="Ц-1" || Zona="Ц-2" || Zona="Ц-3" || Zona="Ц-4" || Zona="Ц-5" || Zona="Ц-6" || Zona="Ц-7" || Zona="Ц-8" || Zona="Ч-1" || Zona="Ч-2" || Zona="Ч-3" || Zona="Ч-4" || Zona="Ч-5" || Zona="Ч-6" || Zona="Ч-7" || Zona="Ч-8" || Zona="Ш-1" || Zona="Ш-2" || Zona="Ш-3" || Zona="Ш-4" || Zona="Ш-5" || Zona="Ш-6" || Zona="Ш-7" || Zona="Ш-8" || Zona="Я-1" || Zona="Я-2" || Zona="Я-3" || Zona="Я-4" || Zona="Я-5" || Zona="Я-6" || Zona="Я-7" || Zona="Я-8" || Zona="О-9" || Zona="П-9" || Zona="С-9" || Zona="Т-9" || Zona="И-7" || Zona="И-8" || Zona="К-7" || Zona="К-8" || Zona="Л-6" || Zona="Л-7" City="San Fierro")
		Jurisdiction := "SFPD"
}
if(Fraction="4")
{
	if (Zona="Н-9" || Zona="Н-10" || Zona="Н-11" || Zona="Н-12" || Zona="Н-13" || Zona="Н-14" || Zona="Н-15" || Zona="Н-16" || Zona="Н-17" || Zona="Н-18" || Zona="Н-19" || Zona="Н-20" || Zona="Н-21" || Zona="Н-22" || Zona="Н-23" || Zona="Н-24" || Zona="О-9" || Zona="О-10" || Zona="О-11" || Zona="О-12" || Zona="О-13" || Zona="О-14" || Zona="О-15" || Zona="О-16" || Zona="О-17" || Zona="О-18" || Zona="О-19" || Zona="О-20" || Zona="О-21" || Zona="О-22" || Zona="О-23" || Zona="О-24" || Zona="П-9" || Zona="П-10" || Zona="П-11" || Zona="П-12" || Zona="П-13" || Zona="П-14" || Zona="П-15" || Zona="П-16" || Zona="П-17" || Zona="П-18" || Zona="П-19" || Zona="П-20" || Zona="П-21" || Zona="П-22" || Zona="П-23" || Zona="П-24" || Zona="Р-9" || Zona="Р-10" || Zona="Р-11" || Zona="Р-12" || Zona="Р-13" || Zona="Р-14" || Zona="Р-15" || Zona="Р-16" || Zona="Р-17" || Zona="Р-18" || Zona="Р-19" || Zona="Р-20" || Zona="Р-21" || Zona="Р-22" || Zona="Р-23" || Zona="Р-24" || Zona="С-9" || Zona="С-10" || Zona="С-11" || Zona="С-12" || Zona="С-13" || Zona="С-14" || Zona="С-15" || Zona="С-16" || Zona="С-17" || Zona="С-18" || Zona="С-19" || Zona="С-20" || Zona="С-21" || Zona="С-22" || Zona="С-23" || Zona="С-24" || Zona="Т-9" || Zona="Т-10" || Zona="Т-11" || Zona="Т-12" || Zona="Т-13" || Zona="Т-14" ||  Zona="У-9" || Zona="У-10" || Zona="У-11" || Zona="У-12" || Zona="У-13" || Zona="Ф-9" || Zona="Ф-10" || Zona="Ф-11" || Zona="Ф-12" || Zona="Ф-13" || Zona="Х-9" || Zona="Х-10" || Zona="Х-11" || Zona="Х-12" || Zona="Х-13" || Zona="Ц-9" || Zona="Ц-10" || Zona="Ц-11" || Zona="Ц-12" || Zona="Ч-9" || Zona="Ч-10" || Zona="Ч-11" || Zona="Ч-12" || Zona="Ш-9" || Zona="Ш-10" || Zona="Ш-11" || Zona="Ш-12" || Zona="Я-9" || Zona="Я-10" || Zona="Я-11" || Zona="Я-12"  Zona="Л-14" || Zona="М-15" || Zona="Л-19" || Zona="Л-20" || Zona="М-19" || Zona="Л-24" || Zona="М-24" || Zona="М-12" || City="Los Santos")
		Jurisdiction := "LSPD"
	else if (Zona="А-1" || Zona="А-2" || Zona="А-3" || Zona="Б-1" || Zona="Б-2" || Zona="Б-3" || Zona="В-1" || Zona="В-2" || Zona="В-3" || Zona="Г-1" || Zona="Г-2" || Zona="Г-3" || Zona="Д-2" || Zona="Ж-2" || Zona="Ж-3" || Zona="Р-1" || Zona="Р-2" || Zona="Р-3" || Zona="Р-4" || Zona="Р-5" || Zona="Р-6" || Zona="Р-7" || Zona="Р-8" || Zona="С-1" || Zona="С-2" || Zona="С-3" || Zona="С-4" || Zona="С-5" || Zona="С-6" || Zona="С-7" || Zona="С-8" || Zona="Т-1" || Zona="Т-2" || Zona="Т-3" || Zona="Т-4" || Zona="Т-5" || Zona="Т-6" || Zona="Т-7" || Zona="Т-8" || Zona="У-1" || Zona="У-2" || Zona="У-3" || Zona="У-4" || Zona="У-5" || Zona="У-6" || Zona="У-7" || Zona="У-8" || Zona="Ф-1" || Zona="Ф-2" || Zona="Ф-3" || Zona="Ф-4" || Zona="Ф-5" || Zona="Ф-6" || Zona="Ф-7" || Zona="Ф-8" || Zona="Х-1" || Zona="Х-2" || Zona="Х-3" || Zona="Х-4" || Zona="Х-5" || Zona="Х-6" || Zona="Х-7" || Zona="Х-8" || Zona="Ц-1" || Zona="Ц-2" || Zona="Ц-3" || Zona="Ц-4" || Zona="Ц-5" || Zona="Ц-6" || Zona="Ц-7" || Zona="Ц-8" || Zona="Ч-1" || Zona="Ч-2" || Zona="Ч-3" || Zona="Ч-4" || Zona="Ч-5" || Zona="Ч-6" || Zona="Ч-7" || Zona="Ч-8" || Zona="Ш-1" || Zona="Ш-2" || Zona="Ш-3" || Zona="Ш-4" || Zona="Ш-5" || Zona="Ш-6" || Zona="Ш-7" || Zona="Ш-8" || Zona="Я-1" || Zona="Я-2" || Zona="Я-3" || Zona="Я-4" || Zona="Я-5" || Zona="Я-6" || Zona="Я-7" || Zona="Я-8" || Zona="О-9" || Zona="П-9" || Zona="С-9" || Zona="Т-9" || Zona="И-7" || Zona="И-8" || Zona="К-7" || Zona="К-8" || Zona="Л-6" || Zona="Л-7" || City="San Fierro")
		Jurisdiction := "SFPD"
	else if (Zona="А-4" || Zona="А-5" || Zona="А-6" || Zona="А-7" || Zona="А-8" || Zona="А-9" || Zona="А-10" || Zona="А-11" || Zona="А-12" || Zona="А-13" || Zona="А-14" || Zona="А-15" || Zona="А-16" || Zona="Б-4" || Zona="Б-5" || Zona="Б-6" || Zona="Б-7" || Zona="Б-8" || Zona="Б-9" || Zona="Б-10" || Zona="Б-11" || Zona="Б-12" || Zona="Б-13" || Zona="Б-14" || Zona="Б-15" || Zona="Б-16" || Zona="В-4" || Zona="В-5" || Zona="В-6" || Zona="В-7" || Zona="В-8" || Zona="В-9" || Zona="В-10" || Zona="В-11" || Zona="В-12" || Zona="В-13" || Zona="В-14" || Zona="В-15" || Zona="В-16" || Zona="Г-4" || Zona="Г-5" || Zona="Г-6" || Zona="Г-7" || Zona="Г-8" || Zona="Г-9" || Zona="Г-10" || Zona="Г-11" || Zona="Г-12" || Zona="Г-13" || Zona="Г-14" || Zona="Г-15" || Zona="Г-16" || Zona="Д-6" || Zona="Д-7" || Zona="Д-8" || Zona="Д-9" || Zona="Д-10" || Zona="Д-11" || Zona="Д-12" || Zona="Д-13" || Zona="Д-14" || Zona="Д-15" || Zona="Д-16" || Zona="Ж-7" || Zona="Ж-8" || Zona="Ж-9" || Zona="Ж-10" || Zona="Ж-11" || Zona="Ж-12" || Zona="Ж-13" || Zona="Ж-14" || Zona="Ж-15" || Zona="Ж-16" || Zona="З-8" || Zona="З-9" || Zona="З-10" || Zona="З-11" || Zona="З-12" || Zona="З-13" || Zona="З-14" || Zona="З-15" || Zona="З-16" || Zona="И-8" || Zona="И-9" || Zona="И-10" || Zona="И-11" || Zona="И-12" || Zona="И-13" || Zona="И-14" || Zona="И-15" || Zona="И-16" || Zona="К-8" || Zona="К-9" || Zona="К-10" || Zona="К-11" || Zona="К-12" || Zona="К-13" || Zona="К-14" || Zona="К-15" || Zona="К-16" || Zona="Л-8" || Zona="Л-9" || Zona="Л-10" || Zona="Л-11" || Zona="Л-12" || Zona="Л-13" || Zona="Л-14" || Zona="Л-15" || Zona="Л-16" || Zona="М-9" || Zona="М-10" || Zona="М-11" || Zona="М-12" || Zona="М-13" || Zona="М-14" || Zona="М-15" || Zona="М-16" || Zona="М-19" || Zona="Н-19" || Zona="О-19" || Zona="М-24"  || City="Las Venturas")
		Jurisdiction := "LVPD"
}
if (isPlayerInAnyVehicle() == 0)
{
	if (cServerID="2")
	{
		if(Fraction="1")
		{
			if (IsPlayerInRangeOfPoint(1480.475952,-1716.446411,13.976975, 40))
				post := "Мэрия"
			else if (IsPlayerInRangeOfPoint(1297.047241,-1871.129639,14.146875, 25))
				post := "Длина"
			else if (IsPlayerInRangeOfPoint(60.646679,-1531.584473,5.793219, 25))
				post := "Мост ЛС-СФ"
			else if (IsPlayerInRangeOfPoint(1636.434082,-814.137939,60.272583, 170))
				post := "Мост ЛС-ЛВ"
			else if (IsPlayerInRangeOfPoint(1545.981323,-1627.342896,13.982813, 25))
				post := "КПП"
			else if (Interior="3")
				post := "Холл Мэрии"
			else if (IsPlayerInRangeOfPoint(1150.679321,-1733.571045,14.683927, 25))
				post := "Автовокзал LS"
			else if (Zona="Ч-23" || Zona="Ч-24" || Zona="Ш-23" || Zona="Ш-24")
				post := "Порт LS"
		}
		if(Fraction="2")
		{
			if (Zona="Н-6")
				post := "Порт СФ"
			else if (Zona="Р-5" || Zona="Р-6")
				post := "Аэропорт СФ"
			else if (IsPlayerInRangeOfPoint(-1580.142944,665.650269,8.834935, 50))
				post := "КПП-1"
			else if (IsPlayerInRangeOfPoint(-1713.470215,685.315857,26.286154, 50))
				post := "КПП-2"
			else if (Zona="М-4")
				post := "SFN"
			else if (Zona="Н-5")
				post := "АВ-СФ"
			else if (Zona="О-4")
				post := "АШ"
		}
		if(Fraction="3")
		{
			if (Zona="З-24" || Zona="И-24")
				post := "Автовокзал"
			else if (Zona="Ж-21")
				post := "Казино ""Caligula"""
			else if (IsPlayerInRangeOfPoint(2036.346680,1013.981567,12.356600, 50))
				post := "Казино ""The Four Dragons"""
		}
	}
	if (cServerID="1")
	{
		if(Fraction="1")
		{
			if (IsPlayerInRangeOfPoint(1480.475952,-1716.446411,13.976975, 40))
				post := "Мэрия"
			else if (IsPlayerInRangeOfPoint(1297.047241,-1871.129639,14.146875, 50))
				post := "Длина"
			else if (IsPlayerInRangeOfPoint(435.716797,-1502.197510,31.371349, 100))
				post := "МО ЛС"
			else if (IsPlayerInRangeOfPoint(1230.723022,-1835.889771,13.715469, 100))
				post := "Delta"
			else if (IsPlayerInRangeOfPoint(1194.358643,-1320.530396,13.729051, 50))
				post := "Больница ЛС"
			else if (IsPlayerInRangeOfPoint(60.646679,-1531.584473,5.793219, 25))
				post := "Мост ЛС-СФ"
			else if (IsPlayerInRangeOfPoint(1636.434082,-814.137939,60.272583, 170))
				post := "Мост ЛС-ЛВ"
			else if (IsPlayerInRangeOfPoint(1545.981323,-1627.342896,13.982813, 25))
				post := "КПП"
			else if (Interior="3")
				post := "Холл Мэрии"
			else if (IsPlayerInRangeOfPoint(1150.679321,-1733.571045,14.683927, 25))
				post := "Автовокзал LS"
			else if (Zona="Ч-23" || Zona="Ч-24" || Zona="Ш-23" || Zona="Ш-24")
				post := "Порт LS"
			else if (IsPlayerInRangeOfPoint(329.218628,-1798.285645,5.065799, 35))
				post := "Авторынок"
		}
		if(Fraction="2")
		{
			if (IsPlayerInRangeOfPoint(-1580.142944,665.650269,8.834935, 50))
				post := "A"
			else if (IsPlayerInRangeOfPoint(-1713.470215,685.315857,26.286154, 50))
				post := "B"
			else if (Zona="М-4")
				post := "SFN"
			else if (Zona="Н-5")
				post := "АВ"
			else if (Zona="О-4")
				post := "АШ"
			else if (IsPlayerInRangeOfPoint(-1524.015503,496.838348,7.540139, 25))
				post := "SFa"
		}
		if(Fraction="3")
		{
			if (IsPlayerInRangeOfPoint(2034.301025,1006.075378,11.183959, 35))
				post := "В"
			else if (Zona="З-24")
				post := "А"
			else if (IsPlayerInRangeOfPoint(2236.955566,2451.759766,11.149650, 25))
				post := "КПП"
			else if (IsPlayerInRangeOfPoint(2175.174316,1668.393066,11.178477, 35))
				post := "C"
			else if (IsPlayerInRangeOfPoint(2457.860107,1328.621826,11.186669, 35))
				post := "D"
		}
	}
}
Players := []
dout := ""
Players := getStreamedInPlayersInfo()
p := 0
For i, o in Players
{
	l := []
	l := getPedCoordinates(o.PED)
	p++
	pos := getCoordinates()
	Name := getPlayerNameById(i)
	Dist := getDist(getCoordinates() ,l)
	idskin := getTargetPlayerSkinIdById(i)
	if (idskin="76" || idskin="265" || idskin="266" || idskin="267" || idskin="280" || idskin="281" || idskin="282" || idskin="283" || idskin="284" || idskin="285" || idskin="288" || idskin="306" || idskin="307" || idskin="309" || idskin="141" || idskin="163" || idskin="164" || idskin="165" || idskin="166" || idskin="286" || idskin="301" || idskin="302" || idskin="303" || idskin="304" || idskin="305" || idskin="306" || idskin="307" || idskin="308" || idskin="309" || idskin="310")
	{
		RegExMatch(Dist,"(.*).(.*)",distt)
		if (Distt1<=30)
		{
			f++
			RegExMatch(Name, "^([A-Z])[a-z]*_(.*)", NameB)
			if(AllName=="")
				AllName:=NameB1 "." NameB2
			else AllName:=AllName ", " NameB1 "." NameB2
			}
	}
	Continue
}
if(f==0)
	Output := "Напарников нет."
else if(f==1)
	Output := "Напарник: " AllName "."
else if(f>=2)
	Output := "Напарники: " AllName "."
if (post!="")
	SendChat("/r " Tag " Пост: " post ". "Output)
else
{
	if (cServerID="2")
	{
		if(Fraction="1")
		{
			if (IsPlayerInRangeOfPoint(60.646679,-1531.584473,5.793219, 50))
				post := "Мост LS-SF"
			else if (IsPlayerInRangeOfPoint(1297.047241,-1871.129639,14.146875, 50))
				post := "Длина"
			else if (IsPlayerInRangeOfPoint(1636.434082,-814.137939,60.272583, 170))
				post := "Мост LS-LV"
			else if (IsPlayerInRangeOfPoint(2390.210204,-1409.073608,24.361462, 750))
				post := "Патруль опасного района"
			else if (Zona="Ч-23" || Zona="Ч-24" || Zona="Ш-23" || Zona="Ш-24")
				post := "Порт LS"
			else if (Jurisdiction!="")
				SendChat("/d [" Jurisdiction "] Пересекли вашу юрисдикцию - погоня.")
		}
		if(Fraction="2")
		{
			if (Zona="Н-6")
				post := "Порт СФ"
			else if (Zona="Р-5" || Zona="P-6")
				post := "Аэропорт"
			else if (IsPlayerInRangeOfPoint(-1659.847046,538.313843,39.767761, 50))
				post := "Мост SF-LV"
			else if (Zona="Л-6" || Zona="И-8")
				post := "Мост SF-LV"
			else if (Zona="Ф-6")
				post := "Шахта"
			else if (Jurisdiction!="")
				SendChat("/d [" Jurisdiction "] Пересекли вашу юрисдикцию - погоня.")
		}
		if(Fraction="3")
		{
			if (IsPlayerInRangeOfPoint(1830.591187,813.961060,11.021535, 100))
				post := "Перекресток"
			else if (Zona="К-18")
				post := "Объезд"
			else if (Zona="З-23")
				post := "Парковка таксистов"
			else if (Jurisdiction!="")
				SendChat("/d [" Jurisdiction "] Пересекли вашу юрисдикцию - погоня.")
			else
			{
				if (Zona="В-12" || Zona="В-13" || Zona="В-14" || Zona="В-15" || Zona="Г-12" || Zona="Г-13" || Zona="Г-14" || Zona="Г-15" || Zona="Д-12" || Zona="Д-13" || Zona="Д-14" || Zona="Д-15" || Zona="Ж-12" || Zona="Ж-13" || Zona="Ж-14" || Zona="Ж-15" || Zona="З-12" || Zona="З-13" || Zona="З-14" || Zona="З-15")
				{
					post := "Патруль LVA"
				}
			}
		}
	}
	if (cServerID="1")
	{
		if(Fraction="1")
		{
			if (IsPlayerInRangeOfPoint(60.646679,-1531.584473,5.793219, 50))
				post := "Мост LS-SF"
			else if (IsPlayerInRangeOfPoint(1297.047241,-1871.129639,14.146875, 50))
				post := "Длина"
			else if (IsPlayerInRangeOfPoint(435.716797,-1502.197510,31.371349, 100))
				post := "МО ЛС"
			else if (IsPlayerInRangeOfPoint(1194.358643,-1320.530396,13.729051, 50))
				post := "Больница ЛС"
			else if (IsPlayerInRangeOfPoint(1636.434082,-814.137939,60.272583, 100))
				post := "Мост LS-LV"
			else if (IsPlayerInRangeOfPoint(1055.545898,-1866.361694,13.831577, 25))
				post := "М"
			else if (Zona="У-12")
				post := "Ферма 0"
			else if (IsPlayerInRangeOfPoint(470.608643,-425.461212,29.457815, 50))
				post := "Пересечение 2"
			else if (IsPlayerInRangeOfPoint(1251.056396,-408.103210,2.921424, 50))
				post := "Пересечение 1"
			else if (IsPlayerInRangeOfPoint(1931.078857,180.992905,36.709091, 100))
				post := "Ферма"
			else if (IsPlayerInRangeOfPoint(-209.618011,247.299454,12.350061, 170))
				post := "Мост"
			else if (IsPlayerInRangeOfPoint(2390.210204,-1409.073608,24.361462, 750))
				post := "Патруль опасного района"
			else if (Zona="О-11" || Zona="О-12" || Zona="О-13" || Zona="О-14" || Zona="О-15" || Zona="О-16" || Zona="О-17" || Zona="О-18" || Zona="Н-17" || Zona="М-17" || Zona="Л-17" || Zona="Н-18" || Zona="М-18" || Zona="М-19" || Zona="М-20" || Zona="М-21" || Zona="Н-22" || Zona="Н-21" || Zona="Н-20" || Zona="О-20" || Zona="П-20" || Zona="П-19" || Zona="П-18" || Zona="П-17" || Zona="Р-16" || Zona="Р-15" || Zona="П-14" || Zona="Р-14" || Zona="Р-13" || Zona="П-13" || Zona="П-12")
				post := "Патруль сельской местности"
			else if (Zona="Ч-23" || Zona="Ч-24" || Zona="Ш-23" || Zona="Ш-24")
				post := "Порт LS"
			else if (Jurisdiction!="")
				SendChat("/d " Jurisdiction ", пересекли вашу юрисдикцию - погоня.")
		}
		if(Fraction="2")
		{
			if (Zona="Н-5" || Zona="Н-4")
				post := "АВ-СФ"
			else if (IsPlayerInRangeOfPoint(-1659.847046,538.313843,39.767761, 80))
				post := "Мост"
			else if (Zona="Р-5")
				post := "Туннель"
			else if (Jurisdiction!="")
				SendChat("/d " Jurisdiction ", пересекли вашу юрисдикцию - погоня.")
		}
		if(Fraction="3")
		{
			if (Zona="В-12" || Zona="В-13" || Zona="В-14" || Zona="Г-13" || Zona="Г-14" || Zona="Д-13" || Zona="Д-14" || Zona="Ж-13")
				post := "Патруль LVA"
			else if (Zona="Ж-8" || Zona="Ж-9" || Zona="З-8" || Zona="Д-12" || Zona="Г-12" || Zona="З-9" || Zona="И-9" || Zona="И-10" || Zona="И-11" || Zona="И-12" || Zona="З-12" || Zona="Ж-12" || Zona="К-9" || Zona="К-10" || Zona="К-11" || Zona="К-12" || Zona="Л-9" || Zona="Л-10" || Zona="Л-11" || Zona="Л-12")
				post := "Маршрут Альфа"
			else if (Zona="Б-15" || Zona="Б-16" || Zona="В-15" || Zona="В-16" ||  Zona="Г-15" || Zona="Г-16" ||  Zona="Д-15" || Zona="Д-16" ||  Zona="Ж-14" ||  Zona="Ж-15" || Zona="Ж-16" ||  Zona="З-14" || Zona="З-16" ||  Zona="И-14" || Zona="И-16" ||  Zona="И-13" ||  Zona="И-14" || Zona="К-13" ||  Zona="К-14" || Zona="К-16" || Zona="Л-14" ||  Zona="Л-15" || Zona="Л-16")
				post := "Маршрут Дельта"
			else if (IsPlayerInRangeOfPoint(2054.972168,865.840698,7.247652, 35))
				post := "Вилка"
			else if (IsPlayerInRangeOfPoint(2092.502930,1632.814697,11.183841, 50))
				post := "С-С"
			else if (IsPlayerInRangeOfPoint(2677.962402,1326.079224,10.868345, 25))
				post := "А-А"
			else if (Zona="К-17" || Zona="К-18")
				post := "Развилка"
			else if (Zona="К-20")
				post := "Перекресток"
			else if (Zona="З-14")
				post := "N-14"
			else if (Jurisdiction!="")
				SendChat("/d " Jurisdiction ", пересекли вашу юрисдикцию - погоня.")
		}
		
	}
	loop, 4
	{
		s++
		IdP:=getMyPassengerId(s)
		if (IdP!="-1")
		{
			Skin:=getTargetPlayerSkinIdByPed(getPedById(IdP))
			if ((Skin="280" or Skin="76" or Skin="281" or Skin="306" or Skin="266" or Skin="284" or Skin="307" or Skin="265" or Skin="282" or Skin="309" or Skin="267" or Skin="285" or Skin="288" or Skin="283" or Skin="284" or Skin="285" or Skin="288" or Skin="306" or Skin="307" or Skin="309" or Skin="141" or Skin="163" or Skin="164" or Skin="165" or Skin="166" or Skin="286" or Skin="301" or Skin="302" or Skin="303" or Skin="304" or Skin="305" or Skin="306" or Skin="307" or Skin="308" or Skin="309" or Skin="310") && IdP!="-1")
			{
				f++
				Name:=getPlayerNameById(IdP)
				RegExMatch(Name, "^([A-Z])[a-z]*_(.*)", NameB)
				if(AllName=="")
					AllName:=NameB1 "." NameB2
				else
				{
					NameBs := NameB1 "." NameB2
					if (AllName != NameBs)
					{
						AllName:=AllName ", " NameBs
					}
				}
			}
		}
		Continue
	}
	if(f==0)
		Output := "Напарников нет."
	else if(f==1)
		Output := "Напарник: " AllName "."
	else if(f>=2)
		Output := "Напарники: " AllName "."
	if (Fraction="1")
	{
		if (post!="")
		{
			if (post!="Патруль опасного района" && post!="Патруль сельской местности" && post!="СОБР на готове" && post!="СОБР приняли вызов" && post!="Ми-6 в полной готовности" && post!="Ми-6 приняли вызов" && post!="ГНР патруль опасного района")
				SendChat("/r " Tag " Пост: " post ". "Output)
			else
				SendChat("/r " Tag " " post ". "Output)
		}
		else if (Jurisdiction="")
			SendChat("/r " Tag " Патруль г. Los-Santos. "Output)
	}
	else if (Fraction="2")
	{
		if (post!="")
		{
			if (post!="Патруль опасного района")
				SendChat("/r " Tag " Пост: " post ". "Output)
			else
				SendChat("/r " Tag " " post ". "Output)
		}
		else if (Jurisdiction="")
			SendChat("/r " Tag " Патруль г. San-Fierro. "Output)
	}
	else if (Fraction="3")
	{
		if (post!="")
		{
			if (post!="Патруль опасного района")
				SendChat("/r " Tag " Пост: " post ". "Output)
			else
				SendChat("/r " Tag " " post ". "Output)
		}
		else if (Jurisdiction="")
			SendChat("/r " Tag " Патруль г. Las-Venturas. "Output)
	}
	else if (Fraction="4")
	{
		if (Jurisdiction="")
			return
		if (Jurisdiction="LVPD")
			SendChat("/r " Tag " Патруль г. Las-Venturas. "Output)
		else if (Jurisdiction="SFPD")
			SendChat("/r " Tag " Патруль г. San-Fierro. "Output)
		else if (Jurisdiction="LSPD")
			SendChat("/r " Tag " Патруль г. Los-Santos. "Output)
	}
}
return
gKeyNarko:
if ((isInChat() || isDialogOpen()) && WarnKey(KeyNarko)) ||(isDialogOpen())
	return
if (Rang < 4 && Fraction!="4")
{
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Данная команда доступна с Сержанта[4]")
	return
}
if (cServerID="1")
{
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Данная функция запрещена на 01 сервере Evolve RP!")
	return
}
if (!IsTakeKpz && !IsTakeKeys)
	return
Interior := getPlayerInteriorId()
if (Interior)
{
	if (isWoman)
	{
		SendChat("/me достала ключ и открыла камеру")
		Sleep 1200
		SendChat("/me вошла в камеру")
		Sleep 1200
		SendChat("/me надела перчатки")
		Sleep 1200
	}
	else
	{
		SendChat("/me достал ключ и открыл камеру")
		Sleep 1200
		SendChat("/me вошел в камеру")
		Sleep 1200
		SendChat("/me надел перчатки")
		Sleep 1200
	}
	Players := []
	dout := ""
	Players := getStreamedInPlayersInfo()
	p := 0
	For i, o in Players
	{
		l := []
		l := getPedCoordinates(o.PED)
		p++
		pos := getCoordinates()
		Name := getPlayerNameById(i)
		Dist := getDist(getCoordinates() ,l)
		idskin := getTargetPlayerSkinIdById(i)
		idskin := getTargetPlayerSkinIdById(i)
		if (idskin="76" || idskin="265" || idskin="266" || idskin="267" || idskin="280" || idskin="281" || idskin="282" || idskin="283" || idskin="284" || idskin="285" || idskin="288" || idskin="306" || idskin="307" || idskin="309" || idskin="141" || idskin="163" || idskin="164" || idskin="165" || idskin="166" || idskin="286" || idskin="187" || idskin="300" || idskin="301" || idskin="302" || idskin="303" || idskin="304" || idskin="305" || idskin="306" || idskin="307" || idskin="308" || idskin="309" || idskin="310" || idskin="57" || idskin="98" || idskin="147" || idskin="150" || idskin="187" || idskin="216")
		{
			Continue
		}
		else
		{
			RegExMatch(Dist,"(.*).(.*)",distt)
			if (Distt1<=4)
			{
				if (WinActive("GTA:SA:MP"))
				{
					SendChat("/take "i)
					Text := ""
					Sleep 250
					If(isDialogOpen())
					Sleep 200
					{
						Text := getDialogText()
						RegExMatch(Text,"A	Наркотики	([0-9]*)",narko)
						RegExMatch(Text,"B	Материалы	([0-9]*)",mati)
						RegExMatch(Text,"F	Ключи	([0-9]*)",keys)
						RegExMatch(Text,"P	Оружие	([0-9]*)",gun)
						if (IsTakeKpz)
						{
							if (IsTakeKpz || IsTakeKeys)
							{
								dfrisk := "0"
								TakeDialog:
								gw := "0"
								msgkeys := false
								Sleep 250
								if (dfrisk="5")
									Continue
								if (isDialogOpen() && dfrisk!="5")
								{
									kolvostrok := getDialogLineCount()
									lines := getDialogLines()
									while kolvostrok >= gw
									{
										gw++
										if (RegExMatch(lines[gw],"B	Материалы	(\d+)", questtake) && IsTakeKpz)
										{
											SendInput {Enter}
											goto, TakeDialog
										}
										else if (RegExMatch(lines[gw],"A	Наркотики	(\d+)",questtake) && IsTakeKpz)
										{
											SendInput {Enter}
											goto, TakeDialog
										}
										else if (RegExMatch(lines[gw],"P	Оружие	(\d+)") && IsTakeKpz)
										{
											SendInput {Down 20}{Enter}
											goto, TakeDialog
										}
										else if (RegExMatch(lines[gw],"F	Ключи	(\d+)") && IsTakeKeys)
										{
											sleep 500
											If(isDialogOpen())
											SendInput {Esc}
											Sleep 1200
											SendChat("/me достал связку ключей от камеры")
											Sleep 1200
											SendChat("/me сравнил ключи от камеры с ключами преступника")
											Sleep 1200
											SendChat("/try ключи " Name " совпадают с ключами от камеры")
											Sleep 1200
											Loop, Read, %Chatlog%
											{
												if(RegExMatch(A_LoopReadLine, "" getUsername() " ключи (.*) совпадают с ключами от камеры (.*)", keytry))
												{
													if (keytry2="{63C600} [Удачно]")
													{
														msw := getPlayerIdByName(keytry1)
														msgkeys := true
														SendChat("/take "msw)
														dfrisk := "0"
														gw := "0"
														kolvostrok := getDialogLineCount()
														lines := getDialogLines()
														Sleep 250
														if (dfrisk="5")
															Return
														if (isDialogOpen() && dfrisk!="5")
														{
															while kolvostrok >= gw
															{
																gw++
																if (RegExMatch(lines[gw],"F	Ключи	(\d+)") && IsTakeKpz)
																{
																	setDialogIndex(gw - 1)
																	SendInput {Enter}
																}
															}
														}
													}
													else
														SendChat("/do Ключи не совпадают.")
												}
												else
													a .= A_LoopReadLine . "`n"
											}
											FileDelete, %Chatlog%
											Sort, a, U
											FileAppend, %a%, %Chatlog%
											goto, TakeDialog
										}
									}
								}
								else
								{
									dfrisk++
									goto, TakeDialog
								}
								Sleep 300
							}
						}
						Sleep 400
						if (isDialogOpen())
						{
							SendInput {Esc}
							if (narko1!="" || mati1!="" || gun1!="" || msgkeys)
							{
								Sleep 1200
								if (isWoman)
									SendChat("/me достала из кармана пакет для улик и положила найденные предметы")
								else
									SendChat("/me достал из кармана пакет для улик и положил найденные предметы")
							}
						}
						Sleep 1200
					}
					Continue
				}
				else
					return
			}
			else
				Continue
		}
	}
	if (isWoman)
	{
		SendChat("/me вышла из камеры и закрыла её на ключ")
		Sleep 1200
		SendChat("/me сняла перчатки с рук и убрала в карман")
		Sleep 250
	}
	else
	{
		SendChat("/me вышел из камеры и закрыл её на ключ")
		Sleep 1200
		SendChat("/me снял перчатки с рук и убрал в карман")
		Sleep 250
	}
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Обыск заключенных завершён")
}
return
gKeyMegaphone:
If((isInChat() || isDialogOpen()) && WarnKey(KeyMegaphone))
return
InitialNearbyCarHP := ""
NearbyCarHP := ""
CarSuspect := ""
NamePlayer := ""
Driver := getMyPassengerId(0)
NumberPre:=NumberPre+1
if (NumberPre==2)
{
	s := 0
	p := getStreamedInPlayersInfo()
	For i, o in p
	{
		if(getTargetVehicleModelNameById(i)!="PoliceCar" and getTargetVehicleModelNameById(i)!="" and getTargetVehicleModelNameById(i)!="HPV1000" and getTargetVehicleModelNameById(i)!="Enforcer" and  isTargetInAnyVehiclebyIdMod(i)=="1" and i==IdInCar)
		{
			NamePlayer := getPlayerNameById(IdIncar)
			gLastDriverRpName := RegExReplace(NamePlayer, "_", " ")
			lvl := getPlayerScoreById(IdIncar)
			s:="1"
			ModelCar:=getTargetVehicleModelNameById(IdInCar)
			idskin := getTargetPlayerSkinIdById(IdInCar)
			colorname := getPlayerColor(IdInCar)
			col :=colorToStr(colorname)
			gLastDriverId := IdInCar
			yxod := 0
			gModelCar := getTargetVehicleModelNameByIdDop(IdInCar)
			if (idskin=="102" or idskin=="103" or idskin=="104" or idskin=="195" or idskin=="21" or idskin=="195")
				org := "{CC00FF}The Ballas Gang"
			else if (idskin=="105" or idskin=="106" or idskin=="107" or idskin=="269" or idskin=="270" or idskin=="271" or idskin=="86" or idskin=="149" or idskin=="297" or idskin=="56")
				org := "{009900}Grove Street Gang"
			else if (idskin=="108" or idskin=="109" or idskin=="110" or idskin=="190" or idskin=="47")
				org := "{FFCD00}Los Santos Vagos"
			else if (idskin=="114" or idskin=="115" or idskin=="116" or idskin=="48" or idskin=="44" or idskin=="41" or idskin=="292")
				org := "{00CCFF}Varios Los Aztecas"
			else if (idskin=="173" or idskin=="174" or idskin=="175" or idskin=="193" or idskin=="226" or idskin=="30" or idskin=="119")
				org := "{008B8B}Rifa"
			else if (idskin=="191" or idskin=="252" or idskin=="287" or idskin=="61" or idskin=="179" or idskin=="255")
				org := "{008000}Army"
			else if (idskin=="57" or idskin=="98" or idskin=="147" or idskin=="150" or idskin=="187" or idskin=="216")
				org := "{4682B4}Мэрия"
			else if (idskin=="59" or idskin=="172" or idskin=="189" or idskin=="240")
				org := "{4169E1}Автошкола"
			else if (idskin=="201" or idskin=="247" or idskin=="248" or idskin=="254" or idskin=="248" or idskin=="298")
				org := "{FF0000}Байкеры"
			else if (idskin=="272" or idskin=="112" or idskin=="125" or idskin=="214" or idskin=="111" or idskin=="126")
				org := "{808080}Русская мафия"
			else if (idskin=="113" or idskin=="124" or idskin=="214" or idskin=="223")
				org := "{DAA520}La Cosa Nostra"
			else if (idskin=="120" or idskin=="123" or idskin=="169" or idskin=="186")
				org := "{FF0000}Yakuza"
			else if (idskin=="211" or idskin=="217" or idskin=="250" or idskin=="261")
				org := "{008080}News"
			else if (idskin=="70" or idskin=="219" or idskin=="274" or idskin=="275"  or idskin=="276")
				org := "{800000}Медики"
			else
			{
				org := "{FFFFFF}Гражданский"
			}
			SendChat("/m Водитель " ModelCar "!")
			sleep 1300
			SendChat("/m Если вы сейчас же не остановитесь, мы будем стрелять!")
			Sleep 350
			if (isStopM)
			{
				AddChatMessageEx("FFFFFF","{0000FF}________________________________________________")
				AddChatMessageEx("FFFFFF","{ffc801}")
				AddChatMessageEx("ffc801","Водитель автомобиля:" col " " NamePlayer " [" IdInCar "]")
				AddChatMessageEx("ffc801","Лет в штате:{FFFFFF} "lvl)
				AddChatMessageEx("ffc801","Организация: "org)
				sleep 50
				AddChatMessageEx("FFFFFF","{0000FF}________________________________________________")
			}
			NumberPre := "0"
		}
		else
			continue
	}
	if (s==0)
		NumberPre:="1"
}
if (NumberPre==1)
{
	IdInCar:=getClosestPlayerIdCar()
	gLastDriverId := IdInCar
	ModelCar:=getTargetVehicleModelNameById(IdInCar)
	NamePlayer := getPlayerNameById(IdIncar)
	lvl := getPlayerScoreById(IdIncar)
	colorname := getPlayerColor(IdInCar)
	col :=colorToStr(colorname)
	gLastDriverRpName := RegExReplace(NamePlayer, "_", " ")
	idskin := getTargetPlayerSkinIdById(IdInCar)
	gModelCar := getTargetVehicleModelNameByIdDop(IdInCar)
	if (idskin=="102" or idskin=="103" or idskin=="104" or idskin=="195" or idskin=="21" or idskin=="195")
		org := "{CC00FF}The Ballas Gang"
	else if (idskin=="105" or idskin=="106" or idskin=="107" or idskin=="269" or idskin=="270" or idskin=="271" or idskin=="86" or idskin=="149" or idskin=="297" or idskin=="56")
		org := "{009900}Grove Street Gang"
	else if (idskin=="108" or idskin=="109" or idskin=="110" or idskin=="190" or idskin=="47")
		org := "{FFCD00}Los Santos Vagos"
	else if (idskin=="114" or idskin=="115" or idskin=="116" or idskin=="48" or idskin=="44" or idskin=="41" or idskin=="292")
		org := "{00CCFF}Varios Los Aztecas"
	else if (idskin=="173" or idskin=="174" or idskin=="175" or idskin=="193" or idskin=="226" or idskin=="30" or idskin=="119")
		org := "{008B8B}Rifa"
	else if (idskin=="191" or idskin=="252" or idskin=="287" or idskin=="61" or idskin=="179" or idskin=="255")
		org := "{008000}Army"
	else if (idskin=="57" or idskin=="98" or idskin=="147" or idskin=="150" or idskin=="187" or idskin=="216")
		org := "{4682B4}Мэрия"
	else if (idskin=="59" or idskin=="172" or idskin=="189" or idskin=="240")
		org := "{4169E1}Автошкола"
	else if (idskin=="201" or idskin=="247" or idskin=="248" or idskin=="254" or idskin=="248" or idskin=="298")
		org := "{FF0000}Байкеры"
	else if (idskin=="272" or idskin=="112" or idskin=="125" or idskin=="214" or idskin=="111" or idskin=="126")
		org := "{808080}Русская мафия"
	else if (idskin=="113" or idskin=="124" or idskin=="214" or idskin=="223")
		org := "{DAA520}La Cosa Nostra"
	else if (idskin=="120" or idskin=="123" or idskin=="169" or idskin=="186")
		org := "{FF0000}Yakuza"
	else if (idskin=="211" or idskin=="217" or idskin=="250" or idskin=="261")
		org := "{008080}News"
	else if (idskin=="70" or idskin=="219" or idskin=="274" or idskin=="275"  or idskin=="276")
		org := "{800000}Медики"
	else
	{
		org := "{FFFFFF}Гражданский"
	}
	if (IdInCar != "-1")
	{
		Random rand, 1, 4
		if (rand==1)
		{
			SendChat("/m Водитель " ModelCar "!")
			sleep 1300
			SendChat("/m Немедленно прижмитесь к обочине и остановитесь или откроем огонь!")
		}
		if (rand==2)
		{
			SendChat("/m Водитель " ModelCar " прижмитесь к обочине")
			sleep 1300
			SendChat("/m В противном случае нам придется открыть огонь!")
		}
		if (rand==3)
		{
			SendChat("/m Водитель " ModelCar " сбавьте скорость!")
			sleep 1300
			SendChat("/m Вам придется прижаться к обочине и остановится или начнем стрелять!")
		}
		if (rand==4)
		{
			SendChat("/m Водитель " ModelCar " остановитесь на обочине")
			sleep 1300
			SendChat("/m Или нам придется открыть по вам огонь!")
		}
		if (isStopM)
		{
			Sleep 350
			AddChatMessageEx("FFFFFF","{0000FF}________________________________________________")
			AddChatMessageEx("FFFFFF","{ffc801}")
			AddChatMessageEx("ffc801","Водитель автомобиля:" col " " NamePlayer " [" IdInCar "]")
			AddChatMessageEx("ffc801","Лет в штате:{FFFFFF} "lvl)
			AddChatMessageEx("ffc801","Организация: "org)
			sleep 50
			AddChatMessageEx("FFFFFF","{0000FF}________________________________________________")
		}
	}
	else
		NumberPre:="0"
}
if (isOffinarrested)
	settimer, Caroff
if (isGmCar)
	settimer, CleoRepair
return
gKeyArrest:
if ((isInChat() || isDialogOpen()) && WarnKey(KeyArrest)) ||(isDialogOpen())
	return
if (getPlayerInteriorId()="0")
	return
if (gLastTargetId!="-1" && gLastTargetId!="")
{
	if (isWoman)
	{
		SendChat("/me достала из кармана связку ключей")
		if (cServerID="2")
			Sleep 1200
		else
		{
			Random Rando, 4000, 8000
			Sleep %Rando%
		}
		SendChat("/me открыла камеру следственного изолятора и завела нарушителя")
		if (cServerID="2")
			Sleep 1200
		else
		{
			Random Rando, 4000, 8000
			Sleep %Rando%
		}
		SendChat("/me закрыла камеру")
	}
	else
	{
		SendChat("/me достал из кармана связку ключей")
		if (cServerID="2")
			Sleep 1200
		else
		{
			Random Rando, 4000, 8000
			Sleep %Rando%
		}
		SendChat("/me открыл камеру следственного изолятора и завел нарушителя")
		if (cServerID="2")
			Sleep 1200
		else
		{
			Random Rando, 4000, 8000
			Sleep %Rando%
		}
		SendChat("/me закрыл камеру")
	}
	Sleep 4000
	SendChat("/arrest "gLastTargetId)
}
else
	AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Цель не захвачена")
Return
gKeySTime:
if ((isInChat() || isDialogOpen()) && WarnKey(KeySTime)) ||(isDialogOpen())
	return
SendChat("/time")
return
gKeyNoga:
if ((isInChat() || isDialogOpen()) && WarnKey(KeyNoga)) ||(isDialogOpen())
	return
SendChat("/try схватил преступника за ногу")
return
gKeySMS:
if ((isInChat() || isDialogOpen()) && WarnKey(KeySMS)) ||(isDialogOpen())
	return
if(!isInChat() && !isDialogOpen())
	SendInput, {F6}
if (isRU)
	SendMessage, 0x50,, 0x4190419,, A
SendInput, ^{SC1E}{BackSpace}
if(strlen(gLastSmsID) > 0)
	SendInput, /t %gLastSmsID%{space}
else
	SendInput, /t{space}
return
gKeyR:
if ((isInChat() || isDialogOpen()) && WarnKey(KeyR)) ||(isDialogOpen())
	return
if(!isInChat() && !isDialogOpen())
	SendInput, {F6}
SendMessage, 0x50,, 0x4190419,, A
SendInput, ^{SC1E}{BackSpace}
if(strlen(Tag) > 0)
	SendInput, /r %Tag%{space}
else
	SendInput, /r{space}
return

gKeyEventYes:
if ((isInChat() || isDialogOpen()) && WarnKey(KeyEventYes)) ||(isDialogOpen())
	return
if (Event["Clear"])
{
	SendChat("/clear "Event["clId"])
	Sleep 1200
	SendChat("/su " Event["clId"] " 1 Чистосердечное")
	Event["Clear"] := false
	Return
}
if (Event["FBISpy"])
{
	Event["FBISpy"] := false
	if (spyid="17")
	{
		SendChat("/spyoff "Event["spyId"])
		Return
	}
	else
		SendChat("/spy "Event["spyId"])
	Sleep 500
	spydialog:
	if (spycount="5")
	{
		AddChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Произошла ошибка, попробуйте еще раз!")
		Event["FBISpy"] := false
		return
	}
	if (isDialogOpen() && spycount!="5")
	{
		setDialogIndex(spyid)
		SendInput {Enter}
	}
	else
	{
		spycount++
		sleep 250
		goto, spydialog
	}
	Return
}
if(!Event["active"] || Event["chat"]="")
	return
if(Event["time"] < A_TickCount)
{
	Event["active"] := false
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Время ожидания решения прошло!")
	return
}
if(Event["time"] > A_TickCount)
{
	Event["OStime"] := A_TickCount + 5000
	SendChat(Event["chat"])
	Event["active"] := false
}
return
gKeyEventNo:
if ((isInChat() || isDialogOpen()) && WarnKey(KeyEventNo)) ||(isDialogOpen())
	return
if (Event["Clear"])
{
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Вы отменили подтверждение действия!")
	Event["Clear"] := false
	return
}
if (Event["FBISpy"])
{
	Event["FBISpy"] := false
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Вы отменили подтверждение действия!")
	Return
}
if (Event["chat"]="")
	return
if(Event["active"] && Event["time"] > A_TickCount)
{
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Вы отменили подтверждение действия!")
	Event["active"] := false
	return
}
if(Event["active"] && Event["time"] < A_TickCount)
{
	Event["active"] := false
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Время ожидания решения прошло!")
	return
}
return
gKeySbros:
NumberPre := "0"
addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Вы успешно сбросили цель")
Return
gKeyHelp:
if ((isInChat() || isDialogOpen()) && WarnKey(KeyHelp)) ||(isDialogOpen())
	return
o:=Object()
o:=GetCoordinates()
Zona:=CalculateZone(o[1],o[2],o[3])
if(Zona!="Unbekannt" && Zona!="Unknown")
	SendChat("/r " Tag " Срочно нужна помощь в квадрате - " Zona ".")
return
~*Enter::
BlockChatInput()
if (isInChat() && !isDialogOpen())
{
	sleep 300
	dwAddress := dwSAMP + 0x12D8F8
	chatInput := readString(hGTA, dwAddress, 256)
	unBlockChatInput()
	if(RegExMatch(chatInput, "^\/yk"))
	{
		statickcount := "0"
		ZText := ""
		StaticInfo := []
		zs := "0"
		sz := "0"
		if (cServerID="2")
		{
			Loop, Read, %Penal2%
			{
				ZText := A_LoopReadLine
				ZText := TextSeparator(ZText, 130)
				str := strsplit(ZText, "`n")
				Loop, % str.MaxIndex() {
					if (statickcount="40")
					{
						statickcount := "0"
						zs++
					}
					if (str[A_Index]!="")
						StaticInfo[zs] .= "" str[A_Index] "`n"
					statickcount++
				}
			}
			yk2:
			Sleep 250
			if (sz>zs)
				return
			showdialog(0, "{ffc801}Уголовный Кодекс","{FFFFFF}" StaticInfo[sz] "", "Дальше", "Отмена")
			Sleep 200
			Loop
			{
				if ((isDialogOpen()))
				{
					tg6:
					if ((GetKeyState("Enter", "P")) or (isDialogButtonSelected(1) = true and GetKeyState("LButton", "P")))
					{
						Sleep 100
						if (isDialogOpen())
							goto, tg6
						sz++
						goto, yk2
						Return
					}
					if (GetKeyState("ESC", "P") or (isDialogButtonSelected(2) = true and GetKeyState("LButton", "P")))
						Return
				}
				else
					Return
			}
		}
		if (cServerID="1")
		{
			Loop, Read, %Penal1%
			{
				ZText := A_LoopReadLine
				ZText := TextSeparator(ZText, 130)
				str := strsplit(ZText, "`n")
				Loop, % str.MaxIndex() {
					if (statickcount="40")
					{
						statickcount := "0"
						zs++
					}
					if (str[A_Index]!="")
						StaticInfo[zs] .= "" str[A_Index] "`n"
					statickcount++
				}
			}
			yk:
			Sleep 250
			if (sz>zs)
				return
			showdialog(0, "{ffc801}Уголовный Кодекс","{FFFFFF}" StaticInfo[sz] "", "Дальше", "Отмена")
			Sleep 200
			Loop
			{
				if ((isDialogOpen()))
				{
					tg7:
					if ((GetKeyState("Enter", "P")) or (isDialogButtonSelected(1) = true and GetKeyState("LButton", "P")))
					{
						Sleep 100
						if (isDialogOpen())
							goto, tg7
						sz++
						goto, yk
						Return
					}
					if (GetKeyState("ESC", "P") or (isDialogButtonSelected(2) = true and GetKeyState("LButton", "P")))
						Return
				}
				else
					Return
			}
		}
		return
	}
	if (chatInput="/crib")
	{
		statickcount := "0"
		ZText := ""
		StaticInfo := []
		zs := "0"
		sz := "0"
		Loop, Read, %Crib%
		{
			ZText := A_LoopReadLine
			ZText := TextSeparator(ZText, 130)
			str := strsplit(ZText, "`n")
			Loop, % str.MaxIndex() {
				if (statickcount="40")
				{
					statickcount := "0"
					zs++
				}
				if (str[A_Index]!="")
					StaticInfo[zs] .= "" str[A_Index] "`n"
				statickcount++
			}
		}
		Crib:
		Sleep 250
		if (sz>zs)
			return
		showdialog(0, "{ffc801}Собственное меню","{FFFFFF}" StaticInfo[sz] "", "Дальше", "Отмена")
		Sleep 200
		Loop
		{
			if ((isDialogOpen()))
			{
				tg8:
				if ((GetKeyState("Enter", "P")) or (isDialogButtonSelected(1) = true and GetKeyState("LButton", "P")))
				{
					Sleep 100
					if (isDialogOpen())
						goto, tg8
					sz++
					goto, Crib
					Return
				}
				if (GetKeyState("ESC", "P") or (isDialogButtonSelected(2) = true and GetKeyState("LButton", "P")))
					Return
			}
			else
				Return
		}
		return
	}
	if (chatInput="/ak")
	{
		statickcount := "0"
		ZText := ""
		StaticInfo := []
		zs := "0"
		sz := "0"
		if (cServerID="2")
		{
			Loop, Read, %Administrative2%
			{
				ZText := A_LoopReadLine
				ZText := TextSeparator(ZText, 130)
				str := strsplit(ZText, "`n")
				Loop, % str.MaxIndex() {
					if (statickcount="40")
					{
						statickcount := "0"
						zs++
					}
					if (str[A_Index]!="")
						StaticInfo[zs] .= "" str[A_Index] "`n"
					statickcount++
				}
			}
			ak2:
			Sleep 250
			if (sz>zs)
				return
			showdialog(0, "{ffc801}Административный Кодекс","{FFFFFF}" StaticInfo[sz] "", "Дальше", "Отмена")
			Sleep 200
			Loop
			{
				if ((isDialogOpen()))
				{
					tg9:
					if ((GetKeyState("Enter", "P")) or (isDialogButtonSelected(1) = true and GetKeyState("LButton", "P")))
					{
						Sleep 100
						if (isDialogOpen())
							goto, tg9
						sz++
						goto, ak2
						Return
					}
					if (GetKeyState("ESC", "P") or (isDialogButtonSelected(2) = true and GetKeyState("LButton", "P")))
					{
						Return
					}
				}
				else
					Return
			}
		}
		if (cServerID="1")
		{
			Loop, Read, %Administrative1%
			{
				ZText := A_LoopReadLine
				ZText := TextSeparator(ZText, 130)
				str := strsplit(ZText, "`n")
				Loop, % str.MaxIndex() {
					if (statickcount="40")
					{
						statickcount := "0"
						zs++
					}
					if (str[A_Index]!="")
						StaticInfo[zs] .= "" str[A_Index] "`n"
					statickcount++
				}
			}
			ak:
			Sleep 250
			if (sz>zs)
				return
			showdialog(0, "{ffc801}Административный Кодекс","{FFFFFF}" StaticInfo[sz] "", "Дальше", "Отмена")
			Sleep 200
			Loop
			{
				if ((isDialogOpen()))
				{
					tg10:
					if ((GetKeyState("Enter", "P")) or (isDialogButtonSelected(1) = true and GetKeyState("LButton", "P")))
					{
						Sleep 100
						if (isDialogOpen())
							goto, tg10
						sz++
						goto, ak
						Return
					}
					if (GetKeyState("ESC", "P") or (isDialogButtonSelected(2) = true and GetKeyState("LButton", "P")))
						Return
				}
				else
					Return
			}
		}
		return
	}
	if(RegExMatch(chatInput, "^\/fp$"))
	{
		statickcount := "0"
		StaticInfo := []
		ZText := ""
		zs := "0"
		sz := "0"
		if (cServerID="2")
		{
			Loop, Read, %FedP2%
			{
				ZText := A_LoopReadLine
				ZText := TextSeparator(ZText, 130)
				str := strsplit(ZText, "`n")
				Loop, % str.MaxIndex() {
					if (statickcount="40")
					{
						statickcount := "0"
						zs++
					}
					if (str[A_Index]!="")
						StaticInfo[zs] .= "" str[A_Index] "`n"
					statickcount++
				}
			}
			fp2:
			Sleep 250
			if (sz>zs)
				return
			showdialog(0, "{ffc801}Федеральное постановление","{FFFFFF}" StaticInfo[sz] "", "Дальше", "Отмена")
			Sleep 200
			Loop
			{
				if ((isDialogOpen()))
				{
					tg11:
					if ((GetKeyState("Enter", "P")) or (isDialogButtonSelected(1) = true and GetKeyState("LButton", "P")))
					{
						Sleep 100
						if (isDialogOpen())
							goto, tg11
						sz++
						goto, fp2
						Return
					}
					if (GetKeyState("ESC", "P") or (isDialogButtonSelected(2) = true and GetKeyState("LButton", "P")))
						Return
				}
				else
					Return
			}
		}
		if (cServerID="1")
		{
			Loop, Read, %FedP1%
			{
				ZText := A_LoopReadLine
				ZText := TextSeparator(ZText, 130)
				str := strsplit(ZText, "`n")
				Loop, % str.MaxIndex() {
					if (statickcount="40")
					{
						statickcount := "0"
						zs++
					}
					if (str[A_Index]!="")
						StaticInfo[zs] .= "" str[A_Index] "`n"
					statickcount++
				}
			}
			fp:
			Sleep 250
			if (sz>zs)
				return
			showdialog(0, "{ffc801}Федеральное постановление","{FFFFFF}" StaticInfo[sz] "", "Дальше", "Отмена")
			Sleep 200
			Loop
			{
				if ((isDialogOpen()))
				{
					tg12:
					if ((GetKeyState("Enter", "P")) or (isDialogButtonSelected(1) = true and GetKeyState("LButton", "P")))
					{
						Sleep 100
						if (isDialogOpen())
							goto, tg12
						sz++
						goto, fp
						Return
					}
					if (GetKeyState("ESC", "P") or (isDialogButtonSelected(2) = true and GetKeyState("LButton", "P")))
						Return
				}
				else
					Return
			}
		}
		return
	}
if (chatInput="/stoplecture")
{
	if (StopLecture)
	{
		StopLecture := !StopLecture
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Вы отключили чтении лекции")
		return
	}
	else
		AddChatMessageEx("{FFFFFF}"," {ffc801}[Police Dream] {FFFFFF}Лекция не запущена!")
	return
}
if(RegExMatch(chatInput, "^\/pdhelp"))
{
	Sleep 200
	showDialog(0, "{ffc801}Помощь по скрипту", "						{0000FF}[Police]`n`n{ffc801}/zap [ID] {FFFFFF}- Запретить рассмотрение дела`n{ffc801}/kit {FFFFFF}- Временно отключить/включить взятие автокомплекта`n{ffc801}/fraction {FFFFFF}- открыть диалоговое окно с участниками организации`n{ffc801}/fractionclear {FFFFFF}- Очищает подразделения участникам организации`n{ffc801}/tag [ID] [Tag] {FFFFFF}- Изменить подразделение участнику фракции `n{ffc801}/hrang [ID/Nick] {FFFFFF}- Посмотреть историю повышений/понижений участника организации`n{ffc801}/lecture {FFFFFF}- Включить чтение лекции. Добавлять свои лекции можно: Документы - Police Dream - Лекции`n{ffc801}/stoplecture {FFFFFF}- Принудительно остановить лекцию`n{ffc801}/roz [ID] {FFFFFF}- Проверить преступления игрока`n{ffc801}/tkey [Причина] {FFFFFF}- Запросить  разрешение в рацию на взятие ключей от КПЗ`n{ffc801}/z [ID] {FFFFFF}- Открыть диалоговое окно со списком правонарушений`n{ffc801}/z [ID] [Номер статьи] {FFFFFF}- Сразу выдать розыск без открытия диалогового окна`n{ffc801}/rlogs {FFFFFF}- Вывести двадцать последних сообщений в рацию`n{ffc801}/dlogs {FFFFFF}- Вывести двадцать последних сообщений в департамент`n{ffc801}/sulogs {FFFFFF}- Вывести двадцать последних сообщений об объявлении в розыск (Системные не выводит)`n{ffc801}/tazerset {FFFFFF}- Изменить расположение Tazer HUD`n{ffc801}/tazersetoff {FFFFFF}- Сохранить изменение расположения Tazer HUD`n{ffc801}/tazersize {FFFFFF}- Изменить размер шрифта Tazer HUD`n{ffc801}/tazerstyle{FFFFFF}- Изменить стиль шрифта Tazer HUD`n{ffc801}/tgun [ID] {FFFFFF}- Забрать оружие у игрока с РП отыгровкой`n{ffc801}/tlgun [ID] {FFFFFF}- Забрать лицензию на оружие с РП отыгровкой`n{ffc801}/tdrive [ID] {FFFFFF}- Аннулировать водительское удостоверение`n{ffc801}/ransom {FFFFFF}- Сумма выкупа за заложника`n{ffc801}/pred [id] {FFFFFF}-  выдать предупреждение за неправильную подачу в розыск`n{ffc801}/viz [id] [время(не обязательно)] {FFFFFF}- Вызвать человека в офис ФБР`n{ffc801}/crib {FFFFFF} - Шпаргалка, в которую вы можете добавлять свой текст`n{ffc801}/vig {FFFFFF} - Выдать выговор сотруднику, и синхронизировать его в гугл таблице`n{ffc801}/work {FFFFFF} - Позвать всех сотрудников на работу, которые находятся в выходном (Майоров и выше звать не будет)`n{ffc801}/form {FFFFFF} - Диалоговое окно со всеми сотрудниками, кого нет в строю`n{ffc801}/cl [id] {FFFFFF} - Чистосердечное признание`n`n						{808080}[Other]`n`n{ffc801}/blclear {FFFFFF}- Очистить черный список адвокатов`n{ffc801}/timeset {FFFFFF}- Изменить расположение Time HUD`n{ffc801}/timesetoff {FFFFFF}- Сохранить изменение расположения Time HUD`n{ffc801}/timesize {FFFFFF}- Изменить размер шрифта`n{ffc801}/timestyle {FFFFFF}- Изменить стиль шрифта`n{ffc801}/timecolor {FFFFFF}- Изменить цвет текста`n{ffc801}/setweather [ID погоды] {FFFFFF}- Сменить погоду`n{ffc801}/cchat {FFFFFF}- Очистить чат`n{ffc801}/ffind {FFFFFF}- Найти определенную фразу в чат-логе`n{ffc801}/yk {FFFFFF}- Открыть диалоговое окно с Уголовным Кодексом`n{ffc801}/fyk {FFFFFF}- Найти определенную фразу в Уголовном Кодексе (Чувствительно к регистру)`n{ffc801}/ak {FFFFFF}- Открыть диалоговое окно с Административным Кодексом`n{ffc801}/fak {FFFFFF}- Найти определенную фразу в Административном Кодексе (Чувствительно к регистру)`n{ffc801}/fp {FFFFFF}- Открыть диалоговое окно с Федеральным постановлением`n{ffc801}/ffp {FFFFFF}- Найти определенную фразу в Федеральном постановлении (Чувствительно к регистру)`n{ffc801}/pdhelp", "Закрыть")
	return
}
if(RegExMatch(chatInput, "^\/lecture"))
{
	if(RegExMatch(chatInput, "^\/lecture([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/lecture$") || RegExMatch(chatInput, "^\/lecture $") || RegExMatch(chatInput, "^\/lecture (.*),$") || RegExMatch(chatInput, "^\/lecture (.*), $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте: /lecture [Название файла], [Время ожидания]")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Для рандомного времени используйте знак ""-"" ")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Пример: /lecture Правила строя, 7-15 (запятую не забудьте)")
		return
	}
	{
		RegExMatch(chatInput, "/lecture (.*), (.*)", lecture)
		output := lecture1
		time := lecture2*1000
		StopLecture := 1
		if (time="0")
		{
			AddChatMessageEx("{FFFFFF}"," {ffc801}[Police Dream] {FFFFFF}Задержка не может быть равна нулю!")
			return
		}
		IfNotExist, %A_MyDocuments%\Police Dream\Лекции\%output%.txt
		{
			AddChatMessageEx("{FFFFFF}"," {ffc801}[Police Dream] {FFFFFF}Указанного вами файла не существует!")
			return
		}
		Loop, Read, %A_MyDocuments%\Police Dream\Лекции\%output%.txt
		{
			if (!StopLecture)
				return
			if (RegExMatch(lecture2,"(\d+)-(\d+)",Rand))
			{
				if (Rand1=Rand2 || Rand1="0" || Rand2="0")
					return
				Random Rando, %Rand1%, %Rand2%
				time := Rando*1000
			}
			SendChat(A_LoopReadLine)
			Sleep %time%
		}
		return
	}
}

if(RegExMatch(chatInput, "^\/ransom$"))
{
	showdialog("2","Сумма выкупа за заложника","`nМэрия`nФБР`nПолиция`nАрмия`nМедики`nАвтошкола`nНовости`nТеракт","Готово", "Отмена")
	IdDialogLocal := 20
	return
}

if(RegExMatch(chatInput, "^\/kit$"))
{
	if (isGiveGuns)
	{
		isGiveGuns := false
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Вы {FF0000}отключили {FFFFFF}автоматический набор амуниции")
	}
	else
	{
		isGiveGuns := true
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Вы {32CD32}включили {FFFFFF}автоматический набор амуниции")
	}
	return
}
if(RegExMatch(chatInput, "^\/dzap"))
{
	if(RegExMatch(chatInput, "^\/dzap([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/dzap$") || RegExMatch(chatInput, "^\/dzap $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /dzap [id адвоката]")
		return
	}
	RegExMatch(chatInput, "^\/dzap ([\dA-Za-z_\[\]]+)", t)
	id := t1
	Event["Active"] := True
	Loop, Read, %Chatlog%
	{
		if (RegExMatch(A_LoopReadLine, "^\[(..):(..):(..)\].*?(\[Police\s..\]|\[FBI\])\s.*(Mayor,|Mayor]|City Hall,|City Hall]|City Hall]:|Mayor]:|Mayor|City Hall|Мэрия)(?<Text>.*)?(КПЗ|рассм|выпуск|СИЗО|расм|закр|выход|ООП|залог|отказ|Неадекв|Федерал|10-14)(.*)",name))
		{
			sys:=A_Hour*3600+A_Min*60+A_Sec-name1*3600-name2*60-name3
			if (sys<0)
			{
				sys:=sys+24*3600
			}
			if (sys<3600)
			{
				Event["Active"] := False
				SendChat("/t " id " " nameText "" name7 "" name8 "")
				Sleep 1200
			}
		}
	}
	if (Event["Active"])
	{
		Event["Active"] := False
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Нет дел для запрета")
	}
	return
}
if(RegExMatch(chatInput, "^\/viz") && Fraction="4")
{
	if(RegExMatch(chatInput, "^\/viz([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/viz$") || RegExMatch(chatInput, "^\/viz $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /viz [id / часть ника]")
		return
	}
	RegExMatch(chatInput, "^\/viz (.*) (\d+)", t) || RegExMatch(chatInput, "^\/viz (.*)", t)
	id := t1
	cIi := "0"
	Event["YNick"] := ""
	if (RegExMatch(id,"(\d+)"))
		Event["YNick"] := RegExReplace(getPlayerNameById(id), "_", " ")
	else
	{
		updateOScoreboardData()
		For i, o in oScoreboardData
		{
			if(InStr(o.NAME,id))
			{
				Event["YNick"] := RegExReplace(getPlayerNameById(i), "_", " ")
				cIi++
				continue
			}
		}
		if (cIi="0")
		{
			AddChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Игрока нет в игре!")
			return
		}
		if (cIi > 1)
		{
			AddChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Слишком много игроков по данному запросу!")
			return
		}
	}
	id := t1
	if (id="-1" || id="")
		return
	if (t2="1")
		Event["QTime"] := "минута"
	else if (t2="2" || t2="3" || t2="4")
		Event["QTime"] := "минуты"
	else if (t2>="5")
		Event["QTime"] := "минут"
	Event["YTime"] := t2
	if (Event["YNick"]!="")
	{
		Event["yourself"] := true
		SendChat("/mdc "id)
	}
	return
}
if(RegExMatch(chatInput, "^\/pred") && Fraction="4")
{
	if(RegExMatch(chatInput, "^\/pred([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/pred$") || RegExMatch(chatInput, "^\/pred $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /pred [id / часть ника]")
		return
	}
	RegExMatch(chatInput, "^\/pred (.*)", t)
	id := t1
	cIi := "0"
	Event["ONick"] := ""
	if (RegExMatch(id,"(\d+)"))
		Event["ONick"] := RegExReplace(getPlayerNameById(id), "_", " ")
	else
	{
		updateOScoreboardData()
		For i, o in oScoreboardData
		{
			if(InStr(o.NAME,id))
			{
				Event["ONick"] := RegExReplace(getPlayerNameById(i), "_", " ")
				cIi++
				continue
			}
		}
		if (cIi="0")
		{
			AddChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Игрока нет в игре!")
			return
		}
		if (cIi > 1)
		{
			AddChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Слишком много игроков по данному запросу!")
			return
		}
	}
	if (Event["ONick"]!="")
	{
		Event["pred"] := true
		SendChat("/mdc "id)
	}
	return
}
if(RegExMatch(chatInput, "^\/cmdc$") && Fraction="4")
{
	sp := 0
	pp := 0
	Event["cmdc"] := true
	scmdc := []
	Players := []
	dout := ""
	Players := getStreamedInPlayersInfo()
	p := 0
	For i, o in Players
	{
		l := []
		pos := getCoordinates()
		Name := getPlayerNameById(i)
		cts := colorToStr(getPlayerColor(i))
		SendChat("/mdc "i)
		Sleep 1200
	}
	Event["cmdc"] := false
	while (sp > pp)
	{
		addchatmessageEx("FFFFFF", "{ffc801}[Police Dream] {FFFFFF}"scmdc[pp])
		pp++
	}
	return
}
if (RegExMatch(chatInput, "^\/cl (\d+)", t))
{
	if(RegExMatch(chatInput, "^\/cl([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/cl$") || RegExMatch(chatInput, "^\/cl $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /cl [id]")
		return
	}
	RegExMatch(chatInput, "^\/cl (\d+)", t)
	id := t1
	if (isPlayerInAnyVehicle())
	{
		SendChat("/clear "id)
		Sleep 1200
		SendChat("/su " id " 1 Чистосердечное")
	}
	else
		SendChat("/r " Tag " Дело № " id " чистосердечное признание.")
	return
}
if(RegExMatch(chatInput, "^\/car (.*)", t))
{
	if(RegExMatch(chatInput, "^\/car([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/car$") || RegExMatch(chatInput, "^\/car $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /car [Название]")
		return
	}
	id := t1
	Loop, Read, %bDir%/veh.txt
	{
		if (RegExMatch(A_LoopReadLine, t1, name))
		{
			AddChatMessageEx("FFFFFF", A_LoopReadLine)
			ClipPutText(A_LoopReadLine)
		}
	}
	return
}
if(RegExMatch(chatInput, "^\/ms") && Fraction=4)
{
	if(RegExMatch(chatInput, "^\/ms([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/ms$") || RegExMatch(chatInput, "^\/ms $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /ms [1/2/3] [Причина]")
		return
	}
	RegExMatch(chatInput, "^\/ms (\d+) (.*)", t) || RegExMatch(chatInput, "^\/ms (\d+)", t)
	id := t1
	if (t2="" && id="0")
	{
		if (isWoman)
		{
			SendChat("/r Переоделась в костюм агента.")
			Sleep 1200
			SendChat("/me надела на себя костюм агента")
		}
		else
		{
			SendChat("/r Переоделся в костюм агента.")
			Sleep 1200
			SendChat("/me надел на себя костюм агента")
		}
		Sleep 1200
		SendChat("/rb "getid())
		return
	}
	if (id>3)
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /ms [1/2/3] [Причина]")
		return
	}
	Reason := t2
	showDialog("2", "{ffc801}Выберите фракцию:","{ffc801}Лаборатория`nГражданский`nПолиция`nАрмия`nМЧС`nМэрия`nАвтошкола`nNews`nLCN`nYakuza`nRussian Mafia`nRifa`nGrove Street`nBallas`nVagos`nAztec`nБайкеры", "Выбрать")
	Loop
	{
		if ((isDialogOpen()))
		{
			maskirovka:
			if ((GetKeyState("Enter", "P")) or (isDialogButtonSelected(1) = true and GetKeyState("LButton", "P")) or (GetKeyState("LButton", "P")))
			{
				Sleep 100
				if (isDialogOpen())
					goto, maskirovka
				masknumber := getDialogIndex()
				if (masknumber=1)
				{
					if (isWoman)
						SendChat("/r Переоделась в сотрудника лаборатории. Причина: "Reason)
					else
						SendChat("/r Переоделся в сотрудника лаборатории. Причина: "Reason)
					Sleep 1200
					SendChat("/clist 31")
				}
				if (masknumber=2)
				{
					if (isWoman)
						SendChat("/r Переоделась в одежду гражданского. Причина: "Reason)
					else
						SendChat("/r Переоделся в одежду гражданского. Причина: "Reason)
					Sleep 1200
					SendChat("/clist 0")
				}
				if (masknumber=3)
				{
					if (isWoman)
						SendChat("/r Переоделась в форму полицейского. Причина: "Reason)
					else
						SendChat("/r Переоделся в форму полицейского. Причина: "Reason)
					Sleep 1200
					SendChat("/clist 19")
				}
				if (masknumber=4)
				{
					if (isWoman)
						SendChat("/r Переоделась в армейскую форму. Причина: "Reason)
					else
						SendChat("/r Переоделся в армейскую форму. Причина: "Reason)
					Sleep 1200
					SendChat("/clist 7")
				}
				if (masknumber=5)
				{
					if (isWoman)
						SendChat("/r Переоделась в форму медика. Причина: "Reason)
					else
						SendChat("/r Переоделся в форму медика. Причина: "Reason)
					Sleep 1200
					SendChat("/clist 13")
				}
				if (masknumber=6)
				{
					if (isWoman)
						SendChat("/r Переоделась в форму работника мэрии. Причина: "Reason)
					else
						SendChat("/r Переоделся в форму работника мэрии. Причина: "Reason)
					Sleep 1200
					SendChat("/clist 21")
				}
				if (masknumber=7)
				{
					if (isWoman)
						SendChat("/r Переоделась в форму работника автошколы. Причина: "Reason)
					else
						SendChat("/r Переоделся в форму работника автошколы. Причина: "Reason)
					Sleep 1200
					SendChat("/clist 19")
				}
				if (masknumber=8)
				{
					if (isWoman)
						SendChat("/r Переоделась в форму работника новостей. Причина: "Reason)
					else
						SendChat("/r Переоделся в форму работника новостей. Причина: "Reason)
					Sleep 1200
					SendChat("/clist 2")
				}
				if (masknumber=9)
				{
					if (isWoman)
						SendChat("/r Переоделась в форму ЧОП LCN. Причина: "Reason)
					else
						SendChat("/r Переоделся в форму ЧОП LCN. Причина: "Reason)
					Sleep 1200
					SendChat("/clist 28")
				}
				if (masknumber=10)
				{
					if (isWoman)
						SendChat("/r Переоделась в форму ЧОП Yakuza. Причина: "Reason)
					else
						SendChat("/r Переоделся в форму ЧОП Yakuza. Причина: "Reason)
					Sleep 1200
					SendChat("/clist 8")
				}
				if (masknumber=11)
				{
					if (isWoman)
						SendChat("/r Переоделась в форму ЧОП РМ. Причина: "Reason)
					else
						SendChat("/r Переоделся в форму ЧОП РМ. Причина: "Reason)
					Sleep 1200
					SendChat("/clist 31")
				}
				if (masknumber=12)
				{
					if (isWoman)
						SendChat("/r Переоделась в форму БК Rifa. Причина: "Reason)
					else
						SendChat("/r Переоделся в форму БК Rifa. Причина: "Reason)
					Sleep 1200
					SendChat("/clist 4")
				}
				if (masknumber=13)
				{
					if (isWoman)
						SendChat("/r Переоделась в форму БК Grove. Причина: "Reason)
					else
						SendChat("/r Переоделся в форму БК Grove. Причина: "Reason)
					Sleep 1200
					SendChat("/clist 1")
				}
				if (masknumber=14)
				{
					if (isWoman)
						SendChat("/r Переоделась в форму БК Ballas. Причина: "Reason)
					else
						SendChat("/r Переоделся в форму БК Ballas. Причина: "Reason)
					Sleep 1200
					SendChat("/clist 23")
				}
				if (masknumber=15)
				{
					if (isWoman)
						SendChat("/r Переоделась в форму БК Vagos. Причина: "Reason)
					else
						SendChat("/r Переоделся в форму БК Vagos. Причина: "Reason)
					Sleep 1200
					SendChat("/clist 25")
				}
				if (masknumber=16)
				{
					if (isWoman)
						SendChat("/r Переоделась в форму БК Aztec. Причина: "Reason)
					else
						SendChat("/r Переоделся в форму БК Aztec. Причина: "Reason)
					Sleep 1200
					SendChat("/clist 18")
				}
				if (masknumber=17)
				{
					if (isWoman)
						SendChat("/r Переоделась в одежду байкеров. Причина: "Reason)
					else
						SendChat("/r Переоделся в одежду байкеров. Причина: "Reason)
					Sleep 1200
					SendChat("/clist 31")
				}
				Sleep 1200
				SendChat("/rb "getID())
				if (id="1")
				{
					Sleep 1200
					if (isWoman)
					{
						SendChat("/me открыла ящик, после чего достала комплект маскировки")
						Sleep 1200
						SendChat("/me надела на себя маскировку и закрыла ящик")
					}
					else
					{
						SendChat("/me открыл ящик, после чего достал комплект маскировки")
						Sleep 1200
						SendChat("/me надел на себя маскировку и закрыл ящик")
					}
					sleep 1200
					SendChat("/do Агент в маскировке.")
					return
				}
				if (id="2")
				{
					Sleep 1200
					if (isWoman)
					{
						SendChat("/me сняла с себя костюм агента и убрала в багажник")
						Sleep 1200
						SendChat("/me достала из багажника комплект с маскировкой и надела на себя")
						Sleep 1200
						SendChat("/me закрыла багажник")
					}
					else
					{
						SendChat("/me снял с себя костюм агента и убрал в багажник")
						Sleep 1200
						SendChat("/me достал из багажника комплект с маскировкой и надел на себя")
						Sleep 1200
						SendChat("/me закрыл багажник")
					}
					sleep 1200
					SendChat("/do Агент в маскировке.")
					return
				}
				if (id="3")
				{
					Sleep 1200
					if (isWoman)
					{
						SendChat("/me открыв сумку, сняла костюм агента и убрала туда")
						Sleep 1200
						SendChat("/me достала из сумки комплект маскировки и надела на себя")
						Sleep 1200
						SendChat("/me закрыла сумку")
					}
					else
					{
						SendChat("/me открыв сумку, снял костюм агента и убрал туда")
						Sleep 1200
						SendChat("/me достал из сумки комплект маскировки и надел на себя")
						Sleep 1200
						SendChat("/me закрыл сумку")
					}
					sleep 1200
					SendChat("/do Агент в маскировке.")
					return
				}
			}
			if (GetKeyState("ESC", "P"))
			{
				Return
			}
		}
		else
		{
			Return
		}
	}
	return
}
if(RegExMatch(chatInput, "^\/(sms|t) (.*)"))
{
	if(RegExMatch(chatInput, "^\/(sms|t)$") || RegExMatch(chatInput, "^\/(sms|t) $"))
	{
		sendchat("/t")
		return
	}
	RegExMatch(chatInput, "^\/(sms|t) ([\dA-Za-z_\[\]]+) (.*)", t)
	id := t2
	cIi := "0"
	Event["aSMS"] := ""
	if (RegExMatch(id,"(\d+)"))
		Event["aSMS"] := t2
	else
	{
		updateOScoreboardData()
		For i, o in oScoreboardData
		{
			if(InStr(o.NAME,id))
			{
				Event["aSMS"] := i
				cIi++
				continue
			}
		}
		if (cIi="0")
		{
			AddChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Игрока нет в игре!")
			return
		}
		if (cIi > 1)
		{
			AddChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Слишком много игроков по данному запросу!")
			return
		}
	}
	if (Event["aSMS"]!="")
		SendChat("/t " Event["aSMS"] " "t3)
	return
}
if(RegExMatch(chatInput, "^\/setweather"))
{
	if(RegExMatch(chatInput, "^\/setweather([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/setweather$") || RegExMatch(chatInput, "^\/setweather $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /setweather [id погоды]")
		return
	}
	RegExMatch(chatInput, "^\/setweather ([\dA-Za-z_\[\]]+)", t)
	id := t1
	setWeather(id)
	AddChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Погода изменена на: {FF0000}"id)
	if(id < 0)
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Вы вернули погоду на стандартную")
	}
	return
}
if(RegExMatch(chatInput, "^\/tkey"))
{
	if(RegExMatch(chatInput, "^\/tkey([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/tkey$") || RegExMatch(chatInput, "^\/tkey $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /tkey [причина]")
		return
	}
	RegExMatch(chatInput, "^\/tkey (.*)", t)
	Reason := t1
	SendChat("/r " Tag " Можно взять ключи от камеры по причине - " reason "?")
	return
}
if(RegExMatch(chatInput, "^\/key"))
{
	if(RegExMatch(chatInput, "^\/key([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/key$") || RegExMatch(chatInput, "^\/key $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /key [id]")
		return
	}
	RegExMatch(chatInput, "^\/key (\d+)", t)
	Event["SuspectKey"] := t1
	Event["SuspectKeyActive"] := true
	if (cServerID="2")
		Sleep 1200
	else
	{
		Random Rando, 4000, 8000
		Sleep %Rando%
	}
	SendChat("/me достал связку ключей от камеры")
	if (cServerID="2")
		Sleep 1200
	else
	{
		Random Rando, 4000, 8000
		Sleep %Rando%
	}
	SendChat("/me сравнил ключи преступника с ключами от камеры")
	if (cServerID="2")
		Sleep 1200
	else
	{
		Random Rando, 4000, 8000
		Sleep %Rando%
	}
	SendChat("/try ключи совпадают с ключами от камеры")
	return
}
if(RegExMatch(chatInput, "^\/kur"))
{
	if(RegExMatch(chatInput, "^\/kur([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/kur$") || RegExMatch(chatInput, "^\/kur $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /kur [id]")
		return
	}
	RegExMatch(chatInput, "^\/kur (\d+)", t)
	SendChat("/me достал КПК и сделал фотографию человека")
	Sleep 1200
	SendChat("/do КПК дал информацию: Имя: "RegExReplace(getPlayerNameById(t1), "_", " "))
	Sleep 1200
	SendChat("/mdc "t1)
	Sleep 1200
	SendChat("/time")
	Sleep 500
	SendInput {F8}
	return
}
if(RegExMatch(chatInput, "^\/ffind"))
{
	if(RegExMatch(chatInput, "^\/ffind([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/ffind$") || RegExMatch(chatInput, "^\/ffind $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /ffind [Текст]")
		return
	}
	RegExMatch(chatInput, "^\/ffind (.*)", t)
	Tember := t1
	if(strlen(Tember) < 3)
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Слишком мало символов. Минимум 3 символа.")
		return
	}
	filedelete, %bDir%\cinfo.txt
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Подождите, идёт загрузка...")
		Loop, Read, %Chatlog%
		{
			if ((RegExMatch(A_LoopReadLine, Tember, name)))
			{
				FileAppend, % "{FFFFFF}" A_LoopReadLine "`n", %bDir%\cinfo.txt
				cinfo:=0
				w:=""
				loop, read, %bDir%\cinfo.txt
				{
					if (cinfo>0)
					{
						w.=A_LoopReadLine "`n"
					}
					cinfo++
				}
				if (cinfo>20)
				{
					filedelete, %bDir%\cinfo.txt
					fileappend, %w%, %bDir%\cinfo.txt
				}
			}
		}
		listrtextfordialog("" bDir "\cinfo.txt","{FFA500}Лог последних сообщений","0")
	}
	return
}
if(RegExMatch(chatInput, "^\/(tgun|tdrive|tdr|tlgun)"))
{
	if(RegExMatch(chatInput, "^\/(tgun|tdrive|tdr|tlgun)([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/(tgun|tdrive|tdr|tlgun)$") || RegExMatch(chatInput, "^\/(tgun|tdrive|tdr|tlgun) $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /tgun [ID]")
		return
	}
	RegExMatch(chatInput, "^\/(tgun|tdrive|tdr|tlgun) (\d+)", t)
	if (Rang < 4 && Fraction!="4")
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Данная команда доступна с Сержанта[4]")
		return
	}
	zFrisk := "0"
	ltake := false
	SendChat("/frisk "t2)
	Name := getPlayerNameById(gLastTargetId)
	gNick := RegExReplace(Name, "_", " ")
	tgfrisk:
	Sleep 250
	if (zFrisk="3")
	{
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Попробуйте обыскать еще раз")
		return
	}
	Sleep 250
	If(isDialogOpen())
	{
		kolvostrok := getDialogLineCount()
		gw := "0"
		lines := getDialogLines()
		Sleep 250
		while kolvostrok >= gw
		{
			gw++
			if (RegExMatch(lines[gw],"P	Оружие	([0-9]*)") && t1="tgun")
			{
				setDialogIndex(gw - 1)
				SendInput {Enter}
				Sleep 500
				SendInput {ESC}
				if (cServerID="2")
					Sleep 1200
				else
				{
					Random Rando, 4000, 8000
					Sleep %Rando%
				}
				ltake := true
				if (isWoman)
					SendChat("/me достала из кармана пакет для улик и положила найденные предметы")
				else
					SendChat("/me достал из кармана пакет для улик и положил найденные предметы")
			}
			if (RegExMatch(lines[gw],"K	Водительские права	([0-9]*)") && t1="tdrive")
			{
				setDialogIndex(gw - 1)
				SendInput {Enter}
				Sleep 500
				SendInput {ESC}
				if (cServerID="2")
					Sleep 1200
				else
				{
					Random Rando, 4000, 8000
					Sleep %Rando%
				}
				ltake := true
				if (isWoman)
				{
					SendChat("/me достала КПК из кармана и зашла в базу данных полиции")
					if (cServerID="2")
						Sleep 1200
					else
					{
						Random Rando, 4000, 8000
						Sleep %Rando%
					}
					SendChat("/me подала запрос о аннулировании водительского удостоверения")
				}
				else
				{
					SendChat("/me достал КПК из кармана и зашел в базу данных полиции")
					if (cServerID="2")
						Sleep 1200
					else
					{
						Random Rando, 4000, 8000
						Sleep %Rando%
					}
					SendChat("/me подал запрос о аннулировании водительского удостоверения")
				}
			}
			if (RegExMatch(lines[gw],"B	Материалы	(\d+)", questtake) && t1="tdr")
			{
				SendInput {Enter}
				ltake := true
				Sleep 250
				SendInput {ESC}
				if (cServerID="2")
					Sleep 1200
				else
				{
					Random Rando, 4000, 8000
					Sleep %Rando%
				}
				if (ltake)
				{
					if (isWoman)
						SendChat("/me достала из кармана пакет для улик и положила найденные предметы")
					else
						SendChat("/me достал из кармана пакет для улик и положил найденные предметы")
				}
			}
			if (RegExMatch(lines[gw],"A	Наркотики	(\d+)",questtake) && t1="tdr")
			{
				SendInput {Enter}
				ltake := true
				Sleep 250
				SendInput {ESC}
				if (cServerID="2")
					Sleep 1200
				else
				{
					Random Rando, 4000, 8000
					Sleep %Rando%
				}
				if (ltake)
				{
					if (isWoman)
						SendChat("/me достала из кармана пакет для улик и положила найденные предметы")
					else
						SendChat("/me достал из кармана пакет для улик и положил найденные предметы")
				}
			}
			if (RegExMatch(lines[gw],"O	Лицензия на оружие	([0-9]*)") && t1="tlgun")
			{
				setDialogIndex(gw - 1)
				SendInput {Enter}
				Sleep 500
				SendInput {ESC}
				Sleep 500
				ltake := true
				if (cServerID="2")
					Sleep 1200
				else
				{
					Random Rando, 4000, 8000
					Sleep %Rando%
				}
				if (isWoman)
				{
					SendChat("/me достала КПК из кармана и зашла в базу данных полиции")
					if (cServerID="2")
						Sleep 1200
					else
					{
						Random Rando, 4000, 8000
						Sleep %Rando%
					}
					SendChat("/me подала запрос о аннулировании лицензии на оружие")
				}
				else
				{
					SendChat("/me достал КПК из кармана и зашел в базу данных полиции")
					if (cServerID="2")
						Sleep 1200
					else
					{
						Random Rando, 4000, 8000
						Sleep %Rando%
					}
					SendChat("/me подал запрос о аннулировании лицензии на оружие")
				}
			}
		}
		if (!ltake)
		{
			SendInput {ESC}
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}У игрока отсутствует данный вид предмета!")
		}
	}
	else
	{
		zfrisk++
		goto, tgfrisk
	}
	return
}
if(RegExMatch(chatInput, "^\/fyk"))
{
	if(RegExMatch(chatInput, "^\/fyk([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/fyk$") || RegExMatch(chatInput, "^\/fyk $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /fyk [слово] (регистр важен)")
		return
	}
	RegExMatch(chatInput, "^\/fyk (.*)", t)
	Text := t1
	if(strlen(Text) < 2)
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Слишком мало символов. Минимум 2 символа.")
		return
	}
	Event["Active"] := true
	if (cServerID="2")
	{
		Loop, Read, %Penal2%
		{
			if (RegExMatch(A_LoopReadLine, "" Text "", name))
			{
				Event["Active"] := False
				ZText := A_LoopReadLine
				ZText := TextSeparator(ZText, 130)
				str := strsplit(ZText, "`n")
				Loop, % str.MaxIndex() {
					if (str[A_Index]!="")
						AddChatMessageEx("{FFFFFF}"," " str[A_Index] " ")
				}
				Sleep 50
			}
		}
	}
	if (cServerID="1")
	{
		Loop, Read, %Penal1%
		{
			if (RegExMatch(A_LoopReadLine, "" Text "", name))
			{
				ZText := A_LoopReadLine
				ZText := TextSeparator(ZText, 130)
				str := strsplit(ZText, "`n")
				Loop, % str.MaxIndex() {
					if (str[A_Index]!="")
						AddChatMessageEx("{FFFFFF}"," " str[A_Index] " ")
				}
				Event["Active"] := False
				Sleep 50
			}
		}
	}
	if (Event["Active"])
	{
		Event["Active"] := False
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}По вашему запросу ничего не найдено")
	}
	return
}
if(RegExMatch(chatInput, "^\/fak"))
{
	if(RegExMatch(chatInput, "^\/fak([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/fak$") || RegExMatch(chatInput, "^\/fak $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /fak [слово] (регистр важен)")
		return
	}
	RegExMatch(chatInput, "^\/fak (.*)", t)
	Text := t1
	if(strlen(Text) < 2)
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Слишком мало символов. Минимум 2 символа.")
		return
	}
	Event["Active"] := true
	if (cServerID="2")
	{
		Loop, Read, %Administrative2%
		{
			if (RegExMatch(A_LoopReadLine, "" Text "", name))
			{
				ZText := A_LoopReadLine
				ZText := TextSeparator(ZText, 130)
				str := strsplit(ZText, "`n")
				Loop, % str.MaxIndex() {
					if (str[A_Index]!="")
						AddChatMessageEx("{FFFFFF}"," " str[A_Index] " ")
				}
				Event["Active"] := False
				Sleep 50
			}
		}
	}
	if (cServerID="1")
	{
		Loop, Read, %Administrative1%
		{
			if (RegExMatch(A_LoopReadLine, "" Text "", name))
			{
				Event["Active"] := False
				ZText := A_LoopReadLine
				ZText := TextSeparator(ZText, 130)
				str := strsplit(ZText, "`n")
				Loop, % str.MaxIndex() {
					if (str[A_Index]!="")
						AddChatMessageEx("{FFFFFF}"," " str[A_Index] " ")
				}
				Sleep 50
			}
		}
	}
	if (Event["Active"])
	{
		Event["Active"] := False
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}По вашему запросу ничего не найдено")
	}
	return
}
if(RegExMatch(chatInput, "^\/ffp"))
{
	if(RegExMatch(chatInput, "^\/ffp([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/ffp$") || RegExMatch(chatInput, "^\/ffp $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /ffp [слово] (регистр важен)")
		return
	}
	RegExMatch(chatInput, "^\/ffp (.*)", t)
	Text := t1
	if(strlen(Text) < 2)
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Слишком мало символов. Минимум 2 символа.")
		return
	}
	Event["Active"] := true
	if (cServerID="2")
	{
		Loop, Read, %FedP2%
		{
			if (RegExMatch(A_LoopReadLine, "" Text "", name))
			{
				Event["Active"] := False
				ZText := A_LoopReadLine
				ZText := TextSeparator(ZText, 130)
				str := strsplit(ZText, "`n")
				Loop, % str.MaxIndex() {
					if (str[A_Index]!="")
						AddChatMessageEx("{FFFFFF}"," " str[A_Index] " ")
				}
				Sleep 50
			}
		}
	}
	if (cServerID="1")
	{
		Loop, Read, %FedP1%
		{
			if (RegExMatch(A_LoopReadLine, "" Text "", name))
			{
				Event["Active"] := False
				ZText := A_LoopReadLine
				ZText := TextSeparator(ZText, 130)
				str := strsplit(ZText, "`n")
				Loop, % str.MaxIndex() {
					if (str[A_Index]!="")
						AddChatMessageEx("{FFFFFF}"," " str[A_Index] " ")
				}
				Sleep 50
			}
		}
	}
	if (Event["Active"])
	{
		Event["Active"] := False
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}По вашему запросу ничего не найдено")
	}
	return
}
if(RegExMatch(chatInput, "^\/zap"))
{
	if(RegExMatch(chatInput, "^\/zap([^ ])"))
		return
	if(RegExMatch(chatInput, "^\/zap$") || RegExMatch(chatInput, "^\/zap $") || RegExMatch(chatInput, "^\/zap (\d+)$") || RegExMatch(chatInput, "^\/zap (\d+) $"))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте: {ffc801}/zap [id] [Причина]")
		return
	}
	{
		RegExMatch(chatInput, "/zap (?<Id>\d+) (.*)", Closed)
		updateOScoreboardData()
		ClosedName := getPlayerNameById(ClosedId)
		if (ClosedName!="")
		{
			gNick := RegExReplace(ClosedName, "_", " ")
			if (cServerID="1")
			{
				if (Rang < 6 && Fraction!="4")
					SendChat("/r " Tag " Дело " gNick " рассмотрению не подлежит - " Closed2 ".")
				else
					SendChat("/d Mayor, дело " gNick " рассмотрению не подлежит - " Closed2 ".")
			}
			if (cServerID="2")
			{
				if (Rang < 11 && Fraction!="4")
					SendChat("/r " Tag " Дело " gNick " рассмотрению не подлежит - " Closed2 ".")
				else
					SendChat("/d [City Hall] Дело " gNick " рассмотрению не подлежит - " Closed2 ".")
			}
		}
		else
		{
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Данный игрок не в игре")
		}
	}
	return
}
if(RegExMatch(chatInput, "^\/su "))
{
	if(RegExMatch(chatInput, "^\/su([^ ])"))
		return
	if(RegExMatch(chatInput, "^\/su (\d+) (\d+) (.*)"))
		SendChat(chatInput)
	if((RegExMatch(chatInput, "^\/su$") || RegExMatch(chatInput, "^\/su $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /su [ID]")
		return
	}
	if (SuError="1")
	{
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Произошла ошибка. Введите команду еще раз.")
		SuError := "0"
		return
	}
	param2 := ""
	Ct := ""
	if (RegExMatch(chatInput, "^\/su (\d+)$", param) || RegExMatch(chatInput, "^\/su (\d+) (\d+)$", param))
	{
		Massiv := []
		NamePlayer := ""
		updateOScoreboardData()
		obnul := 0
		NamePlayer := getPlayerNameById(param1)
		if (param2!="")
			Ct := param2
		if(NamePlayer="")
		{
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Выбранный игрок не найден.")
			return
		}
		suba:
		Loop, read, %bDir%/su.txt
		{
			if(RegExMatch(A_LoopReadLine, "(.*) \- (\d+)"))
			{
				Massiv[A_Index] := "{FFD700}" . A_Index . "{FFFFFF} | " . A_LoopReadLine
				statya := statya . Massiv[A_Index] . "`n"
				obnul:=A_Index
			}
		}
		if (Ct!="")
		{
			DialogText := param2
			RegExMatch(Massiv[DialogText], ".*\d+.* \| (.*) \- (\d+)", _param)
			SendChat("/su " . param1 . " " . _param2 . " " . _param1)
			SuError := "0"
			statya =
			return
		}
		SuError := "1"
		statya := statya . "`n" . ""
		showDialog("2", "{ffc801}Объявление в розыск: {FF0000}" NamePlayer "","{ffc801}" statya , "Выбрать")
		Loop
		{
			if ((isDialogOpen()))
			{
				ssu:
				if ((GetKeyState("Enter", "P")) or (isDialogButtonSelected(1) = true and GetKeyState("LButton", "P")) or (GetKeyState("LButton", "P")))
				{
					Sleep 100
					if (isDialogOpen())
						goto, ssu
					DialogText := getDialogIndex()
					statya =
					if(DialogText < 1 || DialogText > obnul)
					{
						AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Вы ввели неверный номер статьи, введите от 1 до " . obnul . ".")
						SuError := "0"
						return
					}
					RegExMatch(Massiv[DialogText], ".*\d+.* \| (.*) \- (\d+)", _param)
					SendChat("/su " . param1 . " " . _param2 . " " . _param1)
					Sleep 250
					SuError := "0"
				}
				if (GetKeyState("ESC", "P"))
				{
					statya =
					SuError := "0"
					Return
				}
			}
			else
			{
				statya =
				SuError := "0"
				Return
			}
		}
		statya =
		SuError := "0"
	}
	return
}
if(RegExMatch(chatInput, "^\/z"))
{
	if(RegExMatch(chatInput, "^\/z([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/z$") || RegExMatch(chatInput, "^\/z $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /z [ID]")
		return
	}
	if (SuError="1")
	{
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Произошла ошибка. Введите команду еще раз.")
		SuError := "0"
		return
	}
	param2 := ""
	Ct := ""
	if (RegExMatch(chatInput, "^\/z (\d+)$", param) || RegExMatch(chatInput, "^\/z (\d+) (\d+)$", param))
	{
		Massiv := []
		updateOScoreboardData()
		obnul := 0
		NamePlayer := getPlayerNameById(param1)
		if (param2!="")
			Ct := param2
		if(NamePlayer == "")
		{
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Выбранный игрок не найден.")
			return
		}
		sub:
		Loop, read, %bDir%/su.txt
		{
			if(RegExMatch(A_LoopReadLine, "(.*) \- (\d+)"))
			{
				Massiv[A_Index] := "{FFD700}" . A_Index . "{FFFFFF} | " . A_LoopReadLine
				statya := statya . Massiv[A_Index] . "`n"
				obnul:=A_Index
			}
		}
		if (Ct="")
		{
			SuError := "1"
			statya := statya . "`n" . "{FFFFFF}Введите номер статьи. Пример: 11"
			showDialog("1", "{ffc801}Объявление в розыск: {FF0000}" NamePlayer "","{ffc801}" statya , "Отмена")
			statya =
			if (isDialogOpen())
			{
				Input, DialogText, V, {Enter}{Escape}{LButton}
				if(DialogText == "")
				{
					AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Вы не выбрали причину объявления в розыск.")
					SuError := "0"
					return
				}
				if(DialogText < 1 || DialogText > obnul)
				{
					AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}Вы ввели неверный номер статьи, введите от 1 до " . obnul . ".")
					SuError := "0"
					return
				}
			}
			else
				goto sub
		}
		else
			DialogText := param2
		RegExMatch(Massiv[DialogText], ".*\d+.* \| (.*) \- (\d+)", _param)
		SendChat("/su " . param1 . " " . _param2 . " " . _param1)
		SuError := "0"
	}
	return
}
if(RegExMatch(chatInput, "^\/cchat$"))
{
	Loop, 98
	AddChatMessageEx("FFFFFF","")
	Sleep 50
	AddChatMessageEx("FFFFFF","")
	return
}
if(RegExMatch(chatInput, "^\/q$"))
{
	Process, Close, gta_sa.exe
	return
}
if(RegExMatch(chatInput, "^\/tazersetoff$"))
{
	Event["Tazer"] := false
	Event["hTime"] := false
	AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} Вы успешно изменили местоположение Tazer HUD'a")
	stop := "1"
	IniWrite, % X, % iniFile, TextDraw, TazerX
	IniWrite, % Y, % iniFile, TextDraw, TazerY
	settimer, Time, 1000
	return
}
if(RegExMatch(chatInput, "^\/tazerset$"))
{
	Event["Tazer"] := false
	AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} Используйте мышку для редактирования. По завершению введите в чат - /tazersetoff")
	SendInput {F6}
	settimer, Time, off
	stop := "0"
	DestroyAllVisual()
	IniRead, TStyle, % iniFile, TextDraw, TazerStyle
	IniRead, TSize, % iniFile, TextDraw, TazerSize
	Loop
	{
		SX := x
		SY := y
		if (stop="1")
			Return
		MouseGetPos, x, y,
		if (!Event["hTazer"])
		{
			Event["hTazer"] := true
			text_overlay := TextCreate(TStyle, TSize, true, false, x, y, 0xFFFFFFFF, "Tazer: "sTazer, true, true)
		}
		else
		{
			if (SX!=x || SY!=y)
			{
				DestroyAllVisual()
				text_overlay := TextCreate(TStyle, TSize, true, false, x, y, 0xFFFFFFFF, "Tazer: "sTazer, true, true)
			}
		}
	}
	return
}
if(RegExMatch(chatInput, "^\/timesetoff$"))
{
	Event["Tazer"] := false
	Event["hTime"] := false
	AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} Вы успешно изменили местоположение Time HUD'a")
	stop := "1"
	IniWrite, % X, % iniFile, TextDraw, TimeX
	IniWrite, % Y, % iniFile, TextDraw, TimeY
	settimer, Time, 1000
	return
}
if(RegExMatch(chatInput, "^\/timeset$"))
{
	Event["Tazer"] := false
	AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} Используйте мышку для редактирования. По завершению введите в чат - /timesetoff")
	SendInput {F6}
	settimer, Time, off
	stop := "0"
	date := A_DD "." A_MM "." A_YYYY "  " A_Hour ":" A_Min ":" A_Sec
	DestroyAllVisual()
	IniRead, Size, % iniFile, TextDraw, TimeSize
	IniRead, Color, % iniFile, TextDraw, TimeColor
	IniRead, Style, % iniFile, TextDraw, TimeStyle
	Loop
	{
		SX := x
		SY := y
		if (stop="1")
			Return
		MouseGetPos, x, y,
		if (!Event["hTime"])
		{
			Event["hTime"] := true
			text_overlay := TextCreate(Style, Size, true, false, x, y, "0xFF"Color, date, true, true)
		}
		else
		{
			if (SX!=x || SY!=y)
			{
				DestroyAllVisual()
				text_overlay := TextCreate(Style, Size, true, false, x, y, "0xFF"Color, date, true, true)
			}
		}
	}
	return
}
if(RegExMatch(chatInput, "^\/tazersize"))
{
	if(RegExMatch(chatInput, "^\/tazersize([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/tazersize$") || RegExMatch(chatInput, "^\/tazersize $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /tazersize [размер шрифта]")
		return
	}
	if (RegExMatch(chatInput, "^\/tazersize (\d+)", t))
	{
		IniWrite, % t1, % iniFile, TextDraw, TazerSize
		IniRead, xTazer, % iniFile, TextDraw, TazerX
		IniRead, yTazer, % iniFile, TextDraw, TazerY
		IniRead, TStyle, % iniFile, TextDraw, TazerStyle
		settimer, Time, off
		date := A_DD "." A_MM "." A_YYYY "  " A_Hour ":" A_Min ":" A_Sec
		DestroyAllVisual()
		text_overlays := TextCreate(TStyle, t1, true, false, xTazer, yTazer, 0xFFFFFFFF, "Tazer: {FF0000}OFF", true, true)
		Event["hTime"] := false
		settimer, Time, 1000
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} Вы изменили размер HUD Tazer")
	}
	else
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /tazersize [размер шрифта]")
	return
}
if(RegExMatch(chatInput, "^\/tazerstyle"))
{
	if(RegExMatch(chatInput, "^\/tazerstyle([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/tazerstyle$") || RegExMatch(chatInput, "^\/tazerstyle $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /tazerstyle [номер]")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №1: Times New Roman")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №2: Calibri")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №3: Cambria")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №4: Adobe Caslon Pro")
		return
	}
	if (RegExMatch(chatInput, "^\/tazerstyle (\d+)", t))
	{
		if (t1="1")
			Style := "Times New Roman"
		else if (t1="2")
			Style := "Calibri"
		else if (t1="3")
			Style := "Cambria"
		else if (t1="4")
			Style := "Adobe Caslon Pro"
		else
		{
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /tazerstyle [номер]")
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №1: Times New Roman")
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №2: Calibri")
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №3: Cambria")
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №4: Adobe Caslon Pro")
			return
		}
		IniWrite, % Style, % iniFile, TextDraw, TazerStyle
		IniRead, xTazer, % iniFile, TextDraw, TazerX
		IniRead, yTazer, % iniFile, TextDraw, TazerY
		IniRead, TSize, % iniFile, TextDraw, TazerSize
		settimer, Time, off
		date := A_DD "." A_MM "." A_YYYY "  " A_Hour ":" A_Min ":" A_Sec
		DestroyAllVisual()
		text_overlays := TextCreate(Style, TSize, true, false, xTazer, yTazer, 0xFFFFFFFF, "Tazer: {FF0000}OFF", true, true)
		Event["hTime"] := false
		settimer, Time, 1000
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} Вы изменили шрифт HUD Tazer")
	}
	else
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /tazerstyle [номер]")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №1: Times New Roman")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №2: Calibri")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №3: Cambria")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №4: Adobe Caslon Pro")
	}
	return
}
if(RegExMatch(chatInput, "^\/timesize"))
{
	if(RegExMatch(chatInput, "^\/timesize([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/timesize$") || RegExMatch(chatInput, "^\/timesize $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /timesize [размер шрифта]")
		return
	}
	if (RegExMatch(chatInput, "^\/timesize (\d+)", t))
	{
		IniWrite, % t1, % iniFile, TextDraw, TimeSize
		IniRead, xTime, % iniFile, TextDraw, TimeX
		IniRead, yTime, % iniFile, TextDraw, TimeY
		IniRead, Color, % iniFile, TextDraw, TimeColor
		IniRead, Style, % iniFile, TextDraw, TimeStyle
		settimer, Time, off
		date := A_DD "." A_MM "." A_YYYY "  " A_Hour ":" A_Min ":" A_Sec
		DestroyAllVisual()
		text_overlay := TextCreate(Style, t1, true, false, xTime, yTime, "0xFF"Color, date, true, true)
		Event["hTime"] := false
		settimer, Time, 1000
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} Вы изменили размер HUD Time")
	}
	else
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /timesize [размер шрифта]")
	return
}
if(RegExMatch(chatInput, "^\/timecolor"))
{
	if(RegExMatch(chatInput, "^\/timecolor([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/timecolor$") || RegExMatch(chatInput, "^\/timecolor $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /timecolor [цвет]")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Имена цветов:{FF0000}red{FFFFFF}/{0000FF}blue{FFFFFF}/{696969}gray{FFFFFF}/{FFFFFF}white{FFFFFF}")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Имена цветов:{FFFF00}yellow{FFFFFF}/{008000}green")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Также вы можете использовать свой HTML цвет")
		return
	}
	if (RegExMatch(chatInput, "^\/timecolor (.*)", t))
	{
		if (t1="red")
			Color := "FF0000"
		else if (t1="blue")
			Color := "0000FF"
		else if (t1="gray")
			Color := "696969"
		else if (t1="white")
			Color := "FFFFFF"
		else if (t1="yellow")
			Color := "FFFF00"
		else if (t1="green")
			Color := "008000"
		else if (strlen(t1) = 6)
			Color := t1
		else
		{
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /timecolor [цвет]")
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Имена цветов:{FF0000}red{FFFFFF}/{0000FF}blue{FFFFFF}/{696969}gray{FFFFFF}/{FFFFFF}white{FFFFFF}")
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Имена цветов:{FFFF00}yellow{FFFFFF}/{008000}green")
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Также вы можете использовать свой HTML цвет")
			return
		}
		IniWrite, % Color, % iniFile, TextDraw, TimeColor
		IniRead, xTime, % iniFile, TextDraw, TimeX
		IniRead, Size, % iniFile, TextDraw, TimeSize
		IniRead, yTime, % iniFile, TextDraw, TimeY
		settimer, Time, off
		date := A_DD "." A_MM "." A_YYYY "  " A_Hour ":" A_Min ":" A_Sec
		DestroyAllVisual()
		text_overlay := TextCreate(Style, Size, true, false, xTime, yTime, "0xFF"Color, date, true, true)
		Event["hTime"] := false
		settimer, Time, 1000
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} Вы изменили цвет HUD Time")
	}
	else
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /timecolor [цвет]")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Имена цветов:{FF0000}red{FFFFFF}/{0000FF}blue{FFFFFF}/{696969}gray{FFFFFF}/{FFFFFF}white{FFFFFF}")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Имена цветов:{FFFF00}yellow{FFFFFF}/{008000}green")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Также вы можете использовать свой HTML цвет")
	}
	return
}
if(RegExMatch(chatInput, "^\/timestyle"))
{
	if(RegExMatch(chatInput, "^\/timestyle([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/timestyle$") || RegExMatch(chatInput, "^\/timestyle $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /timestyle [номер]")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №1: Times New Roman")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №2: Calibri")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №3: Cambria")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №4: Adobe Caslon Pro")
		return
	}
	if (RegExMatch(chatInput, "^\/timestyle (\d+)", t))
	{
		if (t1="1")
			Style := "Times New Roman"
		else if (t1="2")
			Style := "Calibri"
		else if (t1="3")
			Style := "Cambria"
		else if (t1="4")
			Style := "Adobe Caslon Pro"
		else
		{
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /timestyle [номер]")
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №1: Times New Roman")
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №2: Calibri")
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №3: Cambria")
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №4: Adobe Caslon Pro")
			return
		}
		IniWrite, % Style, % iniFile, TextDraw, TimeStyle
		IniRead, Color, % iniFile, TextDraw, TimeColor
		IniRead, xTime, % iniFile, TextDraw, TimeX
		IniRead, Size, % iniFile, TextDraw, TimeSize
		IniRead, yTime, % iniFile, TextDraw, TimeY
		settimer, Time, off
		date := A_DD "." A_MM "." A_YYYY "  " A_Hour ":" A_Min ":" A_Sec
		DestroyAllVisual()
		text_overlay := TextCreate(Style, Size, true, false, xTime, yTime, "0xFF"Color, date, true, true)
		Event["hTime"] := false
		settimer, Time, 1000
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} Вы изменили шрифт HUD Time")
	}
	else
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Используйте:{ffc801} /timestyle [номер]")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №1: Times New Roman")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №2: Calibri")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №3: Cambria")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Номера стилей №4: Adobe Caslon Pro")
	}
	return
}
if(RegExMatch(chatInput, "^\/rlogs$"))
{
	Filedelete, %bDir%\cinfo.txt
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Подождите, идёт загрузка...")
	Loop, Read, %Chatlog%
	{
		if ((RegExMatch(A_LoopReadLine, "^\[(..):(..):(..)\]\s\s(Кадет|Офицер|Мл.Сержант|Сержант|Прапорщик|Ст.Прапорщик|Мл.Лейтенант|Лейтенант|Ст.Лейтенант|Капитан|Майор|Подполковник|Полковник|Шериф)")) || (RegExMatch(A_LoopReadLine, "^\[(..):(..):(..)\]\s\s\(\(\ (Кадет|Офицер|Мл.Сержант|Сержант|Прапорщик|Ст.Прапорщик|Мл.Лейтенант|Лейтенант|Ст.Лейтенант|Капитан|Майор|Подполковник|Полковник|Шериф)")) || (RegExMatch(A_LoopReadLine, "^\[(..):(..):(..)\]\s\s(Стажёр|Дежурный|Мл.Агент|Агент CID|Агент DEA|Глава CID|Глава DEA|Инспектор|Зам.Директора|Директор)")) || (RegExMatch(A_LoopReadLine, "^\[(..):(..):(..)\]\s\s\(\(\ (Стажёр|Дежурный|Мл.Агент|Агент CID|Агент DEA|Глава CID|Глава DEA|Инспектор|Зам.Директора|Директор)")) || (RegExMatch(A_LoopReadLine, "^\[(..):(..):(..)\]\s\s\(\(\ (Секретарь|Адвокат|Охраник|Нач.Охраны|Нач. Охраны|Зам.Мэра|Зам. Мэра|Мэр)")) || (RegExMatch(A_LoopReadLine, "^\[(..):(..):(..)\]\s\s\(\(\ (Интерн|Санитар|Мед Брат|Спасатель|Нарколог|Доктор|Психолог|Хирург|Зам.Глав.Врача|Глав.Врач)")) || (RegExMatch(A_LoopReadLine, "^\[(..):(..):(..)\]\s\s(Секретарь|Адвокат|Охраник|Нач.Охраны|Нач. Охраны|Зам.Мэра|Зам. Мэра|Мэр)") || (RegExMatch(A_LoopReadLine,"^\[(..):(..):(..)\]\s\s(Интерн|Санитар|Мед.Брат|Спасатель|Нарколог|Доктор|Психолог|Хирург|Зам.Глав.Врача|Глав.Врач)"))))
		{
			FileAppend, % "{8D8DFF}" A_LoopReadLine "`n", %bDir%\cinfo.txt
			cinfo:=0
			w:=""
			loop, read, %bDir%\cinfo.txt
			{
				if (cinfo>0)
				{
					w.=A_LoopReadLine "`n"
				}
				cinfo++
			}
			if (cinfo>20)
			{
				filedelete, %bDir%\cinfo.txt
				fileappend, %w%, %bDir%\cinfo.txt
			}
		}
	}
	listrtextfordialog("" bDir "\cinfo.txt","{FFA500}Лог сообщений в рацию","0")
	return
}
if(RegExMatch(chatInput, "^\/dlogs$"))
{
	Filedelete, %bDir%\cinfo.txt
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Подождите, идёт загрузка...")
	Loop, Read, %Chatlog%
	{
		if (RegExMatch(A_LoopReadLine, "^\[(..):(..):(..)\]\s\s\[(Army|Police|FBI|Mayor|Instructors|Medic)(.*)", name))
		{
			FileAppend, % "{FF8282}" A_LoopReadLine "`n", %bDir%\cinfo.txt
			cinfo:=0
			w:=""
			loop, read, %bDir%\cinfo.txt
			{
				if (cinfo>0)
				{
					w.=A_LoopReadLine "`n"
				}
				cinfo++
			}
			if (cinfo>20)
			{
				filedelete, %bDir%\cinfo.txt
				fileappend, %w%, %bDir%\cinfo.txt
			}
		}
	}
	listrtextfordialog("" bDir "\cinfo.txt","{FFA500}Лог сообщений в департамент","0")
	return
}
if(RegExMatch(chatInput, "^\/sulogs$"))
{
	Filedelete, %bDir%\cinfo.txt
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}Подождите, идёт загрузка...")
	Loop, Read, %Chatlog%
	{
		if (RegExMatch(A_LoopReadLine, "^\[(..):(..):(..)\]\s\s\[Wanted (.*): (.*)] \[Сообщает: (.*)] \[(.*)\]", sulogs))
		{
			if (sulogs6!="Неизвестный")
			{
				FileAppend, % "{ffc801}" A_LoopReadLine "`n", %bDir%\cinfo.txt
				cinfo:=0
				w:=""
				loop, read, %bDir%\cinfo.txt
				{
					if (cinfo>0)
					{
						w.=A_LoopReadLine "`n"
					}
					cinfo++
				}
				if (cinfo>20)
				{
					filedelete, %bDir%\cinfo.txt
					fileappend, %w%, %bDir%\cinfo.txt
				}
			}
		}
	}
	listrtextfordialog("" bDir "\cinfo.txt","{FFA500}Лог объявлений в розыск","0")
	return
}


else
{
	unBlockChatInput()
	if(chatInput != "")
	{
		SendChat(chatInput)
		dwAddress := dwSAMP + 0x12D8F8
		writeString(hGTA, dwAddress, "")
	}
}
}
else
{
unBlockChatInput()
if(GetKeyState("LButton", "P") && isInChat() && !isDialogOpen())
	return
if (IdDialogLocal && isDialogOpen())
{
	if(GetKeyState("LButton", "P"))
	{
		Sleep, 400
		if (isDialogButtonSelected(2))
			IdDialogLocal:=0
		if(isDialogOpen() || isDialogButtonSelected(2))
			return
	}
	Line := getDialogLineNumber()
	dwAddress := dwSAMP + 0x12D8F8
	if (IdDialogLocal == 20)
	{
		if Line = 1
		{
			showdialog("2","Сумма выкупа за заложника","`nМэр [6] - 100.000 $`nЗам.Мэра [5] - 80.000 $`nНачальник охраны [4] - 60.000 $`nОхранник [3] - 40.000 $`nАдвокат [2] - 30.000 $`nСекретарь [1] - 20.000 $","Готово", "Отмена")
			IdDialogLocal := "0"
		}
		else if Line = 2
		{
			showdialog("2","Сумма выкупа за заложника","`nДиректор [10] - 100.000 $`nЗам.Директора [9] - 80.000 $`nИнспектор [8] - 70.000 $`nГлава CID [7] - 60.000 $`nГлава DEA [6] - 50.000 $`nАгент CID [5] - 40.000 $`nАгент DEA [4] - 30.000 $`nМл.Агент [3] - 25.000 $`nДежурный [2] - 20.000 $`nСтажер [1] - 15.000 $","Готово", "Отмена")
			IdDialogLocal := "0"
		}
		else if Line = 3
		{
			showdialog("2","Сумма выкупа за заложника","`nШериф [14] - 80.000 $`nПолковник [13] - 70.000 $`nПодполковник [12] - 65.000 $`nМайор [11] - 60.000 $`nКапитан [10] - 55.000 $`nСт.Лейтенант [9] - 50.000 $`nЛейтенант [8] - 45.000 $`nМл.Лейтенант [7] - 40.000 $`nСт.Прапорщик [6] - 35.000 $`nПрапорщик [5] - 30.000 $`nСержант [4] - 25.000 $`nМл.Сержант [3] - 20.000 $`nОфицер [2] - 15.000 $`nКадет [1] - 10.000 $","Готово", "Отмена")
			IdDialogLocal := "0"
		}
		else if Line = 4
		{
			showdialog("2","Сумма выкупа за заложника","`nГенерал [15] - 80.000 $`nПолковник [14] - 75.000 $`nПодполковник [13] - 70.000 $`nМайор [12] - 65.000 $`nКапитан [11] - 60.000 $`nСт.Лейтенант [10] - 55.000 $`nЛейтенант [9] - 50.000 $`nМл.Лейтенант [8] - 45.000 $`nПрапорщик [7] - 40.000 $`nСтаршина [6] - 35.000 $`nСт.Сержант [5] - 30.000 $`nСержант [4] - 25.000 $`nМл.Сержант [3] - 20.000 $`nЕфрейтор [2] - 15.000 $`nРядовой [1] - 10.000 $","Готово", "Отмена")
			IdDialogLocal := "0"
		}
		else if Line = 5
		{
			showdialog("2","Сумма выкупа за заложника","`nГлав.Врач [10] - 80.000 $`nЗам.Глав.Врача [9] - 75.000 $`nХирург [8] - 70.000 $`nПсихолог [7] - 60.000 $`nДоктор [6] - 40.000 $`nНарколог [5] - 35.000 $`nСпасатель [4] - 30.000 $`nМед.Брат [3] - 25.000 $`nСанитар [2] - 20.000 $`nИнтерн [1] - 15.000 $","Готово", "Отмена")
			IdDialogLocal := "0"
		}
		else if Line = 6
		{
			showdialog("2","Сумма выкупа за заложника","`nУправляющий [10] - 80.000 $`nДиректор [9] - 75.000 $`nСт.Менеджер [8] - 70.000 $`nМл.Менеджер [7] - 60.000 $`nКоординатор [6] - 55.000 $`nИнструктор [5] - 50.000 $`nМл.Инструктор [4] - 45.000 $`nЭкзаменатор [3] - 30.000 $`nКонсультант [2] - 25.000 $`nСтажер [1] - 20.000 $","Готово", "Отмена")
			IdDialogLocal := "0"
		}
		else if Line = 7
		{
			showdialog("2","Сумма выкупа за заложника","`nГенеральный Директор [10] - 70.000 $`nПрограмный Директор [9] - 60.000 $`nТехнический Директор [8] - 55.000 $`nГлавный Редактор [7] - 50.000 $`nРедактор [6] - 45.000 $`nВедущий [5] - 40.000 $`nРепортер [4] - 30.000 $`nЗвукорежиссер [3] - 25.000 $`nЗвукооператор [2] - 20.000 $`nСтажер [1] - 15.000 $","Готово", "Отмена")
			IdDialogLocal := "0"
		}
		else if Line = 8
		{
			showdialog("2","Сумма выкупа за заложника","`nЗахват мэрии без заложников — 100.000$Захват мэрии c заложниками — 150.000$`nЗахват офиса федерального бюро без заложников — 100.000$`nЗахват офиса федерального бюро c заложниками — 150.000$`nЗахват участка SAPD без заложников — 100.000$`n`nЗахват участка SAPD с заложниками — 150.000$`nЗахват больницы без заложников — 75.000$`nЗахват больницы с заложниками — 100.000$`nЗахват автошколы без заложников — 50.000$`nЗахват автошколы с заложниками — 75.000$`nЗахват СМИ без заложников — 50.000$`nЗахват СМИ с заложниками — 75.000$`nЗахват развлекательных/рабочих заведений без заложников — 50.000$`nЗахват развлекательных/рабочих заведений с заложниками — 75.000$","Готово", "Отмена")
			IdDialogLocal := "0"
		}
	}
	if (IdDialogLocal == 21)
	{
		RegExMatch(Massiv[Line], ".*\d+.* \| (.*) \- (\d+)", _param)
		SendChat("/su " . param1 . " " . _param2 . " " . _param1)
		IdDialogLocal := "0"
	}
	return
}
}
return
~*vk54::
if(!isInChat() && !isDialogOpen() && isRu() && isOpenT)
	SendInput, {f6}
return
~*F6::
IdDialogLocal:=0
if (isRU)
	SendMessage, 0x50,, 0x4190419,, A
return
~*ESC::
IdDialogLocal:=0
Return
