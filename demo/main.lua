#include "scripts/utility.lua"
#include "scripts/helicopter.lua"
#include "scripts/mapWeapons.lua"
#include "scripts/hub.lua"

function init()
    initMapWeapons()
    initMapHub()
    initHelicopter()
end

function tick()
    manageMapWeapons()
    manageAmbientHelicopter()
end

function draw()
    drawHub()
end