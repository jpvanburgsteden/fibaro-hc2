fibaro-hc2
==========

This repository holds scripts for automating domotica based on the Fibaro Home Center 2.

Scenes
------------

### darkness.lua
A script to set the global `Darkness` value before the sun has set and unsets it when the sun has risen. Very useful for scenes that need to act on the availability of daylight.

### switch_light_on_movement.lua
A script to switch on a light when detecting movement and `Darkness` is set. The dimlevel and duration are adjustable.
