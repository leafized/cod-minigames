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
   SetDvar( "g_hardcore", 1 );//this will remove player huds
   self _uno_initialize_dashboard();
}

_uno_initialize_dashboard()
{
    self.Uno            = [];
    self.Uno.Background = createRectangle("CENTER", "CENTER",0,0,600, 340,grey,1,0,"white",false);
    self.Uno.Infobar    = createRectangle("CENTER", "CENTER", -200,0,180, 330, indigo, 1, 2, "white", false);
    self.Uno.InfoText   = createText("console",1.5,"LEFT","CENTER",-280,-160,3,white,1,0,0,create_line("Welcome to cod-minigames|Current Mode: UNO|^4Player 1:|^3Player 2|^2Player 3|^1Player 4||||Thank you for playing!"));
}
