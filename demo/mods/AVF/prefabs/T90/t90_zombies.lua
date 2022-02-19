#include "avf_custom.lua"


vehicleParts = {
	chassis = {

	},
	turrets = {


	},
	guns = {
		["mainCannon"] = {	
			name="2A46 125 mm gun",
			magazines = {
						[1] = {
				name = "125mm HE",
				caliber 				= 125,
				velocity				= 200,
				explosionSize			= 2,
				maxPenDepth 			= 0.1,
				timeToLive 				= 7,
				gravityCoef 			= 0.3,
				launcher				= "cannon",
				payload					= "HE",
				shellWidth				= 0.5,
				shellHeight				= 1.5,
				r						= 0.8,
				g						= 0.3, 
				b						= 0.3, 
				shellSpriteName			= "MOD/demo/gfx/shellModel2.png",
				shellSpriteRearName		= "MOD/demo/gfx/shellRear2.png",
				magazineCount = 999999,
			},
		},
					loadedMagazine 			= 1,
					barrels 				= 
												{
													[1] = {x=0.2,y=0.2,z=-0.3},
												},
					sight					= {
												[1] = {
												x=3,
												y=1.3,
												z=0.3,
													},
												},
					canZoom					= true,
					zoomSight 				= "MOD/demo/gfx/1G46Sight.png",
					multiBarrel 			= 1,
					highVelocityShells		= true,
					cannonBlast 			= 10,
					RPM 					= 30,
					reload 					= 2,
					recoil 					= 1.6,
					dispersion 				= 1,
					gunRange				= 500,
					gunBias 				= -1,
					elevationSpeed			= .5,
					smokeFactor 			= 2,
					smokeMulti				= 5,
					soundFile				= "MOD/demo/sounds/tankshot0",
					reloadSound				= "MOD/demo/sounds/AltTankReload",
			},
	},
	}
	

	---- magazine num _ val
	---- barrels num value

vehicle = {

}

