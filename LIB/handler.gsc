/*
*    Infinity Loader :: The Best GSC IDE!
*
*    Project : cod-minigames
*    Author : 
*    Game : Project Bundle
*    Description : This file handles mode distribution during development process, a mini menu will be added to select modes and custom rulesets later on.
*    Date : 5/7/2023 2:45:57 AM
*
*/

#include common_scripts\utility;

#define mode = 0;//0  = uno; 1 = undefined; 2 = undefined
_mod_handler()
{
    timer = 0;
    for(i=0;i<timer;i++)
    {
        wait 1;
        foreach(player in level.players)
        {
            player IPrintLnBold( "Initiating mod, waiting on players to join.\n" + (timer-i) + " seconds left" );
        }
    }
    switch(mode)
    {
        case 0:
        {
            level thread _start_uno_minigame();
        }
        
        default:
        {
            foreach(player in level.players)
            {
                player IPrintLnBold("^1No Mode was selected at this time\nRegular game!");
            } 
        }
    }
}