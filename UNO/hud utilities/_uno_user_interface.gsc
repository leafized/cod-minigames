/*
*    Infinity Loader :: The Best GSC IDE!
*
*    Project : cod-minigames
*    Author : 
*    Game : Project Bundle
*    Description : This is where non card related ui will go (selector, background, score, timer, etc...)
*    Date : 5/7/2023 2:22:31 AM
*
*/

#include common_scripts\utility;

_uno_initialize_interface()
{
   self _uno_initialize_dashboard();
}

_uno_initialize_dashboard()
{
    self.Uno            = [];
    self.Uno.Background = createRectangle("CENTER", "CENTER",0,0,600,400,grey,1,0,"white",false);
    
}