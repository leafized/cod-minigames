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
   
}

_uno_initialize_dashboard()
{
    self.Uno.Background[0] = self createRectangle(align,relative,x,y,width,height,color,1,0,"white",false);
}