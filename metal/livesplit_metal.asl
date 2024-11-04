//Metal: Hellsinger autospliter made by vojtas131 and Dev1ne
//version: 1.0 = 675840

state("Metal", "1.0")
{
    
    int stage: "UnityPlayer.dll", 0x01A00940, 0xE0;
    byte isLoad: "UnityPlayer.dll", 0x01AA5360, 0xB8, 0x8, 0x40, 0xB0; 
    //Doesn't work on game pass version
    //byte isLoad: "GameAssembly.dll", 0x02D2E9C0, 0xB8, 0x10, 0xB0;
}

//TODO: Test if 1.8 can be used for 1.5
state("Metal", "1.5")
{
    
    int stage: "UnityPlayer.dll", 0x01A00940, 0xE0;
    byte isLoad: "UnityPlayer.dll", 0x01AA5360, 0xB8, 0x28, 0x40, 0xB8; 
}

state("Metal", "1.8")
{ 
    int stage: "UnityPlayer.dll", 0x01A00940, 0xE0;
    byte isLoad: "UnityPlayer.dll", 0x01AA5360, 0xB8, 0x28, 0x40, 0xC0; 
}


startup
{
    if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    // Asks user to change to game time if LiveSplit is currently set to Real Time.
    {        
        var timingMsg = MessageBox.Show (
            "Metal: Hellsinger uses Time without Loads (Game Time) as the main timing method.\n"+
            "LiveSplit is currently set to show Real Time (RTA).\n"+
            "Would you like to switch the timing method to Game Time?",
            "LiveSplit | Metal: Hellsinger",
            MessageBoxButtons.YesNo,MessageBoxIcon.Question
        );
        
        if (timingMsg == DialogResult.Yes)
        {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }

    settings.Add("ils", true, "Levels start");
    settings.Add("tutorial", false, "Tutorial (Experimental)", "ils");
    settings.Add("voke", true, "Voke", "ils");
    settings.Add("stygia", false, "Stygia", "ils");
    settings.Add("yhelm", false, "Yhelm", "ils");
    settings.Add("incaustis", false, "Incaustis", "ils");
    settings.Add("gehenna", false, "Gehenna", "ils");
    settings.Add("nihil", false, "Nihil", "ils");
    settings.Add("acheron", false, "Acheron", "ils");
    settings.Add("sheol", false, "Sheol", "ils");

    settings.Add("torment", false, "Torments");

    settings.Add("reset", false, "Reset for ILs only");

    settings.Add("versions", true, "Game version (pick only one!)");
    settings.Add("v1.0", false, "1.0", "versions");
    settings.Add("v1.5", false, "1.5", "versions");
    settings.Add("v1.8", true, "1.8", "versions");
}


//All versions have 675840 module memory size
init
{
    if(settings["v1.0"])  {
        version = "1.0";
        vars.voke = 15;
        vars.stygia = 17;
        vars.yhelm = 21;
        vars.incaustis = 24;
        vars.gehenna = 29;
    }
    if(settings["v1.5"]) {
        version = "1.5";
        vars.voke = 24;
        vars.stygia = 27;
        vars.yhelm = 37;
        vars.incaustis = 27;
        vars.gehenna = 32;
    }
    if(settings["v1.8"]) {
        version = "1.8";
        vars.voke = 24;
        vars.stygia = 27;
        vars.yhelm = 37;
        vars.incaustis = 27;
        vars.gehenna = 32;
    }
    vars.doReset = true;
}

update
{
    //print("" + modules.First().ModuleMemorySize);
    if(!settings["reset"])  return;
    if(current.stage == 36) vars.doReset = false;
    if(!vars.doReset && current.isLoad == 1)    vars.doReset = true;
}


isLoading
{
    return current.isLoad == 1; 
}

start
{
    if(settings["tutorial"] && current.stage == 1)  return current.isLoad == 0 && old.isLoad == 1;
    if(settings["voke"] && current.stage == vars.voke) return current.isLoad == 0 && old.isLoad == 1;
    if(settings["stygia"] && current.stage == vars.stygia)   return current.isLoad == 0 && old.isLoad == 1;
    if(settings["yhelm"] && current.stage == vars.yhelm)    return current.isLoad == 0 && old.isLoad == 1;
    if(settings["incaustis"] && current.stage == vars.incaustis)    return current.isLoad == 0 && old.isLoad == 1;
    if(settings["gehenna"] && current.stage == vars.gehenna)  return current.isLoad == 0 && old.isLoad == 1;
    if(settings["nihil"] && current.stage == 33)   return current.isLoad == 0 && old.isLoad == 1;
    if(settings["acheron"] && current.stage == 35)   return current.isLoad == 0 && old.isLoad == 1;
    if(settings["sheol"] && current.stage == 35)   return current.isLoad == 0 && old.isLoad == 1;
    if(settings["torment"] && current.stage == 131) return current.isLoad == 0 && old.isLoad == 1;
}

split
{
    if(current.isLoad == 1) return false;
    /*
    if(settings["tutorial"] && old.stage == 1)    return current.stage == 0;
    if(settings["voke"] && old.stage == 15)    return current.stage == 1;
    if(settings["stygia"] && old.stage == 17)  return current.stage == 1;
    if(settings["yhelm"] && old.stage == 21)   return current.stage == 1;
    if(settings["incaustis"] && old.stage == 24)   return current.stage == 1;
    if(settings["gehenna"] && old.stage == 29)  return current.stage == 4;
    if(settings["nihil"] && old.stage == 33)    return current.stage == 1;
    if(settings["acheron"] && old.stage == 35)    return current.stage == 1;
    if(settings["torment"] && old.stage == 131)   return current.stage == 0;
    */
    //final split
    if(old.stage == 36)   return current.stage == 5;
    if((settings["v1.5"] || settings["v1.8"]) && old.stage == vars.voke) return current.stage == 4;
    
    
    return old.stage == 1 && current.stage == 0;
}

reset
{
    if(vars.doReset && settings["reset"])   return current.stage == 0 && current.isLoad == 1;
}
