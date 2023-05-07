/*
*    Infinity Loader :: The Best GSC IDE!
*
*    Project : UNOCOD
*    Author : 
*    Game : Project Bundle
*    Description : This is where UNO modules should be scripted, such as initilization, ending etc.
*    Date : 5/7/2023 1:59:49 AM
*
*/

#include common_scripts\utility;

_start_uno_minigame()
{
    uno        = [];
    uno.pcount = getPlayers().size;
    foreach( player in level.players )
    {
        player thread _uno_initialize_interface();
        player iprintln(uno.pcount);
    }
   
}