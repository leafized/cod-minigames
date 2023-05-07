/*
*    Infinity Loader :: The Best GSC IDE!
*
*    Project : UNOCOD
*    Author : Leafized
*    Game : Project Bundle
*    Description : Mini Game Bundle that will support all cods
*    Date : 5/7/2023 1:53:14 AM
*
*   PLEASE READ == THERE SHOULD BE NO LOGIC IN THIS SECTION OTHER THAN INTIAL CALLS TO A HANDLER FOR MODES.
*   PLEASE READ THE UTILITIES FILE.
*/

#include common_scripts\utility;



init()
{
    level thread onPlayerConnect();
}

onPlayerConnect()
{
    for(;;)
    {
        level waittill("connected", player);
        player thread onPlayerSpawned();
        player IPrintLn( "welcome to mini games, please wait while host chooses a mode." );
    }
}

onPlayerSpawned()
{
    self endon("disconnect");
    level endon("game_ended");
    for(;;)
    {
        self waittill("spawned_player");
        if(isDefined(self.playerSpawned))
            continue;
        self.playerSpawned = true;
        self freezeControls(false);//release player from frozen movement in the event that a movement mode is required.
        
        self thread _start_uno_minigame();
        
    }
}

