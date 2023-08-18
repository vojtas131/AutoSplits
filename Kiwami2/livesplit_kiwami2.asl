state("YakuzaKiwami2", "AS")
{
    byte isLoad : 0x2F04580, 0x224;
    long fileTimer : 0x29FA6E0, 0x368;
    string50 value : 0x2A04510;
    string26 end : 0x2A04100;
}
state("YakuzaKiwami2", "EU/US")
{
    byte isLoad : 0x2F05A00, 0x224;
    long fileTimer : 0x29FB430, 0x368;
    string50 value : 0x2A054B0;
    string26 end : 0x2A050A0; 
}
state("YakuzaKiwami2", "community")
{
    byte isLoad : 0x2EFFB00, 0x224;
    long fileTimer : 0x29F6300, 0x368;
    string50 value : 0x29FF510;
    string26 end : 0x29FF100;
}
state("YakuzaKiwami2", "Game Pass")
{
    byte isLoad : 0x374C8E0, 0x224;
    long fileTimer : 0x3249C30, 0x368;
    string50 value : 0x324EDE0;
    string26 end : 0x324E9D0;
}
state("YakuzaKiwami2", "GOG")
{
    byte isLoad : 0x2E1D760, 0x224;
    long fileTimer : 0x2918EF0, 0x368;
    string50 value : 0x29E10A0;
    string26 end : 0x291DC90;
}

// AS: 69746688, EU/US: 69767168, community: 69738496, Game Pass: 78544896, GOG: 68591616
init
{
    int size = modules.First().ModuleMemorySize;

    if (size == 69746688)
    {
        version = "AS";
    }
    else if (size == 69767168)
    {
        version = "EU/US";
    }
    else if (size == 69738496)
    {
        version = "community";
    }
    else if (size == 78544896)
    {
        version = "Game Pass";
    }
    else if (size == 68591616)
    {
        version = "GOG";
    }

    vars.endFight = false;
}

// Works for all difficulties
start
{
    // IGT is set to 0 the moment a new game is started.
    // Prior to that, it's counting up as a timer from boot or reset.
    return current.value == "qloc_menu_scene" && current.fileTimer == 0;
}

isLoading
{
    return current.isLoad == 1;
}

split
{
    if(current.value.StartsWith("lexus2_END") && !old.value.StartsWith("lexus2_END"))
    {
        return true;
    }

    if(current.end.StartsWith("h26350_iibuchi"))
    {
       vars.endFight = true;
    }
    if(vars.endFight && current.end.StartsWith("btled_tod_s_f"))
    {
       vars.endFight = false;
       return true;
    }

    /*
    Ending that splits like 4s later than rules says needs more testing if it's 4s
    if(old.end.StartsWith("h26030_ryuji3_crosscounter") && current.end.StartsWith("btled_tod_s_f"))
    {
       return true;
    }
    */
}

onReset
{
    vars.endFight = false;
}

reset
{
    // Resets when the SEGA logo is displayed.
    // The IGT check should be completely unnecessary, but we have the pointer, so why not?
    return current.value == "lexus2_logo.lua" && current.fileTimer < 6000;
}
