/**
 * Copyright © 2018 XaFlaForo, IRT Studios.
 * Created For ALRPG.
 * All Rights Reserved.
 */

//--- DEBUGGING
scriptName "IRT_fnc_deathscreen";
scopeName "main";

//--- PASS UNIT PARAM
params ["_unit"];

//--- Get PARAMS AND MAKE SURE THEY ARE PASSED
if !(params [ ["_unit"] ]) exitWith { systemChat "THIS SCRIPT IS BROKE - ERROR IN CODE OR INSTALLED INCRORECTLY"; };

//--- REMOVE HUD I HOPE
[] call life_fnc_hudUpdate;

//--- BLOCK DA ESCAPE MENU
(findDisplay 7300) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {true}"]; //Block the ESC menu

//--- FETCH CONTROLS AND DISPLAYS
_display = uiNamespace getVariable ["Life_Death_Screen",displayNull];
_Progress = _display displayCtrl 99532;
_ProgressText = _display displayCtrl 99533;

//--- DEFINE TEXT BAR
_ProgressText ctrlSetText "RESPAWN NOT AVAILIABLE";

//--- SET PROGRESS VALUE
_Progress progressSetPosition 1;

//--- SET VARS ON PLAYER
life_respawned = false;
life_is_alive = false;

//--- LOOP DEATHSCREEN
for "_i" from 0 to 1 step 0 do { 
    
    //--- SLEEP LITTLE BABY
    uiSleep = 0.273;

    //--- DECREASE THE BAR I DONT CARE ABOUT YOUR PRECIOUS CONFIG
    _Progress = _Progress - 0.0000006;

    //--- PLAYER REVIVED BY A MEDIC
    if(life_is_alive) exitWith 
    {
            
        //--- CLOSE DIALOG
        closeDialog 0;

       //--- BREAKOUT
       breakOut "main";     
   };

    //--- FORCE RESPAWN
    if (_Progress <= 0.00007) exitWith 
    {
           
           //--- FORCE RESPAWN
           forceRespawn player;

           //--- SET VARS
           life_respawned = true;
           life_is_alive = true;
           
           //--- BREAKOUT
           breakOut "main";      
    };
    
    //--- CHECK CERATIN ARGUMENTS
    if (_Progress <= 0.60007) then 
    {

        //--- UNBLOCK DA ESCAPE MENU
        (findDisplay 7300) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {false}"]; 
        
        //--- UPDATE CONTROL TEXT
        _ProgressText ctrlSetText "PRESS [ESCAPE] AND [SUICIDE] TO RESPAWN";
    };
};




