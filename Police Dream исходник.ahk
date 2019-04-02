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
global ovehicleNames := ["���������� Landstalker","���������� Bravura","���������� Buffalo","���������� Linerunner","���������� Perrenial","���������� Sentinel","���������� Dumper","���������� Firetruck","���������� Trashmaster","���������� Stretch","���������� Manana","���������� Infernus","���������� Voodoo","���������� Pony","���������� Mool","���������� Cheetah","������ ������","���������� ��������","���������� Moonbeam","���������� Esperanto","�����","���������� Washington","���������� Bobcat","���������� ����","���������� BF Injection","���������� ��������","���������� Premier","Enforcer","���������� Securicar","���������� Banshee","���������� Predator","��������","�����","���������","���������� Hotknife","��������","���������� Previon","��������","�����","���������� Stallion","���������� Rumpo","���������� RC Bandit","���������� Romero","Packer","�������","���������� Admiral","���������� Squalo","���������� Seasparrow","���������� Pizzaboy","���������� Tram","Trailer","���������� Turismo","���������� Speeder","Reefer","���������� Tropic","���������� Flatbed","���������� Yankee","���������� Caddy","���������� Solair","���������� Berkley'sRCVan","���������� Skimmer","��������� PCJ-600","������","��������� Freeway","���������� RCBaron","���������� RCRaider","���������� Glendale","���������� Oceanic","��������� Sanchez","���������� Sparrow","�������","�����������","���������� Coastguard","���������� Dinghy","���������� Hermes","���������� Sabre","���������� Rustler","���������� ZR-350","���������� Walton","���������� Regina","���������� Comet","���������� BMX","���������� Burrito","���������� Camper","���������� Marquis","���������� Baggage","���������� Dozer","�������� Maverick","�������� NewsChopper","���������� Rancher","PoliceCar","���������� Virgo","���������� Greenwood","���������� Jetmax","���������� Hotring","���������� Sandking","���������� Blista Compact","Police Maverick","���������� Boxvillde","���������� Benson","���������� Mesa","RCGoblin","���������� Hotring Racer A","���������� Hotring Racer B","���������� Bloodring Banger","���������� Rancher","���������� Super GT","���������� Elegant","���������� Journey","���������� Bike","���������� MountainBike","���������� Beagle","���������� Cropduster","���������� Stunt","���������","���������","���������� Nebula","���������� Majestic","���������� Buccaneer","������� Shamal","������� Hydra","��������� FCR-900","��������� NRG-500","HPV1000","���������� CementTruck","����������","���������� Fortuna","���������� Cadrona","FBITruck","���������� Willard","���������� Forklift","���������� Tractor","��������","���������� Feltzer","���������� Remington","���������� Slamvan","���������� Blade","���������� Freight","���������� Streak","���������� Vortex","���������� Vincent","���������� Bullet","���������� Clover","���������� Sadler","Firetruck","���������� Hustler","���������� Intruder","���������� Primo","���������� Cargobob","���������� Tampa","Sunrise","���������� Merit","���������� Utility","���������� Nevada","���������� Yosemite","���������� Windsor","�������","�������","���������� Uranus","���������� Jester","���������� Sultan","���������� Stratum","���������� Elegy","Raindance","���������� RCTiger","���������� Flash","���������� Tahoma","���������� Savanna","���������� Bandito","���������� FreightFlat","���������� StreakCarriage","���������� Kart","���������� Mower","���������� Dune","���������� Sweeper","���������� Broadway","Tornado","AT-400","DFT-30","���������� Huntley","���������� Stafford","��������� BF-400","�������","Tug","Trailer","���������� Emperor","��������� Wayfarer","���������� Euros","���������� �������� ���-�����","���������� Club","���������� FreightBox","���������� Trailer","Andromada","Dodo","RCCam","���������� Launch","PoliceCar","PoliceCar","PoliceCar","PoliceRanger","���������� Picador","S.W.A.T","���������� Alpha","���������� Phoenix","���������� GlendaleShit","���������� SadlerShit","���������� Luggage","���������� Luggage","���������� Stairs","���������� Boxville","Tiller","UtilityTrailer"]
global ovehicleNamesImpad := ["Landstalker","Bravura","Buffalo","Linerunner","Perrenial","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana","Infernus","Voodoo","Pony","Mool","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat","����","BF Injection","Hunter","Premier","Enforcer","Securicar","Banshee","Predator","Bus","Rhino","Barracks","Hotknife","Trailer","Previon","Bus","Taxi","Stallion","Rumpo","RC Bandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo","Speeder","Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkley'sRCVan","Skimmer","PCJ-600","Faggio","Freeway","RCBaron","RCRaider","Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR-350","Walton","Regina","Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","NewsChopper","Rancher","PoliceCar","Virgo","Greenwood","Jetmax","Hotring","Sandking","Blista Compact","Police Maverick","Boxvillde","Benson","Mesa","RCGoblin","Hotring Racer A","Hotring Racer B","Bloodring Banger","Rancher","Super GT","Elegant","Journey","Bike","MountainBike","Beagle","Cropduster","Stunt","Tanker","Roadtrain","Nebula","Majestic","Buccaneer","Shamal","Hydra","FCR-900","NRG-500","HPV1000","CementTruck","Towtruck","Fortuna","Cadrona","FBITruck","Willard","Forklift","Tractor","Combine Harvester","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent","Bullet","Clover","Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster","Monster","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RCTiger","Flash","Tahoma","Savanna","Bandito","FreightFlat","StreakCarriage","Kart","Mower","Dune","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley","Stafford","BF-400","Newsvan","Tug","Trailer","Emperor","Wayfarer","Euros","Hotdog","Club","FreightBox","Trailer","Andromada","Dodo","RCCam","Launch","PoliceCar","PoliceCar","PoliceCar","PoliceRanger","Picador","S.W.A.T","Alpha","Phoenix","GlendaleShit","SadlerShit","Luggage","Luggage","Stairs","Boxville","Tiller","UtilityTrailer"]
global oradiostationNames := ["Playback FM", "K Rose", "K-DST", "Bounce FM", "SF-UR", "Radio Los Santos", "Radio X", "CSR 103.9", "K-JAH West", "Master Sounds 98.3", "WCTR Talk Radio", "User Track Player", "Radio Off"]
global oweatherNames := ["EXTRASUNNY_LA", "SUNNY_LA", "EXTRASUNNY_SMOG_LA", "SUNNY_SMOG_LA", "CLOUDY_LA", "SUNNY_SF", "EXTRASUNNY_SF", "CLOUDY_SF", "RAINY_SF", "FOGGY_SF", "SUNNY_VEGAS", "EXTRASUNNY_VEGAS", "CLOUDY_VEGAS", "EXTRASUNNY_COUNTRYSIDE", "SUNNY_COUNTRYSIDE", "CLOUDY_COUNTRYSIDE", "RAINY_COUNTRYSIDE", "EXTRASUNNY_DESERT", "SUNNY_DESERT", "SANDSTORM_DESERT", "UNDERWATER", "EXTRACOLOURS_1", "EXTRACOLOURS_2"]
global color11namecars :=["�����-", "����-", "������-", "������-", "����-", "������-", "��������-", "������-", "����-", "����-", "����-", "����-", "������-", "����-", "����-", "����-", "������-", "������-", "������-", "����-", "����-", "��������-", "��������-", "����-", "����-", "����-", "����-", "����-", "����-", "����-", "���������-", "���������-", "������-", "����-", "����-", "����-", "�����-", "�����-", "����-", "������-", "���������-", "����-", "������-", "������-", "������-", "������-", "������-","����-", "����-", "����-", "����-", "������-", "����-", "����-", "����-", "���������-", "����-", "���������-", "������-", "����-", "����-", "���������-", "������-", "����-", "����-", "�����-", "���������-", "������-", "�����-", "������-", "������-", "������-", "����-", "����-", "���������-", "�����-", "����-", "���������-", "������-", "����-", "������-", "���������-", "������-", "������-", "���������-", "������-", "������-", "������-", "������-", "����-", "������-����-", "����-", "����-", "������-", "����-", "����-", "����-", "����-", "����-", "���������-", "����-", "����-", "���������-", "����-", "���������-", "����-", "������-", "����-", "������-", "����-", "���������-", "����-", "������-", "���������-", "������-", "��������-", "����-", "������-", "����-", "���������-", "���������-", "������-", "����-", "�����-", "��������-", "����-", "������-"]
global color12namecars := ["���������", "����������", "�������", "���������", "�������-�������", "������", "����������", "������-�������", "�������", "����-���������", "�������", "������-����������", "��������", "��������", "������", "��������", "������-��������", "������-���������", "������-�������", "�������", "�����", "����-����������", "�����", "����-���������", "�������", "�����", "������-���������", "����-�������", "��������", "������-�����", "���������", "����������", "�����-�������", "���������-�������", "�����-�������", "������� �����", "�����-�����", "����-�������", "������-�������", "���������", "������� �������", "������-�������", "������-���������", "���������", "������� �������", "������� �������", "������-����������", "����� ����������", "������-����������", "������-��������", "������-�������", "�������", "������-���������", "������ ����������", "������ �������", "������-���������", "������-�������", "������-�����","�����-�������", "�������", "������-�������", "����-�������", "������ ����", "������-���������", "��������", "�����", "����������", "������-������", "�����", "������", "����-�������", "�����", "��������", "����-�����", "����-�������", "�����-�����", "��������", "�����-�����", "�����-�����", "�����", "�����", "����-�������", "������ ����-�������", "����������", "���������", "��������", "�����-�������", "������ �������", "�������", "������-�������", "����������", "������-���������", "�������� �������", "������-������", "���������-���������", "�����-�����", "������� �������", "�����", "���������", "�����-�������", "�������-������", "�������", "��������", "������-������", "������-�������", "������-���������", "�����-�������", "����-�������", "�����-�����", "��������", "��������", "���������", "�������", "�����-���������", "�����-���������", "������-�������", "����������", "�����-�������", "����-�������", "�����", "������� �������", "��������", "��������", "������-�����", "�����", "�������� �����", "�������-�����", "����-�����"]
global color21namecars :=["������", "�����", "�������", "�������", "�����-�����", "�������", "���������", "����-�������", "������-�����", "�����", "����-�����", "�����", "����-�������", "�����", "������-�����", "������-�����", "�������", "��������", "�����-���������", "������-�����", "����-�����", "������ ���������", "�����-���������", "������-�����", "�����", "�����-�����", "������-�����", "�����", "����-�����", "������-�����", "�����-����������", "����������", "������-�������", "�����", "�����", "�����", "�����-�����", "����-�������", "�����", "����-�������", "�����-����������", "�����", "������ ��������", "��������", "�����-�������", "���������-��������", "������� ����","�����", "������-�����", "������-�����", "�����", "������-�������", "�����", "�����", "�����������", "�����", "������-�����", "������� ����", "�����-��������", "����-�������", "������-�����", "������ ��������", "�����-���������", "�����", "�����", "������ ���������", "����� ����������", "����-�������", "������� ����", "����� � �������", "������ ��������", "�������", "�����-�����", "������-�����", "�����-����������", "�����-�����", "������-�����", "������� �����", "������� ��������", "�����", "������-���������", "�����", "�����-��������", "�����-�������", "�������� �������", "���������", "������-�������", "�������", "��������������", "������� �����", "������-�����", "����-�����", "�����", "�������", "������-������", "�����", "������-�����", "�����", "�����-�����", "������� �����", "�������", "�����-�����", "������� �����", "�����", "�����", "�����", "�����-�������", "��������", "�������", "�����-�����", "�����", "������-�����", "�������", "����������", "�����", "���������", "�����", "��������", "������-�����", "�����", "�����", "�����-��������", "�����-�����", "���������", "�����-���������", "�����", "�������"]
global color22namecars := ["���������", "����������", "�������", "���������", "�������-�������", "������", "����������", "������-�������", "�������", "����-���������", "�������", "������-����������", "��������", "��������", "������", "��������", "������-��������", "������-���������", "������-�������", "�������", "�����", "����-����������", "�����", "����-���������", "�������", "�����", "������-���������", "����-�������", "��������", "������-�����", "���������", "����������", "�����-�������", "���������-�������", "�����-�������", "������� �����", "�����-�����", "����-�������", "������-�������", "���������", "������� �������", "������-�������", "������-���������", "���������", "������� �������", "������� �������", "������-����������", "����� ����������", "������-����������", "������-��������", "������-�������", "�������", "������-���������", "������ ����������", "������ �������", "������-���������", "������-�������", "������-�����","�����-�������", "�������", "������-�������", "����-�������", "������ ����", "������-���������", "��������", "�����", "����������", "������-������", "�����", "������", "����-�������", "�����", "��������", "����-�����", "����-�������", "�����-�����", "��������", "�����-�����", "�����-�����", "�����", "�����", "����-�������", "������ ����-�������", "����������", "���������", "��������", "�����-�������", "������ �������", "�������", "������-�������", "����������", "������-���������", "�������� �������", "������-������", "���������-���������", "�����-�����", "������� �������", "�����", "���������", "�����-�������", "�������-������", "�������", "��������", "������-������", "������-�������", "������-���������", "�����-�������", "����-�������", "�����-�����", "��������", "��������", "���������", "�������", "�����-���������", "�����-���������", "������-�������", "����������", "�����-�������", "����-�������", "�����", "������� �������", "��������", "��������", "������-�����", "�����", "�������� �����", "�������-�����", "����-�����"]
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
msgbox, , ������ ��������� ������ %vupd%, %updupd%
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
AddZone("�-1", -3000.000000,2500.000000,-500,-2750.000000,2750.000000,500)
AddZone("�-2", -2750.000000,2500.000000,-500,-2500.000000,2750.000000,500)
AddZone("�-3", -2500.000000,2500.000000,-500,-2250.000000,2750.000000,500)
AddZone("�-4", -2250.000000,2500.000000,-500,-2000.000000,2750.000000,500)
AddZone("�-5", -2000.000000,2500.000000,-500,-1750.000000,2750.000000,500)
AddZone("�-6", -1750.000000,2500.000000,-500,-1500.000000,2750.000000,500)
AddZone("�-7", -1500.000000,2500.000000,-500,-1250.000000,2750.000000,500)
AddZone("�-8", -1250.000000,2500.000000,-500,-1000.000000,2750.000000,500)
AddZone("�-9", -1000.000000,2500.000000,-500,-750.000000,2750.000000,500)
AddZone("�-10", -750.000000,2500.000000,-500,-500.000000,2750.000000,500)
AddZone("�-11", -500.000000,2500.000000,-500,-250.000000,2750.000000,500)
AddZone("�-12", -250.000000,2500.000000,-500,0.000000,2750.000000,500)
AddZone("�-13", 0.000000,2500.000000,-500,250.000000,2750.000000,500)
AddZone("�-14", 250.000000,2500.000000,-500,500.000000,2750.000000,500)
AddZone("�-15", 500.000000,2500.000000,-500,750.000000,2750.000000,500)
AddZone("�-16", 750.000000,2500.000000,-500,1000.000000,2750.000000,500)
AddZone("�-17", 1000.000000,2500.000000,-500,1250.000000,2750.000000,500)
AddZone("�-18", 1250.000000,2500.000000,-500,1500.000000,2750.000000,500)
AddZone("�-19", 1500.000000,2500.000000,-500,1750.000000,2750.000000,500)
AddZone("�-20", 1750.000000,2500.000000,-500,2000.000000,2750.000000,500)
AddZone("�-21", 2000.000000,2500.000000,-500,2250.000000,2750.000000,500)
AddZone("�-22", 2250.000000,2500.000000,-500,2500.000000,2750.000000,500)
AddZone("�-23", 2500.000000,2500.000000,-500,2750.000000,2750.000000,500)
AddZone("�-24", 2750.000000,2500.000000,-500,3000.000000,2750.000000,500)
AddZone("�-1", -3000.000000,2250.000000,-500,-2750.000000,2500.000000,500)
AddZone("�-2", -2750.000000,2250.000000,-500,-2500.000000,2500.000000,500)
AddZone("�-3", -2500.000000,2250.000000,-500,-2250.000000,2500.000000,500)
AddZone("�-4", -2250.000000,2250.000000,-500,-2000.000000,2500.000000,500)
AddZone("�-5", -2000.000000,2250.000000,-500,-1750.000000,2500.000000,500)
AddZone("�-6", -1750.000000,2250.000000,-500,-1500.000000,2500.000000,500)
AddZone("�-7", -1500.000000,2250.000000,-500,-1250.000000,2500.000000,500)
AddZone("�-8", -1250.000000,2250.000000,-500,-1000.000000,2500.000000,500)
AddZone("�-9", -1000.000000,2250.000000,-500,-750.000000,2500.000000,500)
AddZone("�-10", -750.000000,2250.000000,-500,-500.000000,2500.000000,500)
AddZone("�-11", -500.000000,2250.000000,-500,-250.000000,2500.000000,500)
AddZone("�-12", -250.000000,2250.000000,-500,0.000000,2500.000000,500)
AddZone("�-13", 0.000000,2250.000000,-500,250.000000,2500.000000,500)
AddZone("�-14", 250.000000,2250.000000,-500,500.000000,2500.000000,500)
AddZone("�-15", 500.000000,2250.000000,-500,750.000000,2500.000000,500)
AddZone("�-16", 750.000000,2250.000000,-500,1000.000000,2500.000000,500)
AddZone("�-17", 1000.000000,2250.000000,-500,1250.000000,2500.000000,500)
AddZone("�-18", 1250.000000,2250.000000,-500,1500.000000,2500.000000,500)
AddZone("�-19", 1500.000000,2250.000000,-500,1750.000000,2500.000000,500)
AddZone("�-20", 1750.000000,2250.000000,-500,2000.000000,2500.000000,500)
AddZone("�-21", 2000.000000,2250.000000,-500,2250.000000,2500.000000,500)
AddZone("�-22", 2250.000000,2250.000000,-500,2500.000000,2500.000000,500)
AddZone("�-23", 2500.000000,2250.000000,-500,2750.000000,2500.000000,500)
AddZone("�-24", 2750.000000,2250.000000,-500,3000.000000,2500.000000,500)
AddZone("�-1", -3000.000000,2000.000000,-500,-2750.000000,2250.000000,500)
AddZone("�-2", -2750.000000,2000.000000,-500,-2500.000000,2250.000000,500)
AddZone("�-3", -2500.000000,2000.000000,-500,-2250.000000,2250.000000,500)
AddZone("�-4", -2250.000000,2000.000000,-500,-2000.000000,2250.000000,500)
AddZone("�-5", -2000.000000,2000.000000,-500,-1750.000000,2250.000000,500)
AddZone("�-6", -1750.000000,2000.000000,-500,-1500.000000,2250.000000,500)
AddZone("�-7", -1500.000000,2000.000000,-500,-1250.000000,2250.000000,500)
AddZone("�-8", -1250.000000,2000.000000,-500,-1000.000000,2250.000000,500)
AddZone("�-9", -1000.000000,2000.000000,-500,-750.000000,2250.000000,500)
AddZone("�-10", -750.000000,2000.000000,-500,-500.000000,2250.000000,500)
AddZone("�-11", -500.000000,2000.000000,-500,-250.000000,2250.000000,500)
AddZone("�-12", -250.000000,2000.000000,-500,0.000000,2250.000000,500)
AddZone("�-13", 0.000000,2000.000000,-500,250.000000,2250.000000,500)
AddZone("�-14", 250.000000,2000.000000,-500,500.000000,2250.000000,500)
AddZone("�-15", 500.000000,2000.000000,-500,750.000000,2250.000000,500)
AddZone("�-16", 750.000000,2000.000000,-500,1000.000000,2250.000000,500)
AddZone("�-17", 1000.000000,2000.000000,-500,1250.000000,2250.000000,500)
AddZone("�-18", 1250.000000,2000.000000,-500,1500.000000,2250.000000,500)
AddZone("�-19", 1500.000000,2000.000000,-500,1750.000000,2250.000000,500)
AddZone("�-20", 1750.000000,2000.000000,-500,2000.000000,2250.000000,500)
AddZone("�-21", 2000.000000,2000.000000,-500,2250.000000,2250.000000,500)
AddZone("�-22", 2250.000000,2000.000000,-500,2500.000000,2250.000000,500)
AddZone("�-23", 2500.000000,2000.000000,-500,2750.000000,2250.000000,500)
AddZone("�-24", 2750.000000,2000.000000,-500,3000.000000,2250.000000,500)
AddZone("�-1", -3000.000000,1750.000000,-500,-2750.000000,2000.000000,500)
AddZone("�-2", -2750.000000,1750.000000,-500,-2500.000000,2000.000000,500)
AddZone("�-3", -2500.000000,1750.000000,-500,-2250.000000,2000.000000,500)
AddZone("�-4", -2250.000000,1750.000000,-500,-2000.000000,2000.000000,500)
AddZone("�-5", -2000.000000,1750.000000,-500,-1750.000000,2000.000000,500)
AddZone("�-6", -1750.000000,1750.000000,-500,-1500.000000,2000.000000,500)
AddZone("�-7", -1500.000000,1750.000000,-500,-1250.000000,2000.000000,500)
AddZone("�-8", -1250.000000,1750.000000,-500,-1000.000000,2000.000000,500)
AddZone("�-9", -1000.000000,1750.000000,-500,-750.000000,2000.000000,500)
AddZone("�-10", -750.000000,1750.000000,-500,-500.000000,2000.000000,500)
AddZone("�-11", -500.000000,1750.000000,-500,-250.000000,2000.000000,500)
AddZone("�-12", -250.000000,1750.000000,-500,0.000000,2000.000000,500)
AddZone("�-13", 0.000000,1750.000000,-500,250.000000,2000.000000,500)
AddZone("�-14", 250.000000,1750.000000,-500,500.000000,2000.000000,500)
AddZone("�-15", 500.000000,1750.000000,-500,750.000000,2000.000000,500)
AddZone("�-16", 750.000000,1750.000000,-500,1000.000000,2000.000000,500)
AddZone("�-17", 1000.000000,1750.000000,-500,1250.000000,2000.000000,500)
AddZone("�-18", 1250.000000,1750.000000,-500,1500.000000,2000.000000,500)
AddZone("�-19", 1500.000000,1750.000000,-500,1750.000000,2000.000000,500)
AddZone("�-20", 1750.000000,1750.000000,-500,2000.000000,2000.000000,500)
AddZone("�-21", 2000.000000,1750.000000,-500,2250.000000,2000.000000,500)
AddZone("�-22", 2250.000000,1750.000000,-500,2500.000000,2000.000000,500)
AddZone("�-23", 2500.000000,1750.000000,-500,2750.000000,2000.000000,500)
AddZone("�-24", 2750.000000,1750.000000,-500,3000.000000,2000.000000,500)
AddZone("�-1", -3000.000000,1500.000000,-500,-2750.000000,1750.000000,500)
AddZone("�-2", -2750.000000,1500.000000,-500,-2500.000000,1750.000000,500)
AddZone("�-3", -2500.000000,1500.000000,-500,-2250.000000,1750.000000,500)
AddZone("�-4", -2250.000000,1500.000000,-500,-2000.000000,1750.000000,500)
AddZone("�-5", -2000.000000,1500.000000,-500,-1750.000000,1750.000000,500)
AddZone("�-6", -1750.000000,1500.000000,-500,-1500.000000,1750.000000,500)
AddZone("�-7", -1500.000000,1500.000000,-500,-1250.000000,1750.000000,500)
AddZone("�-8", -1250.000000,1500.000000,-500,-1000.000000,1750.000000,500)
AddZone("�-9", -1000.000000,1500.000000,-500,-750.000000,1750.000000,500)
AddZone("�-10", -750.000000,1500.000000,-500,-500.000000,1750.000000,500)
AddZone("�-11", -500.000000,1500.000000,-500,-250.000000,1750.000000,500)
AddZone("�-12", -250.000000,1500.000000,-500,0.000000,1750.000000,500)
AddZone("�-13", 0.000000,1500.000000,-500,250.000000,1750.000000,500)
AddZone("�-14", 250.000000,1500.000000,-500,500.000000,1750.000000,500)
AddZone("�-15", 500.000000,1500.000000,-500,750.000000,1750.000000,500)
AddZone("�-16", 750.000000,1500.000000,-500,1000.000000,1750.000000,500)
AddZone("�-17", 1000.000000,1500.000000,-500,1250.000000,1750.000000,500)
AddZone("�-18", 1250.000000,1500.000000,-500,1500.000000,1750.000000,500)
AddZone("�-19", 1500.000000,1500.000000,-500,1750.000000,1750.000000,500)
AddZone("�-20", 1750.000000,1500.000000,-500,2000.000000,1750.000000,500)
AddZone("�-21", 2000.000000,1500.000000,-500,2250.000000,1750.000000,500)
AddZone("�-22", 2250.000000,1500.000000,-500,2500.000000,1750.000000,500)
AddZone("�-23", 2500.000000,1500.000000,-500,2750.000000,1750.000000,500)
AddZone("�-24", 2750.000000,1500.000000,-500,3000.000000,1750.000000,500)
AddZone("�-1", -3000.000000,1250.000000,-500,-2750.000000,1500.000000,500)
AddZone("�-2", -2750.000000,1250.000000,-500,-2500.000000,1500.000000,500)
AddZone("�-3", -2500.000000,1250.000000,-500,-2250.000000,1500.000000,500)
AddZone("�-4", -2250.000000,1250.000000,-500,-2000.000000,1500.000000,500)
AddZone("�-5", -2000.000000,1250.000000,-500,-1750.000000,1500.000000,500)
AddZone("�-6", -1750.000000,1250.000000,-500,-1500.000000,1500.000000,500)
AddZone("�-7", -1500.000000,1250.000000,-500,-1250.000000,1500.000000,500)
AddZone("�-8", -1250.000000,1250.000000,-500,-1000.000000,1500.000000,500)
AddZone("�-9", -1000.000000,1250.000000,-500,-750.000000,1500.000000,500)
AddZone("�-10", -750.000000,1250.000000,-500,-500.000000,1500.000000,500)
AddZone("�-11", -500.000000,1250.000000,-500,-250.000000,1500.000000,500)
AddZone("�-12", -250.000000,1250.000000,-500,0.000000,1500.000000,500)
AddZone("�-13", 0.000000,1250.000000,-500,250.000000,1500.000000,500)
AddZone("�-14", 250.000000,1250.000000,-500,500.000000,1500.000000,500)
AddZone("�-15", 500.000000,1250.000000,-500,750.000000,1500.000000,500)
AddZone("�-16", 750.000000,1250.000000,-500,1000.000000,1500.000000,500)
AddZone("�-17", 1000.000000,1250.000000,-500,1250.000000,1500.000000,500)
AddZone("�-18", 1250.000000,1250.000000,-500,1500.000000,1500.000000,500)
AddZone("�-19", 1500.000000,1250.000000,-500,1750.000000,1500.000000,500)
AddZone("�-20", 1750.000000,1250.000000,-500,2000.000000,1500.000000,500)
AddZone("�-21", 2000.000000,1250.000000,-500,2250.000000,1500.000000,500)
AddZone("�-22", 2250.000000,1250.000000,-500,2500.000000,1500.000000,500)
AddZone("�-23", 2500.000000,1250.000000,-500,2750.000000,1500.000000,500)
AddZone("�-24", 2750.000000,1250.000000,-500,3000.000000,1500.000000,500)
AddZone("�-1", -3000.000000,1000.000000,-500,-2750.000000,1250.000000,500)
AddZone("�-2", -2750.000000,1000.000000,-500,-2500.000000,1250.000000,500)
AddZone("�-3", -2500.000000,1000.000000,-500,-2250.000000,1250.000000,500)
AddZone("�-4", -2250.000000,1000.000000,-500,-2000.000000,1250.000000,500)
AddZone("�-5", -2000.000000,1000.000000,-500,-1750.000000,1250.000000,500)
AddZone("�-6", -1750.000000,1000.000000,-500,-1500.000000,1250.000000,500)
AddZone("�-7", -1500.000000,1000.000000,-500,-1250.000000,1250.000000,500)
AddZone("�-8", -1250.000000,1000.000000,-500,-1000.000000,1250.000000,500)
AddZone("�-9", -1000.000000,1000.000000,-500,-750.000000,1250.000000,500)
AddZone("�-10", -750.000000,1000.000000,-500,-500.000000,1250.000000,500)
AddZone("�-11", -500.000000,1000.000000,-500,-250.000000,1250.000000,500)
AddZone("�-12", -250.000000,1000.000000,-500,0.000000,1250.000000,500)
AddZone("�-13", 0.000000,1000.000000,-500,250.000000,1250.000000,500)
AddZone("�-14", 250.000000,1000.000000,-500,500.000000,1250.000000,500)
AddZone("�-15", 500.000000,1000.000000,-500,750.000000,1250.000000,500)
AddZone("�-16", 750.000000,1000.000000,-500,1000.000000,1250.000000,500)
AddZone("�-17", 1000.000000,1000.000000,-500,1250.000000,1250.000000,500)
AddZone("�-18", 1250.000000,1000.000000,-500,1500.000000,1250.000000,500)
AddZone("�-19", 1500.000000,1000.000000,-500,1750.000000,1250.000000,500)
AddZone("�-20", 1750.000000,1000.000000,-500,2000.000000,1250.000000,500)
AddZone("�-21", 2000.000000,1000.000000,-500,2250.000000,1250.000000,500)
AddZone("�-22", 2250.000000,1000.000000,-500,2500.000000,1250.000000,500)
AddZone("�-23", 2500.000000,1000.000000,-500,2750.000000,1250.000000,500)
AddZone("�-24", 2750.000000,1000.000000,-500,3000.000000,1250.000000,500)
AddZone("�-1", -3000.000000,750.000000,-500,-2750.000000,1000.000000,500)
AddZone("�-2", -2750.000000,750.000000,-500,-2500.000000,1000.000000,500)
AddZone("�-3", -2500.000000,750.000000,-500,-2250.000000,1000.000000,500)
AddZone("�-4", -2250.000000,750.000000,-500,-2000.000000,1000.000000,500)
AddZone("�-5", -2000.000000,750.000000,-500,-1750.000000,1000.000000,500)
AddZone("�-6", -1750.000000,750.000000,-500,-1500.000000,1000.000000,500)
AddZone("�-7", -1500.000000,750.000000,-500,-1250.000000,1000.000000,500)
AddZone("�-8", -1250.000000,750.000000,-500,-1000.000000,1000.000000,500)
AddZone("�-9", -1000.000000,750.000000,-500,-750.000000,1000.000000,500)
AddZone("�-10", -750.000000,750.000000,-500,-500.000000,1000.000000,500)
AddZone("�-11", -500.000000,750.000000,-500,-250.000000,1000.000000,500)
AddZone("�-12", -250.000000,750.000000,-500,0.000000,1000.000000,500)
AddZone("�-13", 0.000000,750.000000,-500,250.000000,1000.000000,500)
AddZone("�-14", 250.000000,750.000000,-500,500.000000,1000.000000,500)
AddZone("�-15", 500.000000,750.000000,-500,750.000000,1000.000000,500)
AddZone("�-16", 750.000000,750.000000,-500,1000.000000,1000.000000,500)
AddZone("�-17", 1000.000000,750.000000,-500,1250.000000,1000.000000,500)
AddZone("�-18", 1250.000000,750.000000,-500,1500.000000,1000.000000,500)
AddZone("�-19", 1500.000000,750.000000,-500,1750.000000,1000.000000,500)
AddZone("�-20", 1750.000000,750.000000,-500,2000.000000,1000.000000,500)
AddZone("�-21", 2000.000000,750.000000,-500,2250.000000,1000.000000,500)
AddZone("�-22", 2250.000000,750.000000,-500,2500.000000,1000.000000,500)
AddZone("�-23", 2500.000000,750.000000,-500,2750.000000,1000.000000,500)
AddZone("�-24", 2750.000000,750.000000,-500,3000.000000,1000.000000,500)
AddZone("�-1", -3000.000000,500.000000,-500,-2750.000000,750.000000,500)
AddZone("�-2", -2750.000000,500.000000,-500,-2500.000000,750.000000,500)
AddZone("�-3", -2500.000000,500.000000,-500,-2250.000000,750.000000,500)
AddZone("�-4", -2250.000000,500.000000,-500,-2000.000000,750.000000,500)
AddZone("�-5", -2000.000000,500.000000,-500,-1750.000000,750.000000,500)
AddZone("�-6", -1750.000000,500.000000,-500,-1500.000000,750.000000,500)
AddZone("�-7", -1500.000000,500.000000,-500,-1250.000000,750.000000,500)
AddZone("�-8", -1250.000000,500.000000,-500,-1000.000000,750.000000,500)
AddZone("�-9", -1000.000000,500.000000,-500,-750.000000,750.000000,500)
AddZone("�-10", -750.000000,500.000000,-500,-500.000000,750.000000,500)
AddZone("�-11", -500.000000,500.000000,-500,-250.000000,750.000000,500)
AddZone("�-12", -250.000000,500.000000,-500,0.000000,750.000000,500)
AddZone("�-13", 0.000000,500.000000,-500,250.000000,750.000000,500)
AddZone("�-14", 250.000000,500.000000,-500,500.000000,750.000000,500)
AddZone("�-15", 500.000000,500.000000,-500,750.000000,750.000000,500)
AddZone("�-16", 750.000000,500.000000,-500,1000.000000,750.000000,500)
AddZone("�-17", 1000.000000,500.000000,-500,1250.000000,750.000000,500)
AddZone("�-18", 1250.000000,500.000000,-500,1500.000000,750.000000,500)
AddZone("�-19", 1500.000000,500.000000,-500,1750.000000,750.000000,500)
AddZone("�-20", 1750.000000,500.000000,-500,2000.000000,750.000000,500)
AddZone("�-21", 2000.000000,500.000000,-500,2250.000000,750.000000,500)
AddZone("�-22", 2250.000000,500.000000,-500,2500.000000,750.000000,500)
AddZone("�-23", 2500.000000,500.000000,-500,2750.000000,750.000000,500)
AddZone("�-24", 2750.000000,500.000000,-500,3000.000000,750.000000,500)
AddZone("�-1", -3000.000000,250.000000,-500,-2750.000000,500.000000,500)
AddZone("�-2", -2750.000000,250.000000,-500,-2500.000000,500.000000,500)
AddZone("�-3", -2500.000000,250.000000,-500,-2250.000000,500.000000,500)
AddZone("�-4", -2250.000000,250.000000,-500,-2000.000000,500.000000,500)
AddZone("�-5", -2000.000000,250.000000,-500,-1750.000000,500.000000,500)
AddZone("�-6", -1750.000000,250.000000,-500,-1500.000000,500.000000,500)
AddZone("�-7", -1500.000000,250.000000,-500,-1250.000000,500.000000,500)
AddZone("�-8", -1250.000000,250.000000,-500,-1000.000000,500.000000,500)
AddZone("�-9", -1000.000000,250.000000,-500,-750.000000,500.000000,500)
AddZone("�-10", -750.000000,250.000000,-500,-500.000000,500.000000,500)
AddZone("�-11", -500.000000,250.000000,-500,-250.000000,500.000000,500)
AddZone("�-12", -250.000000,250.000000,-500,0.000000,500.000000,500)
AddZone("�-13", 0.000000,250.000000,-500,250.000000,500.000000,500)
AddZone("�-14", 250.000000,250.000000,-500,500.000000,500.000000,500)
AddZone("�-15", 500.000000,250.000000,-500,750.000000,500.000000,500)
AddZone("�-16", 750.000000,250.000000,-500,1000.000000,500.000000,500)
AddZone("�-17", 1000.000000,250.000000,-500,1250.000000,500.000000,500)
AddZone("�-18", 1250.000000,250.000000,-500,1500.000000,500.000000,500)
AddZone("�-19", 1500.000000,250.000000,-500,1750.000000,500.000000,500)
AddZone("�-20", 1750.000000,250.000000,-500,2000.000000,500.000000,500)
AddZone("�-21", 2000.000000,250.000000,-500,2250.000000,500.000000,500)
AddZone("�-22", 2250.000000,250.000000,-500,2500.000000,500.000000,500)
AddZone("�-23", 2500.000000,250.000000,-500,2750.000000,500.000000,500)
AddZone("�-24", 2750.000000,250.000000,-500,3000.000000,500.000000,500)
AddZone("�-1", -3000.000000,0.000000,-500,-2750.000000,250.000000,500)
AddZone("�-2", -2750.000000,0.000000,-500,-2500.000000,250.000000,500)
AddZone("�-3", -2500.000000,0.000000,-500,-2250.000000,250.000000,500)
AddZone("�-4", -2250.000000,0.000000,-500,-2000.000000,250.000000,500)
AddZone("�-5", -2000.000000,0.000000,-500,-1750.000000,250.000000,500)
AddZone("�-6", -1750.000000,0.000000,-500,-1500.000000,250.000000,500)
AddZone("�-7", -1500.000000,0.000000,-500,-1250.000000,250.000000,500)
AddZone("�-8", -1250.000000,0.000000,-500,-1000.000000,250.000000,500)
AddZone("�-9", -1000.000000,0.000000,-500,-750.000000,250.000000,500)
AddZone("�-10", -750.000000,0.000000,-500,-500.000000,250.000000,500)
AddZone("�-11", -500.000000,0.000000,-500,-250.000000,250.000000,500)
AddZone("�-12", -250.000000,0.000000,-500,0.000000,250.000000,500)
AddZone("�-13", 0.000000,0.000000,-500,250.000000,250.000000,500)
AddZone("�-14", 250.000000,0.000000,-500,500.000000,250.000000,500)
AddZone("�-15", 500.000000,0.000000,-500,750.000000,250.000000,500)
AddZone("�-16", 750.000000,0.000000,-500,1000.000000,250.000000,500)
AddZone("�-17", 1000.000000,0.000000,-500,1250.000000,250.000000,500)
AddZone("�-18", 1250.000000,0.000000,-500,1500.000000,250.000000,500)
AddZone("�-19", 1500.000000,0.000000,-500,1750.000000,250.000000,500)
AddZone("�-20", 1750.000000,0.000000,-500,2000.000000,250.000000,500)
AddZone("�-21", 2000.000000,0.000000,-500,2250.000000,250.000000,500)
AddZone("�-22", 2250.000000,0.000000,-500,2500.000000,250.000000,500)
AddZone("�-23", 2500.000000,0.000000,-500,2750.000000,250.000000,500)
AddZone("�-24", 2750.000000,0.000000,-500,3000.000000,250.000000,500)
AddZone("�-1", -3000.000000,-250.000000,-500,-2750.000000,0.000000,500)
AddZone("�-2", -2750.000000,-250.000000,-500,-2500.000000,0.000000,500)
AddZone("�-3", -2500.000000,-250.000000,-500,-2250.000000,0.000000,500)
AddZone("�-4", -2250.000000,-250.000000,-500,-2000.000000,0.000000,500)
AddZone("�-5", -2000.000000,-250.000000,-500,-1750.000000,0.000000,500)
AddZone("�-6", -1750.000000,-250.000000,-500,-1500.000000,0.000000,500)
AddZone("�-7", -1500.000000,-250.000000,-500,-1250.000000,0.000000,500)
AddZone("�-8", -1250.000000,-250.000000,-500,-1000.000000,0.000000,500)
AddZone("�-9", -1000.000000,-250.000000,-500,-750.000000,0.000000,500)
AddZone("�-10", -750.000000,-250.000000,-500,-500.000000,0.000000,500)
AddZone("�-11", -500.000000,-250.000000,-500,-250.000000,0.000000,500)
AddZone("�-12", -250.000000,-250.000000,-500,0.000000,0.000000,500)
AddZone("�-13", 0.000000,-250.000000,-500,250.000000,0.000000,500)
AddZone("�-14", 250.000000,-250.000000,-500,500.000000,0.000000,500)
AddZone("�-15", 500.000000,-250.000000,-500,750.000000,0.000000,500)
AddZone("�-16", 750.000000,-250.000000,-500,1000.000000,0.000000,500)
AddZone("�-17", 1000.000000,-250.000000,-500,1250.000000,0.000000,500)
AddZone("�-18", 1250.000000,-250.000000,-500,1500.000000,0.000000,500)
AddZone("�-19", 1500.000000,-250.000000,-500,1750.000000,0.000000,500)
AddZone("�-20", 1750.000000,-250.000000,-500,2000.000000,0.000000,500)
AddZone("�-21", 2000.000000,-250.000000,-500,2250.000000,0.000000,500)
AddZone("�-22", 2250.000000,-250.000000,-500,2500.000000,0.000000,500)
AddZone("�-23", 2500.000000,-250.000000,-500,2750.000000,0.000000,500)
AddZone("�-24", 2750.000000,-250.000000,-500,3000.000000,0.000000,500)
AddZone("�-1", -3000.000000,-500.000000,-500,-2750.000000,-250.000000,500)
AddZone("�-2", -2750.000000,-500.000000,-500,-2500.000000,-250.000000,500)
AddZone("�-3", -2500.000000,-500.000000,-500,-2250.000000,-250.000000,500)
AddZone("�-4", -2250.000000,-500.000000,-500,-2000.000000,-250.000000,500)
AddZone("�-5", -2000.000000,-500.000000,-500,-1750.000000,-250.000000,500)
AddZone("�-6", -1750.000000,-500.000000,-500,-1500.000000,-250.000000,500)
AddZone("�-7", -1500.000000,-500.000000,-500,-1250.000000,-250.000000,500)
AddZone("�-8", -1250.000000,-500.000000,-500,-1000.000000,-250.000000,500)
AddZone("�-9", -1000.000000,-500.000000,-500,-750.000000,-250.000000,500)
AddZone("�-10", -750.000000,-500.000000,-500,-500.000000,-250.000000,500)
AddZone("�-11", -500.000000,-500.000000,-500,-250.000000,-250.000000,500)
AddZone("�-12", -250.000000,-500.000000,-500,0.000000,-250.000000,500)
AddZone("�-13", 0.000000,-500.000000,-500,250.000000,-250.000000,500)
AddZone("�-14", 250.000000,-500.000000,-500,500.000000,-250.000000,500)
AddZone("�-15", 500.000000,-500.000000,-500,750.000000,-250.000000,500)
AddZone("�-16", 750.000000,-500.000000,-500,1000.000000,-250.000000,500)
AddZone("�-17", 1000.000000,-500.000000,-500,1250.000000,-250.000000,500)
AddZone("�-18", 1250.000000,-500.000000,-500,1500.000000,-250.000000,500)
AddZone("�-19", 1500.000000,-500.000000,-500,1750.000000,-250.000000,500)
AddZone("�-20", 1750.000000,-500.000000,-500,2000.000000,-250.000000,500)
AddZone("�-21", 2000.000000,-500.000000,-500,2250.000000,-250.000000,500)
AddZone("�-22", 2250.000000,-500.000000,-500,2500.000000,-250.000000,500)
AddZone("�-23", 2500.000000,-500.000000,-500,2750.000000,-250.000000,500)
AddZone("�-24", 2750.000000,-500.000000,-500,3000.000000,-250.000000,500)
AddZone("�-1", -3000.000000,-750.000000,-500,-2750.000000,-500.000000,500)
AddZone("�-2", -2750.000000,-750.000000,-500,-2500.000000,-500.000000,500)
AddZone("�-3", -2500.000000,-750.000000,-500,-2250.000000,-500.000000,500)
AddZone("�-4", -2250.000000,-750.000000,-500,-2000.000000,-500.000000,500)
AddZone("�-5", -2000.000000,-750.000000,-500,-1750.000000,-500.000000,500)
AddZone("�-6", -1750.000000,-750.000000,-500,-1500.000000,-500.000000,500)
AddZone("�-7", -1500.000000,-750.000000,-500,-1250.000000,-500.000000,500)
AddZone("�-8", -1250.000000,-750.000000,-500,-1000.000000,-500.000000,500)
AddZone("�-9", -1000.000000,-750.000000,-500,-750.000000,-500.000000,500)
AddZone("�-10", -750.000000,-750.000000,-500,-500.000000,-500.000000,500)
AddZone("�-11", -500.000000,-750.000000,-500,-250.000000,-500.000000,500)
AddZone("�-12", -250.000000,-750.000000,-500,0.000000,-500.000000,500)
AddZone("�-13", 0.000000,-750.000000,-500,250.000000,-500.000000,500)
AddZone("�-14", 250.000000,-750.000000,-500,500.000000,-500.000000,500)
AddZone("�-15", 500.000000,-750.000000,-500,750.000000,-500.000000,500)
AddZone("�-16", 750.000000,-750.000000,-500,1000.000000,-500.000000,500)
AddZone("�-17", 1000.000000,-750.000000,-500,1250.000000,-500.000000,500)
AddZone("�-18", 1250.000000,-750.000000,-500,1500.000000,-500.000000,500)
AddZone("�-19", 1500.000000,-750.000000,-500,1750.000000,-500.000000,500)
AddZone("�-20", 1750.000000,-750.000000,-500,2000.000000,-500.000000,500)
AddZone("�-21", 2000.000000,-750.000000,-500,2250.000000,-500.000000,500)
AddZone("�-22", 2250.000000,-750.000000,-500,2500.000000,-500.000000,500)
AddZone("�-23", 2500.000000,-750.000000,-500,2750.000000,-500.000000,500)
AddZone("�-24", 2750.000000,-750.000000,-500,3000.000000,-500.000000,500)
AddZone("�-1", -3000.000000,-1000.000000,-500,-2750.000000,-750.000000,500)
AddZone("�-2", -2750.000000,-1000.000000,-500,-2500.000000,-750.000000,500)
AddZone("�-3", -2500.000000,-1000.000000,-500,-2250.000000,-750.000000,500)
AddZone("�-4", -2250.000000,-1000.000000,-500,-2000.000000,-750.000000,500)
AddZone("�-5", -2000.000000,-1000.000000,-500,-1750.000000,-750.000000,500)
AddZone("�-6", -1750.000000,-1000.000000,-500,-1500.000000,-750.000000,500)
AddZone("�-7", -1500.000000,-1000.000000,-500,-1250.000000,-750.000000,500)
AddZone("�-8", -1250.000000,-1000.000000,-500,-1000.000000,-750.000000,500)
AddZone("�-9", -1000.000000,-1000.000000,-500,-750.000000,-750.000000,500)
AddZone("�-10", -750.000000,-1000.000000,-500,-500.000000,-750.000000,500)
AddZone("�-11", -500.000000,-1000.000000,-500,-250.000000,-750.000000,500)
AddZone("�-12", -250.000000,-1000.000000,-500,0.000000,-750.000000,500)
AddZone("�-13", 0.000000,-1000.000000,-500,250.000000,-750.000000,500)
AddZone("�-14", 250.000000,-1000.000000,-500,500.000000,-750.000000,500)
AddZone("�-15", 500.000000,-1000.000000,-500,750.000000,-750.000000,500)
AddZone("�-16", 750.000000,-1000.000000,-500,1000.000000,-750.000000,500)
AddZone("�-17", 1000.000000,-1000.000000,-500,1250.000000,-750.000000,500)
AddZone("�-18", 1250.000000,-1000.000000,-500,1500.000000,-750.000000,500)
AddZone("�-19", 1500.000000,-1000.000000,-500,1750.000000,-750.000000,500)
AddZone("�-20", 1750.000000,-1000.000000,-500,2000.000000,-750.000000,500)
AddZone("�-21", 2000.000000,-1000.000000,-500,2250.000000,-750.000000,500)
AddZone("�-22", 2250.000000,-1000.000000,-500,2500.000000,-750.000000,500)
AddZone("�-23", 2500.000000,-1000.000000,-500,2750.000000,-750.000000,500)
AddZone("�-24", 2750.000000,-1000.000000,-500,3000.000000,-750.000000,500)
AddZone("�-1", -3000.000000,-1250.000000,-500,-2750.000000,-1000.000000,500)
AddZone("�-2", -2750.000000,-1250.000000,-500,-2500.000000,-1000.000000,500)
AddZone("�-3", -2500.000000,-1250.000000,-500,-2250.000000,-1000.000000,500)
AddZone("�-4", -2250.000000,-1250.000000,-500,-2000.000000,-1000.000000,500)
AddZone("�-5", -2000.000000,-1250.000000,-500,-1750.000000,-1000.000000,500)
AddZone("�-6", -1750.000000,-1250.000000,-500,-1500.000000,-1000.000000,500)
AddZone("�-7", -1500.000000,-1250.000000,-500,-1250.000000,-1000.000000,500)
AddZone("�-8", -1250.000000,-1250.000000,-500,-1000.000000,-1000.000000,500)
AddZone("�-9", -1000.000000,-1250.000000,-500,-750.000000,-1000.000000,500)
AddZone("�-10", -750.000000,-1250.000000,-500,-500.000000,-1000.000000,500)
AddZone("�-11", -500.000000,-1250.000000,-500,-250.000000,-1000.000000,500)
AddZone("�-12", -250.000000,-1250.000000,-500,0.000000,-1000.000000,500)
AddZone("�-13", 0.000000,-1250.000000,-500,250.000000,-1000.000000,500)
AddZone("�-14", 250.000000,-1250.000000,-500,500.000000,-1000.000000,500)
AddZone("�-15", 500.000000,-1250.000000,-500,750.000000,-1000.000000,500)
AddZone("�-16", 750.000000,-1250.000000,-500,1000.000000,-1000.000000,500)
AddZone("�-17", 1000.000000,-1250.000000,-500,1250.000000,-1000.000000,500)
AddZone("�-18", 1250.000000,-1250.000000,-500,1500.000000,-1000.000000,500)
AddZone("�-19", 1500.000000,-1250.000000,-500,1750.000000,-1000.000000,500)
AddZone("�-20", 1750.000000,-1250.000000,-500,2000.000000,-1000.000000,500)
AddZone("�-21", 2000.000000,-1250.000000,-500,2250.000000,-1000.000000,500)
AddZone("�-22", 2250.000000,-1250.000000,-500,2500.000000,-1000.000000,500)
AddZone("�-23", 2500.000000,-1250.000000,-500,2750.000000,-1000.000000,500)
AddZone("�-24", 2750.000000,-1250.000000,-500,3000.000000,-1000.000000,500)
AddZone("�-1", -3000.000000,-1500.000000,-500,-2750.000000,-1250.000000,500)
AddZone("�-2", -2750.000000,-1500.000000,-500,-2500.000000,-1250.000000,500)
AddZone("�-3", -2500.000000,-1500.000000,-500,-2250.000000,-1250.000000,500)
AddZone("�-4", -2250.000000,-1500.000000,-500,-2000.000000,-1250.000000,500)
AddZone("�-5", -2000.000000,-1500.000000,-500,-1750.000000,-1250.000000,500)
AddZone("�-6", -1750.000000,-1500.000000,-500,-1500.000000,-1250.000000,500)
AddZone("�-7", -1500.000000,-1500.000000,-500,-1250.000000,-1250.000000,500)
AddZone("�-8", -1250.000000,-1500.000000,-500,-1000.000000,-1250.000000,500)
AddZone("�-9", -1000.000000,-1500.000000,-500,-750.000000,-1250.000000,500)
AddZone("�-10", -750.000000,-1500.000000,-500,-500.000000,-1250.000000,500)
AddZone("�-11", -500.000000,-1500.000000,-500,-250.000000,-1250.000000,500)
AddZone("�-12", -250.000000,-1500.000000,-500,0.000000,-1250.000000,500)
AddZone("�-13", 0.000000,-1500.000000,-500,250.000000,-1250.000000,500)
AddZone("�-14", 250.000000,-1500.000000,-500,500.000000,-1250.000000,500)
AddZone("�-15", 500.000000,-1500.000000,-500,750.000000,-1250.000000,500)
AddZone("�-16", 750.000000,-1500.000000,-500,1000.000000,-1250.000000,500)
AddZone("�-17", 1000.000000,-1500.000000,-500,1250.000000,-1250.000000,500)
AddZone("�-18", 1250.000000,-1500.000000,-500,1500.000000,-1250.000000,500)
AddZone("�-19", 1500.000000,-1500.000000,-500,1750.000000,-1250.000000,500)
AddZone("�-20", 1750.000000,-1500.000000,-500,2000.000000,-1250.000000,500)
AddZone("�-21", 2000.000000,-1500.000000,-500,2250.000000,-1250.000000,500)
AddZone("�-22", 2250.000000,-1500.000000,-500,2500.000000,-1250.000000,500)
AddZone("�-23", 2500.000000,-1500.000000,-500,2750.000000,-1250.000000,500)
AddZone("�-24", 2750.000000,-1500.000000,-500,3000.000000,-1250.000000,500)
AddZone("�-1", -3000.000000,-1750.000000,-500,-2750.000000,-1500.000000,500)
AddZone("�-2", -2750.000000,-1750.000000,-500,-2500.000000,-1500.000000,500)
AddZone("�-3", -2500.000000,-1750.000000,-500,-2250.000000,-1500.000000,500)
AddZone("�-4", -2250.000000,-1750.000000,-500,-2000.000000,-1500.000000,500)
AddZone("�-5", -2000.000000,-1750.000000,-500,-1750.000000,-1500.000000,500)
AddZone("�-6", -1750.000000,-1750.000000,-500,-1500.000000,-1500.000000,500)
AddZone("�-7", -1500.000000,-1750.000000,-500,-1250.000000,-1500.000000,500)
AddZone("�-8", -1250.000000,-1750.000000,-500,-1000.000000,-1500.000000,500)
AddZone("�-9", -1000.000000,-1750.000000,-500,-750.000000,-1500.000000,500)
AddZone("�-10", -750.000000,-1750.000000,-500,-500.000000,-1500.000000,500)
AddZone("�-11", -500.000000,-1750.000000,-500,-250.000000,-1500.000000,500)
AddZone("�-12", -250.000000,-1750.000000,-500,0.000000,-1500.000000,500)
AddZone("�-13", 0.000000,-1750.000000,-500,250.000000,-1500.000000,500)
AddZone("�-14", 250.000000,-1750.000000,-500,500.000000,-1500.000000,500)
AddZone("�-15", 500.000000,-1750.000000,-500,750.000000,-1500.000000,500)
AddZone("�-16", 750.000000,-1750.000000,-500,1000.000000,-1500.000000,500)
AddZone("�-17", 1000.000000,-1750.000000,-500,1250.000000,-1500.000000,500)
AddZone("�-18", 1250.000000,-1750.000000,-500,1500.000000,-1500.000000,500)
AddZone("�-19", 1500.000000,-1750.000000,-500,1750.000000,-1500.000000,500)
AddZone("�-20", 1750.000000,-1750.000000,-500,2000.000000,-1500.000000,500)
AddZone("�-21", 2000.000000,-1750.000000,-500,2250.000000,-1500.000000,500)
AddZone("�-22", 2250.000000,-1750.000000,-500,2500.000000,-1500.000000,500)
AddZone("�-23", 2500.000000,-1750.000000,-500,2750.000000,-1500.000000,500)
AddZone("�-24", 2750.000000,-1750.000000,-500,3000.000000,-1500.000000,500)
AddZone("�-1", -3000.000000,-2000.000000,-500,-2750.000000,-1750.000000,500)
AddZone("�-2", -2750.000000,-2000.000000,-500,-2500.000000,-1750.000000,500)
AddZone("�-3", -2500.000000,-2000.000000,-500,-2250.000000,-1750.000000,500)
AddZone("�-4", -2250.000000,-2000.000000,-500,-2000.000000,-1750.000000,500)
AddZone("�-5", -2000.000000,-2000.000000,-500,-1750.000000,-1750.000000,500)
AddZone("�-6", -1750.000000,-2000.000000,-500,-1500.000000,-1750.000000,500)
AddZone("�-7", -1500.000000,-2000.000000,-500,-1250.000000,-1750.000000,500)
AddZone("�-8", -1250.000000,-2000.000000,-500,-1000.000000,-1750.000000,500)
AddZone("�-9", -1000.000000,-2000.000000,-500,-750.000000,-1750.000000,500)
AddZone("�-10", -750.000000,-2000.000000,-500,-500.000000,-1750.000000,500)
AddZone("�-11", -500.000000,-2000.000000,-500,-250.000000,-1750.000000,500)
AddZone("�-12", -250.000000,-2000.000000,-500,0.000000,-1750.000000,500)
AddZone("�-13", 0.000000,-2000.000000,-500,250.000000,-1750.000000,500)
AddZone("�-14", 250.000000,-2000.000000,-500,500.000000,-1750.000000,500)
AddZone("�-15", 500.000000,-2000.000000,-500,750.000000,-1750.000000,500)
AddZone("�-16", 750.000000,-2000.000000,-500,1000.000000,-1750.000000,500)
AddZone("�-17", 1000.000000,-2000.000000,-500,1250.000000,-1750.000000,500)
AddZone("�-18", 1250.000000,-2000.000000,-500,1500.000000,-1750.000000,500)
AddZone("�-19", 1500.000000,-2000.000000,-500,1750.000000,-1750.000000,500)
AddZone("�-20", 1750.000000,-2000.000000,-500,2000.000000,-1750.000000,500)
AddZone("�-21", 2000.000000,-2000.000000,-500,2250.000000,-1750.000000,500)
AddZone("�-22", 2250.000000,-2000.000000,-500,2500.000000,-1750.000000,500)
AddZone("�-23", 2500.000000,-2000.000000,-500,2750.000000,-1750.000000,500)
AddZone("�-24", 2750.000000,-2000.000000,-500,3000.000000,-1750.000000,500)
AddZone("�-1", -3000.000000,-2250.000000,-500,-2750.000000,-2000.000000,500)
AddZone("�-2", -2750.000000,-2250.000000,-500,-2500.000000,-2000.000000,500)
AddZone("�-3", -2500.000000,-2250.000000,-500,-2250.000000,-2000.000000,500)
AddZone("�-4", -2250.000000,-2250.000000,-500,-2000.000000,-2000.000000,500)
AddZone("�-5", -2000.000000,-2250.000000,-500,-1750.000000,-2000.000000,500)
AddZone("�-6", -1750.000000,-2250.000000,-500,-1500.000000,-2000.000000,500)
AddZone("�-7", -1500.000000,-2250.000000,-500,-1250.000000,-2000.000000,500)
AddZone("�-8", -1250.000000,-2250.000000,-500,-1000.000000,-2000.000000,500)
AddZone("�-9", -1000.000000,-2250.000000,-500,-750.000000,-2000.000000,500)
AddZone("�-10", -750.000000,-2250.000000,-500,-500.000000,-2000.000000,500)
AddZone("�-11", -500.000000,-2250.000000,-500,-250.000000,-2000.000000,500)
AddZone("�-12", -250.000000,-2250.000000,-500,0.000000,-2000.000000,500)
AddZone("�-13", 0.000000,-2250.000000,-500,250.000000,-2000.000000,500)
AddZone("�-14", 250.000000,-2250.000000,-500,500.000000,-2000.000000,500)
AddZone("�-15", 500.000000,-2250.000000,-500,750.000000,-2000.000000,500)
AddZone("�-16", 750.000000,-2250.000000,-500,1000.000000,-2000.000000,500)
AddZone("�-17", 1000.000000,-2250.000000,-500,1250.000000,-2000.000000,500)
AddZone("�-18", 1250.000000,-2250.000000,-500,1500.000000,-2000.000000,500)
AddZone("�-19", 1500.000000,-2250.000000,-500,1750.000000,-2000.000000,500)
AddZone("�-20", 1750.000000,-2250.000000,-500,2000.000000,-2000.000000,500)
AddZone("�-21", 2000.000000,-2250.000000,-500,2250.000000,-2000.000000,500)
AddZone("�-22", 2250.000000,-2250.000000,-500,2500.000000,-2000.000000,500)
AddZone("�-23", 2500.000000,-2250.000000,-500,2750.000000,-2000.000000,500)
AddZone("�-24", 2750.000000,-2250.000000,-500,3000.000000,-2000.000000,500)
AddZone("�-1", -3000.000000,-2500.000000,-500,-2750.000000,-2250.000000,500)
AddZone("�-2", -2750.000000,-2500.000000,-500,-2500.000000,-2250.000000,500)
AddZone("�-3", -2500.000000,-2500.000000,-500,-2250.000000,-2250.000000,500)
AddZone("�-4", -2250.000000,-2500.000000,-500,-2000.000000,-2250.000000,500)
AddZone("�-5", -2000.000000,-2500.000000,-500,-1750.000000,-2250.000000,500)
AddZone("�-6", -1750.000000,-2500.000000,-500,-1500.000000,-2250.000000,500)
AddZone("�-7", -1500.000000,-2500.000000,-500,-1250.000000,-2250.000000,500)
AddZone("�-8", -1250.000000,-2500.000000,-500,-1000.000000,-2250.000000,500)
AddZone("�-9", -1000.000000,-2500.000000,-500,-750.000000,-2250.000000,500)
AddZone("�-10", -750.000000,-2500.000000,-500,-500.000000,-2250.000000,500)
AddZone("�-11", -500.000000,-2500.000000,-500,-250.000000,-2250.000000,500)
AddZone("�-12", -250.000000,-2500.000000,-500,0.000000,-2250.000000,500)
AddZone("�-13", 0.000000,-2500.000000,-500,250.000000,-2250.000000,500)
AddZone("�-14", 250.000000,-2500.000000,-500,500.000000,-2250.000000,500)
AddZone("�-15", 500.000000,-2500.000000,-500,750.000000,-2250.000000,500)
AddZone("�-16", 750.000000,-2500.000000,-500,1000.000000,-2250.000000,500)
AddZone("�-17", 1000.000000,-2500.000000,-500,1250.000000,-2250.000000,500)
AddZone("�-18", 1250.000000,-2500.000000,-500,1500.000000,-2250.000000,500)
AddZone("�-19", 1500.000000,-2500.000000,-500,1750.000000,-2250.000000,500)
AddZone("�-20", 1750.000000,-2500.000000,-500,2000.000000,-2250.000000,500)
AddZone("�-21", 2000.000000,-2500.000000,-500,2250.000000,-2250.000000,500)
AddZone("�-22", 2250.000000,-2500.000000,-500,2500.000000,-2250.000000,500)
AddZone("�-23", 2500.000000,-2500.000000,-500,2750.000000,-2250.000000,500)
AddZone("�-24", 2750.000000,-2500.000000,-500,3000.000000,-2250.000000,500)
AddZone("�-1", -3000.000000,-2750.000000,-500,-2750.000000,-2500.000000,500)
AddZone("�-2", -2750.000000,-2750.000000,-500,-2500.000000,-2500.000000,500)
AddZone("�-3", -2500.000000,-2750.000000,-500,-2250.000000,-2500.000000,500)
AddZone("�-4", -2250.000000,-2750.000000,-500,-2000.000000,-2500.000000,500)
AddZone("�-5", -2000.000000,-2750.000000,-500,-1750.000000,-2500.000000,500)
AddZone("�-6", -1750.000000,-2750.000000,-500,-1500.000000,-2500.000000,500)
AddZone("�-7", -1500.000000,-2750.000000,-500,-1250.000000,-2500.000000,500)
AddZone("�-8", -1250.000000,-2750.000000,-500,-1000.000000,-2500.000000,500)
AddZone("�-9", -1000.000000,-2750.000000,-500,-750.000000,-2500.000000,500)
AddZone("�-10", -750.000000,-2750.000000,-500,-500.000000,-2500.000000,500)
AddZone("�-11", -500.000000,-2750.000000,-500,-250.000000,-2500.000000,500)
AddZone("�-12", -250.000000,-2750.000000,-500,0.000000,-2500.000000,500)
AddZone("�-13", 0.000000,-2750.000000,-500,250.000000,-2500.000000,500)
AddZone("�-14", 250.000000,-2750.000000,-500,500.000000,-2500.000000,500)
AddZone("�-15", 500.000000,-2750.000000,-500,750.000000,-2500.000000,500)
AddZone("�-16", 750.000000,-2750.000000,-500,1000.000000,-2500.000000,500)
AddZone("�-17", 1000.000000,-2750.000000,-500,1250.000000,-2500.000000,500)
AddZone("�-18", 1250.000000,-2750.000000,-500,1500.000000,-2500.000000,500)
AddZone("�-19", 1500.000000,-2750.000000,-500,1750.000000,-2500.000000,500)
AddZone("�-20", 1750.000000,-2750.000000,-500,2000.000000,-2500.000000,500)
AddZone("�-21", 2000.000000,-2750.000000,-500,2250.000000,-2500.000000,500)
AddZone("�-22", 2250.000000,-2750.000000,-500,2500.000000,-2500.000000,500)
AddZone("�-23", 2500.000000,-2750.000000,-500,2750.000000,-2500.000000,500)
AddZone("�-24", 2750.000000,-2750.000000,-500,3000.000000,-2500.000000,500)
AddZone("�-1", -3000.000000,-3000.000000,-500,-2750.000000,-2750.000000,500)
AddZone("�-2", -2750.000000,-3000.000000,-500,-2500.000000,-2750.000000,500)
AddZone("�-3", -2500.000000,-3000.000000,-500,-2250.000000,-2750.000000,500)
AddZone("�-4", -2250.000000,-3000.000000,-500,-2000.000000,-2750.000000,500)
AddZone("�-5", -2000.000000,-3000.000000,-500,-1750.000000,-2750.000000,500)
AddZone("�-6", -1750.000000,-3000.000000,-500,-1500.000000,-2750.000000,500)
AddZone("�-7", -1500.000000,-3000.000000,-500,-1250.000000,-2750.000000,500)
AddZone("�-8", -1250.000000,-3000.000000,-500,-1000.000000,-2750.000000,500)
AddZone("�-9", -1000.000000,-3000.000000,-500,-750.000000,-2750.000000,500)
AddZone("�-10", -750.000000,-3000.000000,-500,-500.000000,-2750.000000,500)
AddZone("�-11", -500.000000,-3000.000000,-500,-250.000000,-2750.000000,500)
AddZone("�-12", -250.000000,-3000.000000,-500,0.000000,-2750.000000,500)
AddZone("�-13", 0.000000,-3000.000000,-500,250.000000,-2750.000000,500)
AddZone("�-14", 250.000000,-3000.000000,-500,500.000000,-2750.000000,500)
AddZone("�-15", 500.000000,-3000.000000,-500,750.000000,-2750.000000,500)
AddZone("�-16", 750.000000,-3000.000000,-500,1000.000000,-2750.000000,500)
AddZone("�-17", 1000.000000,-3000.000000,-500,1250.000000,-2750.000000,500)
AddZone("�-18", 1250.000000,-3000.000000,-500,1500.000000,-2750.000000,500)
AddZone("�-19", 1500.000000,-3000.000000,-500,1750.000000,-2750.000000,500)
AddZone("�-20", 1750.000000,-3000.000000,-500,2000.000000,-2750.000000,500)
AddZone("�-21", 2000.000000,-3000.000000,-500,2250.000000,-2750.000000,500)
AddZone("�-22", 2250.000000,-3000.000000,-500,2500.000000,-2750.000000,500)
AddZone("�-23", 2500.000000,-3000.000000,-500,2750.000000,-2750.000000,500)
AddZone("�-24", 2750.000000,-3000.000000,-500,3000.000000,-2750.000000,500)
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
showDialog(dialogstyle,pages, textout , "��", "������")
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
Menu, Tray, Add, ��������, goHideTray
Menu, tray, default, ��������
Menu, Tray, Add, �����, GuiClose
Menu, Tray, Click, 1
Gui, Load:-caption -sysmenu +AlwaysOnTop +Border
Gui, Load:font, S16
Gui, Load:Add, Text, x0 y8 w200 h40 Center, ��������...
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
global Penal2 := A_MyDocuments "\Police Dream\������ �2\��������� ������.txt"
global FedP2 := A_MyDocuments "\Police Dream\������ �2\����������� �������������.txt"
global Administrative2 := A_MyDocuments "\Police Dream\������ �2\���������������� ������.txt"
global Crib := A_MyDocuments "\Police Dream\Crib.txt"
global Penal1 := A_MyDocuments "\Police Dream\������ �1\��������� ������.txt"
global FedP1 := A_MyDocuments "\Police Dream\������ �1\����������� �������������.txt"
global Administrative1 := A_MyDocuments "\Police Dream\������ �1\���������������� ������.txt"
global Lect := A_MyDocuments "\Police Dream\������\�������� � ������.txt"
global bDir := A_MyDocuments "\Police Dream"
global S1 := A_MyDocuments "\Police Dream\������ �1"
global S2 := A_MyDocuments "\Police Dream\������ �2"
global Lec := A_MyDocuments "\Police Dream\������"
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
		msgbox, ����������� dx9_overlay.dll
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
��������� �������� ����������� - 2 ����
����������� ��������� �� ����������� - 3 ����
����������� ��������� �� ��� - 6 ���, ������ �� ��������
����������� - 1 ���
������������ ��������� - 1 ���
���������������� - 1 ���
����������� - 2 ����
���� ������������� �������� - 2 ����
������������ ����������� �� - 1 ���
���� �� ����������� �� - 2 ����
����� � ����� ���������� - 6 ���
������� ������ ��� �������� - 1 ��� � ����� � ������� 2000$.
������������ ������������ ������ - 3 ���� � �������
������������ ������������ ������ - 3 ���� � �������
������� ������������ ������ - 3 ���� � �������
�������� ���������� - 3 ���� � �������
�������� ���������� - 3 ���� � �������
������������ ���������� - 3 ���� � �������
����� ������ ��������� - 1 ��� � ����� � ������� 5000$
����������� ������ ��������� - 4 ���� � ����� � ������� 15000$
������������� �� ���. ���������� - 2 ����
������������� �� ����. ���������� - 1 ���
�������������� - 2 ����
������ - 1 ���
���������� - 2 ����
������������� - 2 ����
����������� �������� ����� - 1 ���
������������� ���������� - 3 ���
�������������� ������������ - 2 ����
������������� ��������� ���������� - 1 ���
������� �� ���. ���� - 1 ���
������� �� ���. ����������� - 2 ����
������� ������� ����� - 2 ���� ����� �������� �������.
������� ������� ����� - 2 ����, ����� �������� �������.
������� ������ �� ������ - 6 ���
����������� ������ - 2 ����
���������� ������� - 6 ���, ������� ���� ��������
����������� ����������� ����������� - 2 ����
�������� ������ - 2 ����
������������� ����. ����� - 1 ���
���������� ���������� �������� - 3 ����
�������� � ���� ������� � 6 ���
), %suini%
if(!FileExist(cprice))
	FileAppend,
(
�� 1 �� 2 LVL ���� �� ������: 1500
�� 3 �� 6 LVL ���� �� ������: 4000
�� 7 �� 13 LVL ���� �� ������: 8000
�� 14 �� 23 LVL ���� �� ������: 12000
�� 24 �� 35 LVL ���� �� ������: 15000
�� 36 �� 99 LVL ���� �� ������: 20000
), %cprice%
if(!FileExist(FedP2))
	FileAppend,
(
0.1 ����������� ������������� - ��� ����������-�������� ���, ������� ��� ������� ������ ������ ����� � ������ ��������������� �����������.
0.2 ����������� ������������� ������� ����������� ���� ������������� (����� ���) ��� ����������� ������������� (����� ��) � ������� ������ (����� �����).
0.3 ����������� ������������� ����� ���� �������� ���������� ��� ( ��� ������� ��������� �������������� ) � ����� ����� ��� � ����, ��� ���������� � ���� ���������� ����� 48 ����� ����� ����������.
0.4 ����������� ������������� ������� ����������� ����� ������������ �������������� �����������.
0.5 �������� ������������ ������������� �� ����������� ����������� �� ���������������.
1.1 ����������� ������������������� ���������� �������������� ������ ������ ������ ������������ ����/���������� ��������������� ����������� - ����������.
1.2 ����������� ����� �������� ����� � ����������� ������� ��� �������� �� ��� ����������� ��� ��������� ������� - ����������.
1.3 ����������� ���������� ������� � ��������� ��� ������� ��� � ����������� ��� ������ ��� - ���������.
2.1 ����������� ��������� �� ���������� FBI ��� ��������� ������������ �������� �� ������ �� ������� ��� ���� ��.������ - �������������� / ���������.
2.1 ����������: ����, ��������� �����, ������� ���������� �� ���������.
2.2 ����������� �������� ���� �� ������ ���������������� ���������� - ����������.
2.2 ����������: ������ ��� �� ����� ������� ������������ �������� ��� ����������.
2.3 ����������� ����� ����������� ���������� (������� / ���������) ��� ������� ��� - ����������.
2.4 ����������� ������������ ������ ��� � ������ ��� �������� ���������� - ���������-����������.
2.4 ����������: ������ ��� �� ����� ������� ������������ �������� ��� ����������.
2.5 ����������� ����������/��������/������������� ������ ��� - ����������.
2.6 ����������� ���������� ���������/����������, �������� ������� ���/����� ���-����, ����� ��� � ����������� ������� ����� - ��������� / ����������.
2.7 ����������� ���������� �������� ������ ���, ���� ��� ��������� ��� ���������� - ����������.
2.8 ����������� ������� ������ � ������ �������������� �������� �� ������ ������� ������, ���������� ������ ���� �������� � ��������������� ���������� - ���������.
2.9 ����������� �������� �������� �� ��� - ���������.
2.9 ����������: ����� ����� ����� ��� ������� � ���� � �������� ��������. ��� ������ ��������� ��������������� ��������� �������� ������ 2.9.
3.1 ����������� ����� ���������� ������������� ��������� � ���������� - �������������� / ��������� / ����������.
3.2 ����������� �������� ������� ����� - �������������� / ���������.
3.3 ����������� ������� ������ ���������������� ��������� (����� �� �����/�����/���� � ������������) - ���������� + �� �������.
3.4 ����������� ������ �������� ������ ���������� ���������������� ���������� - ����������.
3.5 ����������� ������������� ��������� ���������, � ��� �� ��������� ����� ����������� ��� - ���������.
3.6 ����������� ������ ����� �� �������� (�� ����������� ������� "���������� �������",����������������� ������� � ������� � ��� �������������) - ���������.
3.7 ����������� ��������������� ����������� ������� � ������� � ������/������� - ����������.
3.7 ����������: ����. �������� (������������ �������� �������� �������).
3.8 ����������� ��� ����������/�������� (����������) �������� �����/���� ����� - ����������.
3.9 ����������� ������ ����� �� ��������������� ���������� ���������/������ - ���������.
3.9 ����������: ������������ ����� � ������ ��������������� ������������� �����������.
3.10 ����������� � ������� ����� ������ �� ���� ���������� ���������� - �������������� / ���������.
3.11 ����������� ��������� ������� � ���� ������ ������� - ��������� / ����������
3.11 ����������: ���� �� �������� � ������ �������� ���� ������������, �� ������ �������� �� ���� � �����������.
4.1 ����������� ������� ������������ ������ ��� ����������� ��� - ���������.
4.1 ����������: ���� ������ ��� ����� �� ������ � �� ������ ��� ��������.
4.2 ����������� �������� ������ ��� ������� �� �� �������, �� �������. ����� ������� - �� ���� ����� ��������� ����� - ��������� / ����������.
4.3 ����������� ������������� ����-����, �� �����, ������ ���� ���������� - ���������.
4.4 ����������� ������������ ����������� �����, � ����� ����������� - ��������� / ����������.
4.5 ����������� � ������� ����� ���������� ������ ������ ( ���� � ������, ������� � ������, �����, ��������� � ������� ����� � 9:00 �� 22:00 �� ����������� ������� � 13:00 �� 14:00 , � �������, ����� �������������� ����������� ���� ������������ �������������� �������) - �������������� / ��������� / ����������.
4.5 ����������: ���������� �� ������� ����������� �����������, ���������� ��������� ������������ (��������, ������ ���������) ��� ���������� ��� ���������� �������� ����������� �������.
4.6 ����������� �������� � ������������ ������������� �������, � ����� �������� �������� ���������� - ����������.
4.6 ����������: ���������� PD, ���������� ��� � ����� ����. �������� (� ������������ ��������� �������� �������).
4.7 ����������� ���������� � ������� ������ ��� ����. �������� - ����������.
4.7 ����������: ����. ��������, ����������� �������,����������� ������ (������������ �������� �� ������� ����������� �����������).
4.8 ����������� ��������� � ������ �� �� ���������� ������� - �������������� / ���������.
4.9 ����������� ������������ �������� �� ������ � ������ ������ - ���������.
4.9 ����������: ������� �� ������ - � ������ ����� �����������.
4.10 ����������� ����������� �������� � ������� ����� - ���������.
4.11 ����������� �����/������ ������ - ����������.
4.12 ����������� �������� ������� ����� ������������ - �������������� / ���������.
4.13 ����������� ����������� ���������� ��������������� ����������� - ���������.
4.14 ����������� ������ �������� ��� ������� �� �� ������ - ����������� ��������� �������� �� ���� ����������� ������� + ���������.
4.14 ����������: ���� �� �������, ��� ��������������� ��������� ������� ������� ��������� �������� ��� � ����������� ����� �� (��� ����������������� ������� ��������), � � ��� ���� ��������������, �� ������ ������ ����� ������� ��������.
4.15 ����������� �������� ������������ ��� ������� �� �������� �� ������ - �������������� / ���������.
4.16 ����������� �������� � ���������� ��� �������� ������������� - ��������� / ����������.
4.16 ����������: ��������� ������������ ������������ � �����������, ���� ��� �������� � ������ ���� � � ��� ���� ��������������.
4.17 ����������� �������� ������ �����, �� ����� � ����� �� ��� ��� - �������������� / ��������� / ����������.
4.17 ����������: ���� � ��� ���� ��������������, �������������� ���� ������ ���� ��������� ������������ �� ������: ����������� ���� � �������; ������ ������� ���������; ��� ���������� ���������� �����, �� �������� �� ��� ���������� ��������� ������������ ( �� � ����� ); ������ �������� �� ������ � ������ ������.
4.18 ����������� �������� ����� ������� Police - ������� / ��������� / ����������.
4.19 ����������� ������������ ������������ ������� ��� - ����������.
4.20 ����������� ������������ ���� � ������ ������ ����� Evolve - ����������.
4.21 ����������� �������� ������� ���� - ����������.
4.22 ����������� �������� ������� ����������� ��� - ����������.
5.1 ��������� ��� ����� ����� ������� ��������� �� �������������� ��������� � ���� ��������������.
5.2 C�������� ����� ��� �� ������ ������� ������ � ����� ���� � ����������� ����� �� �������� ��.
5.3 ����� ��������� �������������� ������� ���, ������ �� ��� �������� ������ � �����. ������ �������������� �� ������, ������� ��� ��� ����� �������� ��������� ��������������� ������������ - ���������.
5.4 ��������� ����� ����� �������� ������ ���� ��������������, ��� ����������� ���������� ������� ����� ������ ���������.
5.5 ������, ����������������� ����� ���� ���������, ������������� ���������� ������ �� ��� �� ���������� ��������� ���������, � ����������� �� ������� ��������� � ������� �������� ��������������, ���� ��������� � �������.
), %FedP2%
if(!FileExist(Penal2))
	FileAppend,
(
1. ��������, ��������� �������� �����������.
1.1 �� �������� ��� ��������� �������� �����������, ����������� ������������� 2 ������� �������.
1.1 [ ����� �����, �����, �������, ������� � �����. ]
2. ���������� ���������, ������������� �������������� ������.
2.1 �� ���������� ��������� �� �����������, ����������� ������������� 3 ������� ������� + ������� �������� �� ������.
2.2 �� ���������� ��������� �� ���.�����������, ����������� ������������� 6 ������� ������� + ������� �������� �� ������ + ������ �� ����� ��� ����� [���].
2.2 [ ������ ������� �� ������������� �������������� ������ � ����� ��������� ����������� ����� ��� �����������/����������� ���������. ]
2.2 � ������ ����������� ��������� ������������ ������, �� ������ ��� ������� ������� ��������������� ��������. ���� �������� ���, ������������� �� ����� ������������� �� ������ �� "������� ������ ��� ��������". ]
3. ��������.
3.1 �� �������� ��� ����� ��������, ����������� ������������� 3 ������� �������.
3.2 �� �������� ��������������� ��� ����������, ����������� ������������� 4 ������� �������.
3.3 �� �������� ������������ ��� ����������, ����������� ������������� 5 ������� �������.
3.4 �� �������� ������ ��� ��� ����������, ����������� ������������� 6 ������� �������.
4. �����������, ����������������.
4.1 �� ����������� � ������������ ��������� � ������������ ������, ����������� ������������� 1 ������� �������.
4.1 [ � ����������� �������������� ����� ��������� ������������� �������: ������� �� ����� ����������, ���������� �� ����� ���������, ������ ����� �� ���������� �����, ���� � ����� ��� ����� � ��� �� ����������.
4.1 ���� ������� ������� ������ ������ � �������� ����� �� �������, ��� �� ��������� ������������. ]
4.2 �� ���������������� � ������������ ������, ����������� ������������� 1 ������� �������.
5. �����������.
5.1 �� ����������� � ����� �����, ����������� ������������� 2 ������� �������.
5.1 [ ����������� � ��� ����� ������� �������� �� �������� � �������, �������� ��������� � "�����" � ��������� ������������� ������� ��������. ��� �� ������������ ����� ������� ������������ ����, �������������� [������, ����������, ���������� � �.�.].
5.1 � ������ ���� ����������� ���� � ������ ������������ �����, ��� ���������� ������� ������� ������ �� ������������ ���� � ������� ��� ����� [������ ����� �� ��������].
6. ���� ������������� ��������.
6.1 �� ���� ������������� ��������, ����������� ������������� 2 ������� �������.
6.1 [ ���� ��������� ������ ���� �����, ����� ���������� ��������� � ����� �������� �� ����� ���������� � � ���� ������� ������� ����������� �� "�������������", � ����������� �� �������� ������������� ���������������.
6.1 ���� ���� ���������� ����� ����� ����, ��� �� ������� �������� � ����� ���������. ]
7. ������������, ������� �������� �� �������, �����.
7.1 �� ������������ ������������������ �������, ����������� ������������� 1 ������� �������.
7.1 [ ������������� ������� ������� ����� ��� ������������� �������� ���������� �������, ��� ������: ����� �������� ����� ���� ��� ����� �������� ����� ���������� ���������� ���. ��������.
7.1 ����� ���������� ����� ��� ����������� �������� � ���������� ������������� �� ��������! ]
7.2 �� ������� �������� �� ����������� ������������������ �������, ����������� ������������� 2 ������� �������.
7.3 �� ����� �� ������ ��� ������ ������ �� ����� [/escape], ����������� ������������� 6 ������� ������� � ������ �� ����� ��� ����� [���].
7.3 [ ����� ������������ ������� �� ��������� ���� ��� 3 � ���� ������ ������� [����� ���-�� ��. �� ����������� �������] � �� ��� �� ������.
7.3 ��� ���������� ������ �� ���, � ������ ��� ������ ��� ���������� 6+, ��� ��� ���� ���������� ����� ����������� ������������� ������ ������ ���.
7.3 �������, ����� � ��� � ��������, �������� ��������� ��������, �� ��������������� ������������ � ���������, ����� ��������� ��������� ������ �� ���������� � ���������� � �� ���. ��������. ]
8. ��������� � ������������.
8.1 �� ��������� � ������������, ����������� ������������� ���� �� ���������, ��� � ������������.
8.1 [ ������: ������� ���� ���������, ���� ���������� ��������, � �������� �������� �������� �� ������, ������� ���� ����� ������������� ���������� � �� ����������.
8.1 ������ ���� �������� ����������, � �������� �������� ���� �����, �� �������� ������������ �� ��������, ��� ��� �� �� ��������� � ������������.
8.1 �� ������� ������ � ����������� ������������, ���� �������� � ������� ������������ �������� ���/���� ����� ��� �������� ����������� �������� ������ �������, �� ��� ����� �� ���������. ]
9. ������.
9.1 �� ������� ������ � �������� ����, ����� ���. �������� ����������� ��� ���������� ��������� ������������ � ������ ���������.
9.2 �� ������� ������ ��� ��������, ����������� ������������� 1 ������� ������� � ����� � ������� 2000$.
9.3 �� ������������ ������ ����������� ��������, ��� ������������ ��� ��� �������, ����������� ������������� 3 ������� ������� � ����������� �������� ������ �/��� ����������.
9.3 [ ����������� �������� �������� ������������ ������ �� ���������� � �����. ��������� ������ � ������� � NPC � ����. ]
10. ��������� � ���������.
10.1 �� �������� ��� ��������� ����������, ����������� ������������� 3 ������� ������� � �������� ������������� �������.
10.2 �� �������� ��� ��������� ����������, ����������� ������������� 3 ������� ������� � �������� ����������.
10.3 �� ������������ ����������, ����������� ������������� 3 ������� ������� � ����������� �������� ������������� �������.
10.3 [ ��������� ������� � "/me ���� �������", � ����� ���������� �������� � �������� ��������� � �� �������� ���������� ��-����������.
10.3 ���� �� ������ � ���� "Nick_Name ���������(�) ��������", �� ����� ������������ �����������, ��� ������������ ������� ��� ��� ���������� ����� �� ����� ������ � �� �������� ������ �������� ������.
10.3 ��� ������������ ������������� �������, ������ ������� ��� �� �������� � �� �� ��������. ]
10.4 �� ������������ ������������� ������� ���. ��������, ��������� ����������� �� ����������� � �������� 3 ������� �������.
10.5 �� �������/�������/������� ���������� ��� ����������, ����������� ������������� 2 ������� ������� � ������� ����������/����������.
10.6 �� ������������ ����������/������������ �������, ������������� 3 ������� �������.
10.6 [ ��������� ��� �� � ����������� "���������" �� ������. ��������� �������� ��� �������, ����������� � ������� ����� ������� ��������� ��������� �� ��������. ]
11. ����������� � ����������� ���������.
11.1 �� ����������� ������ ���������, ����������� ������������� 1 ������� ������� � ����� � ������� 5000$
11.2 �� ����������� ������ ���������, ����������� ������������� 4 ������� �������, ����� � ������� 15000$ � ������ ������� ����������� �� ��������� �����.
11.2 [ ������������ �������� ����� ��������, ����� �������� ������� ��������� ��� ����� [�����������, �������, ����������� � �.�.]
12. ������������� �� ��������� ����������.
12.1 �� ������������� �� ���������� ����������, ����������� ������������� 2 ������� �������.
12.1 [ ���������� �������� ������ � ������������, ���� ���, ������� SAPD, ������ � ���� ����� �����, ����� ���������� - ������ ������� �������� ����� ���������� ��������� �������. ���������� ���� ������, ������������� �� ���������� ����������� ��� ���������� ������ ������������ - ������ ������� �������� ����� ��, ����� ��������� �������.
12.1 ���� ���������� �������� �������������� �� ����������, �� ������ ������� �������� ��� �� � �� ���� ������ (�������� � �����, �������� ���������, ����� �/� � �.�.). ].
12.2 �� ������������� �� ������� ����������, ����������� ������������� 1 ������� �������.
12.2 [ ������������� � ��������� �������� ����������, ���� ��� �������������� ��� �������� ���������/���������� ������� ����������.
12.2 ����� SFN ��� �� �������� ������� ����������� ].
13. ���������.
13.1 �� ���������� ������� ��� �����������, ����������� ������������� 3 ������� ������� � ����������� �������� ������������� ���������.
13.1 [ ��� ����������� �� �����, ��������� ��� ���������, ������ ������� �������� ��� �� � �� ��������. ]
13.2 �� ��������������, ����������� ������������� 2 ������� �������.
13.2 [ "� �������, ���� �� ������ ������ ��� ��� ���� ������, ���� �� ���������� ��� ������ �� ��������� �����������!", "� � ���� ���� ���-�� ������ ��������, ���� �� ������ ������� ��� 50000$, ���� � �� ��� ��������� � ���� ������!" � ������� ��������� ��� ��������� � ��������������. ]
13.3 �� ������, ����������� ������������� 1 ������� �������.
13.3 [ ������ ��������� "���� �������/������/������� � �� ���. ��������" � ������������ �� ���� ������, �� ���� ��������� � ������� ������� "� ���� ����������!" � ��� �� �������� ����������. ]
13.4 �� ����������, ����������� ������������� 2 ������� �������.
13.4 [ ������� ������� "� �����! �������, ��� �� �������?!", �������������� ����� ����� "/me ������� ������� �����", "/me ������ � ����" � �.�. � ������� ��������� ��� ��������� � ����������. ]
13.5 �� �������������, ����������� ������������� 2 ������� �������.
13.5 [ ������: ������� �� ������������ ���. ���� � ���������� ��������� [/fare] �������� ������/������ ������, � ��� ������ �� ���� � ���������� �� ����. �������� �������� �������������� � �� ��� ������� �����������.
13.5 "� ������ ��������, ��� ���������� ��������? ������� ������ � �����." � NonRP-�������������, � ���� �������� ����������� �������� � ������ �������������. ]
13.6 �� ������� ������/����� ���� ������ �������, ����������� ������������� 1 ������� �������.
14. ����������� � �������������.
14.1 �� ����������� �������� �����, ����������� ������������� 1 ������� �������.
14.2 �� ������������� ����������� ������������� 3 ������� �������.
15. ���� ������ ���������, ������������� ��������� ����������.
15.1 �� �������������� ������������/������������/������/���� � ������ ������ ��� ��������� ���������� ��� �� ���� ������ ���������, ����������� ������������� 2 ������� �������.
15.2 �� ������������� ��������� ���������� ��� �������������, ������������� 1 ������� �������.
16. �������.
16.1 �� ������� �� ����������� ��� ��������������� ����, ������������� 1 ������� �������.
16.2 �� ������� �� ��������������� � ������� �����������, ������������� 2 ������� �������.
17. �������, ������� � �������� ������� �����.
17.1 �� ������� �������� ���������, ������� �������� ����������, ��������� � ������ ������ �����, ��� �� ��� ������������� 3 ������� �������.
17.2 �� ������� ������� �����, ����������� ������������� 2 ������� �������, ����� �������� �������.
17.3 �� ��������/������� ��������� ��� ���������� ������� �����, ����������� ������������� 2 ������� �������, ����� �������� �������.
17.3 [ ��� ��������, ��� ������� � ��� ���� � ���� ������������ � ��� ���������� ��������� ������� �������� ���� �� ������ ���� ������. ]
18. �������, ����� � ������� ������ �� �����.
18.1 �� �������/�������/����� ������ �� ������, ����������� ������������� 6 ������� �������.
19. ���������.
19.1 �� ����������� ������, ����������� ������������� 2 ������� �������.
19.2 �� �������� ������, ���. ��������� ����� ��������� � ���� ���������� 2 ������ ������� � ����������.
19.2 [ ����� ������ ���� ��������� �� ���������, �� ������ ������������ ����������� ��-��������������, � �������: ������ ��������� ��� ����� � �����������������, � ������������ ��-����������.
19.2 ������� ����������� ��������� �������������� ���������, �� �������� ������� �� ������� �����, �� �������� ��������� ����� "/me ����� ��� �������� ��� �����������, ��������, ���� � �.�.", ����� ��������� ��������� �� PowerGaming. ]
20. ��������� � ������ � ���������.
20.1 �� ���������� �������, ������ ������ � ���������, ����������� ������������� 6 ������� �������, ������� ���� �������� � ������ �� ����� ��� ����� [���].
20.1 [ ���������������� ��� � ���������� ������, ������� ��� ���� ��������, ����������� ��������� � ��������� ��������� ������ ��������, ������ ����� � ������������� � ��� �������������� ����� ���������.
20.1 �������� � ������ ����� ���������, �������� � �����, ������ � ��������� ��������. ����������� ��������� �� ������ ��������, ���������������� ����� �� ��������. ]
20.2 �� ��������� ��� ������ � ��������� ������� ��� ���. �����������, ����������� ������������� 4 ������� �������, ������� �������� �� ������ � ������ �� ����� ��� ����� [���].
21. ����������� �����������/�����������. �������.
21.1 �� ����������� ����������� �����������/�������� (��� �������� ����, �������-�������� ��� ������ �����������, ������� ����� ������ ����������), ������������� ������������� 2 ������� �������.
21.2 �� �������� ����������� ����������� (��� �������� ���� ��� �������-��������), ������������ � ��������� �������� ��������� � ���� 3 ������ �������.
22. �������������.
22.1 �� ������� ��� �������� [�������������], ����������� ������������� 1 ������� �������.
23. �������� ������.
23.1 �� �������� ������, ����������� ������������� 2 ������� �������.
24. ������������� ����.�����.
24.1 �� ������������� ����������� ����� ��� �������� ���������������� ����������, ����������� ������������� 1 ������� �������.
������ II
1. ������������ ��������.
1.1 �� ���� � "���" �� 30 � ������ ������ ��� �� ��� �� ������, ����������� ������������� 6 ������� ������� � ��������: "����" � ������ �� ����� ��� ����� [���].
1.2 �� ���������� ���������� �������� [������������ ���], �������� ������������� 3 ������� ������� � ������ �� ����� ��� ����� [������ ������ �������������� � ��������� ���].
1.2 [ ������������� ���������� ������������� �� ������ �� ����� � ����� ���������� (������ 7.3) ].
1.3 �� �������� � ���� ������� � ������������� 6 ������� ������� � ������ �� ����� ��� ����� [���].
1.3 [ ��������� �������� ���� ������ ����������, � ������ �����, � ��������� ������������, �������� � ���-��������. ]
2. �������� ���������������.
2.1 �� ��������� �� ������� � �������� ���������������, ����������� ������������� 3 ������� ������� � ������ �� ����� ��� ����� [���], ��� �� ���������� ���������/���������� �� �����������, ���� �� ��� �������, ���� ��� ����������, �� ��� ������������� ����� ��������������� �����.
2.2 �� ����� � ������� �������� �����������, ����������� ������������� 2 ������� ������� � ������ �� ����� ��� ����� [���], ��� �� ���������� ���������/���������� �� �����������, ���� �� ��� �������, ���� ��� ����������, �� ��� ������������� ����� ��������������� �����.
2.3 �� ��������� �� ���������� ��������� [���/����� �� ����/������������� ������� � �.�.], ����������� ������������� 3 ������� ������� � ������ �� ����� ��� ����� [���], ��� �� ���������� ���������/���������� �� �����������, ���� �� ��� �������, ���� �� ��� ����������, �� ��� ������������� ����� ��������������� �����.
2.4 �� ��������� ������� �� �������� ��������� [�������� ���� ���������� ��������, ������� �������� ��������], ����������� ������������� 2 ������� ������� � ������ �� ����� ��� ����� [���], ��� �� ���� �� ������� ��������� ����������, �� ����������� ������ 2.3.
3. ��������� �������� ����������� ��������.
3.1 �� ������� ������� ��� �������� ����������� ������������� 1 ������� ������� � ����� � ������� 100.000$.
), %Penal2%
if(!FileExist(Administrative2))
	FileAppend,
(
{FFFFFF}������ 1. ���������� ������� ������������ � ����� ������������ ���������������� ��������� ����������, � ������ ���� � �������� ��� ���������� ������������� ����������� ������������������ �������.
������ 2. ����� �� ������ ������ ������������ � ������������ �� ������� 13.1 ������������ ���������� �������.
������ 3. ������������ ������������� ����� ������ ���������� 5000 ����, � ������ ���������� ���������� ����� ����������� ������������������ �������, �� ����� ��������� � ��������������� �� ��������������� ���������� ������������.
������ 4. 4.1. ��������� ������� �������� ��������������� ����������� ��������������� ������� ������������ ������� � ������� 100.000 ���� � ������ ��� � 300.000 � ������ ���������� ���������.
������ 4. 4.2. �������� ������� ��� ��������������� �������� ������������ ������� � ������� 300.000 ����.
������ 4. 4.3. ����� �� ������� �������, ��������������� ������� 4 ������� �� ���������������� ��������������� ������������ � ������������ � ������� 24 ������������ ���������� �������.
������ 5. 5.1. �������� ������������� ������� � ������� �� 5 ����� ������������ ������� � ������� 5000 ���� � �������� �������.
������ 6. 6.1. �������� ������ ����� ����������� ��������������� ����������� ������������ ������� � ������� 5000 ����.
������ 7. 7.1. �������� �� ��������� ������ ������������ �������� ������������� �������������.
������ 8. 8.1. ����������� ���������� ����� ��� ������������ ������� � ������� 5000 ����.
������ 8. 8.2. ����� ��������� ���������� ����� ��� �� ������� ����������� ������� ������������ ������� � ������� 1000 ����.
������ 9. 9.1. ��������� ������������� ������ �������� ������������ ������� � ������� 5000 ����.
������ 9. 9.2. ���������� ���������� ������� �������� ����� ������������ �������� ������������� �������������.
������ 10. 10.1. ���������� �������� ��������� �������� ������������ �������� ������������� �������������.
������ 10. 10.2. ��������� ����� �������� ���������� � ������ ��������� ������ ��������� �������� ������������ �������� ������������� �������������.
������ 10. 10.3. ���������� ������������ ��������� � ��������� ������������ ��� �������������� ��������� ������������ ������� � ������� 5000 ����.
������ 10. 10.4. ���������������� �������� ��������� �������� ������������ ������� � ������� 1000 ����.
������ 11. 11.1. �������� �� ���������, ��������, ������ ����������� ������������ ������� � ������� 5000 ����.
������ 12. 12.1. ���������� �������� ��������� ��������� �������� ������������ ������� � ������� 5000 ����.
������ 12. 12.2. ���������������� �������� ��������� ��������� �������� ������������ ������� � ������� 1000 ����.
), %Administrative2%
if(!FileExist(Penal1))
	FileAppend,
(
1. ��������, ��������� �������� �����������.
1.1 �� �������� ��� ��������� �������� �����������, ����������� ������������� 2 ������� �������.
1.1 [ ����� �����, �����, �������, ������� � �����. ]
2. ���������� ���������, ������������� �������������� ������.
2.1 �� ���������� ��������� �� �����������, ����������� ������������� 3 ������� ������� + ������� �������� �� ������.
2.2 �� ���������� ��������� �� ���.�����������, ����������� ������������� 6 ������� ������� + ������� �������� �� ������ + ������ �� ����� ��� ����� [���].
2.2 [ ������ ������� �� ������������� �������������� ������ � ����� ��������� ����������� ����� ��� �����������/����������� ���������. ]
2.2 � ������ ����������� ��������� ������������ ������, �� ������ ��� ������� ������� ��������������� ��������. ���� �������� ���, ������������� �� ����� ������������� �� ������ �� "������� ������ ��� ��������". ]
3. ��������.
3.1 �� �������� ��� ����� ��������, ����������� ������������� 3 ������� �������.
3.2 �� �������� ��������������� ��� ����������, ����������� ������������� 4 ������� �������.
3.3 �� �������� ������������ ��� ����������, ����������� ������������� 5 ������� �������.
3.4 �� �������� ������ ��� ��� ����������, ����������� ������������� 6 ������� �������.
4. �����������, ����������������.
4.1 �� ����������� � ������������ ��������� � ������������ ������, ����������� ������������� 1 ������� �������.
4.1 [ � ����������� �������������� ����� ��������� ������������� �������: ������� �� ����� ����������, ���������� �� ����� ���������, ������ ����� �� ���������� �����, ���� � ����� ��� ����� � ��� �� ����������.
4.1 ���� ������� ������� ������ ������ � �������� ����� �� �������, ��� �� ��������� ������������. ]
4.2 �� ���������������� � ������������ ������, ����������� ������������� 1 ������� �������.
5. �����������.
5.1 �� ����������� � ����� �����, ����������� ������������� 2 ������� �������.
5.1 [ ����������� � ��� ����� ������� �������� �� �������� � �������, �������� ��������� � "�����" � ��������� ������������� ������� ��������. ��� �� ������������ ����� ������� ������������ ����, �������������� [������, ����������, ���������� � �.�.].
5.1 � ������ ���� ����������� ���� � ������ ������������ �����, ��� ���������� ������� ������� ������ �� ������������ ���� � ������� ��� ����� [������ ����� �� ��������].
6. ���� ������������� ��������.
6.1 �� ���� ������������� ��������, ����������� ������������� 2 ������� �������.
6.1 [ ���� ��������� ������ ���� �����, ����� ���������� ��������� � ����� �������� �� ����� ���������� � � ���� ������� ������� ����������� �� "�������������", � ����������� �� �������� ������������� ���������������.
6.1 ���� ���� ���������� ����� ����� ����, ��� �� ������� �������� � ����� ���������. ]
7. ������������, ������� �������� �� �������, �����.
7.1 �� ������������ ������������������ �������, ����������� ������������� 1 ������� �������.
7.1 [ ������������� ������� ������� ����� ��� ������������� �������� ���������� �������, ��� ������: ����� �������� ����� ���� ��� ����� �������� ����� ���������� ���������� ���. ��������.
7.1 ����� ���������� ����� ��� ����������� �������� � ���������� ������������� �� ��������! ]
7.2 �� ������� �������� �� ����������� ������������������ �������, ����������� ������������� 2 ������� �������.
7.3 �� ����� �� ������ ��� ������ ������ �� ����� [/escape], ����������� ������������� 6 ������� ������� � ������ �� ����� ��� ����� [���].
7.3 [ ����� ������������ ������� �� ��������� ���� ��� 3 � ���� ������ ������� [����� ���-�� ��. �� ����������� �������] � �� ��� �� ������.
7.3 ��� ���������� ������ �� ���, � ������ ��� ������ ��� ���������� 6+, ��� ��� ���� ���������� ����� ����������� ������������� ������ ������ ���.
7.3 �������, ����� � ��� � ��������, �������� ��������� ��������, �� ��������������� ������������ � ���������, ����� ��������� ��������� ������ �� ���������� � ���������� � �� ���. ��������. ]
8. ��������� � ������������.
8.1 �� ��������� � ������������, ����������� ������������� ���� �� ���������, ��� � ������������.
8.1 [ ������: ������� ���� ���������, ���� ���������� ��������, � �������� �������� �������� �� ������, ������� ���� ����� ������������� ���������� � �� ����������.
8.1 ������ ���� �������� ����������, � �������� �������� ���� �����, �� �������� ������������ �� ��������, ��� ��� �� �� ��������� � ������������.
8.1 �� ������� ������ � ����������� ������������, ���� �������� � ������� ������������ �������� ���/���� ����� ��� �������� ����������� �������� ������ �������, �� ��� ����� �� ���������. ]
9. ������.
9.1 �� ������� ������ � �������� ����, ����� ���. �������� ����������� ��� ���������� ��������� ������������ � ������ ���������.
9.2 �� ������� ������ ��� ��������, ����������� ������������� 1 ������� ������� � ����� � ������� 2000$.
9.3 �� ������������ ������ ����������� ��������, ��� ������������ ��� ��� �������, ����������� ������������� 3 ������� ������� � ����������� �������� ������ �/��� ����������.
9.3 [ ����������� �������� �������� ������������ ������ �� ���������� � �����. ��������� ������ � ������� � NPC � ����. ]
10. ��������� � ���������.
10.1 �� �������� ��� ��������� ����������, ����������� ������������� 3 ������� ������� � �������� ������������� �������.
10.2 �� �������� ��� ��������� ����������, ����������� ������������� 3 ������� ������� � �������� ����������.
10.3 �� ������������ ����������, ����������� ������������� 3 ������� ������� � ����������� �������� ������������� �������.
10.3 [ ��������� ������� � "/me ���� �������", � ����� ���������� �������� � �������� ��������� � �� �������� ���������� ��-����������.
10.3 ���� �� ������ � ���� "Nick_Name ���������(�) ��������", �� ����� ������������ �����������, ��� ������������ ������� ��� ��� ���������� ����� �� ����� ������ � �� �������� ������ �������� ������.
10.3 ��� ������������ ������������� �������, ������ ������� ��� �� �������� � �� �� ��������. ]
10.4 �� ������������ ������������� ������� ���. ��������, ��������� ����������� �� ����������� � �������� 3 ������� �������.
10.5 �� �������/�������/������� ���������� ��� ����������, ����������� ������������� 2 ������� ������� � ������� ����������/����������.
10.6 �� ������������ ����������/������������ �������, ������������� 3 ������� �������.
10.6 [ ��������� ��� �� � ����������� "���������" �� ������. ��������� �������� ��� �������, ����������� � ������� ����� ������� ��������� ��������� �� ��������. ]
11. ����������� � ����������� ���������.
11.1 �� ����������� ������ ���������, ����������� ������������� 1 ������� ������� � ����� � ������� 5000$
11.2 �� ����������� ������ ���������, ����������� ������������� 4 ������� �������, ����� � ������� 15000$ � ������ ������� ����������� �� ��������� �����.
11.2 [ ������������ �������� ����� ��������, ����� �������� ������� ��������� ��� ����� [�����������, �������, ����������� � �.�.]
12. ������������� �� ��������� ����������.
12.1 �� ������������� �� ���������� ����������, ����������� ������������� 2 ������� �������.
12.1 [ ���������� �������� ������ � ������������, ���� ���, ������� SAPD, ������ � ���� ����� �����, ����� ���������� - ������ ������� �������� ����� ���������� ��������� �������. ���������� ���� ������, ������������� �� ���������� ����������� ��� ���������� ������ ������������ - ������ ������� �������� ����� ��, ����� ��������� �������.
12.1 ���� ���������� �������� �������������� �� ����������, �� ������ ������� �������� ��� �� � �� ���� ������ (�������� � �����, �������� ���������, ����� �/� � �.�.). ].
12.2 �� ������������� �� ������� ����������, ����������� ������������� 1 ������� �������.
12.2 [ ������������� � ��������� �������� ����������, ���� ��� �������������� ��� �������� ���������/���������� ������� ����������.
12.2 ����� SFN ��� �� �������� ������� ����������� ].
13. ���������.
13.1 �� ���������� ������� ��� �����������, ����������� ������������� 3 ������� ������� � ����������� �������� ������������� ���������.
13.1 [ ��� ����������� �� �����, ��������� ��� ���������, ������ ������� �������� ��� �� � �� ��������. ]
13.2 �� ��������������, ����������� ������������� 2 ������� �������.
13.2 [ "� �������, ���� �� ������ ������ ��� ��� ���� ������, ���� �� ���������� ��� ������ �� ��������� �����������!", "� � ���� ���� ���-�� ������ ��������, ���� �� ������ ������� ��� 50000$, ���� � �� ��� ��������� � ���� ������!" � ������� ��������� ��� ��������� � ��������������. ]
13.3 �� ������, ����������� ������������� 1 ������� �������.
13.3 [ ������ ��������� "���� �������/������/������� � �� ���. ��������" � ������������ �� ���� ������, �� ���� ��������� � ������� ������� "� ���� ����������!" � ��� �� �������� ����������. ]
13.4 �� ����������, ����������� ������������� 2 ������� �������.
13.4 [ ������� ������� "� �����! �������, ��� �� �������?!", �������������� ����� ����� "/me ������� ������� �����", "/me ������ � ����" � �.�. � ������� ��������� ��� ��������� � ����������. ]
13.5 �� �������������, ����������� ������������� 2 ������� �������.
13.5 [ ������: ������� �� ������������ ���. ���� � ���������� ��������� [/fare] �������� ������/������ ������, � ��� ������ �� ���� � ���������� �� ����. �������� �������� �������������� � �� ��� ������� �����������.
13.5 "� ������ ��������, ��� ���������� ��������? ������� ������ � �����." � NonRP-�������������, � ���� �������� ����������� �������� � ������ �������������. ]
13.6 �� ������� ������/����� ���� ������ �������, ����������� ������������� 1 ������� �������.
14. ����������� � �������������.
14.1 �� ����������� �������� �����, ����������� ������������� 1 ������� �������.
14.2 �� ������������� ����������� ������������� 3 ������� �������.
15. ���� ������ ���������, ������������� ��������� ����������.
15.1 �� �������������� ������������/������������/������/���� � ������ ������ ��� ��������� ���������� ��� �� ���� ������ ���������, ����������� ������������� 2 ������� �������.
15.2 �� ������������� ��������� ���������� ��� �������������, ������������� 1 ������� �������.
16. �������.
16.1 �� ������� �� ����������� ��� ��������������� ����, ������������� 1 ������� �������.
16.2 �� ������� �� ��������������� � ������� �����������, ������������� 2 ������� �������.
17. �������, ������� � �������� ������� �����.
17.1 �� ������� �������� ���������, ������� �������� ����������, ��������� � ������ ������ �����, ��� �� ��� ������������� 3 ������� �������.
17.2 �� ������� ������� �����, ����������� ������������� 2 ������� �������, ����� �������� �������.
17.3 �� ��������/������� ��������� ��� ���������� ������� �����, ����������� ������������� 2 ������� �������, ����� �������� �������.
17.3 [ ��� ��������, ��� ������� � ��� ���� � ���� ������������ � ��� ���������� ��������� ������� �������� ���� �� ������ ���� ������. ]
18. �������, ����� � ������� ������ �� �����.
18.1 �� �������/�������/����� ������ �� ������, ����������� ������������� 6 ������� �������.
19. ���������.
19.1 �� ����������� ������, ����������� ������������� 2 ������� �������.
19.2 �� �������� ������, ���. ��������� ����� ��������� � ���� ���������� 2 ������ ������� � ����������.
19.2 [ ����� ������ ���� ��������� �� ���������, �� ������ ������������ ����������� ��-��������������, � �������: ������ ��������� ��� ����� � �����������������, � ������������ ��-����������.
19.2 ������� ����������� ��������� �������������� ���������, �� �������� ������� �� ������� �����, �� �������� ��������� ����� "/me ����� ��� �������� ��� �����������, ��������, ���� � �.�.", ����� ��������� ��������� �� PowerGaming. ]
20. ��������� � ������ � ���������.
20.1 �� ���������� �������, ������ ������ � ���������, ����������� ������������� 6 ������� �������, ������� ���� �������� � ������ �� ����� ��� ����� [���].
20.1 [ ���������������� ��� � ���������� ������, ������� ��� ���� ��������, ����������� ��������� � ��������� ��������� ������ ��������, ������ ����� � ������������� � ��� �������������� ����� ���������.
20.1 �������� � ������ ����� ���������, �������� � �����, ������ � ��������� ��������. ����������� ��������� �� ������ ��������, ���������������� ����� �� ��������. ]
20.2 �� ��������� ��� ������ � ��������� ������� ��� ���. �����������, ����������� ������������� 4 ������� �������, ������� �������� �� ������ � ������ �� ����� ��� ����� [���].
21. ����������� �����������/�����������. �������.
21.1 �� ����������� ����������� �����������/�������� (��� �������� ����, �������-�������� ��� ������ �����������, ������� ����� ������ ����������), ������������� ������������� 2 ������� �������.
21.2 �� �������� ����������� ����������� (��� �������� ���� ��� �������-��������), ������������ � ��������� �������� ��������� � ���� 3 ������ �������.
22. �������������.
22.1 �� ������� ��� �������� [�������������], ����������� ������������� 1 ������� �������.
23. �������� ������.
23.1 �� �������� ������, ����������� ������������� 2 ������� �������.
24. ������������� ����.�����.
24.1 �� ������������� ����������� ����� ��� �������� ���������������� ����������, ����������� ������������� 1 ������� �������.
������ II
1. ������������ ��������.
1.1 �� ���� � "���" �� 30 � ������ ������ ��� �� ��� �� ������, ����������� ������������� 6 ������� ������� � ��������: "����" � ������ �� ����� ��� ����� [���].
1.2 �� ���������� ���������� �������� [������������ ���], �������� ������������� 3 ������� ������� � ������ �� ����� ��� ����� [������ ������ �������������� � ��������� ���].
1.2 [ ������������� ���������� ������������� �� ������ �� ����� � ����� ���������� (������ 7.3) ].
1.3 �� �������� � ���� ������� � ������������� 6 ������� ������� � ������ �� ����� ��� ����� [���].
1.3 [ ��������� �������� ���� ������ ����������, � ������ �����, � ��������� ������������, �������� � ���-��������. ]
2. �������� ���������������.
2.1 �� ��������� �� ������� � �������� ���������������, ����������� ������������� 3 ������� ������� � ������ �� ����� ��� ����� [���], ��� �� ���������� ���������/���������� �� �����������, ���� �� ��� �������, ���� ��� ����������, �� ��� ������������� ����� ��������������� �����.
2.2 �� ����� � ������� �������� �����������, ����������� ������������� 2 ������� ������� � ������ �� ����� ��� ����� [���], ��� �� ���������� ���������/���������� �� �����������, ���� �� ��� �������, ���� ��� ����������, �� ��� ������������� ����� ��������������� �����.
2.3 �� ��������� �� ���������� ��������� [���/����� �� ����/������������� ������� � �.�.], ����������� ������������� 3 ������� ������� � ������ �� ����� ��� ����� [���], ��� �� ���������� ���������/���������� �� �����������, ���� �� ��� �������, ���� �� ��� ����������, �� ��� ������������� ����� ��������������� �����.
2.4 �� ��������� ������� �� �������� ��������� [�������� ���� ���������� ��������, ������� �������� ��������], ����������� ������������� 2 ������� ������� � ������ �� ����� ��� ����� [���], ��� �� ���� �� ������� ��������� ����������, �� ����������� ������ 2.3.
3. ��������� �������� ����������� ��������.
3.1 �� ������� ������� ��� �������� ����������� ������������� 1 ������� ������� � ����� � ������� 100.000$.
), %Penal1%
if(!FileExist(FedP1))
	FileAppend,
(
���������
������������� �����.
0.1 ����������� ������������� - ��� ����������-�������� ���, ������� ��� ������� ������ ������ ����� � ������ ��������������� �����������.
0.2 ����������� ������������� ������� ����������� ���� ������������� (����� ���) ��� ����������� ������������� (����� ��) � ������� ������ (����� �����).
0.3 ����������� ������������� ����� ���� �������� ���������� ��� ( ��� ������� ��������� �������������� ) � ����� ����� ��� � ����, ��� ���������� � ���� ���������� ����� 48 ����� ����� ����������.
0.4 ����������� ������������� ������� ����������� ����� ������������ �������������� �����������.
0.5 �������� ������������ ������������� �� ����������� ����������� �� ���������������.
����� ����� ����
������������ ������ ��������������.
1.1 ����������� ������������������� ���������� �������������� ������ ������ ������ ������������ ����/���������� ��������������� ����������� - ����������.
1.2 ����������� ����� �������� ����� � ����������� ������� ��� �������� �� ��� ����������� ��� ��������� ������� - ����������.
1.3 ����������� ���������� ������� � ��������� ��� ������� ��� � ����������� ��� ������ ��� - ���������.
1.3 ������������� � ��������� ����������� ������������ ���� ������������� � �����.
2.1 ����������� ��������� �� ���������� FBI ��� ��������� ������������ �������� �� ������ �� ������� ��� ���� ��.������ - �������������� / ���������.
2.1 ����������: ����, ��������� �����, ������� ���������� �� ���������.
2.2 ����������� �������� ���� �� ������ ���������������� ���������� - ����������.
2.2 ����������: ������ ��� �� ����� ������� ������������ �������� ��� ����������.
2.3 ����������� ����� ����������� ���������� (������� / ���������) ��� ������� ��� - ����������.
2.4 ����������� ������������ ������ ��� � ������ ��� �������� ���������� - ��������� - ����������.
2.4 ����������: ������ ��� �� ����� ������� ������������ �������� ��� ����������.
2.5 ����������� ����������/��������/������������� ������ ��� - ����������.
2.6 ����������� ���������� ���������/����������, �������� ������� ���/����� ���-����, ����� ��� � ����������� ������� ����� - ��������� / ����������.
2.7 ����������� ���������� �������� ������ ���, ���� ��� ��������� ��� ���������� - ����������.
2.8 ����������� ������� ������ � ������ �������������� �������� �� ������ ������� ������, ���������� ������ ���� �������� � ��������������� ���������� - ���������.
2.9 ����������� �������� �������� �� ��� - ���������.
2.9 ����������: ����� ����� ����� ��� ������� � ���� � �������� ��������. ��� ������ ��������� ��������������� ��������� �������� ������ 2.9.
����� ����� ���
������������� � ��������� ����������� ������������� � �����.
3.1 ����������� ����� ���������� ������������� ��������� � ���������� - �������������� / ��������� / ����������.
3.2 ����������� �������� ������� ����� - �������������� / ���������.
3.3 ����������� ������� ������ ���������������� ��������� (����� �� �����/�����/���� � ������������) - ���������� + �� �������.
3.4 ����������� ������ �������� ������ ���������� ���������������� ���������� - ����������.
3.5 ����������� ������������� ��������� ���������, � ��� �� ��������� ����� ����������� ��� - ���������.
3.6 ����������� ������ ����� �� �������� (�� ����������� ������� "���������� �������",����������������� ������� � ������� � ��� �������������) - ���������.
3.7 ����������� ��������������� ����������� ������� � ������� � ������/������� - ����������.
3.7 ����������: ����. �������� (������������ �������� �������� �������).
3.8 ����������� ��� ����������/�������� (����������) �������� �����/���� ����� - ����������.
3.9 ����������� ������ ����� �� ��������������� ���������� ���������/������ - ���������.
3.9 ����������: ������������ ����� � ������ ��������������� ������������� �����������.
3.10 ����������� � ������� ����� ������ �� ���� ���������� ���������� - �������������� / ���������.
3.11 ����������� ��������� ������� � ���� ������ ������� - ��������� / ����������
3.11 ����������: ���� �� �������� � ������ �������� ���� ������������, �� ������ �������� �� ���� � �����������.
����� ����� ������
������������ ��������������� ����������� ������ ���� ������, � ������ �������� ����������.
4.1 ����������� ������� ������������ ������ ��� ����������� ��� - ���������.
4.1 ����������: ���� ������ ��� ����� �� ������ � �� ������ ��� ��������.
4.2 ����������� �������� ������ ��� ������� �� �� �������, �� �������. ����� ������� - �� ���� ����� ��������� ����� - ��������� / ����������.
4.3 ����������� ������������� ����-����, �� �����, ������ ���� ���������� - ���������.
4.4 ����������� ������������ ����������� �����, � ����� ����������� �� ��� ���� - ��������� / ����������.
4.5 ����������� � ������� ����� ���������� ������ ������ ( ���� � ������, ������� � ������, �����, ��������� � ������� ����� � 9:00 �� 22:00 �� ����������� ������� � 13:00 �� 14:00 , � �������, ����� �������������� ����������� ���� ������������ �������������� �������) - �������������� / ��������� / ����������.
4.5 ����������: ���������� �� ������� ����������� �����������, ���������� ��������� ������������ (��������, ������ ���������) ��� ���������� ��� ���������� �������� ����������� �������.
4.6 ����������� �������� � ������������ ������������� �������, � ����� �������� �������� ���������� - ����������.
4.6 ����������: ���������� PD, ���������� ��� � ����� ����. �������� (� ������������ ��������� �������� �������).
4.7 ����������� ���������� � ������� ������ ��� ����. �������� - ����������.
4.7 ����������: ����. ��������, ����������� �������,����������� ������ (������������ �������� �� ������� ����������� �����������).
4.8 ����������� ��������� � ������ �� �� ���������� ������� - �������������� / ���������.
4.9 ����������� ������������ �������� �� ������ � ������ ������ - ���������.
4.9 ����������: ������� �� ������ - � ������ ����� �����������.
4.10 ����������� ����������� �������� � ������� ����� - ���������.
4.11 ����������� �����/������ ������ - ����������.
4.12 ����������� �������� ������� ����� ������������ - ���������.
4.13 ����������� ����������� ���������� ��������������� ����������� - ���������.
4.14 ����������� ������ �������� ��� ������� �� �� ������ - ����������� ��������� �������� �� ���� ����������� ������� + ���������.
4.14 ����������: ���� �� �������, ��� ��������������� ��������� ������� ������� ��������� �������� ��� � ����������� ����� �� (��� ����������������� ������� ��������), � � ��� ���� ��������������, �� ������ ������ ����� ������� ��������.
4.15 ����������� �������� ������������ ��� ������� �� �������� �� ������ - �������������� / ���������.
4.16 ����������� �������� � ���������� ��� �������� ������������� - ��������� / ����������.
4.16 ����������: ��������� ������������ ������������ � �����������, ���� ��� �������� � ������ ���� � � ��� ���� ��������������.
4.17 ����������� �������� ������ �����, �� ����� � ����� �� ��� ��� - �������������� / ��������� / ����������.
4.17 ����������: ���� � ��� ���� ��������������, �������������� ���� ������ ���� ��������� ������������ �� ������: ����������� ���� � �������; ������ ������� ���������; ��� ���������� ���������� �����, �� �������� �� ��� ���������� ��������� ������������ ( �� � ����� ); ������ �������� �� ������ � ������ ������.
4.18 ����������� ������������ ������������ ������� ��� - ����������.
4.19 ����������� ������������ ���� � ������ ������ ����� Evolve - ����������.
4.20 ����������� �������� ������� ���� - ����������.
4.21 ����������� �������� ������� ����������� ��� - ����������.
����� ����� ����
�������������� ���������.
5.1 ��������� ��� ����� ����� ������� ��������� �� �������������� ��������� � ���� ��������������.
5.2 C�������� ����� ��� �� ������ ������� ������ � ����� ���� � ����������� ����� �� �������� ��.
5.3 ����� ��������� �������������� ������� ���, ������ �� ��� �������� ������ � �����. ������ �������������� �� ������, ������� ��� ��� ����� �������� ��������� ��������������� ������������ - ���������.
5.4 ��������� ����� ����� �������� ������ ���� ��������������, ��� ����������� ���������� ������� ����� ������ ���������.
5.5 ������, ����������������� ����� ���� ���������, ������������� ���������� ������ �� ��� �� ���������� ��������� ���������, � ����������� �� ������� ��������� � ������� �������� ��������������, ���� ��������� � �������.
), %FedP1%
if(!FileExist(Administrative1))
	FileAppend,
(
{FFFFFF}0.0 ���� ��� ���������� ���.
0.1 �� ���� ��� ��� �������� ����� [/clist 33], ���������� ������� ��������� � ���� �������������� � ������ �� �������.
���������� ���. �������� ����� ����� ��������� ���� ��� �������������. ]
1.1 ���� �� ��������� ������.
1.2 ���� �� ���������: ����� � ������� [LVL x 500$], � ������ �� �������� ������ � ������� ������������ ���� � ���������� �� ������ �� �������� �������.
1.2 [ ������ �� ��������� ������ �� ��������� ����������, ���� �� ���� ���������� ��-�� �������� � ��������� ��� ������ ��������� ]
2.0 ���������� ��������.
2.1 ���������� ��������: ����� � ������� [LVL x 500$].
3.0 ����� �� ��������.
3.1 ����� �� ��������: 2 ������� ������� + ������� ������������ ����.
4.0 �������� � ������������ �����.
4.1 �������� � ������������ ����� �������� ������������ ���������: ������� ������������ ����.
4.2 �������� � ������������ ����� ��������� ������������ ���������: ������� �������� ������.
5.0 ���, ���� � ����� ���.
5.1 �������� ���: ����� � ������� [LVL x 500$], ������� ������������� ������.
5.2 ��������� ����� ���: 3 ������� �������, ����� � ������� [LVL x 500$] + ������� ����.
6.0 ���������� ������������ ��������� � ��������� ���������.
6.1 ���������� �� � ������������� ��� ����������� ���������: 1 ������� ������� + ������� ����.
7.0 �������� ��������� ��������.
7.1 �������� ��������� �������� [��� �� ������ ������ ��������� ����, ���������� ������ ��������, ����������]: ������� ���� � ����� [LVL x 500$].
7.1 [ ����������� ������� ������������ �����, ���� ������� ��������� � ��� ]
8.0 �������� � ������������ �����.
8.1 �������� �� ���������, �������� � �/� �����: ����� � ������� [LVL x 500$], � ������ �� �������� ������ � ������� ������������ ���� � ���������� �� ������ �� �������� �������.
2-� ����� � ��� ���������:
10.1 �������� ��������� �������� [��� �� ������, ������ �� �������� �����, ��������������� �������� � ���������� ������ ��� ������]:
10.1 [ ��� ����� ����������� � ����� �� 1 �� 2-� ��� : ������ ��������������, ��� ��������� ��������� ���������� �����. ��� ����� ����������� � ����� �� 3-�� ���: ���������� �����. ����� [LVL x 250]. ]
), %Administrative1%
if(!FileExist(Lect))
	FileAppend,
(
����������� ����, ��������� ��������������.
� ��� ������� ���������� ������������ ������������ �.Los-Santos. 
� ���������� ��������. ����� ��������� ��������. 
������ � ��� �������� ������ ����� ������� ������ ��� ����������� �����������.
��� ���������� ������ ������� �������. 
� ����� ������������ ��� ������� ������������������ ��������, ������� ������... 
������������ ���������, ��� ��������� ��� � �������� "������� ���������� ������". 
� ��� ��, � ��� ���� ������������ ����� ��������� ����������� �������������. 
���� ������ � ��� �� ������� �������� ���� ������ � ����������� �����. 
�� ��� �� ��� ��������� - ��� ������ ���� ���������� ������ ����������. 
����� ����, � ��� ���� ������� ������. �� ������� ����� ���� ���������� �� ������ ������.
����� ���� ����������� �������������, ������ ���� � ��� ����� ������� ���������. 
� ����� ������������ ������������ ����� ������ - Patrul Service, Higway Police, ���������, SWAT. 
��� ���� ����� ����������� � ����������� ����������� �.Los-Santos, ��������� ����...
����� ������ �������� ��������, ����� �������� �� ������, ������ ���������� � �������. 
�� ����� ������� � ������� � �� �������� � ׸���� ������ ������������ ������������. 
���� �� ��������� �� ���� ��������� � � ��� ���� ������� �������� � ����� ����������...
�� ������ ����� ���� ������ ������� �� ���� ���.
� ����-������ ���� �����-���� �������? ��� ���-�� ������ �� ������� � ���?
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
		showError("����� ������ �� ����� ��������� 33")
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
			showError("������� " HKToStr(gKey) " ��� ������������")
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
Gui, ChooseFraction:Add, Text, x10 y3 h18, �����������
Gui, ChooseFraction:Add, DropDownList, xp+106 yp-3 w103 AltSubmit Choose%Fraction% vzFraction gLoadFraction, LSPD|SFPD|LVPD|FBI
Gui, ChooseFraction:Add, Text, xp-106 yp+30 C424242, �������� ������:
Gui, ChooseFraction:+DelimiterTab
Gui, ChooseFraction:Add, DropDownList, xp+2 yp+14 w209 AltSubmit vzecServerID Choose%cServerID% gLoadFraction, Evolve-Rp.Ru | Server: 01 | Client 0.3.7`tEvolve-Rp.Ru `| Server: 02 | Client 0.3.7`tEvolve-Rp.Ru `| Server: 03 | Client 0.3.7
Gui, ChooseFraction:+DelimiterDefault
Gui, ChooseFraction:Font, S8
Gui, ChooseFraction:Add, Text, x46 y80 h30 0x11
Gui, ChooseFraction:Add, Text, x47 y80 w135 0x10
Gui, ChooseFraction:Add, Text, xp+131 yp h30 0x11
Gui, ChooseFraction:Add, Text, xp-131 yp+27 w135 0x10
Gui, ChooseFraction:Font, S12
Gui, ChooseFraction:Add, Text, Center xp+1 yp-24 h23 w129 c000000 ggoReload, �����������
Gui, LoadConnect:Font, S8
Gui, LoadConnect:-SysMenu
Gui, LoadConnect:Add, Text, x5 y1 C424242, ������� �������:
Gui, LoadConnect:Add, Edit, xp+2 yp+14 w140 h18 veUserName C424242, %UserName%
Gui, LoadConnect:Add, Text, xp+145 yp w16 h19 0x12
Gui, LoadConnect:Add, Text, xp+1 yp+2 gSetOldNick Center C424242 w13 h15, X
Gui, LoadConnect:Add, Text, xp-148 yp+16 C424242, �������� ������:
Gui, LoadConnect:+DelimiterTab
Gui, LoadConnect:Add, DropDownList, xp+2 yp+14 w200 AltSubmit vecServerID Choose%cServerID% gSave, Evolve-Rp.Ru | Server: 01 | Client 0.3.7`tEvolve-Rp.Ru `| Server: 02 | Client 0.3.7`tEvolve-Rp.Ru `| Server: 03 | Client 0.3.7
Gui, LoadConnect:+DelimiterDefault
Gui, LoadConnect:Font, S8
Gui, LoadConnect:Add, Text, x5 y70 h30 0x11
Gui, LoadConnect:Add, Text, x6 y70 w135 0x10
Gui, LoadConnect:Add, Text, xp+131 yp h30 0x11
Gui, LoadConnect:Add, Text, xp-131 yp+27 w135 0x10
Gui, LoadConnect:Font, S12
Gui, LoadConnect:Add, Text, Center xp+1 yp-24 h23 w129 c000000 ggoConnect , ������������
Gui, LoadConnect:Font, S8
Gui, LoadConnect:Add, Text, x141 y70 h30 0x11
Gui, LoadConnect:Add, Text, x142 y70 w135 0x10
Gui, LoadConnect:Add, Text, xp+131 yp h30 0x11
Gui, LoadConnect:Add, Text, xp-131 yp+27 w135 0x10
Gui, LoadConnect:Font, S12
Gui, LoadConnect:Add, Text, Center xp+1 yp-24 h24 w129 c000000 ggoNoConnect , �������
Gui, Main:+hwndhGui
Gui, Main:Font, S14
Gui, Main:Add, Text, Center x0 y0 w640 h31 Disabled ,
Gui, Main:Add, Text, x12 y2 w300 vvarMainMenu , ������� ����
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
Gui, Main:Add, Text, Center x537 y2 h26 w80 ggoMenu vvarMenu, ����
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
Gui, Main:Add, Text, Center x463 y31 w159 h22 ggoMenuSettings vgMainSettings Hidden, ���������
Gui, Main:Add, Text, Center x463 y54 w159 h22 ggoHideTray vgMenuHideKey Hidden, �������� � ����
Gui, Main:Add, Text, Center x463 y78 w159 h22 ggoReload vgMenuVK Hidden, �������������
Gui, Main:Add, Text, Center x463 y102 w159 h22 ggoVk vgMenuReloadKey Hidden, �����������
Gui, Main:Add, Text, Center x463 y126 w159 h22 gGuiClose vgMenuCloseKey Hidden, �����
Gui, Main:Font, S8
Gui, guiMainMenu:+parent%hGui% -Caption
Gui, guiMainMenu:Font, S8
Gui, guiMainMenu:Add, GroupBox, x12 y33 w300 h440 C000000, ��������� �����
Gui, guiMainMenu:Add, Hotkey, xp+7 yp+18 w100 h18 veKeyTazer gSave, %KeyTazer%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, ������� ��� ��������
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyCuff gSave, %KeyCuff%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, ������ ��������� �� �����������
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyFollow gSave, %KeyFollow%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, ����� ����������� �� �����
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyCput gSave, %KeyCput%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, �������� ����������� � ������
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyCeject gSave, %KeyCeject%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, �������� ����������� � �������
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyArrest gSave, %KeyArrest%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, ����� �����������
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyDeject gSave, %KeyDeject%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, �������� ����������� �� ����
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyHelp gSave, %KeyHelp%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, ������� ������������
Active := ((Fraction="1" || Fraction="2" || Fraction="3") && Rang < 4?" Disabled":"")
aFBI := (Fraction="4"?" Disabled":"")
Gui, guiMainMenu:Add, Hotkey,%Active% xp-106 yp+18 w100 h18 veKeyFrisk gSave, %KeyFrisk%
Gui, guiMainMenu:Add, Text,%Active% xp+106 yp+3 h18 vtKeyFrisk, �������� ��������
Gui, guiMainMenu:Add, Hotkey,%Active% xp-106 yp+18 w100 h18 veKeyNarko gSave, %KeyNarko%
Gui, guiMainMenu:Add, Text,%Active% xp+106 yp+3 h18 vtKeyNarko, ������ ���������� � ���
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyClist gSave, %KeyClist%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18 vtKeyClist, ������� �����
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyDoklad gSave, %KeyDoklad%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18 vtKeyDoklad, ������� ������
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyMegaphone gSave, %KeyMegaphone%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, ��������� � ������� � ���������
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeySbros gSave, %KeySbros%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, �������� ����������� ����
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeySTime gSave, %KeySTime%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18 vtKeySTime, �������� �����
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyNoga gSave, %KeyNoga%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, �������� ����������� �� ����
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeySMS gSave, %KeySMS%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, �������� �� ��������� SMS
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyR gSave, %KeyR%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, ������������ �����
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyEventYes gSave, %KeyEventYes%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, ����������� ��������
Gui, guiMainMenu:Add, Hotkey, xp-106 yp+18 w100 h18 veKeyEventNo gSave, %KeyEventNo%
Gui, guiMainMenu:Add, Text, xp+106 yp+3 h18, �������� ��������
Gui, guiMainMenu:Add, GroupBox, x317 y33 w300 h144 c000000, �������� ���������
Gui, guiMainMenu:Add, Text, xp+8 yp+18 vtClist, ���� �� ���������:
Gui, guiMainMenu:Add, Edit, xp+103 yp-2 Limit3 Number w30 h18 veClist gSave, %Clist%
Gui, guiMainMenu:Add, Checkbox, xp-103 yp+18 checked%isAuthDuty% veisAuthDuty gSave , ������������� �������� ���� ��� ������ ������
Gui, guiMainMenu:Add, Checkbox, xp yp+18 checked%isDead% veisDead gSave, ������������� �������� ���� ��� ������
Gui, guiMainMenu:Add, Checkbox, xp yp+18 checked%isOffinarrested% veisOffinarrested gSave, �������� �������� �� ����� ��� ������
Gui, guiMainMenu:Add, Checkbox, xp yp+18 checked%isGmCar% veisGmCar gSave  , �������� �������� �� ���� ������� ����
Gui, guiMainMenu:Add, Checkbox, xp yp+18 checked%isOpenHide% veisOpenHide gSave , �������� ���� �������� � ���� ��� �������
Gui, guiMainMenu:Add, Checkbox, xp yp+18 checked%isOpenT% veisOpenT gSave, ��������� ��� ���������� �� ��������� [������ T]
Gui, guiMainMenu:Font, S8
Gui, guiMainMenu:Add, Text, x12 y476 h30 0x11
Gui, guiMainMenu:Add, Text, x13 y476 w148 0x10
Gui, guiMainMenu:Add, Text, xp+144 yp h30 0x11
Gui, guiMainMenu:Add, Text, xp-145 yp+27 w149 0x10
Gui, guiMainMenu:Font, S12
Gui, guiMainMenu:Add, Text, Center xp+2 yp-25 h24 w143 c000000 ggoUserSet , ������
Gui, guiMainMenu:Font, S8
Gui, guiMainMenu:Add, Text, x163 y476 h30 0x11
Gui, guiMainMenu:Add, Text, x164 y476 w150 0x10
Gui, guiMainMenu:Add, Text, xp+146 yp h30 0x11
Gui, guiMainMenu:Add, Text, xp-147 yp+27 w151 0x10
Gui, guiMainMenu:Font, S12
Gui, guiMainMenu:Add, Text, Center xp+2 yp-25 h24 w143 c424242 gopenIni, ������: %Version%
Gui, guiMainMenu:Font, S8
Gui, guiMainMenu:Add, GroupBox, x317 y176 w300 h85 C424242, ������� ����������� � �������
Gui, guiMainMenu:Add, Text, xp+6 yp+13 C424242, ������� �������:
Gui, guiMainMenu:Add, Edit, xp+2 yp+14 w140 h18 veUserName C424242, %UserName%
Gui, guiMainMenu:Add, Text, xp+145 yp w16 h19 0x12
Gui, guiMainMenu:Add, Text, xp+1 yp+2 gSetOldNick Center C424242 w13 h15, X
Gui, guiMainMenu:Add, Text, xp-148 yp+16 C424242, �������� ������:
Gui, guiMainMenu:+DelimiterTab
Gui, guiMainMenu:Add, DropDownList, xp+2 yp+14 w230 AltSubmit vecServerID Choose%cServerID% gSave, Evolve-Rp.Ru | Server: 01 | Client 0.3.7`tEvolve-Rp.Ru `| Server: 02 | Client 0.3.7`tEvolve-Rp.Ru `| Server: 03 | Client 0.3.7
Gui, guiMainMenu:+DelimiterDefault
Gui, guiMainMenu:Font, S8
Gui, guiMainMenu:Add, Text, x317 y260 h30 0x11
Gui, guiMainMenu:Add, Text, xp+298 yp h30 0x11
Gui, guiMainMenu:Add, Text, xp-298 yp+27 w303 0x10
Gui, guiMainMenu:Font, S12
Gui, guiMainMenu:Add, Text, Center xp+2 yp-25 h24 w295 c000000 ggoConnect , ������������
Gui, guiMainMenu:Font, S8
Gui, guiMainMenu:Add, GroupBox, x317 y288 w300 h185 C424242, ����������
Gui, guiMainMenu:Add, Text, xp+7 yp+14 w285, `n `     ��������� ��������� ���������� � ����� �������� �������� ���`n`n�� ������������ ��������� - vk.com/69cucumber69`n`n���� ����������� ������ ������, ������� ������������ � ������ �������. `n`n����� �� ������ ������� ���� ������ ��� ������ ������� - /pdhelp
Gui, guiMainMenu:Add, Text, xp-7 yp+174 h30 0x11
Gui, guiMainMenu:Add, Text, xp+1 yp w302 0x10
Gui, guiMainMenu:Add, Text, xp+298 yp h30 0x11
Gui, guiMainMenu:Add, Text, xp-299 yp+27 w303 0x10
Gui, guiMainMenu:Font, S12
Gui, guiMainMenu:Add, Text, Center xp+3 yp-25 h24 w295 Center c000000 ggoHelpACMD vverHelpACMD, ���������� ������ ������
Gui, gMainSettings:+parent%hGui% -Caption
Gui, gMainSettings:Font, S8
Gui, gMainSettings:Add, GroupBox, x12 y33 w300 h114 C000000, �������� ����������
Gui, gMainSettings:Add, Text, xp+15 yp+20 h18, ��� � �����
Gui, gMainSettings:Add, Edit, xp+106 yp w100 h18 veTag gSave, %Tag%
Gui, gMainSettings:Add, Text, xp-106 yp+20 h18, ������
AutoPass := (!isPass?" Disabled":"")
Gui, gMainSettings:Add, Edit,%AutoPass% xp+106 yp w100 h18 vePass gSave, %Pass%
Gui, gMainSettings:Add, Text, xp-106 yp+20 h18, �����������
Gui, gMainSettings:Add, DropDownList, xp+106 yp w100 AltSubmit Choose%Fraction% veFraction gReFraction, LSPD|SFPD|LVPD|FBI
Gui, gMainSettings:Add, Text, xp-106 yp+20 h18, ������
if (fraction!="4")
	Gui, gMainSettings:Add, DropDownList, %aArmy% xp+106 yp w100 AltSubmit Choose%Rang% veRang gReRang, �����|������|��.�������|�������|���������|��.���������|��.���������|���������|��.���������|�������|�����|������������|���������|�����
else
	Gui, gMainSettings:Add, DropDownList, xp+106 yp w100 AltSubmit Choose%Rang% veRang gReRang, ������|��������|��.�����|����� DEA|����� CID|����� DEA|����� CID|���������|���.���������|���������
Gui, gMainSettings:Add, GroupBox,%aMedic% %aArmy% x12 y146 w300 h60 C000000, ����� ����������� � ���
Gui, gMainSettings:Add, Checkbox,%Active% %aMedic% %aArmy% xp+8 yp+18 checked%isTakeKpz% veisTakeKpz gSave , �������� �����/����/������ ��� ������ � ���
Gui, gMainSettings:Add, Checkbox,%Active% %aMedic% %aArmy% xp yp+18 checked%isTakeKeys% veisTakeKeys gSave , ������� ������ �� ������ � �� ����������
GunsCount := (xCount > 6?" Disabled":"")
Gui, gMainSettings:Add, GroupBox,%aMedic%  x12 y205 w300 h170 C000000, ������������ ������
if (isDeagleCount && isGiveGuns)
{
	Gui, gMainSettings:Add, DropDownList,%aMedic%  xp+116 yp+20 w100 AltSubmit Choose%DeagleCount% veDeagleCount gReGuns, ���� ������|��� ������
	Gui, gMainSettings:Add, Checkbox,%aMedic%  xp-96 yp checked%isDeagleCount% veisDeagleCount gReGuns , Desert Eagle
}
else
{
	Gui, gMainSettings:Add, DropDownList,%GunsCount% %aMedic%  xp+116 yp+20 w100 AltSubmit Choose%DeagleCount% veDeagleCount gReGuns, ���� ������|��� ������
	Gui, gMainSettings:Add, Checkbox,%GunsCount% %aMedic%  xp-96 yp checked%isDeagleCount% veisDeagleCount gReGuns , Desert Eagle
}
if (isShotgunCount && isGiveGuns)
{
	Gui, gMainSettings:Add, DropDownList, %aMedic%  xp+96 yp+20 w100 AltSubmit Choose%ShotgunCount% veShotgunCount gReGuns, ���� ������|��� ������
	Gui, gMainSettings:Add, Checkbox, %aMedic%  xp-96 yp checked%isShotgunCount% veisShotgunCount gReGuns , Shotgun
}
else
{
	Gui, gMainSettings:Add, DropDownList,%GunsCount% %aMedic%  xp+96 yp+20 w100 AltSubmit Choose%ShotgunCount% veShotgunCount gReGuns, ���� ������|��� ������
	Gui, gMainSettings:Add, Checkbox,%GunsCount% %aMedic%  xp-96 yp checked%isShotgunCount% veisShotgunCount gReGuns , Shotgun
}
if (isMP5Count && isGiveGuns)
{
	Gui, gMainSettings:Add, DropDownList, %aMedic%  xp+96 yp+20 w100 AltSubmit Choose%MP5Count% veMP5Count gReGuns, ���� ������|��� ������
	Gui, gMainSettings:Add, Checkbox, %aMedic%  xp-96 yp checked%isMP5Count% veisMP5Count gReGuns , MP5
}
else
{
	Gui, gMainSettings:Add, DropDownList, %GunsCount% %aMedic%  xp+96 yp+20 w100 AltSubmit Choose%MP5Count% veMP5Count gReGuns, ���� ������|��� ������
	Gui, gMainSettings:Add, Checkbox,%GunsCount% %aMedic%  xp-96 yp checked%isMP5Count% veisMP5Count gReGuns , MP5
}
if (isM4A1Count && isGiveGuns)
{
	Gui, gMainSettings:Add, DropDownList, %aMedic%  xp+96 yp+20 w100 AltSubmit Choose%M4A1Count% veM4A1Count gReGuns, ���� ������|��� ������
	Gui, gMainSettings:Add, Checkbox, %aMedic%  xp-96 yp checked%isM4A1Count% veisM4A1Count gReGuns , M4A1
}
else
{
	Gui, gMainSettings:Add, DropDownList, %GunsCount% %aMedic%  xp+96 yp+20 w100 AltSubmit Choose%M4A1Count% veM4A1Count gReGuns, ���� ������|��� ������
	Gui, gMainSettings:Add, Checkbox,%GunsCount% %aMedic%  xp-96 yp checked%isM4A1Count% veisM4A1Count gReGuns , M4A1
}
if (isRifleCount && isGiveGuns)
{
	Gui, gMainSettings:Add, DropDownList,%aMedic%  xp+96 yp+20 w100 AltSubmit Choose%RifleCount% veRifleCount gReGuns, ���� ������|��� ������
	Gui, gMainSettings:Add, Checkbox,%aMedic%  xp-96 yp checked%isRifleCount% veisRifleCount gReGuns , Rifle
}
else
{
	Gui, gMainSettings:Add, DropDownList, %GunsCount% %aMedic%  xp+96 yp+20 w100 AltSubmit Choose%RifleCount% veRifleCount gReGuns, ���� ������|��� ������
	Gui, gMainSettings:Add, Checkbox,%GunsCount% %aMedic%  xp-96 yp checked%isRifleCount% veisRifleCount gReGuns , Rifle
}
if (isArmourCount && isGiveGuns && ArmourCount="1")
{
	Gui, gMainSettings:Add, DropDownList, %aMedic%  xp+96 yp+20 w100 AltSubmit Choose%ArmourCount% veArmourCount gReGuns, �����|�� �����
	Gui, gMainSettings:Add, Checkbox, %aMedic%  xp-96 yp checked%isArmourCount% veisArmourCount gReGuns , �����
}
else
{
	Gui, gMainSettings:Add, DropDownList, %GunsCount% %aMedic%  xp+96 yp+20 w100 AltSubmit Choose%ArmourCount% veArmourCount gReGuns, �����|�� �����
	Gui, gMainSettings:Add, Checkbox,%GunsCount% %aMedic%  xp-96 yp checked%isArmourCount% veisArmourCount gReGuns , �����
}
if (isSpecGunCount && isGiveGuns && SpecGunCount="1")
{
	Gui, gMainSettings:Add, DropDownList, %aMedic%  xp+96 yp+20 w100 AltSubmit Choose%SpecGunCount% veSpecGunCount gReGuns, �����|�� �����
	Gui, gMainSettings:Add, Checkbox, %aMedic%  xp-96 yp checked%isSpecGunCount% veisSpecGunCount gReGuns , ����. ������
}
else
{
	Gui, gMainSettings:Add, DropDownList, %GunsCount% %aMedic%  xp+96 yp+20 w100 AltSubmit Choose%SpecGunCount% veSpecGunCount gReGuns, �����|�� �����
	Gui, gMainSettings:Add, Checkbox,%GunsCount% %aMedic%  xp-96 yp checked%isSpecGunCount% veisSpecGunCount gReGuns , ����.������
}
Gui, gMainSettings:Add, GroupBox, x317 y33 w300 h275 c000000, ���������
Gui, gMainSettings:Add, Checkbox,%Active% %aMedic% %aArmy% xp+8 yp+18 checked%isChatFrisk% veisChatFrisk gSave , �������� ���������� ��� ������ � ���
Gui, gMainSettings:Add, Checkbox,%aMedic% %aArmy% xp yp+18 checked%isMdc% veisMdc gSave , ��������� ��� ��������� ���� ��������
Gui, gMainSettings:Add, Checkbox,%aMedic% %aArmy% xp yp+18 checked%isStopM% veisStopM gSave , �������� ���, �������, ������� ������ ����� /m
Gui, gMainSettings:Add, Checkbox,%Active% %aMedic% %aArmy% xp yp+18 checked%isTake% veisTake gSave , �������� ���������/��������� ��� ������
Gui, gMainSettings:Add, Checkbox, xp yp+18 checked%isAutoEn% veisAutoEn gSave , ������������� �������� ���������
Gui, gMainSettings:Add, Checkbox,%aMedic% %aArmy% xp yp+18 checked%isKill% veisKill gSave , ������� ������ ����
Gui, gMainSettings:Add, Checkbox, xp yp+18 checked%isRU% veisRU gSave , ������ ������� ��������� ��� �������� ����
Gui, gMainSettings:Add, Checkbox, xp yp+18 checked%isPass% veisPass gSave gRePass, ������������� ������� ������ ��� ����� � ����
Gui, gMainSettings:Add, Checkbox,%aMedic% %aArmy% xp yp+18 checked%isTazer% veisTazer gSave , �������� HUD Tazer
Gui, gMainSettings:Add, Checkbox, xp yp+18 checked%isTime% veisTime gSave , �������� HUD Time
Gui, gMainSettings:Add, Checkbox,%aMedic% %aArmy% xp yp+18 checked%isGiveGuns% veisGiveGuns gReGuns, ������������ ������
Gui, gMainSettings:Add, Checkbox, xp yp+18 checked%isWoman% veisWoman gSave , ��������� �� �������� ����
Gui, gMainSettings:Add, Checkbox, xp yp+18 checked%isAutoScreen% veisAutoScreen gSave , ������������� ������ �������� ��� ���������
Gui, gMainSettings:Add, Checkbox, xp yp+18 checked%isBar% veisBar gSave , �������� HUD Patrul
Gui, gMainSettings:Font, S8
Gui, gMainSettings:Add, Text, x12 y380 h30 0x11
Gui, gMainSettings:Add, Text, x13 y380 w148 0x10
Gui, gMainSettings:Add, Text, xp+144 yp h30 0x11
Gui, gMainSettings:Add, Text, xp-145 yp+27 w149 0x10
Gui, gMainSettings:Font, S12
Gui, gMainSettings:Add, Text, Center xp+2 yp-25 h24 w143 c000000 ggoSettingsMenuInBind , ������
Gui, gMainSettings:Font, S8
Gui, gMainSettings:Add, Text, x163 y380 h30 0x11
Gui, gMainSettings:Add, Text, x164 y380 w150 0x10
Gui, gMainSettings:Add, Text, xp+146 yp h30 0x11
Gui, gMainSettings:Add, Text, xp-147 yp+27 w151 0x10
Gui, gMainSettings:Font, S12
Gui, gMainSettings:Add, Text, Center xp+2 yp-25 h24 w143 c424242 gopenIni, ������: %Version%
Gui, gMainSettings:Font, S8
Gui, gMainSettings:Add, Text, x317 y380 h30 0x11
Gui, gMainSettings:Add, Text, x318 y380 w300 0x10
Gui, gMainSettings:Add, Text, xp+296 yp h30 0x11
Gui, gMainSettings:Add, Text, xp-297 yp+27 w301 0x10
Gui, gMainSettings:Font, S12
Gui, gMainSettings:Add, Text, Center xp+2 yp-24 w295 h23 ggoSettingsMenuInSub , ��������� �� �������
Gui, helpCMD: -SysMenu
Gui, helpCMD:Add, GroupBox, x4 y1 w494 h415 C424242, ����������
Gui, helpCMD:Font, S8 c424242
Gui, helpCMD:Add, Text, xp+5 yp+14 w474
Gui, helpCMD:Font, S8 cDefault
Gui, helpCMD:Add, Text, x15 yp+5, - /yk - ������� ������� � ��������� ��������
Gui, helpCMD:Add, Text, xp yp+15, - /fyk [�����] - ����� ��� ������ �� �� � ������ ������ (������������ � ��������)
Gui, helpCMD:Add, Text, xp yp+15, - /ak - ������� ������� � ���������������� ��������
Gui, helpCMD:Add, Text, xp yp+15, - /fak [�����] - ����� ��� ������ �� �� � ������ ������ (������������ � ��������)
Gui, helpCMD:Add, Text, xp yp+15, - /fp - ������� ������� � ����������� ��������������
Gui, helpCMD:Add, Text, xp yp+15, - /ffp [�����] - ����� ��� ������ �� �� � ������ ������ (������������ � ��������)
Gui, helpCMD:Add, Text, xp yp+15, - /lecture - ��������� �����
Gui, helpCMD:Add, Text, xp yp+15, - /stoplecture - ���������� ������
Gui, helpCMD:Add, Text, xp yp+15, - /dzap [ID] - SMS �������� � ������������ ������
Gui, helpCMD:Add, Text, xp yp+15, - /zap [ID] [�������] - ��������� ���� �� ������������ ���������
Gui, helpCMD:Add, Text, xp yp+15, - /setweather [ID ������] - ������� ������
Gui, helpCMD:Add, Text, xp yp+15, - /roz [ID] - ������� ���������� � ���������� �����������
Gui, helpCMD:Add, Text, xp yp+15, - /tkey [�������] - ��������� ���������� � ����� ����� ���� �� ������
Gui, helpCMD:Add, Text, xp yp+15, - /cchat - �������� ���
Gui, helpCMD:Add, Text, xp yp+15, - /rlogs - ���������� ���� � ���������� ����������� � �����
Gui, helpCMD:Add, Text, xp yp+15, - /dlogs - ���������� ���� � ���������� ����������� � �����������
Gui, helpCMD:Add, Text, xp yp+15, - /sulogs - ���������� ���� � ���������� ������������ � ������
Gui, helpCMD:Add, Text, xp yp+15, - /ffind [�����] - ����� ��������� � ���� ���������� ������ ����� (20 ���������)
Gui, helpCMD:Add, Text, xp yp+15, - /kit - �������� ��������/��������� ������������
Gui, helpCMD:Add, Text, xp yp+15, - /tazerset - �������� �������������� Tazer HUD
Gui, helpCMD:Add, Text, xp yp+15, - /tazersetoff - ��������� ��������� �������������� Tazer HUD
Gui, helpCMD:Add, Text, xp yp+15, - /timeset - �������� �������������� Time HUD
Gui, helpCMD:Add, Text, xp yp+15, - /timesetoff - ��������� ��������� �������������� Time HUD
Gui, helpCMD:Add, Text, xp yp+15, - /fraction - ������� � ���������� ���� ������ ���������� �����������
Gui, helpCMD:Add, Text, xp yp+15, - /z id - ������� ���������� ���� �� ������� ������
Gui, helpCMD:Add, Text, xp yp+15, - /z id ������ - ����� ������ �� ������ ������. ������������� ������ ����� � ����� su.txt
Gui, helpCMD:Font, S8 �000000
Gui, helpCMD:Add, Text, x4 y420 h30 0x11
Gui, helpCMD:Add, Text, x5 y420 w494 0x10
Gui, helpCMD:Add, Text, xp+490 yp h30 0x11
Gui, helpCMD:Add, Text, xp-490 yp+27 w494 0x10
Gui, helpCMD:Font, S12
Gui, helpCMD:Add, Text, Center xp+2 yp-24 w475 h23 C000000 ggoSettingsMenuInHelp, ������� ������� �� ��������
Gui, helpCMD:Font, S8
Gui, guiUserSetKey:+parent%hGui% -Caption +hwndrKeys
Gui, guiUserSetKey:Add, Text, x0 y31 h17 w640 ,
Gui, guiUserSetKey:Add, Text, x10 y33 C424242 , �������
Gui, guiUserSetKey:Add, Text, x117 y33 C424242 , ���������
Gui, guiUserSetKey:Add, Text, x480 y33 C424242 , ��������
Gui, guiUserSetKey:Add, Text, x540 y33 C424242 , �������
Gui, guiUserSetKey:Add, Text, x588 y33 C424242 , ����
Gui, guiUserSetKey:Add, Text, Center x0 y477 w640 h40 Disabled ,
Gui, guiUserSetKey:Font, S12
Gui, guiUserSetKey:Add, Text, x6 y477 h30 0x11
Gui, guiUserSetKey:Add, Text, x7 y477 w151 0x10
Gui, guiUserSetKey:Add, Text, xp+147 yp h30 0x11
Gui, guiUserSetKey:Add, Text, xp-148 yp+27 w152 0x10
Gui, guiUserSetKey:Font, S12
Gui, guiUserSetKey:Add, Text, Center xp+2 yp-24 w146 h23 gSaveBinds, ���������
Gui, guiUserSetKey:Font, S12
Gui, guiUserSetKey:Add, Text, x157 y477 h30 0x11
Gui, guiUserSetKey:Add, Text, x158 y477 w161 0x10
Gui, guiUserSetKey:Add, Text, xp+157 yp h30 0x11
Gui, guiUserSetKey:Add, Text, xp-158 yp+27 w162 0x10
Gui, guiUserSetKey:Font, S12
Gui, guiUserSetKey:Add, Text, Center xp+2 yp-24 w146 h23 gHelpKeys, `  ����� / �������
Gui, guiUserSetKey:Font, S8
Gui, guiUserSetKey:Add, Text, x320 y477 h30 0x11
Gui, guiUserSetKey:Add, Text, x321 y477 w301 0x10
Gui, guiUserSetKey:Add, Text, xp+297 yp h30 0x11
Gui, guiUserSetKey:Add, Text, xp-298 yp+27 w302 0x10
Gui, guiUserSetKey:Font, S12
Gui, guiUserSetKey:Add, Text, Center xp+2 yp-24 w295 h23 ggoMainMenuSub , ��������� �� �������
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
Gui, ghelpKeys:Add, GroupBox, x4 y1 w494 h397 C424242, ����������
Gui, ghelpKeys:Font, S8 c424242
Gui, ghelpKeys:Add, Text, xp+7 yp+15 w482, `    ����������� ���� ��� ��������� ������ ��� ��������� ��������� ��� �� ��������� ������� � ������ �����.`n    ������:`n  /su <DriverId> 2 ������������
Gui, ghelpKeys:Add, Text, xp+5 yp+57 w474 0x10
Gui, ghelpKeys:Font, S8 cDefault
Gui, ghelpKeys:Add, Text, x15 yp+5, - <cur> - ���������� ������ � �������� ����� (�� ����� ������ ����)
Gui, ghelpKeys:Add, Text, xp yp+15, - <SmsID> - ID ���������� ��� ������� ��� SMS
Gui, ghelpKeys:Add, Text, xp yp+15, - <SmsNick> - ��� ���������� ��� ������� ��� SMS
Gui, ghelpKeys:Add, Text, xp yp+15, - <SmsToId> - ID ���������� ���� �� �������� � SMS
Gui, ghelpKeys:Add, Text, xp yp+15, - <SmsToNick> - ��� ���������� ���� �� �������� � SMS
Gui, ghelpKeys:Add, Text, xp yp+15, - <SuId> - ID �������� ������ ��������� ������
Gui, ghelpKeys:Add, Text, xp yp+15, - <SuNick> - ��� �������� ������ ��������� ������
Gui, ghelpKeys:Add, Text, xp yp+15, - <SuRpNick> - RP ��� �������� ������ ��������� ������
Gui, ghelpKeys:Add, Text, xp yp+15, - <KillRpNick> - ��� ���������� ����������� ������ ����� ������
Gui, ghelpKeys:Add, Text, xp yp+15, - <ArrestRpNick> - ��� ���������� ������������� ������
Gui, ghelpKeys:Add, Text, xp yp+15, - <DriverId> - ID �������� �� �� ������� ��� ������
Gui, ghelpKeys:Add, Text, xp yp+15, - <DriverRpName> - ��� �������� �� �� ������� ��� ������
Gui, ghelpKeys:Add, Text, xp yp+15, - <TargetId> - ID ������ ����������� �������������
Gui, ghelpKeys:Add, Text, xp yp+15, - <TargetRpName> - ��� ������ ����������� �������������
Gui, ghelpKeys:Add, Text, xp yp+15, - <MyId> - ������� �� ������ ���������
Gui, ghelpKeys:Add, Text, xp yp+15, - <Zona> - ������� ������� � ������� �� ����������
Gui, ghelpKeys:Add, Text, xp yp+15, - <Tag> - ��� ��� � ����� (����������� � ����������)
Gui, ghelpKeys:Add, Text, xp yp+15, - <ModelCar> - ��� ������ ���� �� ������� ��� ������
Gui, ghelpKeys:Add, Text, xp yp+15, - <Nap> - ��������� ���������� �� ����� / � ����������
Gui, ghelpKeys:Add, Text, xp yp+15, - <SF> - ���������� ��������� � ��� �� ����� ������ GTA
Gui, ghelpKeys:Add, Text, xp yp+15, - <Screen> - ������� ��������
Gui, ghelpKeys:Font, S8 �000000
Gui, ghelpKeys:Add, Text, x4 y401 h30 0x11
Gui, ghelpKeys:Add, Text, x5 y401 w494 0x10
Gui, ghelpKeys:Add, Text, xp+490 yp h30 0x11
Gui, ghelpKeys:Add, Text, xp-490 yp+27 w494 0x10
Gui, ghelpKeys:Font, S12
Gui, ghelpKeys:Add, Text, Center xp+2 yp-24 w475 h23 C000000 ggoMainMenuInHelp, ������� ������� �� ������
Gui, ghelpKeys:Font, S8
Gui, guiError:-caption -sysmenu +AlwaysOnTop +Border
Gui, guiError:font, S10
Gui, guiError:Add, Text, x4 y4 w200, ������
Gui, guiError:font, S8
Gui, guiError:Add, Text, x0 yp+22 w230 Center verrorText, ��������� ������������� ������
Gui, Saved:-caption -sysmenu +AlwaysOnTop +Border
Gui, Saved:font, S14
Gui, Saved:Add, Text, x0 y2 w200 Center, ���������
Gui, Saved:font, S8
Gui, Saved:Add, Text, x0 yp+25 w200 Center, ��������� ���� �������
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
		Gui, LoadConnect:Show, w278 h100, ����������� � �������
		LoadConnect := true
	}
} else tHide := ""
if (Fraction="0")
{
	tChooseFraction := true
	Gui, Main:Hide
	Gui, ChooseFraction:Show, w230 h116, �������� �������
	Return
}
Gui, Main:Show,%tHide% w625 h509, Police Dream for Evolve Role Play
TrayTip, Police Dream, ������� �� ������ ��������� ����� �������� ��� ������ ��������� � �����������, 3
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
		showError("������� " HKToStr(gKey) " ��� ������������")
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
GuiControl, Main:, varMainMenu, ������� ����
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
	showError("������� ���������� �������")
	return
}
if(strlen(Pass) < 6 && isPass)
{
	showError("������� �������� ������")
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
GuiControl, Main:, varMainMenu, ������� ����
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
GuiControl, Main:, varMainMenu, ������
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
GuiControl, Main:, varMainMenu, ������
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
Gui, helpCMD:Show, w500 h452, ������ ������ ������
return
HelpKeys:
gosub, ErrorHide
gosub, SavedOff
Gui, ghelpKeys:Show, w500 h433, ����� / �������
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
GuiControl, Main:, varMainMenu, ���������
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
	Menu, Tray, Rename, ����������, ��������
	Menu, tray, default, ��������
	Gui, Main:Show
	} else {
	Menu, Tray, Rename, ��������, ����������
	Menu, tray, default, ����������
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
	if(!isRead1001 && RegExMatch(ChatLineText, "SMS: (?<Text>.*). ����������: (?<Nick>.*)\[(?<ID>\d+)\]", smsto))
	{
		isRead1001 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		gLastSmsToId := smstoID
		gLastSmstoNick := smstoNick
		continue
	}
	if(!isRead1002 && isAutoEn && RegExMatch(ChatLineText, "����� ������� ��������� ������� �������",AutoEn))
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
	if(!isRead1003 && isKill && RegExMatch(ChatLineText, "�� �������� � ������ (?<Nick>.*) �� (?<Time>\d+) ������", arrest) || RegExMatch(ChatLineText, "�� �������� ����������� �� (?<Time>\d+) ������!", Kill))
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
				Event["reason"] := "���"
				if (((cServerID="1" && Rang < 6) || (cServerID="2" && Rang < 6)) && Fraction!="4")
					Event["chat"] := "/r " Tag " ���� " Event["RpName"] " ������������ �� �������� - " Event["reason"] "."
				else if (cServerID="1" && (Rang >= 6 || Fraction="4"))
					Event["chat"] := "/d Mayor, ���� " Event["RpName"] " ������������ �� �������� - " Event["reason"] "."
				else if (cServerID="2" && (Rang >= 6 || Fraction="4"))
					Event["chat"] := "/d [City Hall] ���� " Event["RpName"] " ������������ �� �������� - " Event["reason"] "."
			}
			if (KillTime)
			{
				Event["RpName"] := gLastKillNick
				NickArrested := gLastKillNick
				Event["Active"] := true
				Event["time"] := A_TickCount + 30000
				Event["reason"] := "���"
				if (((cServerID="1" && Rang < 6) || (cServerID="2" && Rang < 6)) && Fraction!="4")
					Event["chat"] := "/r " Tag " ���� " Event["RpName"] " ������������ �� �������� - " Event["reason"] "."
				else if (cServerID="1" && (Rang >= 6 || Fraction="4"))
					Event["chat"] := "/d Mayor, ���� " Event["RpName"] " ������������ �� �������� - " Event["reason"] "."
				else if (cServerID="2" && (Rang >= 6 || Fraction="4"))
					Event["chat"] := "/d [City Hall] ���� " Event["RpName"] " ������������ �� �������� - " Event["reason"] "."
			}
			if (Event["Active"] && arrestTime="3000" || arrestTime="3600" || KillTime)
			{
				if (cServerID="2" && (arrestTime="3000" || arrestTime="3600"))
					Continue
				AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}��������� ������������ ���� {ffc801}" Event["RpName"] " {FFFFFF}�� �������: {ffc801}" Event["reason"])
				Sleep 50
				AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}����������� ��������: {ffc801}" HKToStr(KeyEventYes) "{FFFFFF} | �������� ��������:{ffc801} "HKToStr(KeyEventNo))
			}
		}
		continue
	}
	if(!isRead1004 && RegExMatch(ChatLineText, "������� ���� �����", FDuty))
	{
		isRead1004 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		if(isAuthDuty && strlen(Clist))
			SendChat("/clist " Clist)
		continue
	}
	if(!isRead1005 && RegExMatch(ChatLineText, "SMS: (?<Text>.*). �����������: (?<Nick>.*)\[(?<ID>\d+)\]", sms))
	{
		isRead1005 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		gLastSmsID := smsID
		gLastSmsNICK := smsNick
		gLastSmsText := smsText
		continue
	}
	if(!isRead1006 && RegExMatch(ChatLineText, "" getUsername() " ������� ����������� �� ���� {(.*)\} (.*)", CuffWater))
	{
		isRead1006 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		zek := getClosestPlayerIdCarNotCopFBI3()
		if (CuffWater2="[������]")
		{
			Sleep 1200
			SendChat("/cuff "zek)
		}
		if (CuffWater2="[��������]")
		{
			Sleep 1200
			SendChat("/do ���������� ��������.")
		}
		continue
	}
	if(!isRead1007 && RegExMatch(ChatLineText, "����� ���������� �� Evolve Role Play", UpDate))
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
				AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}��������� ������. ������� ������ � ������.")
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
	if(!isRead1008 && RegExMatch(ChatLineText, "(.*) (?<Name>[A-Z][a-z]*)_(?<Family>[A-Z][a-z]*): (.*)����� ����� ����� �� ������ �� ������� - (?<Reason>.*)\?", tKey))
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
			Event["chat"] := "/r " Tag " " Event["Name"] ", ������ ����� ����� ���� �� ������."
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}����������� {ffc801}" Event["Name"] " " Event["Family"] " {FFFFFF}����� ����� ����� �� ������, �� �������: {ffc801}" Event["reason"] "")
			Sleep 50
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}����������� ��������: {ffc801}" HKToStr(KeyEventYes) "{FFFFFF} | �������� ��������:{ffc801} "HKToStr(KeyEventNo))
		}
		continue
	}
	if(!isRead1009 && RegExMatch(ChatLineText, "(.*) (?<SName>[A-Z][a-z]*)_(?<SFamily>[A-Z][a-z]*): (.*)������ ����� ����� ���� �� ������.", tKey))
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
	if(!isRead1010 && RegExMatch(ChatLineText, "(.*) (?<SName>[A-Z][a-z]*)_(?<SFamily>[A-Z][a-z]*): (.*) (����|����) (.*) ������������ �� �������� - (.*).", rZap) && isKill)
	{
		isRead1010 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead4, 4)
		Event["SName"] := rZapSName
		Event["SFamily"] := rZapSFamily
		Event["rZapReason"] := rZap7
		Event["PNick"] := "" Event["SName"] "_" Event["SFamily"] ""
		if (RegExMatch(ChatLineText, "(.*)\[(Army|Police|FBI|Mayor|Instructors|Medic)(.*)") && rZap6=Event["RpName"] && Event["RpName"]!="" && getUsername() != Event["PNick"])
		{
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}������������ ���� {ffc801}" Event["RpName"] " {FFFFFF}���� ��������� ��� ������ ��������!")
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
			Event["chat"] := "/d Mayor, ���� " Event["RpName"] " ������������ �� �������� - " Event["rZapReason"]"."
		if (cServerID="2" && (Rang >= 6 || Fraction="4"))
			Event["chat"] := "/d [City Hall] ���� " Event["RpName"] " ������������ �� �������� - " Event["rZapReason"]"."
		if (cServerID="1" && (Rang >= 6 || Fraction="4")) || (cServerID="2" && (Rang >= 6 || Fraction="4"))
		{
			Event["Active"] := true
			Event["time"] := A_TickCount + 30000
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}��������� ������������ ���� {ffc801}" Event["RpName"] " {FFFFFF}�� �������: {ffc801}" Event["rZapReason"])
			Sleep 50
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}����������� ��������: {ffc801}" HKToStr(KeyEventYes) "{FFFFFF} | �������� ��������:{ffc801} "HKToStr(KeyEventNo))
		}
		continue
	}
	if(!isRead1011 && RegExMatch(ChatLineText, "�� ����� ��� ������"))
	{
		isRead1011 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		Sleep 1200
		if (isWoman)
			SendChat("/me ������ ����������� �� �����")
		else
			SendChat("/me ���� ����������� �� �����")
		continue
	}
	if(!isRead1012 && RegExMatch(ChatLineText, "�� ��������� ������������ ������"))
	{
		isRead1012 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		Sleep 1200
		if (isWoman)
			SendChat("/me ���������� �����������")
		else
			SendChat("/me ��������� �����������")
		continue
	}
	if(!isRead1013 && (RegExMatch(ChatLineText, "�������� ���������� ����� ��� � 10 ������!") || RegExMatch(ChatLineText, "�� �����!")))
	{
		isRead1013 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		if(Event["OStime"] > A_TickCount)
		{
			Event["Active"] := true
			Event["time"] := A_TickCount + 30000
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}��������� ������ ��� ������� ���� {ffc801}" Event["RpName"] " {FFFFFF}���������� ��� ���!")
			Sleep 50
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}����������� ��������: {ffc801}" HKToStr(KeyEventYes) "{FFFFFF} | �������� ��������:{ffc801} "HKToStr(KeyEventNo))
		}
		continue
	}
	if(!isRead1014 && RegExMatch(ChatLineText, "�� �������� ���� �� (.*)", tazer))
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
			sTazer := Tazer = "���������" ? "{32CD32}ON" : "{FF0000}OFF"
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
	if(!isRead1015 && RegExMatch(ChatLineText, "([A-Za-z0-9\[\]\_\$\.]+)\: ��������(��|���) (.*)", spy) && Fraction="4" && Rang>=6)
	{
		isRead1015 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		updateOScoreboardData()
		spycount := "0"
		Event["spyNick"] := spy1
		Event["spyId"] := getPlayerIdByName(spy1)
		if (RegExMatch(spy3, "(�����|���|�����|���)"))
			spyid := "4"
		else if (RegExMatch(spy3, "(�������|�������)"))
			spyid := "1"
		else if (RegExMatch(spy3, "(�������|�����)"))
			spyid := "2"
		else if (RegExMatch(spy3, "(�������|�������|�����|�����)"))
			spyid := "3"
		else if (RegExMatch(spy3, "(���|���)"))
			spyid := "5"
		else if (RegExMatch(spy3, "(��������|��������)"))
			spyid := "6"
		else if (RegExMatch(spy3, "(������|������)"))
			spyid := "7"
		else if (RegExMatch(spy3, "(LCN|lcn|���|���|La Cosa Nostra|la cosa nostra)"))
			spyid := "8"
		else if (RegExMatch(spy3, "(Yakuza|yakuza|������|������)"))
			spyid := "9"
		else if (RegExMatch(spy3, "(��|PM|������� �����|�������|�������|�������|�������)"))
			spyid := "10"
		else if (RegExMatch(spy3, "(Rifa|rifa|����|����)"))
			spyid := "11"
		else if (RegExMatch(spy3, "(Grove|grove|����|����|Groove|groove)"))
			spyid := "12"
		else if (RegExMatch(spy3, "(Ballas|ballas|������|������|�����|�����)"))
			spyid := "13"
		else if (RegExMatch(spy3, "(Vagos|vagos|�����|�����)"))
			spyid := "14"
		else if (RegExMatch(spy3, "(Aztec|aztec|�����|�����)"))
			spyid := "15"
		else if (RegExMatch(spy3, "(������|������|biker|Biker)"))
			spyid := "16"
		else if (RegExMatch(spy3, "�����"))
			spyid := "17"
		if (spyid!="" && Event["spyId"]!="" && Event["spyId"]!="-1")
		{
			if (spyid="1")
				spyinfo := "������������"
			if (spyid="2")
				spyinfo := "������������"
			if (spyid="3")
				spyinfo := "��������"
			if (spyid="4")
				spyinfo := "������"
			if (spyid="5")
				spyinfo := "�����"
			if (spyid="6")
				spyinfo := "���������"
			if (spyid="7")
				spyinfo := "��������"
			if (spyid="8")
				spyinfo := "LCN"
			if (spyid="9")
				spyinfo := "Yakuza"
			if (spyid="10")
				spyinfo := "������� �����"
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
				spyinfo := "��������"
			if (spyid="17")
				spyinfo := "������"
			Event["FBISpy"] := true
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}������ ������ {ffc801}" Event["spyNick"] " {FFFFFF}����������: {ffc801}" spyinfo)
			Sleep 50
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}����������� ��������: {ffc801}" HKToStr(KeyEventYes) "{FFFFFF} | �������� ��������:{ffc801} "HKToStr(KeyEventNo))
		}
		if (Event["spyId"]="" && Event["spyId"]="-1")
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}��������� ������, ������� ���������� �������!")
		continue
	}
	if(!isRead1016 && RegExMatch(ChatLineText, "" getUsername() " ����� ��������� � ������� �� ������ (.*)", keytry))
	{
		isRead1016 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead1, 4)
		if (Event["SuspectKeyActive"])
		{
			Sleep 4000
			if (keytry1="{63C600} [������]")
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
						if (RegExMatch(qlines[qgw],"F	�����	(\d+)"))
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
				SendChat("/do ����� �� ���������.")
		}
		continue
	}
	if(!isRead1017 && RegExMatch(ChatLineText, "(.*) (?<SName>[A-Z][a-z]*)_(?<SFamily>[A-Z][a-z]*):(.*) (����|����) � (\d+) �������������� ���������.", cl))
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
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}�������� ������ ������� {ffc801}" RegExReplace(Event["clNick"], "_", " ") " {FFFFFF}�� �������: {ffc801}��������������.")
		Sleep 50
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}����������� ��������: {ffc801}" HKToStr(KeyEventYes) "{FFFFFF} | �������� ��������:{ffc801} "HKToStr(KeyEventNo))
		continue
	}
	if(!isRead1018 && RegExMatch(ChatLineText, "\[Clear\] (.*) ������ �� ������������� (.*)", clear))
	{
		isRead1018 := true
		WriteRaw(hGTA, dwAddrr1 + ChatLine, &SetRead4, 4)
		if (&& Event["Clear"] && Event["clNick"]=clear2 && getusername()!=clear1)
		{
			Event["Clear"] := false
			Event["clNick"] := ""
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}������ � ������{ffc801}" RegExReplace(Event["clNick"], "_", " ") " {FFFFFF}��� ������ ��� ������ ��������!")
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
addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] " col "���� ���� ��� ������")
return
gKeyCuff:
if ((isInChat() || isDialogOpen()) && WarnKey(KeyCuff)) ||(isDialogOpen())
	return
if (gLastTargetId!="-1" && gLastTargetId!="")
{
	if (isWoman)
		SendChat("/me �������� ���� ����������� � ����� ��������� � �������� ���������")
	else
		SendChat("/me ������� ���� ����������� � ���� ��������� � �������� ���������")
	Sleep 1200
	SendChat("/cuff "gLastTargetId)
}
else
	AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}���� �� ���������")
return
gKeyFollow:
if ((isInChat() || isDialogOpen()) && WarnKey(KeyFollow)) ||(isDialogOpen())
	return
if (gLastTargetId!="-1" && gLastTargetId!="")
	SendChat("/follow "gLastTargetId)
else
	AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}���� �� ���������")
return
gKeyTazer:
if ((isInChat() || isDialogOpen()) && WarnKey(KeyTazer)) ||(isDialogOpen())
	return
SendChat("/tazer")
if (IsMdc)
{
	Sleep 1200
	if (isWoman)
		SendChat("/me ������� ��� �������� � ������")
	else
		SendChat("/me ������ ��� �������� � ������")
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
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] " col "���� ���� ��� ������")
	}
	if (isDialogOpen() && getDialogCaption()="����� ������" && isGiveGuns && Event["kit"] < A_TickCount && getDialogID() != "5226")
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
			org := "{4682B4}�����"
		else if (idskin="59" || idskin="172" || idskin="189" || idskin="240")
			org := "{4169E1}���������"
		else if (idskin="201" || idskin="247" || idskin="248" || idskin="254" || idskin="248" || idskin="298")
			org := "{FF0000}�������"
		else if (idskin="272" || idskin="112" || idskin="125" || idskin="214" || idskin="111" || idskin="126")
			org := "{808080}������� �����"
		else if (idskin="113" || idskin="124" || idskin="214" || idskin="223")
			org := "{DAA520}La Cosa Nostra"
		else if (idskin="120" || idskin="123" || idskin="169" || idskin="186")
			org := "{FF0000}Yakuza"
		else if (idskin="211" || idskin="217" || idskin="250" || idskin="261")
			org := "{008080}News"
		else if (idskin="70" || idskin="219" || idskin="274" || idskin="275"  || idskin="276" || idskin="70")
			org := "{800000}������"
		else
			org := "{FFFFFF}�����������"
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
		AddChatMessageEx("FF0000","{FF0000}___________________��������_________________________")
		AddChatMessageEx("ffc801","")
		AddChatMessageEx("ffc801","������������� {FF0000}" NearbyPlayerName " [" NearbyPlayerID "]{ffc801} ����� �� ����")
		AddChatMessageEx("ffc801","��� � �����: {FFFFFF}"lvl)
		AddChatMessageEx("ffc801","�����������: "org)
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
		AddChatMessageEx("FF0000","{FF0000}___________________��������_________________________")
		AddChatMessageEx("ffc801","")
		AddChatMessageEx("ffc801","������������� {FF0000}" NamePlayer " [" IdInCar "]{ffc801} ����� �� ����")
		AddChatMessageEx("ffc801","��� � �����: {FFFFFF}"lvl)
		AddChatMessageEx("ffc801","�����������: "org)
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
			AddChatMessageEx("FF0000","{FF0000}___________________��������_________________________")
			AddChatMessageEx("ffc801","")
			AddChatMessageEx("ffc801","������������� {FF0000}" NamePlayer " [" IdInCar "]{ffc801} ����������� ���� �������")
			addChatMessageEx("ffc801","���� HP: {FF0000}" InitialNearbyCarHP "{ffc801} | ����� HP: {FF0000}"NearbyCarHP)
			AddChatMessageEx("ffc801","��� � �����: {FFFFFF}"lvl)
			AddChatMessageEx("ffc801","�����������: "org)
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
					SendChat("/me �������� ����������� �� ������ ������� ���������")
				else
					SendChat("/me ������� ����������� �� ������ ������� ���������")
				Sleep 1200
				SendChat("/cput " dzp " 1")
			}
			else
				AddChatMessageEx("{FFFFFF}"," {ffc801}[Police Dream] {FFFFFF}� ������������ �������� ��� ����� ��� �����������")
		}
		else if (CarId="599" || CarId="415")
		{
			if (a2="-1")
			{
				if (isWoman)
					SendChat("/me ������� ����� � �������� ����������� � ����������")
				else
					SendChat("/me ������ ����� � ������� ����������� � ����������")
				Sleep 1200
				SendChat("/cput " dzp " 1")
			}
			else
				AddChatMessageEx("{FFFFFF}"," {ffc801}[Police Dream]{FFFFFF} � ������������ �������� ��� ����� ��� �����������")
		}
		else  if (CarId="596" || CarId="560" || CarId="597" || CarId="598" || CarId="490")
		{
			if (isWoman)
				SendChat("/me ������� ����� ���������� ���������� � �������� ����������� �� �������")
			else
				SendChat("/me ������ ����� ���������� ���������� � ������� ����������� �� �������")
			Sleep 1200
			if (a4="-1")
				SendChat("/cput " dzp " 3")
			else if (a3="-1")
				SendChat("/cput " dzp " 2")
			else if (a2="-1")
				SendChat("/cput " dzp " 1")
			else
				AddChatMessageEx("{FFFFFF}"," {ffc801}[Police Dream]{FFFFFF} � ������������ �������� ��� ����� ��� �����������")
		}
		else if (CarId="427")
		{
			if (isWoman)
				SendChat("/me ������� ����� ������ � �������� �����������")
			else
				SendChat("/me ������ ����� ������ � ������� �����������")
			Sleep 1200
			if (a4="-1")
				SendChat("/cput " dzp " 3")
			else if (a3="-1")
				SendChat("/cput " dzp " 2")
			else if (a2="-1")
				SendChat("/cput " dzp " 1")
			else
				AddChatMessageEx("{FFFFFF}"," {ffc801}[Police Dream]{FFFFFF} � ������������ �������� ��� ����� ��� �����������")
		}
		else if (CarId="497")
		{
			if (isWoman)
				SendChat("/me ������� ����� �������� � �������� ����������� �� �������")
			else
				SendChat("/me ������ ����� �������� � ������� ����������� �� �������")
			Sleep 1200
			if (a4="-1")
				SendChat("/cput " dzp " 3")
			else if (a3="-1")
				SendChat("/cput " dzp " 2")
			else if (a2="-1")
				SendChat("/cput " dzp " 1")
			else
				AddChatMessageEx("{FFFFFF}"," {ffc801}[Police Dream]{FFFFFF} � ������������ �������� ��� ����� ��� �����������")
		}
		else
			AddChatMessageEx("{FFFFFF}"," {ffc801}[Police Dream]{FFFFFF} ������ ���� �� �������� ��������� ")
	}
	else
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}����� ��� ������")
}
else
	AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} ���������� ��������� �� ����")
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
			SendChat("/me ������� ����������� ������ � ���������")
		else
			SendChat("/me ����� ����������� ������ � ���������")
	}
	else if (CarId="599" || CarId="415")
	{
		if (isWoman)
			SendChat("/me ������� ����� Rancher'a � �������� ����������� �� ����������")
		else
			SendChat("/me ������ ����� Rancher'a � ������� ����������� �� ����������")
	}
	else  if (CarId="596" || CarId="560" || CarId="597" || CarId="598" || CarId="490")
	{
		if (isWoman)
			SendChat("/me ������� ����� ���������� ���������� � �������� ��������������")
		else
			SendChat("/me ������ ����� ���������� ���������� � ������� ��������������")
	}
	else if (CarId="427")
	{
		if (isWoman)
			SendChat("/me ������� ����� ������ � ��������� ����������� �� �������")
		else
			SendChat("/me ������ ����� ������ � �������� ����������� �� �������")
	}
	else if (CarId="497")
	{
		if (isWoman)
			SendChat("/me �������� ����������� �� ���������")
		else
			SendChat("/me ������� ����������� �� ���������")
	}
	Sleep 1200
	SendChat("/ceject "dzp)
}
else
	AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} ����� ��� ������ � ����")
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
	SendChat("/me ������� ������ � ������� ������� �� ���������")
else
	SendChat("/me ������ ������ � ����� ������� �� ���������")
else if (ModellCar="461" || ModellCar="523" || ModellCar="463" || ModellCar="468" || ModellCar="521" || ModellCar="522" || ModellCar="581" || ModellCar="586")
	if (isWoman)
	SendChat("/me ������� ���������� � ���������")
else
	SendChat("/me ������ ���������� � ���������")
else if (ModellCar="448" || ModellCar="462")
	if (isWoman)
	SendChat("/me ������� ���������� � ������")
else
	SendChat("/me ������ ���������� � ������")
else if (ModellCar="471")
	if (isWoman)
	SendChat("/me ������� ���������� � �����������")
else
	SendChat("/me ������ ���������� � �����������")
else if (ModellCar="481" || ModellCar="509" || ModellCar="510")
	if (isWoman)
	SendChat("/me ������� ���������� � ����������")
else
	SendChat("/me ������ ���������� � ����������")
else
{
	if (isWoman)
		SendChat("/me ������� ������ ��������� ������ � �������� ����������� �� ����������")
	else
		SendChat("/me ������ ������ ��������� ������ � ������� ����������� �� ����������")
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
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������� �������� � ��������[4]")
	return
}
zFrisk := 0
if (gLastTargetId!="-1" && gLastTargetId!="")
{
	if (isWoman)
		SendChat("/me ������ ��������")
	else
		SendChat("/me ����� ��������")
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
	AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} ���� �� ���������")
	return
}
Name := getPlayerNameById(gLastTargetId)
gNick := RegExReplace(Name, "_", " ")
frisk:
Sleep 250
if (zFrisk="3")
{
	AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}���������� �������� ��� ���")
	return
}
If(isDialogOpen())
{
	Text := getDialogText()
	RegExMatch(Text,"A	���������	([0-9]*)",narko)
	RegExMatch(Text,"B	���������	([0-9]*)",mati)
	RegExMatch(Text,"F	�����	([0-9]*)",keyss)
	RegExMatch(Text,"P	������	([0-9]*)",gun)
	RegExMatch(Text,"K	������������ �����	([0-9]*)",prava)
	RegExMatch(Text,"O	�������� �� ������	([0-9]*)",lgun)
	if (isChatFrisk)
	{
		AddChatMessageEx("FFFFFF","{0000FF}________________________________________________")
		AddChatMessageEx("FFFFFF","{ffc801}")
		AddChatMessageEx("FFFFFF","{ffc801}������ ���� {FF0000}" gNick "{ffc801}")
		if (narko1!="")
			AddChatMessageEx("FFFFFF","{FF0000}���������: "narko1)
		if (mati1!="")
			AddChatMessageEx("FFFFFF","{FF0000}���������: "mati1)
		if (keyss1!="")
			AddChatMessageEx("FFFFFF","{FF0000}����� �� �����: "keyss1)
		if (gun1!="")
		{
			if (gun1="1")
			{
				idskin := getTargetPlayerSkinIdById(gLastTargetId)
				if (idskin="102" || idskin="103" || idskin="104" || idskin="195" || idskin="105" || idskin="106" || idskin="107" || idskin="269" || idskin="270" || idskin="271" || idskin="108" || idskin="109" || idskin="110" || idskin="190" || idskin="114" || idskin="115" || idskin="116" || idskin="173" || idskin="174" || idskin="175" || idskin="193" || idskin="226" || idskin="30" || idskin="201" || idskin="247" || idskin="248" || idskin="254" || idskin="248" || idskin="298" || idskin="272" || idskin="112" || idskin="125" || idskin="214" || idskin="111" || idskin="113" || idskin="124" || idskin="214" || idskin="223" || idskin="120" || idskin="123" || idskin="169" || idskin="186" || idskin="211" || idskin="217" || idskin="250" || idskin="261")
					AddChatMessageEx("FFFFFF","{ffc801}�������� ������")
				else
					AddChatMessageEx("FFFFFF","{FF0000}������������� ������")
			}
			else
				AddChatMessageEx("FFFFFF","{FF0000}������������� ������")
		}
		if (prava1!="")
			AddChatMessageEx("FFFFFF","{32CD32}������������ �������������")
		if (lgun1!="")
			AddChatMessageEx("FFFFFF","{32CD32}�������� �� ������")
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
				SendChat("/me ������� �� ������� ����� ��� ���� � �������� ��������� ��������")
			else
				SendChat("/me ������ �� ������� ����� ��� ���� � ������� ��������� ��������")
		}
		else
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}���������� �������� ��� ���")
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
	if (City!="Los Santos" && Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-2" || Zona="�-2" || Zona="�-3" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-9" || Zona="�-9" || Zona="�-9" || Zona="�-9" ||  City="San Fierro")
		Jurisdiction := "SFPD"
	else if (City!="Los Santos" && Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-7" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-19" || Zona="�-19" || Zona="�-19" || Zona="�-24"  || City="Las Venturas")
		Jurisdiction := "LVPD"
}
if(Fraction="2")
{
	if (City!="San Fierro" && Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-17" || Zona="�-18" || Zona="�-19" || Zona="�-20" || Zona="�-21" || Zona="�-22" || Zona="�-23" || Zona="�-24" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-17" || Zona="�-18" || Zona="�-19" || Zona="�-20" || Zona="�-21" || Zona="�-22" || Zona="�-23" || Zona="�-24" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-17" || Zona="�-18" || Zona="�-19" || Zona="�-20" || Zona="�-21" || Zona="�-22" || Zona="�-23" || Zona="�-24" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-17" || Zona="�-18" || Zona="�-19" || Zona="�-20" || Zona="�-21" || Zona="�-22" || Zona="�-23" || Zona="�-24" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-17" || Zona="�-18" || Zona="�-19" || Zona="�-20" || Zona="�-21" || Zona="�-22" || Zona="�-23" || Zona="�-24" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" ||  Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-8" || City="Los Santos")
		Jurisdiction := "LSPD"
	else if (City!="San Fierro" && Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-7" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-19" || Zona="�-19" || Zona="�-19" || Zona="�-24"  || | Zona="�-7" || Zona="�-8" || Zona="�-7" || Zona="�-8" ||  City="Las Venturas")
		Jurisdiction := "LVPD"
}
if(Fraction="3")
{
	if (City!="Las Venturas" && Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-17" || Zona="�-18" || Zona="�-19" || Zona="�-20" || Zona="�-21" || Zona="�-22" || Zona="�-23" || Zona="�-24" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-17" || Zona="�-18" || Zona="�-19" || Zona="�-20" || Zona="�-21" || Zona="�-22" || Zona="�-23" || Zona="�-24" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-17" || Zona="�-18" || Zona="�-19" || Zona="�-20" || Zona="�-21" || Zona="�-22" || Zona="�-23" || Zona="�-24" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-17" || Zona="�-18" || Zona="�-19" || Zona="�-20" || Zona="�-21" || Zona="�-22" || Zona="�-23" || Zona="�-24" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-17" || Zona="�-18" || Zona="�-19" || Zona="�-20" || Zona="�-21" || Zona="�-22" || Zona="�-23" || Zona="�-24" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" ||  Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12"  Zona="�-14" || Zona="�-15" || Zona="�-19" || Zona="�-20" || Zona="�-19" || Zona="�-24" || Zona="�-24" || Zona="�-12" City="Los Santos")
		Jurisdiction := "LSPD"
	else if (City!="Las Venturas" && Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-2" || Zona="�-2" || Zona="�-3" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-9" || Zona="�-9" || Zona="�-9" || Zona="�-9" || Zona="�-7" || Zona="�-8" || Zona="�-7" || Zona="�-8" || Zona="�-6" || Zona="�-7" City="San Fierro")
		Jurisdiction := "SFPD"
}
if(Fraction="4")
{
	if (Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-17" || Zona="�-18" || Zona="�-19" || Zona="�-20" || Zona="�-21" || Zona="�-22" || Zona="�-23" || Zona="�-24" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-17" || Zona="�-18" || Zona="�-19" || Zona="�-20" || Zona="�-21" || Zona="�-22" || Zona="�-23" || Zona="�-24" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-17" || Zona="�-18" || Zona="�-19" || Zona="�-20" || Zona="�-21" || Zona="�-22" || Zona="�-23" || Zona="�-24" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-17" || Zona="�-18" || Zona="�-19" || Zona="�-20" || Zona="�-21" || Zona="�-22" || Zona="�-23" || Zona="�-24" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-17" || Zona="�-18" || Zona="�-19" || Zona="�-20" || Zona="�-21" || Zona="�-22" || Zona="�-23" || Zona="�-24" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" ||  Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12"  Zona="�-14" || Zona="�-15" || Zona="�-19" || Zona="�-20" || Zona="�-19" || Zona="�-24" || Zona="�-24" || Zona="�-12" || City="Los Santos")
		Jurisdiction := "LSPD"
	else if (Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-2" || Zona="�-2" || Zona="�-3" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-1" || Zona="�-2" || Zona="�-3" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-9" || Zona="�-9" || Zona="�-9" || Zona="�-9" || Zona="�-7" || Zona="�-8" || Zona="�-7" || Zona="�-8" || Zona="�-6" || Zona="�-7" || City="San Fierro")
		Jurisdiction := "SFPD"
	else if (Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-4" || Zona="�-5" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-6" || Zona="�-7" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-7" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-8" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-19" || Zona="�-19" || Zona="�-19" || Zona="�-24"  || City="Las Venturas")
		Jurisdiction := "LVPD"
}
if (isPlayerInAnyVehicle() == 0)
{
	if (cServerID="2")
	{
		if(Fraction="1")
		{
			if (IsPlayerInRangeOfPoint(1480.475952,-1716.446411,13.976975, 40))
				post := "�����"
			else if (IsPlayerInRangeOfPoint(1297.047241,-1871.129639,14.146875, 25))
				post := "�����"
			else if (IsPlayerInRangeOfPoint(60.646679,-1531.584473,5.793219, 25))
				post := "���� ��-��"
			else if (IsPlayerInRangeOfPoint(1636.434082,-814.137939,60.272583, 170))
				post := "���� ��-��"
			else if (IsPlayerInRangeOfPoint(1545.981323,-1627.342896,13.982813, 25))
				post := "���"
			else if (Interior="3")
				post := "���� �����"
			else if (IsPlayerInRangeOfPoint(1150.679321,-1733.571045,14.683927, 25))
				post := "���������� LS"
			else if (Zona="�-23" || Zona="�-24" || Zona="�-23" || Zona="�-24")
				post := "���� LS"
		}
		if(Fraction="2")
		{
			if (Zona="�-6")
				post := "���� ��"
			else if (Zona="�-5" || Zona="�-6")
				post := "�������� ��"
			else if (IsPlayerInRangeOfPoint(-1580.142944,665.650269,8.834935, 50))
				post := "���-1"
			else if (IsPlayerInRangeOfPoint(-1713.470215,685.315857,26.286154, 50))
				post := "���-2"
			else if (Zona="�-4")
				post := "SFN"
			else if (Zona="�-5")
				post := "��-��"
			else if (Zona="�-4")
				post := "��"
		}
		if(Fraction="3")
		{
			if (Zona="�-24" || Zona="�-24")
				post := "����������"
			else if (Zona="�-21")
				post := "������ ""Caligula"""
			else if (IsPlayerInRangeOfPoint(2036.346680,1013.981567,12.356600, 50))
				post := "������ ""The Four Dragons"""
		}
	}
	if (cServerID="1")
	{
		if(Fraction="1")
		{
			if (IsPlayerInRangeOfPoint(1480.475952,-1716.446411,13.976975, 40))
				post := "�����"
			else if (IsPlayerInRangeOfPoint(1297.047241,-1871.129639,14.146875, 50))
				post := "�����"
			else if (IsPlayerInRangeOfPoint(435.716797,-1502.197510,31.371349, 100))
				post := "�� ��"
			else if (IsPlayerInRangeOfPoint(1230.723022,-1835.889771,13.715469, 100))
				post := "Delta"
			else if (IsPlayerInRangeOfPoint(1194.358643,-1320.530396,13.729051, 50))
				post := "�������� ��"
			else if (IsPlayerInRangeOfPoint(60.646679,-1531.584473,5.793219, 25))
				post := "���� ��-��"
			else if (IsPlayerInRangeOfPoint(1636.434082,-814.137939,60.272583, 170))
				post := "���� ��-��"
			else if (IsPlayerInRangeOfPoint(1545.981323,-1627.342896,13.982813, 25))
				post := "���"
			else if (Interior="3")
				post := "���� �����"
			else if (IsPlayerInRangeOfPoint(1150.679321,-1733.571045,14.683927, 25))
				post := "���������� LS"
			else if (Zona="�-23" || Zona="�-24" || Zona="�-23" || Zona="�-24")
				post := "���� LS"
			else if (IsPlayerInRangeOfPoint(329.218628,-1798.285645,5.065799, 35))
				post := "���������"
		}
		if(Fraction="2")
		{
			if (IsPlayerInRangeOfPoint(-1580.142944,665.650269,8.834935, 50))
				post := "A"
			else if (IsPlayerInRangeOfPoint(-1713.470215,685.315857,26.286154, 50))
				post := "B"
			else if (Zona="�-4")
				post := "SFN"
			else if (Zona="�-5")
				post := "��"
			else if (Zona="�-4")
				post := "��"
			else if (IsPlayerInRangeOfPoint(-1524.015503,496.838348,7.540139, 25))
				post := "SFa"
		}
		if(Fraction="3")
		{
			if (IsPlayerInRangeOfPoint(2034.301025,1006.075378,11.183959, 35))
				post := "�"
			else if (Zona="�-24")
				post := "�"
			else if (IsPlayerInRangeOfPoint(2236.955566,2451.759766,11.149650, 25))
				post := "���"
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
	Output := "���������� ���."
else if(f==1)
	Output := "��������: " AllName "."
else if(f>=2)
	Output := "���������: " AllName "."
if (post!="")
	SendChat("/r " Tag " ����: " post ". "Output)
else
{
	if (cServerID="2")
	{
		if(Fraction="1")
		{
			if (IsPlayerInRangeOfPoint(60.646679,-1531.584473,5.793219, 50))
				post := "���� LS-SF"
			else if (IsPlayerInRangeOfPoint(1297.047241,-1871.129639,14.146875, 50))
				post := "�����"
			else if (IsPlayerInRangeOfPoint(1636.434082,-814.137939,60.272583, 170))
				post := "���� LS-LV"
			else if (IsPlayerInRangeOfPoint(2390.210204,-1409.073608,24.361462, 750))
				post := "������� �������� ������"
			else if (Zona="�-23" || Zona="�-24" || Zona="�-23" || Zona="�-24")
				post := "���� LS"
			else if (Jurisdiction!="")
				SendChat("/d [" Jurisdiction "] ��������� ���� ���������� - ������.")
		}
		if(Fraction="2")
		{
			if (Zona="�-6")
				post := "���� ��"
			else if (Zona="�-5" || Zona="P-6")
				post := "��������"
			else if (IsPlayerInRangeOfPoint(-1659.847046,538.313843,39.767761, 50))
				post := "���� SF-LV"
			else if (Zona="�-6" || Zona="�-8")
				post := "���� SF-LV"
			else if (Zona="�-6")
				post := "�����"
			else if (Jurisdiction!="")
				SendChat("/d [" Jurisdiction "] ��������� ���� ���������� - ������.")
		}
		if(Fraction="3")
		{
			if (IsPlayerInRangeOfPoint(1830.591187,813.961060,11.021535, 100))
				post := "�����������"
			else if (Zona="�-18")
				post := "������"
			else if (Zona="�-23")
				post := "�������� ���������"
			else if (Jurisdiction!="")
				SendChat("/d [" Jurisdiction "] ��������� ���� ���������� - ������.")
			else
			{
				if (Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15")
				{
					post := "������� LVA"
				}
			}
		}
	}
	if (cServerID="1")
	{
		if(Fraction="1")
		{
			if (IsPlayerInRangeOfPoint(60.646679,-1531.584473,5.793219, 50))
				post := "���� LS-SF"
			else if (IsPlayerInRangeOfPoint(1297.047241,-1871.129639,14.146875, 50))
				post := "�����"
			else if (IsPlayerInRangeOfPoint(435.716797,-1502.197510,31.371349, 100))
				post := "�� ��"
			else if (IsPlayerInRangeOfPoint(1194.358643,-1320.530396,13.729051, 50))
				post := "�������� ��"
			else if (IsPlayerInRangeOfPoint(1636.434082,-814.137939,60.272583, 100))
				post := "���� LS-LV"
			else if (IsPlayerInRangeOfPoint(1055.545898,-1866.361694,13.831577, 25))
				post := "�"
			else if (Zona="�-12")
				post := "����� 0"
			else if (IsPlayerInRangeOfPoint(470.608643,-425.461212,29.457815, 50))
				post := "����������� 2"
			else if (IsPlayerInRangeOfPoint(1251.056396,-408.103210,2.921424, 50))
				post := "����������� 1"
			else if (IsPlayerInRangeOfPoint(1931.078857,180.992905,36.709091, 100))
				post := "�����"
			else if (IsPlayerInRangeOfPoint(-209.618011,247.299454,12.350061, 170))
				post := "����"
			else if (IsPlayerInRangeOfPoint(2390.210204,-1409.073608,24.361462, 750))
				post := "������� �������� ������"
			else if (Zona="�-11" || Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-15" || Zona="�-16" || Zona="�-17" || Zona="�-18" || Zona="�-17" || Zona="�-17" || Zona="�-17" || Zona="�-18" || Zona="�-18" || Zona="�-19" || Zona="�-20" || Zona="�-21" || Zona="�-22" || Zona="�-21" || Zona="�-20" || Zona="�-20" || Zona="�-20" || Zona="�-19" || Zona="�-18" || Zona="�-17" || Zona="�-16" || Zona="�-15" || Zona="�-14" || Zona="�-14" || Zona="�-13" || Zona="�-13" || Zona="�-12")
				post := "������� �������� ���������"
			else if (Zona="�-23" || Zona="�-24" || Zona="�-23" || Zona="�-24")
				post := "���� LS"
			else if (Jurisdiction!="")
				SendChat("/d " Jurisdiction ", ��������� ���� ���������� - ������.")
		}
		if(Fraction="2")
		{
			if (Zona="�-5" || Zona="�-4")
				post := "��-��"
			else if (IsPlayerInRangeOfPoint(-1659.847046,538.313843,39.767761, 80))
				post := "����"
			else if (Zona="�-5")
				post := "�������"
			else if (Jurisdiction!="")
				SendChat("/d " Jurisdiction ", ��������� ���� ���������� - ������.")
		}
		if(Fraction="3")
		{
			if (Zona="�-12" || Zona="�-13" || Zona="�-14" || Zona="�-13" || Zona="�-14" || Zona="�-13" || Zona="�-14" || Zona="�-13")
				post := "������� LVA"
			else if (Zona="�-8" || Zona="�-9" || Zona="�-8" || Zona="�-12" || Zona="�-12" || Zona="�-9" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-12" || Zona="�-12" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12" || Zona="�-9" || Zona="�-10" || Zona="�-11" || Zona="�-12")
				post := "������� �����"
			else if (Zona="�-15" || Zona="�-16" || Zona="�-15" || Zona="�-16" ||  Zona="�-15" || Zona="�-16" ||  Zona="�-15" || Zona="�-16" ||  Zona="�-14" ||  Zona="�-15" || Zona="�-16" ||  Zona="�-14" || Zona="�-16" ||  Zona="�-14" || Zona="�-16" ||  Zona="�-13" ||  Zona="�-14" || Zona="�-13" ||  Zona="�-14" || Zona="�-16" || Zona="�-14" ||  Zona="�-15" || Zona="�-16")
				post := "������� ������"
			else if (IsPlayerInRangeOfPoint(2054.972168,865.840698,7.247652, 35))
				post := "�����"
			else if (IsPlayerInRangeOfPoint(2092.502930,1632.814697,11.183841, 50))
				post := "�-�"
			else if (IsPlayerInRangeOfPoint(2677.962402,1326.079224,10.868345, 25))
				post := "�-�"
			else if (Zona="�-17" || Zona="�-18")
				post := "��������"
			else if (Zona="�-20")
				post := "�����������"
			else if (Zona="�-14")
				post := "N-14"
			else if (Jurisdiction!="")
				SendChat("/d " Jurisdiction ", ��������� ���� ���������� - ������.")
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
		Output := "���������� ���."
	else if(f==1)
		Output := "��������: " AllName "."
	else if(f>=2)
		Output := "���������: " AllName "."
	if (Fraction="1")
	{
		if (post!="")
		{
			if (post!="������� �������� ������" && post!="������� �������� ���������" && post!="���� �� ������" && post!="���� ������� �����" && post!="��-6 � ������ ����������" && post!="��-6 ������� �����" && post!="��� ������� �������� ������")
				SendChat("/r " Tag " ����: " post ". "Output)
			else
				SendChat("/r " Tag " " post ". "Output)
		}
		else if (Jurisdiction="")
			SendChat("/r " Tag " ������� �. Los-Santos. "Output)
	}
	else if (Fraction="2")
	{
		if (post!="")
		{
			if (post!="������� �������� ������")
				SendChat("/r " Tag " ����: " post ". "Output)
			else
				SendChat("/r " Tag " " post ". "Output)
		}
		else if (Jurisdiction="")
			SendChat("/r " Tag " ������� �. San-Fierro. "Output)
	}
	else if (Fraction="3")
	{
		if (post!="")
		{
			if (post!="������� �������� ������")
				SendChat("/r " Tag " ����: " post ". "Output)
			else
				SendChat("/r " Tag " " post ". "Output)
		}
		else if (Jurisdiction="")
			SendChat("/r " Tag " ������� �. Las-Venturas. "Output)
	}
	else if (Fraction="4")
	{
		if (Jurisdiction="")
			return
		if (Jurisdiction="LVPD")
			SendChat("/r " Tag " ������� �. Las-Venturas. "Output)
		else if (Jurisdiction="SFPD")
			SendChat("/r " Tag " ������� �. San-Fierro. "Output)
		else if (Jurisdiction="LSPD")
			SendChat("/r " Tag " ������� �. Los-Santos. "Output)
	}
}
return
gKeyNarko:
if ((isInChat() || isDialogOpen()) && WarnKey(KeyNarko)) ||(isDialogOpen())
	return
if (Rang < 4 && Fraction!="4")
{
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������� �������� � ��������[4]")
	return
}
if (cServerID="1")
{
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������� ��������� �� 01 ������� Evolve RP!")
	return
}
if (!IsTakeKpz && !IsTakeKeys)
	return
Interior := getPlayerInteriorId()
if (Interior)
{
	if (isWoman)
	{
		SendChat("/me ������� ���� � ������� ������")
		Sleep 1200
		SendChat("/me ����� � ������")
		Sleep 1200
		SendChat("/me ������ ��������")
		Sleep 1200
	}
	else
	{
		SendChat("/me ������ ���� � ������ ������")
		Sleep 1200
		SendChat("/me ����� � ������")
		Sleep 1200
		SendChat("/me ����� ��������")
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
						RegExMatch(Text,"A	���������	([0-9]*)",narko)
						RegExMatch(Text,"B	���������	([0-9]*)",mati)
						RegExMatch(Text,"F	�����	([0-9]*)",keys)
						RegExMatch(Text,"P	������	([0-9]*)",gun)
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
										if (RegExMatch(lines[gw],"B	���������	(\d+)", questtake) && IsTakeKpz)
										{
											SendInput {Enter}
											goto, TakeDialog
										}
										else if (RegExMatch(lines[gw],"A	���������	(\d+)",questtake) && IsTakeKpz)
										{
											SendInput {Enter}
											goto, TakeDialog
										}
										else if (RegExMatch(lines[gw],"P	������	(\d+)") && IsTakeKpz)
										{
											SendInput {Down 20}{Enter}
											goto, TakeDialog
										}
										else if (RegExMatch(lines[gw],"F	�����	(\d+)") && IsTakeKeys)
										{
											sleep 500
											If(isDialogOpen())
											SendInput {Esc}
											Sleep 1200
											SendChat("/me ������ ������ ������ �� ������")
											Sleep 1200
											SendChat("/me ������� ����� �� ������ � ������� �����������")
											Sleep 1200
											SendChat("/try ����� " Name " ��������� � ������� �� ������")
											Sleep 1200
											Loop, Read, %Chatlog%
											{
												if(RegExMatch(A_LoopReadLine, "" getUsername() " ����� (.*) ��������� � ������� �� ������ (.*)", keytry))
												{
													if (keytry2="{63C600} [������]")
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
																if (RegExMatch(lines[gw],"F	�����	(\d+)") && IsTakeKpz)
																{
																	setDialogIndex(gw - 1)
																	SendInput {Enter}
																}
															}
														}
													}
													else
														SendChat("/do ����� �� ���������.")
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
									SendChat("/me ������� �� ������� ����� ��� ���� � �������� ��������� ��������")
								else
									SendChat("/me ������ �� ������� ����� ��� ���� � ������� ��������� ��������")
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
		SendChat("/me ����� �� ������ � ������� � �� ����")
		Sleep 1200
		SendChat("/me ����� �������� � ��� � ������ � ������")
		Sleep 250
	}
	else
	{
		SendChat("/me ����� �� ������ � ������ � �� ����")
		Sleep 1200
		SendChat("/me ���� �������� � ��� � ����� � ������")
		Sleep 250
	}
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}����� ����������� ��������")
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
				org := "{4682B4}�����"
			else if (idskin=="59" or idskin=="172" or idskin=="189" or idskin=="240")
				org := "{4169E1}���������"
			else if (idskin=="201" or idskin=="247" or idskin=="248" or idskin=="254" or idskin=="248" or idskin=="298")
				org := "{FF0000}�������"
			else if (idskin=="272" or idskin=="112" or idskin=="125" or idskin=="214" or idskin=="111" or idskin=="126")
				org := "{808080}������� �����"
			else if (idskin=="113" or idskin=="124" or idskin=="214" or idskin=="223")
				org := "{DAA520}La Cosa Nostra"
			else if (idskin=="120" or idskin=="123" or idskin=="169" or idskin=="186")
				org := "{FF0000}Yakuza"
			else if (idskin=="211" or idskin=="217" or idskin=="250" or idskin=="261")
				org := "{008080}News"
			else if (idskin=="70" or idskin=="219" or idskin=="274" or idskin=="275"  or idskin=="276")
				org := "{800000}������"
			else
			{
				org := "{FFFFFF}�����������"
			}
			SendChat("/m �������� " ModelCar "!")
			sleep 1300
			SendChat("/m ���� �� ������ �� �� ������������, �� ����� ��������!")
			Sleep 350
			if (isStopM)
			{
				AddChatMessageEx("FFFFFF","{0000FF}________________________________________________")
				AddChatMessageEx("FFFFFF","{ffc801}")
				AddChatMessageEx("ffc801","�������� ����������:" col " " NamePlayer " [" IdInCar "]")
				AddChatMessageEx("ffc801","��� � �����:{FFFFFF} "lvl)
				AddChatMessageEx("ffc801","�����������: "org)
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
		org := "{4682B4}�����"
	else if (idskin=="59" or idskin=="172" or idskin=="189" or idskin=="240")
		org := "{4169E1}���������"
	else if (idskin=="201" or idskin=="247" or idskin=="248" or idskin=="254" or idskin=="248" or idskin=="298")
		org := "{FF0000}�������"
	else if (idskin=="272" or idskin=="112" or idskin=="125" or idskin=="214" or idskin=="111" or idskin=="126")
		org := "{808080}������� �����"
	else if (idskin=="113" or idskin=="124" or idskin=="214" or idskin=="223")
		org := "{DAA520}La Cosa Nostra"
	else if (idskin=="120" or idskin=="123" or idskin=="169" or idskin=="186")
		org := "{FF0000}Yakuza"
	else if (idskin=="211" or idskin=="217" or idskin=="250" or idskin=="261")
		org := "{008080}News"
	else if (idskin=="70" or idskin=="219" or idskin=="274" or idskin=="275"  or idskin=="276")
		org := "{800000}������"
	else
	{
		org := "{FFFFFF}�����������"
	}
	if (IdInCar != "-1")
	{
		Random rand, 1, 4
		if (rand==1)
		{
			SendChat("/m �������� " ModelCar "!")
			sleep 1300
			SendChat("/m ���������� ���������� � ������� � ������������ ��� ������� �����!")
		}
		if (rand==2)
		{
			SendChat("/m �������� " ModelCar " ���������� � �������")
			sleep 1300
			SendChat("/m � ��������� ������ ��� �������� ������� �����!")
		}
		if (rand==3)
		{
			SendChat("/m �������� " ModelCar " ������� ��������!")
			sleep 1300
			SendChat("/m ��� �������� ��������� � ������� � ����������� ��� ������ ��������!")
		}
		if (rand==4)
		{
			SendChat("/m �������� " ModelCar " ������������ �� �������")
			sleep 1300
			SendChat("/m ��� ��� �������� ������� �� ��� �����!")
		}
		if (isStopM)
		{
			Sleep 350
			AddChatMessageEx("FFFFFF","{0000FF}________________________________________________")
			AddChatMessageEx("FFFFFF","{ffc801}")
			AddChatMessageEx("ffc801","�������� ����������:" col " " NamePlayer " [" IdInCar "]")
			AddChatMessageEx("ffc801","��� � �����:{FFFFFF} "lvl)
			AddChatMessageEx("ffc801","�����������: "org)
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
		SendChat("/me ������� �� ������� ������ ������")
		if (cServerID="2")
			Sleep 1200
		else
		{
			Random Rando, 4000, 8000
			Sleep %Rando%
		}
		SendChat("/me ������� ������ ������������� ��������� � ������ ����������")
		if (cServerID="2")
			Sleep 1200
		else
		{
			Random Rando, 4000, 8000
			Sleep %Rando%
		}
		SendChat("/me ������� ������")
	}
	else
	{
		SendChat("/me ������ �� ������� ������ ������")
		if (cServerID="2")
			Sleep 1200
		else
		{
			Random Rando, 4000, 8000
			Sleep %Rando%
		}
		SendChat("/me ������ ������ ������������� ��������� � ����� ����������")
		if (cServerID="2")
			Sleep 1200
		else
		{
			Random Rando, 4000, 8000
			Sleep %Rando%
		}
		SendChat("/me ������ ������")
	}
	Sleep 4000
	SendChat("/arrest "gLastTargetId)
}
else
	AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}���� �� ���������")
Return
gKeySTime:
if ((isInChat() || isDialogOpen()) && WarnKey(KeySTime)) ||(isDialogOpen())
	return
SendChat("/time")
return
gKeyNoga:
if ((isInChat() || isDialogOpen()) && WarnKey(KeyNoga)) ||(isDialogOpen())
	return
SendChat("/try ������� ����������� �� ����")
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
	SendChat("/su " Event["clId"] " 1 ��������������")
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
		AddChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}��������� ������, ���������� ��� ���!")
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
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}����� �������� ������� ������!")
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
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�� �������� ������������� ��������!")
	Event["Clear"] := false
	return
}
if (Event["FBISpy"])
{
	Event["FBISpy"] := false
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�� �������� ������������� ��������!")
	Return
}
if (Event["chat"]="")
	return
if(Event["active"] && Event["time"] > A_TickCount)
{
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�� �������� ������������� ��������!")
	Event["active"] := false
	return
}
if(Event["active"] && Event["time"] < A_TickCount)
{
	Event["active"] := false
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}����� �������� ������� ������!")
	return
}
return
gKeySbros:
NumberPre := "0"
addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�� ������� �������� ����")
Return
gKeyHelp:
if ((isInChat() || isDialogOpen()) && WarnKey(KeyHelp)) ||(isDialogOpen())
	return
o:=Object()
o:=GetCoordinates()
Zona:=CalculateZone(o[1],o[2],o[3])
if(Zona!="Unbekannt" && Zona!="Unknown")
	SendChat("/r " Tag " ������ ����� ������ � �������� - " Zona ".")
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
			showdialog(0, "{ffc801}��������� ������","{FFFFFF}" StaticInfo[sz] "", "������", "������")
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
			showdialog(0, "{ffc801}��������� ������","{FFFFFF}" StaticInfo[sz] "", "������", "������")
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
		showdialog(0, "{ffc801}����������� ����","{FFFFFF}" StaticInfo[sz] "", "������", "������")
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
			showdialog(0, "{ffc801}���������������� ������","{FFFFFF}" StaticInfo[sz] "", "������", "������")
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
			showdialog(0, "{ffc801}���������������� ������","{FFFFFF}" StaticInfo[sz] "", "������", "������")
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
			showdialog(0, "{ffc801}����������� �������������","{FFFFFF}" StaticInfo[sz] "", "������", "������")
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
			showdialog(0, "{ffc801}����������� �������������","{FFFFFF}" StaticInfo[sz] "", "������", "������")
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
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}�� ��������� ������ ������")
		return
	}
	else
		AddChatMessageEx("{FFFFFF}"," {ffc801}[Police Dream] {FFFFFF}������ �� ��������!")
	return
}
if(RegExMatch(chatInput, "^\/pdhelp"))
{
	Sleep 200
	showDialog(0, "{ffc801}������ �� �������", "						{0000FF}[Police]`n`n{ffc801}/zap [ID] {FFFFFF}- ��������� ������������ ����`n{ffc801}/kit {FFFFFF}- �������� ���������/�������� ������ �������������`n{ffc801}/fraction {FFFFFF}- ������� ���������� ���� � ����������� �����������`n{ffc801}/fractionclear {FFFFFF}- ������� ������������� ���������� �����������`n{ffc801}/tag [ID] [Tag] {FFFFFF}- �������� ������������� ��������� ������� `n{ffc801}/hrang [ID/Nick] {FFFFFF}- ���������� ������� ���������/��������� ��������� �����������`n{ffc801}/lecture {FFFFFF}- �������� ������ ������. ��������� ���� ������ �����: ��������� - Police Dream - ������`n{ffc801}/stoplecture {FFFFFF}- ������������� ���������� ������`n{ffc801}/roz [ID] {FFFFFF}- ��������� ������������ ������`n{ffc801}/tkey [�������] {FFFFFF}- ���������  ���������� � ����� �� ������ ������ �� ���`n{ffc801}/z [ID] {FFFFFF}- ������� ���������� ���� �� ������� ��������������`n{ffc801}/z [ID] [����� ������] {FFFFFF}- ����� ������ ������ ��� �������� ����������� ����`n{ffc801}/rlogs {FFFFFF}- ������� �������� ��������� ��������� � �����`n{ffc801}/dlogs {FFFFFF}- ������� �������� ��������� ��������� � �����������`n{ffc801}/sulogs {FFFFFF}- ������� �������� ��������� ��������� �� ���������� � ������ (��������� �� �������)`n{ffc801}/tazerset {FFFFFF}- �������� ������������ Tazer HUD`n{ffc801}/tazersetoff {FFFFFF}- ��������� ��������� ������������ Tazer HUD`n{ffc801}/tazersize {FFFFFF}- �������� ������ ������ Tazer HUD`n{ffc801}/tazerstyle{FFFFFF}- �������� ����� ������ Tazer HUD`n{ffc801}/tgun [ID] {FFFFFF}- ������� ������ � ������ � �� ����������`n{ffc801}/tlgun [ID] {FFFFFF}- ������� �������� �� ������ � �� ����������`n{ffc801}/tdrive [ID] {FFFFFF}- ������������ ������������ �������������`n{ffc801}/ransom {FFFFFF}- ����� ������ �� ���������`n{ffc801}/pred [id] {FFFFFF}-  ������ �������������� �� ������������ ������ � ������`n{ffc801}/viz [id] [�����(�� �����������)] {FFFFFF}- ������� �������� � ���� ���`n{ffc801}/crib {FFFFFF} - ���������, � ������� �� ������ ��������� ���� �����`n{ffc801}/vig {FFFFFF} - ������ ������� ����������, � ���������������� ��� � ���� �������`n{ffc801}/work {FFFFFF} - ������� ���� ����������� �� ������, ������� ��������� � �������� (������� � ���� ����� �� �����)`n{ffc801}/form {FFFFFF} - ���������� ���� �� ����� ������������, ���� ��� � �����`n{ffc801}/cl [id] {FFFFFF} - �������������� ���������`n`n						{808080}[Other]`n`n{ffc801}/blclear {FFFFFF}- �������� ������ ������ ���������`n{ffc801}/timeset {FFFFFF}- �������� ������������ Time HUD`n{ffc801}/timesetoff {FFFFFF}- ��������� ��������� ������������ Time HUD`n{ffc801}/timesize {FFFFFF}- �������� ������ ������`n{ffc801}/timestyle {FFFFFF}- �������� ����� ������`n{ffc801}/timecolor {FFFFFF}- �������� ���� ������`n{ffc801}/setweather [ID ������] {FFFFFF}- ������� ������`n{ffc801}/cchat {FFFFFF}- �������� ���`n{ffc801}/ffind {FFFFFF}- ����� ������������ ����� � ���-����`n{ffc801}/yk {FFFFFF}- ������� ���������� ���� � ��������� ��������`n{ffc801}/fyk {FFFFFF}- ����� ������������ ����� � ��������� ������� (������������� � ��������)`n{ffc801}/ak {FFFFFF}- ������� ���������� ���� � ���������������� ��������`n{ffc801}/fak {FFFFFF}- ����� ������������ ����� � ���������������� ������� (������������� � ��������)`n{ffc801}/fp {FFFFFF}- ������� ���������� ���� � ����������� ��������������`n{ffc801}/ffp {FFFFFF}- ����� ������������ ����� � ����������� ������������� (������������� � ��������)`n{ffc801}/pdhelp", "�������")
	return
}
if(RegExMatch(chatInput, "^\/lecture"))
{
	if(RegExMatch(chatInput, "^\/lecture([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/lecture$") || RegExMatch(chatInput, "^\/lecture $") || RegExMatch(chatInput, "^\/lecture (.*),$") || RegExMatch(chatInput, "^\/lecture (.*), $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������: /lecture [�������� �����], [����� ��������]")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}��� ���������� ������� ����������� ���� ""-"" ")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������: /lecture ������� �����, 7-15 (������� �� ��������)")
		return
	}
	{
		RegExMatch(chatInput, "/lecture (.*), (.*)", lecture)
		output := lecture1
		time := lecture2*1000
		StopLecture := 1
		if (time="0")
		{
			AddChatMessageEx("{FFFFFF}"," {ffc801}[Police Dream] {FFFFFF}�������� �� ����� ���� ����� ����!")
			return
		}
		IfNotExist, %A_MyDocuments%\Police Dream\������\%output%.txt
		{
			AddChatMessageEx("{FFFFFF}"," {ffc801}[Police Dream] {FFFFFF}���������� ���� ����� �� ����������!")
			return
		}
		Loop, Read, %A_MyDocuments%\Police Dream\������\%output%.txt
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
	showdialog("2","����� ������ �� ���������","`n�����`n���`n�������`n�����`n������`n���������`n�������`n������","������", "������")
	IdDialogLocal := 20
	return
}

if(RegExMatch(chatInput, "^\/kit$"))
{
	if (isGiveGuns)
	{
		isGiveGuns := false
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�� {FF0000}��������� {FFFFFF}�������������� ����� ��������")
	}
	else
	{
		isGiveGuns := true
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�� {32CD32}�������� {FFFFFF}�������������� ����� ��������")
	}
	return
}
if(RegExMatch(chatInput, "^\/dzap"))
{
	if(RegExMatch(chatInput, "^\/dzap([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/dzap$") || RegExMatch(chatInput, "^\/dzap $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /dzap [id ��������]")
		return
	}
	RegExMatch(chatInput, "^\/dzap ([\dA-Za-z_\[\]]+)", t)
	id := t1
	Event["Active"] := True
	Loop, Read, %Chatlog%
	{
		if (RegExMatch(A_LoopReadLine, "^\[(..):(..):(..)\].*?(\[Police\s..\]|\[FBI\])\s.*(Mayor,|Mayor]|City Hall,|City Hall]|City Hall]:|Mayor]:|Mayor|City Hall|�����)(?<Text>.*)?(���|�����|������|����|����|����|�����|���|�����|�����|�������|�������|10-14)(.*)",name))
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
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}��� ��� ��� �������")
	}
	return
}
if(RegExMatch(chatInput, "^\/viz") && Fraction="4")
{
	if(RegExMatch(chatInput, "^\/viz([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/viz$") || RegExMatch(chatInput, "^\/viz $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /viz [id / ����� ����]")
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
			AddChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ��� � ����!")
			return
		}
		if (cIi > 1)
		{
			AddChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������� ����� ������� �� ������� �������!")
			return
		}
	}
	id := t1
	if (id="-1" || id="")
		return
	if (t2="1")
		Event["QTime"] := "������"
	else if (t2="2" || t2="3" || t2="4")
		Event["QTime"] := "������"
	else if (t2>="5")
		Event["QTime"] := "�����"
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
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /pred [id / ����� ����]")
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
			AddChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ��� � ����!")
			return
		}
		if (cIi > 1)
		{
			AddChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������� ����� ������� �� ������� �������!")
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
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /cl [id]")
		return
	}
	RegExMatch(chatInput, "^\/cl (\d+)", t)
	id := t1
	if (isPlayerInAnyVehicle())
	{
		SendChat("/clear "id)
		Sleep 1200
		SendChat("/su " id " 1 ��������������")
	}
	else
		SendChat("/r " Tag " ���� � " id " �������������� ���������.")
	return
}
if(RegExMatch(chatInput, "^\/car (.*)", t))
{
	if(RegExMatch(chatInput, "^\/car([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/car$") || RegExMatch(chatInput, "^\/car $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /car [��������]")
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
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /ms [1/2/3] [�������]")
		return
	}
	RegExMatch(chatInput, "^\/ms (\d+) (.*)", t) || RegExMatch(chatInput, "^\/ms (\d+)", t)
	id := t1
	if (t2="" && id="0")
	{
		if (isWoman)
		{
			SendChat("/r ����������� � ������ ������.")
			Sleep 1200
			SendChat("/me ������ �� ���� ������ ������")
		}
		else
		{
			SendChat("/r ���������� � ������ ������.")
			Sleep 1200
			SendChat("/me ����� �� ���� ������ ������")
		}
		Sleep 1200
		SendChat("/rb "getid())
		return
	}
	if (id>3)
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /ms [1/2/3] [�������]")
		return
	}
	Reason := t2
	showDialog("2", "{ffc801}�������� �������:","{ffc801}�����������`n�����������`n�������`n�����`n���`n�����`n���������`nNews`nLCN`nYakuza`nRussian Mafia`nRifa`nGrove Street`nBallas`nVagos`nAztec`n�������", "�������")
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
						SendChat("/r ����������� � ���������� �����������. �������: "Reason)
					else
						SendChat("/r ���������� � ���������� �����������. �������: "Reason)
					Sleep 1200
					SendChat("/clist 31")
				}
				if (masknumber=2)
				{
					if (isWoman)
						SendChat("/r ����������� � ������ ������������. �������: "Reason)
					else
						SendChat("/r ���������� � ������ ������������. �������: "Reason)
					Sleep 1200
					SendChat("/clist 0")
				}
				if (masknumber=3)
				{
					if (isWoman)
						SendChat("/r ����������� � ����� ������������. �������: "Reason)
					else
						SendChat("/r ���������� � ����� ������������. �������: "Reason)
					Sleep 1200
					SendChat("/clist 19")
				}
				if (masknumber=4)
				{
					if (isWoman)
						SendChat("/r ����������� � ��������� �����. �������: "Reason)
					else
						SendChat("/r ���������� � ��������� �����. �������: "Reason)
					Sleep 1200
					SendChat("/clist 7")
				}
				if (masknumber=5)
				{
					if (isWoman)
						SendChat("/r ����������� � ����� ������. �������: "Reason)
					else
						SendChat("/r ���������� � ����� ������. �������: "Reason)
					Sleep 1200
					SendChat("/clist 13")
				}
				if (masknumber=6)
				{
					if (isWoman)
						SendChat("/r ����������� � ����� ��������� �����. �������: "Reason)
					else
						SendChat("/r ���������� � ����� ��������� �����. �������: "Reason)
					Sleep 1200
					SendChat("/clist 21")
				}
				if (masknumber=7)
				{
					if (isWoman)
						SendChat("/r ����������� � ����� ��������� ���������. �������: "Reason)
					else
						SendChat("/r ���������� � ����� ��������� ���������. �������: "Reason)
					Sleep 1200
					SendChat("/clist 19")
				}
				if (masknumber=8)
				{
					if (isWoman)
						SendChat("/r ����������� � ����� ��������� ��������. �������: "Reason)
					else
						SendChat("/r ���������� � ����� ��������� ��������. �������: "Reason)
					Sleep 1200
					SendChat("/clist 2")
				}
				if (masknumber=9)
				{
					if (isWoman)
						SendChat("/r ����������� � ����� ��� LCN. �������: "Reason)
					else
						SendChat("/r ���������� � ����� ��� LCN. �������: "Reason)
					Sleep 1200
					SendChat("/clist 28")
				}
				if (masknumber=10)
				{
					if (isWoman)
						SendChat("/r ����������� � ����� ��� Yakuza. �������: "Reason)
					else
						SendChat("/r ���������� � ����� ��� Yakuza. �������: "Reason)
					Sleep 1200
					SendChat("/clist 8")
				}
				if (masknumber=11)
				{
					if (isWoman)
						SendChat("/r ����������� � ����� ��� ��. �������: "Reason)
					else
						SendChat("/r ���������� � ����� ��� ��. �������: "Reason)
					Sleep 1200
					SendChat("/clist 31")
				}
				if (masknumber=12)
				{
					if (isWoman)
						SendChat("/r ����������� � ����� �� Rifa. �������: "Reason)
					else
						SendChat("/r ���������� � ����� �� Rifa. �������: "Reason)
					Sleep 1200
					SendChat("/clist 4")
				}
				if (masknumber=13)
				{
					if (isWoman)
						SendChat("/r ����������� � ����� �� Grove. �������: "Reason)
					else
						SendChat("/r ���������� � ����� �� Grove. �������: "Reason)
					Sleep 1200
					SendChat("/clist 1")
				}
				if (masknumber=14)
				{
					if (isWoman)
						SendChat("/r ����������� � ����� �� Ballas. �������: "Reason)
					else
						SendChat("/r ���������� � ����� �� Ballas. �������: "Reason)
					Sleep 1200
					SendChat("/clist 23")
				}
				if (masknumber=15)
				{
					if (isWoman)
						SendChat("/r ����������� � ����� �� Vagos. �������: "Reason)
					else
						SendChat("/r ���������� � ����� �� Vagos. �������: "Reason)
					Sleep 1200
					SendChat("/clist 25")
				}
				if (masknumber=16)
				{
					if (isWoman)
						SendChat("/r ����������� � ����� �� Aztec. �������: "Reason)
					else
						SendChat("/r ���������� � ����� �� Aztec. �������: "Reason)
					Sleep 1200
					SendChat("/clist 18")
				}
				if (masknumber=17)
				{
					if (isWoman)
						SendChat("/r ����������� � ������ ��������. �������: "Reason)
					else
						SendChat("/r ���������� � ������ ��������. �������: "Reason)
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
						SendChat("/me ������� ����, ����� ���� ������� �������� ����������")
						Sleep 1200
						SendChat("/me ������ �� ���� ���������� � ������� ����")
					}
					else
					{
						SendChat("/me ������ ����, ����� ���� ������ �������� ����������")
						Sleep 1200
						SendChat("/me ����� �� ���� ���������� � ������ ����")
					}
					sleep 1200
					SendChat("/do ����� � ����������.")
					return
				}
				if (id="2")
				{
					Sleep 1200
					if (isWoman)
					{
						SendChat("/me ����� � ���� ������ ������ � ������ � ��������")
						Sleep 1200
						SendChat("/me ������� �� ��������� �������� � ����������� � ������ �� ����")
						Sleep 1200
						SendChat("/me ������� ��������")
					}
					else
					{
						SendChat("/me ���� � ���� ������ ������ � ����� � ��������")
						Sleep 1200
						SendChat("/me ������ �� ��������� �������� � ����������� � ����� �� ����")
						Sleep 1200
						SendChat("/me ������ ��������")
					}
					sleep 1200
					SendChat("/do ����� � ����������.")
					return
				}
				if (id="3")
				{
					Sleep 1200
					if (isWoman)
					{
						SendChat("/me ������ �����, ����� ������ ������ � ������ ����")
						Sleep 1200
						SendChat("/me ������� �� ����� �������� ���������� � ������ �� ����")
						Sleep 1200
						SendChat("/me ������� �����")
					}
					else
					{
						SendChat("/me ������ �����, ���� ������ ������ � ����� ����")
						Sleep 1200
						SendChat("/me ������ �� ����� �������� ���������� � ����� �� ����")
						Sleep 1200
						SendChat("/me ������ �����")
					}
					sleep 1200
					SendChat("/do ����� � ����������.")
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
			AddChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ��� � ����!")
			return
		}
		if (cIi > 1)
		{
			AddChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������� ����� ������� �� ������� �������!")
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
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /setweather [id ������]")
		return
	}
	RegExMatch(chatInput, "^\/setweather ([\dA-Za-z_\[\]]+)", t)
	id := t1
	setWeather(id)
	AddChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ �������� ��: {FF0000}"id)
	if(id < 0)
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�� ������� ������ �� �����������")
	}
	return
}
if(RegExMatch(chatInput, "^\/tkey"))
{
	if(RegExMatch(chatInput, "^\/tkey([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/tkey$") || RegExMatch(chatInput, "^\/tkey $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /tkey [�������]")
		return
	}
	RegExMatch(chatInput, "^\/tkey (.*)", t)
	Reason := t1
	SendChat("/r " Tag " ����� ����� ����� �� ������ �� ������� - " reason "?")
	return
}
if(RegExMatch(chatInput, "^\/key"))
{
	if(RegExMatch(chatInput, "^\/key([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/key$") || RegExMatch(chatInput, "^\/key $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /key [id]")
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
	SendChat("/me ������ ������ ������ �� ������")
	if (cServerID="2")
		Sleep 1200
	else
	{
		Random Rando, 4000, 8000
		Sleep %Rando%
	}
	SendChat("/me ������� ����� ����������� � ������� �� ������")
	if (cServerID="2")
		Sleep 1200
	else
	{
		Random Rando, 4000, 8000
		Sleep %Rando%
	}
	SendChat("/try ����� ��������� � ������� �� ������")
	return
}
if(RegExMatch(chatInput, "^\/kur"))
{
	if(RegExMatch(chatInput, "^\/kur([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/kur$") || RegExMatch(chatInput, "^\/kur $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /kur [id]")
		return
	}
	RegExMatch(chatInput, "^\/kur (\d+)", t)
	SendChat("/me ������ ��� � ������ ���������� ��������")
	Sleep 1200
	SendChat("/do ��� ��� ����������: ���: "RegExReplace(getPlayerNameById(t1), "_", " "))
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
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /ffind [�����]")
		return
	}
	RegExMatch(chatInput, "^\/ffind (.*)", t)
	Tember := t1
	if(strlen(Tember) < 3)
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������� ���� ��������. ������� 3 �������.")
		return
	}
	filedelete, %bDir%\cinfo.txt
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}���������, ��� ��������...")
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
		listrtextfordialog("" bDir "\cinfo.txt","{FFA500}��� ��������� ���������","0")
	}
	return
}
if(RegExMatch(chatInput, "^\/(tgun|tdrive|tdr|tlgun)"))
{
	if(RegExMatch(chatInput, "^\/(tgun|tdrive|tdr|tlgun)([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/(tgun|tdrive|tdr|tlgun)$") || RegExMatch(chatInput, "^\/(tgun|tdrive|tdr|tlgun) $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /tgun [ID]")
		return
	}
	RegExMatch(chatInput, "^\/(tgun|tdrive|tdr|tlgun) (\d+)", t)
	if (Rang < 4 && Fraction!="4")
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������� �������� � ��������[4]")
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
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}���������� �������� ��� ���")
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
			if (RegExMatch(lines[gw],"P	������	([0-9]*)") && t1="tgun")
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
					SendChat("/me ������� �� ������� ����� ��� ���� � �������� ��������� ��������")
				else
					SendChat("/me ������ �� ������� ����� ��� ���� � ������� ��������� ��������")
			}
			if (RegExMatch(lines[gw],"K	������������ �����	([0-9]*)") && t1="tdrive")
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
					SendChat("/me ������� ��� �� ������� � ����� � ���� ������ �������")
					if (cServerID="2")
						Sleep 1200
					else
					{
						Random Rando, 4000, 8000
						Sleep %Rando%
					}
					SendChat("/me ������ ������ � ������������� ������������� �������������")
				}
				else
				{
					SendChat("/me ������ ��� �� ������� � ����� � ���� ������ �������")
					if (cServerID="2")
						Sleep 1200
					else
					{
						Random Rando, 4000, 8000
						Sleep %Rando%
					}
					SendChat("/me ����� ������ � ������������� ������������� �������������")
				}
			}
			if (RegExMatch(lines[gw],"B	���������	(\d+)", questtake) && t1="tdr")
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
						SendChat("/me ������� �� ������� ����� ��� ���� � �������� ��������� ��������")
					else
						SendChat("/me ������ �� ������� ����� ��� ���� � ������� ��������� ��������")
				}
			}
			if (RegExMatch(lines[gw],"A	���������	(\d+)",questtake) && t1="tdr")
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
						SendChat("/me ������� �� ������� ����� ��� ���� � �������� ��������� ��������")
					else
						SendChat("/me ������ �� ������� ����� ��� ���� � ������� ��������� ��������")
				}
			}
			if (RegExMatch(lines[gw],"O	�������� �� ������	([0-9]*)") && t1="tlgun")
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
					SendChat("/me ������� ��� �� ������� � ����� � ���� ������ �������")
					if (cServerID="2")
						Sleep 1200
					else
					{
						Random Rando, 4000, 8000
						Sleep %Rando%
					}
					SendChat("/me ������ ������ � ������������� �������� �� ������")
				}
				else
				{
					SendChat("/me ������ ��� �� ������� � ����� � ���� ������ �������")
					if (cServerID="2")
						Sleep 1200
					else
					{
						Random Rando, 4000, 8000
						Sleep %Rando%
					}
					SendChat("/me ����� ������ � ������������� �������� �� ������")
				}
			}
		}
		if (!ltake)
		{
			SendInput {ESC}
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}� ������ ����������� ������ ��� ��������!")
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
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /fyk [�����] (������� �����)")
		return
	}
	RegExMatch(chatInput, "^\/fyk (.*)", t)
	Text := t1
	if(strlen(Text) < 2)
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������� ���� ��������. ������� 2 �������.")
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
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}�� ������ ������� ������ �� �������")
	}
	return
}
if(RegExMatch(chatInput, "^\/fak"))
{
	if(RegExMatch(chatInput, "^\/fak([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/fak$") || RegExMatch(chatInput, "^\/fak $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /fak [�����] (������� �����)")
		return
	}
	RegExMatch(chatInput, "^\/fak (.*)", t)
	Text := t1
	if(strlen(Text) < 2)
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������� ���� ��������. ������� 2 �������.")
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
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}�� ������ ������� ������ �� �������")
	}
	return
}
if(RegExMatch(chatInput, "^\/ffp"))
{
	if(RegExMatch(chatInput, "^\/ffp([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/ffp$") || RegExMatch(chatInput, "^\/ffp $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /ffp [�����] (������� �����)")
		return
	}
	RegExMatch(chatInput, "^\/ffp (.*)", t)
	Text := t1
	if(strlen(Text) < 2)
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������� ���� ��������. ������� 2 �������.")
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
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}�� ������ ������� ������ �� �������")
	}
	return
}
if(RegExMatch(chatInput, "^\/zap"))
{
	if(RegExMatch(chatInput, "^\/zap([^ ])"))
		return
	if(RegExMatch(chatInput, "^\/zap$") || RegExMatch(chatInput, "^\/zap $") || RegExMatch(chatInput, "^\/zap (\d+)$") || RegExMatch(chatInput, "^\/zap (\d+) $"))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������: {ffc801}/zap [id] [�������]")
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
					SendChat("/r " Tag " ���� " gNick " ������������ �� �������� - " Closed2 ".")
				else
					SendChat("/d Mayor, ���� " gNick " ������������ �� �������� - " Closed2 ".")
			}
			if (cServerID="2")
			{
				if (Rang < 11 && Fraction!="4")
					SendChat("/r " Tag " ���� " gNick " ������������ �� �������� - " Closed2 ".")
				else
					SendChat("/d [City Hall] ���� " gNick " ������������ �� �������� - " Closed2 ".")
			}
		}
		else
		{
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ����� �� � ����")
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
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /su [ID]")
		return
	}
	if (SuError="1")
	{
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}��������� ������. ������� ������� ��� ���.")
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
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}��������� ����� �� ������.")
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
		showDialog("2", "{ffc801}���������� � ������: {FF0000}" NamePlayer "","{ffc801}" statya , "�������")
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
						AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}�� ����� �������� ����� ������, ������� �� 1 �� " . obnul . ".")
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
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /z [ID]")
		return
	}
	if (SuError="1")
	{
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}��������� ������. ������� ������� ��� ���.")
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
			AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}��������� ����� �� ������.")
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
			statya := statya . "`n" . "{FFFFFF}������� ����� ������. ������: 11"
			showDialog("1", "{ffc801}���������� � ������: {FF0000}" NamePlayer "","{ffc801}" statya , "������")
			statya =
			if (isDialogOpen())
			{
				Input, DialogText, V, {Enter}{Escape}{LButton}
				if(DialogText == "")
				{
					AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}�� �� ������� ������� ���������� � ������.")
					SuError := "0"
					return
				}
				if(DialogText < 1 || DialogText > obnul)
				{
					AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream] {FFFFFF}�� ����� �������� ����� ������, ������� �� 1 �� " . obnul . ".")
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
	AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} �� ������� �������� �������������� Tazer HUD'a")
	stop := "1"
	IniWrite, % X, % iniFile, TextDraw, TazerX
	IniWrite, % Y, % iniFile, TextDraw, TazerY
	settimer, Time, 1000
	return
}
if(RegExMatch(chatInput, "^\/tazerset$"))
{
	Event["Tazer"] := false
	AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} ����������� ����� ��� ��������������. �� ���������� ������� � ��� - /tazersetoff")
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
	AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} �� ������� �������� �������������� Time HUD'a")
	stop := "1"
	IniWrite, % X, % iniFile, TextDraw, TimeX
	IniWrite, % Y, % iniFile, TextDraw, TimeY
	settimer, Time, 1000
	return
}
if(RegExMatch(chatInput, "^\/timeset$"))
{
	Event["Tazer"] := false
	AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} ����������� ����� ��� ��������������. �� ���������� ������� � ��� - /timesetoff")
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
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /tazersize [������ ������]")
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
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} �� �������� ������ HUD Tazer")
	}
	else
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /tazersize [������ ������]")
	return
}
if(RegExMatch(chatInput, "^\/tazerstyle"))
{
	if(RegExMatch(chatInput, "^\/tazerstyle([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/tazerstyle$") || RegExMatch(chatInput, "^\/tazerstyle $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /tazerstyle [�����]")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �1: Times New Roman")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �2: Calibri")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �3: Cambria")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �4: Adobe Caslon Pro")
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
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /tazerstyle [�����]")
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �1: Times New Roman")
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �2: Calibri")
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �3: Cambria")
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �4: Adobe Caslon Pro")
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
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} �� �������� ����� HUD Tazer")
	}
	else
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /tazerstyle [�����]")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �1: Times New Roman")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �2: Calibri")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �3: Cambria")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �4: Adobe Caslon Pro")
	}
	return
}
if(RegExMatch(chatInput, "^\/timesize"))
{
	if(RegExMatch(chatInput, "^\/timesize([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/timesize$") || RegExMatch(chatInput, "^\/timesize $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /timesize [������ ������]")
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
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} �� �������� ������ HUD Time")
	}
	else
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /timesize [������ ������]")
	return
}
if(RegExMatch(chatInput, "^\/timecolor"))
{
	if(RegExMatch(chatInput, "^\/timecolor([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/timecolor$") || RegExMatch(chatInput, "^\/timecolor $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /timecolor [����]")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}����� ������:{FF0000}red{FFFFFF}/{0000FF}blue{FFFFFF}/{696969}gray{FFFFFF}/{FFFFFF}white{FFFFFF}")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}����� ������:{FFFF00}yellow{FFFFFF}/{008000}green")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}����� �� ������ ������������ ���� HTML ����")
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
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /timecolor [����]")
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}����� ������:{FF0000}red{FFFFFF}/{0000FF}blue{FFFFFF}/{696969}gray{FFFFFF}/{FFFFFF}white{FFFFFF}")
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}����� ������:{FFFF00}yellow{FFFFFF}/{008000}green")
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}����� �� ������ ������������ ���� HTML ����")
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
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} �� �������� ���� HUD Time")
	}
	else
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /timecolor [����]")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}����� ������:{FF0000}red{FFFFFF}/{0000FF}blue{FFFFFF}/{696969}gray{FFFFFF}/{FFFFFF}white{FFFFFF}")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}����� ������:{FFFF00}yellow{FFFFFF}/{008000}green")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}����� �� ������ ������������ ���� HTML ����")
	}
	return
}
if(RegExMatch(chatInput, "^\/timestyle"))
{
	if(RegExMatch(chatInput, "^\/timestyle([^ ])"))
		return
	if((RegExMatch(chatInput, "^\/timestyle$") || RegExMatch(chatInput, "^\/timestyle $")))
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /timestyle [�����]")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �1: Times New Roman")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �2: Calibri")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �3: Cambria")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �4: Adobe Caslon Pro")
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
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /timestyle [�����]")
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �1: Times New Roman")
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �2: Calibri")
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �3: Cambria")
			addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �4: Adobe Caslon Pro")
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
		AddChatMessageEx("FFFFFF"," {ffc801}[Police Dream]{FFFFFF} �� �������� ����� HUD Time")
	}
	else
	{
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}�����������:{ffc801} /timestyle [�����]")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �1: Times New Roman")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �2: Calibri")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �3: Cambria")
		addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}������ ������ �4: Adobe Caslon Pro")
	}
	return
}
if(RegExMatch(chatInput, "^\/rlogs$"))
{
	Filedelete, %bDir%\cinfo.txt
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}���������, ��� ��������...")
	Loop, Read, %Chatlog%
	{
		if ((RegExMatch(A_LoopReadLine, "^\[(..):(..):(..)\]\s\s(�����|������|��.�������|�������|���������|��.���������|��.���������|���������|��.���������|�������|�����|������������|���������|�����)")) || (RegExMatch(A_LoopReadLine, "^\[(..):(..):(..)\]\s\s\(\(\ (�����|������|��.�������|�������|���������|��.���������|��.���������|���������|��.���������|�������|�����|������������|���������|�����)")) || (RegExMatch(A_LoopReadLine, "^\[(..):(..):(..)\]\s\s(�����|��������|��.�����|����� CID|����� DEA|����� CID|����� DEA|���������|���.���������|��������)")) || (RegExMatch(A_LoopReadLine, "^\[(..):(..):(..)\]\s\s\(\(\ (�����|��������|��.�����|����� CID|����� DEA|����� CID|����� DEA|���������|���.���������|��������)")) || (RegExMatch(A_LoopReadLine, "^\[(..):(..):(..)\]\s\s\(\(\ (���������|�������|�������|���.������|���. ������|���.����|���. ����|���)")) || (RegExMatch(A_LoopReadLine, "^\[(..):(..):(..)\]\s\s\(\(\ (������|�������|��� ����|���������|��������|������|��������|������|���.����.�����|����.����)")) || (RegExMatch(A_LoopReadLine, "^\[(..):(..):(..)\]\s\s(���������|�������|�������|���.������|���. ������|���.����|���. ����|���)") || (RegExMatch(A_LoopReadLine,"^\[(..):(..):(..)\]\s\s(������|�������|���.����|���������|��������|������|��������|������|���.����.�����|����.����)"))))
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
	listrtextfordialog("" bDir "\cinfo.txt","{FFA500}��� ��������� � �����","0")
	return
}
if(RegExMatch(chatInput, "^\/dlogs$"))
{
	Filedelete, %bDir%\cinfo.txt
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}���������, ��� ��������...")
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
	listrtextfordialog("" bDir "\cinfo.txt","{FFA500}��� ��������� � �����������","0")
	return
}
if(RegExMatch(chatInput, "^\/sulogs$"))
{
	Filedelete, %bDir%\cinfo.txt
	addChatMessageEx("FFFFFF", " {ffc801}[Police Dream] {FFFFFF}���������, ��� ��������...")
	Loop, Read, %Chatlog%
	{
		if (RegExMatch(A_LoopReadLine, "^\[(..):(..):(..)\]\s\s\[Wanted (.*): (.*)] \[��������: (.*)] \[(.*)\]", sulogs))
		{
			if (sulogs6!="�����������")
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
	listrtextfordialog("" bDir "\cinfo.txt","{FFA500}��� ���������� � ������","0")
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
			showdialog("2","����� ������ �� ���������","`n��� [6] - 100.000 $`n���.���� [5] - 80.000 $`n��������� ������ [4] - 60.000 $`n�������� [3] - 40.000 $`n������� [2] - 30.000 $`n��������� [1] - 20.000 $","������", "������")
			IdDialogLocal := "0"
		}
		else if Line = 2
		{
			showdialog("2","����� ������ �� ���������","`n�������� [10] - 100.000 $`n���.��������� [9] - 80.000 $`n��������� [8] - 70.000 $`n����� CID [7] - 60.000 $`n����� DEA [6] - 50.000 $`n����� CID [5] - 40.000 $`n����� DEA [4] - 30.000 $`n��.����� [3] - 25.000 $`n�������� [2] - 20.000 $`n������ [1] - 15.000 $","������", "������")
			IdDialogLocal := "0"
		}
		else if Line = 3
		{
			showdialog("2","����� ������ �� ���������","`n����� [14] - 80.000 $`n��������� [13] - 70.000 $`n������������ [12] - 65.000 $`n����� [11] - 60.000 $`n������� [10] - 55.000 $`n��.��������� [9] - 50.000 $`n��������� [8] - 45.000 $`n��.��������� [7] - 40.000 $`n��.��������� [6] - 35.000 $`n��������� [5] - 30.000 $`n������� [4] - 25.000 $`n��.������� [3] - 20.000 $`n������ [2] - 15.000 $`n����� [1] - 10.000 $","������", "������")
			IdDialogLocal := "0"
		}
		else if Line = 4
		{
			showdialog("2","����� ������ �� ���������","`n������� [15] - 80.000 $`n��������� [14] - 75.000 $`n������������ [13] - 70.000 $`n����� [12] - 65.000 $`n������� [11] - 60.000 $`n��.��������� [10] - 55.000 $`n��������� [9] - 50.000 $`n��.��������� [8] - 45.000 $`n��������� [7] - 40.000 $`n�������� [6] - 35.000 $`n��.������� [5] - 30.000 $`n������� [4] - 25.000 $`n��.������� [3] - 20.000 $`n�������� [2] - 15.000 $`n������� [1] - 10.000 $","������", "������")
			IdDialogLocal := "0"
		}
		else if Line = 5
		{
			showdialog("2","����� ������ �� ���������","`n����.���� [10] - 80.000 $`n���.����.����� [9] - 75.000 $`n������ [8] - 70.000 $`n�������� [7] - 60.000 $`n������ [6] - 40.000 $`n�������� [5] - 35.000 $`n��������� [4] - 30.000 $`n���.���� [3] - 25.000 $`n������� [2] - 20.000 $`n������ [1] - 15.000 $","������", "������")
			IdDialogLocal := "0"
		}
		else if Line = 6
		{
			showdialog("2","����� ������ �� ���������","`n����������� [10] - 80.000 $`n�������� [9] - 75.000 $`n��.�������� [8] - 70.000 $`n��.�������� [7] - 60.000 $`n����������� [6] - 55.000 $`n���������� [5] - 50.000 $`n��.���������� [4] - 45.000 $`n����������� [3] - 30.000 $`n����������� [2] - 25.000 $`n������ [1] - 20.000 $","������", "������")
			IdDialogLocal := "0"
		}
		else if Line = 7
		{
			showdialog("2","����� ������ �� ���������","`n����������� �������� [10] - 70.000 $`n���������� �������� [9] - 60.000 $`n����������� �������� [8] - 55.000 $`n������� �������� [7] - 50.000 $`n�������� [6] - 45.000 $`n������� [5] - 40.000 $`n�������� [4] - 30.000 $`n������������� [3] - 25.000 $`n������������� [2] - 20.000 $`n������ [1] - 15.000 $","������", "������")
			IdDialogLocal := "0"
		}
		else if Line = 8
		{
			showdialog("2","����� ������ �� ���������","`n������ ����� ��� ���������� � 100.000$������ ����� c ����������� � 150.000$`n������ ����� ������������ ���� ��� ���������� � 100.000$`n������ ����� ������������ ���� c ����������� � 150.000$`n������ ������� SAPD ��� ���������� � 100.000$`n`n������ ������� SAPD � ����������� � 150.000$`n������ �������� ��� ���������� � 75.000$`n������ �������� � ����������� � 100.000$`n������ ��������� ��� ���������� � 50.000$`n������ ��������� � ����������� � 75.000$`n������ ��� ��� ���������� � 50.000$`n������ ��� � ����������� � 75.000$`n������ ���������������/������� ��������� ��� ���������� � 50.000$`n������ ���������������/������� ��������� � ����������� � 75.000$","������", "������")
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
