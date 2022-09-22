//Metal: Hellsinger autospliter made by vojtas131 and Dev1ne
//version: 1.0 = 675840

state("Metal", "1.0")
{
    
    int stage: "UnityPlayer.dll", 0x01A00940, 0xE0;
    byte isLoad: "UnityPlayer.dll", 0x01A940F0, 0x128, 0x80, 0xB0;
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

    settings.Add("ils", true, "Levels");
    settings.Add("tutorial", false, "Tutorial (Experimental)", "ils");
    settings.Add("voke", true, "Voke", "ils");
    settings.Add("stygia", true, "Stygia", "ils");
    settings.Add("yhelm", true, "Yhelm", "ils");
    settings.Add("incaustis", true, "Incaustis", "ils");
    settings.Add("gehenna", true, "Gehenna", "ils");
    settings.Add("nihil", true, "Nihil", "ils");
    settings.Add("acheron", true, "Acheron", "ils");
    settings.Add("sheol", true, "Sheol", "ils");

    settings.Add("torment", false, "Torments");

    settings.Add("reset", false, "Reset for ILs only");
}

init
{
    if(modules.First().ModuleMemorySize == 675840)  version = "1.0";
    vars.doReset = true;
}

update
{
    //print(""+ vars.doReset);
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
    if(settings["voke"] && current.stage == 15) return current.isLoad == 0 && old.isLoad == 1;
    if(settings["stygia"] && current.stage == 17)   return current.isLoad == 0 && old.isLoad == 1;
    if(settings["yhelm"] && current.stage == 21)    return current.isLoad == 0 && old.isLoad == 1;
    if(settings["incaustis"] && current.stage == 24)    return current.isLoad == 0 && old.isLoad == 1;
    if(settings["gehenna"] && current.stage == 29)  return current.isLoad == 0 && old.isLoad == 1;
    if(settings["nihil"] && current.stage == 33)   return current.isLoad == 0 && old.isLoad == 1;
    if(settings["acheron"] && current.stage == 35)   return current.isLoad == 0 && old.isLoad == 1;
    if(settings["sheol"] && current.stage == 35)   return current.isLoad == 0 && old.isLoad == 1;
    if(settings["torment"] && current.stage == 131) return current.isLoad == 0 && old.isLoad == 1;
}

split
{
    if(current.isLoad == 1) return false;
    if(settings["tutorial"] && old.stage == 1)    return current.stage != 1;
    if(settings["voke"] && old.stage == 15)    return current.stage != 15;
    if(settings["stygia"] && old.stage == 17)  return current.stage != 17;
    if(settings["yhelm"] && old.stage == 21)   return current.stage != 21;
    if(settings["incaustis"] && old.stage == 24)   return current.stage != 24;
    if(settings["gehenna"] && old.stage == 29)  return current.stage != 29;
    if(settings["nihil"] && old.stage == 33)    return current.stage != 33;
    if(settings["acheron"] && old.stage == 35)    return current.stage != 35;
    if(settings["sheol"] && old.stage == 36)   return current.stage != 36;
    if(settings["torment"] && old.stage == 131)   return current.stage != 131;
}

reset
{
    if(vars.doReset && settings["reset"])   return current.stage == 0 && current.isLoad == 1;
}
