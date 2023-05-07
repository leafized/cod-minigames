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
        self freezeControls(false);
        
        // Will appear each time when the player spawns, that's just an example.
        self iprintln(RED + BUILD);
        self iprintln(WELCOME_MSG);
        self iprintln(GetBundleMessage());
    
        //Your code goes here...Good Luck!
    }
}

#ifndef MW2 && MW3
GetBundleMessage = () => return "Hello from main.gsc";
#endif