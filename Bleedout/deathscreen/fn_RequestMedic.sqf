/*
    File: fn_requestmedic

    Author: Ethan (XaLaForo)

    Description:
    Master include for IRT configs
*/

//--- Dont Show If Not Medic
if !(playerSide isEqualTo independent) exitWith {};

//--- Create Marker
_revivemarker = createMarker ["Dead Player", position player];

//--- Define Marker Shape
_revivemarker setMarkerShape "ICON";

//--- Define Marker Typer
_revivemarker setMarkerType "hd_dot";

//--- Show notification
["ReviveIncapacitated", [_unit]] call BIS_fnc_showNotification;

//--- Show Hint Whereabouts
hint format [" Medic. %1 is in need of medical attention according to his gps he is located near %2",player,_position ]; //--- ToDO: Different Hint If Player Has No GPS

//--- Play Jingle
playSound "ReviveJingle";