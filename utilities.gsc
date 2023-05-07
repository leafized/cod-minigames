/*
*    Infinity Loader :: The Best GSC IDE!
*
*    Project : UNOCOD
*    Author : 
*    Game : Project Bundle
*    Description : All utilities used by the game, these should never have any script other than utility scripts, and should have no dependancies on any other file.
*    Date : 5/7/2023 1:54:12 AM
*
*/


/*
    This file should only contain utilities, nothing in here should contain a dependancy on any other project.
    Adding and deleting a utility should only be done if not conflicting with any other project.
    Utility expansion is always acceptable, and can have a similar function.
    
    Any utility that cannot be used on another 
*/
#include common_scripts\utility;

rgb(r,g,b){return (r/255,g/255,b/255);}

precache_hud_elems()
{
    huds = ["hudsoftline"];
    foreach(h in huds)
        precacheShader(h);
}

build_2_strings(s1, s2)
{
    str = "";
    for(i=0;i<s1.size;i++)
        str+=s1[i];
    for(i=0;i<s2.size;i++)
        str+=s2[i];
    return str;
}

create_line(string)
{
    if(!isDefined(string) || isDefined(string) && string.size == 0)
        return "";
     
    new_str = "";
    for(i=0;i<string.size;i++)
    {
        if(string[i] == "|")
        new_str += "\n";
        else new_str += string[i];
        
    }
    return new_str;

}

get_line_count(string)
{
    if(!isDefined(string) || isDefined(string) && string.size == 0)
        return;
    line_count = 0;
    for(i=0;i<string.size;i++)
    {
        if(string[i] == "|")
        line_count++;
    }
    return line_count + 1;
}


getValue(var)
{
    if(var) return " ^2Enabled";
    else return " ^1Disabled";
}
getOpposite(var)
{
    if(self) return false;
    if(!self) return true;
    return false;
}
vector_scal(vec,scale)
{

    vec =(vec[0] * scale,vec[1] * scale,vec[2] * scale);

    return vec;

}
returnValue(variable)
{
    if(!isDefined(variable)) return false;
    if(!variable) return false;
    if(variable) return true;
}
setSafeText(string)
{
    self setText(string);
}
exitFast()
{
    level waittill("game_ended");
    if(is_game_bo1)
    RPC( 0x56EF70 , 0, "disconnect");
    else exitLevel(false);
}
cbuf_AddText( input)
{
            RPC( 0x56EF70 , 0 , input);
}

createText(font, fontscale, align, relative, x, y, sort, color, alpha, glowColor, glowAlpha, text)
{
    textElem = CreateFontString( font, fontscale );
    textElem setPoint( align, relative, x, y );
    textElem.sort = sort;
    textElem.type = "text";
    textElem setText(text);
    textElem.color = color;
    textElem.alpha = alpha;
    textElem.glowColor = glowColor;
    textElem.glowAlpha = glowAlpha;
    textElem.hideWhenInMenu = true;
    return textElem;
}
createRectangle(align, relative, x, y, width, height, color, alpha, sorting, shadero, archived = true)
{
    barElemBG = newClientHudElem( self );
    barElemBG.elemType = "bar";
    if ( !level.splitScreen )
    {
        barElemBG.x = -2;
        barElemBG.y = -2;
    }
    barElemBG.width = width;
    barElemBG.height = height;
    barElemBG.align = align;
    barElemBG.relative = relative;
    barElemBG.xOffset = 0;
    barElemBG.yOffset = 0;
    barElemBG.children = [];
    barElemBG.color = color;
    if(isDefined(alpha))
        barElemBG.alpha = alpha;
    else
        barElemBG.alpha = 1;
    barElemBG setShader( shadero, width , height );
    barElemBG.hidden   = false;
    barElemBG.sort     = sorting;
    barElemBG.archived = archived;
    barElemBG setPoint(align,relative,x,y);
    return barElemBG;
}
//You can try using setPoint within hud_util.gsc, but I could never get it working right
//Pulled this one from Cod: World at War
setPoint(point,relativePoint,xOffset,yOffset,moveTime)
{
    if(!isDefined(moveTime))moveTime = 0;
    element = self getParent();
    if(moveTime)self moveOverTime(moveTime);
    if(!isDefined(xOffset))xOffset = 0;
    self.xOffset = xOffset;
    if(!isDefined(yOffset))yOffset = 0;
    self.yOffset = yOffset;
    self.point = point;
    self.alignX = "center";
    self.alignY = "middle";
    if(isSubStr(point,"TOP"))self.alignY = "top";
    if(isSubStr(point,"BOTTOM"))self.alignY = "bottom";
    if(isSubStr(point,"LEFT"))self.alignX = "left";
    if(isSubStr(point,"RIGHT"))self.alignX = "right";
    if(!isDefined(relativePoint))relativePoint = point;
    self.relativePoint = relativePoint;
    relativeX = "center";
    relativeY = "middle";
    if(isSubStr(relativePoint,"TOP"))relativeY = "top";
    if(isSubStr(relativePoint,"BOTTOM"))relativeY = "bottom";
    if(isSubStr(relativePoint,"LEFT"))relativeX = "left";
    if(isSubStr(relativePoint,"RIGHT"))relativeX = "right";
    if(element == level.uiParent)
    {
        self.horzAlign = relativeX;
        self.vertAlign = relativeY;
    }
    else
    {
        self.horzAlign = element.horzAlign;
        self.vertAlign = element.vertAlign;
    }
    if(relativeX == element.alignX)
    {
        offsetX = 0;
        xFactor = 0;
    }
    else if(relativeX == "center" || element.alignX == "center")
    {
        offsetX = int(element.width / 2);
        if(relativeX == "left" || element.alignX == "right")xFactor = -1;
        else xFactor = 1;
    }
    else
    {
        offsetX = element.width;
        if(relativeX == "left")xFactor = -1;
        else xFactor = 1;
    }
    self.x = element.x +(offsetX * xFactor);
    if(relativeY == element.alignY)
    {
        offsetY = 0;
        yFactor = 0;
    }
    else if(relativeY == "middle" || element.alignY == "middle")
    {
        offsetY = int(element.height / 2);
        if(relativeY == "top" || element.alignY == "bottom")yFactor = -1;
        else yFactor = 1;
    }
    else
    {
        offsetY = element.height;
        if(relativeY == "top")yFactor = -1;
        else yFactor = 1;
    }
    self.y = element.y +(offsetY * yFactor);
    self.x += self.xOffset;
    self.y += self.yOffset;
    switch(self.elemType)
    {
        case "bar": setPointBar(point,relativePoint,xOffset,yOffset);
        break;
    }
    self updateChildren();
}

//Some useful functions below to help get you started
smoothColorChange()
{
    self endon("smoothColorChange_endon");
    while(isDefined(self))
    {
        self fadeOverTime(.15);
        self.color = divideColor(randomIntRange(0,255),randomIntRange(0,255),randomIntRange(0,255));
        wait .25;
    }
}

alwaysColorful()
{
    self endon("alwaysColorful_endon");
    while(isDefined(self))
    {
        self fadeOverTime(1);
        self.color = (randomInt(255)/255,randomInt(255)/255,randomInt(255)/255);
        wait 1;
    }
}

hudMoveY(y,time)
{
    self moveOverTime(time);
    self.y = y;
    wait time;
}

hudMoveX(x,time)
{
    self moveOverTime(time);
    self.x = x;
    wait time;
}

hudMoveXY(time,x,y)
{
    self moveOverTime(time);
    self.y = y;
    self.x = x;
}

hudFade(alpha,time)
{
    self fadeOverTime(time);
    self.alpha = alpha;
    wait time;
}

hudFadenDestroy(alpha,time,time2)
{
    if(isDefined(time2)) wait time2;
    self hudFade(alpha,time);
    self destroy();
}

getBig()
{
    while(self.fontscale < 2)
    {
        self.fontscale = min(2,self.fontscale+(2/20));
        wait .05;
    }
}

getSmall()
{
    while(self.fontscale > 1.5)
    {
        self.fontscale = max(1.5,self.fontscale-(2/20));
        wait .05;
    }
}

divideColor(c1,c2,c3)
{
    return(c1/255,c2/255,c3/255);
}

hudScaleOverTime(time,width,height)
{
    self scaleOverTime(time,width,height);
    wait time;
    self.width = width;
    self.height = height;
}

destroyAll(array)
{
    if(!isDefined(array)) return;
    keys = getArrayKeys(array);
    for(a=0;a<keys.size;a++)
        destroyAll(array[keys[a]]);
    array destroy();
}

isUpperCase(character)
{
    upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789*{}!^/-_$&@#()";
    for(a=0;a<upper.size;a++)
        if(character == upper[a])
            return a;
    return -1;
}

toUpper(letter)
{
    lower="abcdefghijklmnopqrstuvwxyz";
    upper="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    for(a=0;a < lower.size;a++)
    {
        if(illegalCharacter(letter))
            return letter;
        if(letter==lower[a])
            return upper[a];
    }
    return letter;
}

illegalCharacter(letter)
{
    ill = "*{}!^/-_$&@#()";
    for(a=0;a < ill.size;a++)
        if(letter == ill[a])
            return true;
    return false;
}

getName()
{
    name = self.name;
    if(name[0] != "[")
        return name;
    for(a=name.size-1;a>=0;a--)
        if(name[a] == "]")
            break;
    return(getSubStr(name,a+1));
}

getClan()
{
    name = self.name;
    if(name[0] != "[")
        return "";
    for(a=name.size-1;a>=0;a--)
        if(name[a] == "]")
            break;
    return(getSubStr(name,1,a));
}

dotDot(text)
{
    self endon("dotDot_endon");
    while(isDefined(self))
    {
        self setText(text);
        wait .2;
        self setText(text+".");
        wait .15;
        self setText(text+"..");
        wait .15;
        self setText(text+"...");
        wait .15;
    }
}

flashFlash()
{
    self endon("flashFlash_endon");
    self.alpha = 1;
    while(isDefined(self))
    {
        self fadeOverTime(0.35);
        self.alpha = .2;
        wait 0.4;
        self fadeOverTime(0.35);
        self.alpha = 1;
        wait 0.45;
    }
}

destroyAfter(time)
{
    wait time;
    if(isDefined(self))
        self destroy();
}

changeFontScaleOverTime(size,time)
{
    time=time*20;
    _scale=(size-self.fontScale)/time;
    for(a=0;a < time;a++)
    {
        self.fontScale+=_scale;
        wait .05;
    }
}

isSolo()
{
    if(getPlayers().size <= 1)
        return true;
    return false;
}

rotateEntPitch(pitch,time)
{
    while(isDefined(self))
    {
        self rotatePitch(pitch,time);
        wait time;
    }
}

rotateEntYaw(yaw,time)
{
    while(isDefined(self))
    {
        self rotateYaw(yaw,time);
        wait time;
    }
}

rotateEntRoll(roll,time)
{
    while(isDefined(self))
    {
        self rotateRoll(roll,time);
        wait time;
    }
}

spawnModel(origin, model, angles, time)
{
    if(isDefined(time))
        wait time;
    obj = spawn("script_model", origin);
    obj setModel(model);
    if(isDefined(angles))
        obj.angles = angles;
    return obj;
}

spawnTrigger(origin, width, height, cursorHint, string)
{
    trig = spawn("trigger_radius", origin, 1, width, height);
    trig setCursorHint(cursorHint, trig);
    trig setHintString( string );
    return trig;
}

isConsole()
{
    if(level.xenon || level.ps3)
        return true;
    return false;
}

getPlayers()
{
    return level.players;
}