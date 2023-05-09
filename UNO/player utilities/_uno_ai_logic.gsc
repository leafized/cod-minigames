/*
*    Infinity Loader :: The Best GSC IDE!
*
*    Project : UNOCOD
*    Author : 
*    Game : Project Bundle
*    Description : This is where all ai logic should go. There should be no player calls in this file.
*    Date : 5/7/2023 1:57:22 AM
*
*/

#include common_scripts\utility;

_uno_init_ai_logic()
{
    
}

_uno_ai_chat()
{
    OtherPlayMessages = StrTok("Oh damn, good job man;Oh wow;Ugh really... wtf;Screw this; Lmao how bruh;Are you serious?;F this man i'm done lmao; God damn it;Aye bro how!!;I hope you get a draw 4;I hope you get a draw 2;You've got to be kidding" , ";");
    GoodPlayMessages  = StrTok("Get good;Imma win this;", ";");
    LossMessages      = StrTok("GG boys;Damn i lost;Shit, welp, gg.;Fuck this i'm done;Lmao are you serious?;What the heck;", ";");
    UnoMessages       = StrTok("Someone has one card left? Damn man;Oh boy, is he gonna win?;Hope i can beat you...;Wow you're good.;Nah imma beat this", ";");
}