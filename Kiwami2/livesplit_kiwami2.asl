state("YakuzaKiwami2", "Steam")
{
    long FileTimer:   0x29FB430, 0x368;
    byte EnemyCount1: 0x29FBC78, 0x22;
    byte EnemyCount2: 0x29FBC78, 0xCC;
    byte Load:        0x2F05A00, 0x224;
    byte Pause:       0x2F05A00, 0x244;
    string26 Magic:   0x2A050A0; 
    string50 Lua:     0x2A054B0;
}
state("YakuzaKiwami2", "communitytestbranch")
{
    long FileTimer:   0x29F6300, 0x368;
    byte EnemyCount1: 0x29F6BA8, 0x22;
    byte EnemyCount2: 0x29F6BA8, 0xCC;
    byte Load:        0x2EFFB00, 0x224;
    byte Pause:       0x2EFFB00, 0x244;
    string26 Magic:   0x29FF100;
    string50 Lua:     0x29FF510;
}
state("YakuzaKiwami2", "M Store")
{
    long FileTimer:   0x3249C30, 0x368;
    byte EnemyCount1: 0x324A078, 0x22;
    byte EnemyCount2: 0x324A078, 0xCC;
    byte Load:        0x374C8E0, 0x224;
    byte Pause:       0x374C8E0, 0x244;
    string26 Magic:   0x324E9D0;
    string50 Lua:     0x324EDE0;
}
state("YakuzaKiwami2", "GOG")
{
    long FileTimer:   0x2918EF0, 0x368;
    byte EnemyCount1: 0x2919338, 0x22;
    byte EnemyCount2: 0x2919338, 0xCC;
    byte Load:        0x2E1D760, 0x224;
    byte Pause:       0x2E1D760, 0x244;
    string50 Magic:   0x291DC90;
    string50 Lua:     0x291E0A0;
}
state("YakuzaKiwami2", "AS")
{
    long FileTimer:   0x29FA6E0, 0x368;
    byte EnemyCount1: 0x0, 0x22;
    byte EnemyCount2: 0x0, 0xCC;
    byte Load:        0x2F04580, 0x224;
    byte Pause:       0x2F04580, 0x244;
    string26 Magic:   0x2A04100;
    string50 Lua:     0x2A04510;
}

startup
{
    // Final QTE offsets (to be set in init)
    vars.Cucco = 0;
    vars.HActAdj = 0;

    // Only used for autostart currently
    vars.LoadCount = 0;

    vars.Start = false;
    vars.Splits = new HashSet<string>();
    vars.OngoingFight = "";
    vars.QTESuccess = null;

    refreshRate = 60; // Needs to be explicitly set to 60 for things to work properly.

    settings.Add("CHAPTERS", false, "Chapter End Splits");
        settings.Add("lexus2_END01.lua", true, "Chapter 1: Letter of Blood", "CHAPTERS");
        settings.Add("lexus2_END02.lua", true, "Chapter 2: The Dragon of Kansai", "CHAPTERS");
        settings.Add("lexus2_END03.lua", true, "Chapter 3: The Yakuza Huntress", "CHAPTERS");
        settings.Add("lexus2_END04.lua", true, "Chapter 4: The Four Kings of Omi", "CHAPTERS");
        settings.Add("lexus2_END05.lua", true, "Chapter 5: Hidden Past", "CHAPTERS");
        settings.Add("lexus2_END06.lua", true, "Chapter 6: Schemes", "CHAPTERS");
        settings.Add("lexus2_END07.lua", true, "Chapter 7: The Foreign Threat", "CHAPTERS");
        settings.Add("lexus2_END08.lua", true, "Chapter 8: Suspect", "CHAPTERS");
        settings.Add("lexus2_END09.lua", true, "Chapter 9: The Omi Invasion", "CHAPTERS");
        settings.Add("lexus2_END10.lua", true, "Chapter 10: Survivors", "CHAPTERS");
        settings.Add("lexus2_END11.lua", true, "Chapter 11: The Iron Creed", "CHAPTERS");
        settings.Add("lexus2_END12.lua", true, "Chapter 12: Osaka Castle", "CHAPTERS");
        settings.Add("lexus2_END13.lua", true, "Chapter 13: Settling Accounts", "CHAPTERS");
        settings.Add("lexus2_END14.lua", true, "Chapter 14: The Go-Ryu March", "CHAPTERS");
        settings.Add("lexus2_END15.lua", true, "Chapter 15: Blood and Bonds", "CHAPTERS");
        settings.Add("lexus2_END91.lua", true, "[Majima Saga] Chapter 1: Tojo Clan Reform", "CHAPTERS");
        settings.Add("lexus2_END92.lua", true, "[Majima Saga] Chapter 2: Prodigal Son", "CHAPTERS");

    settings.Add("FIGHTS", false, "Fight Splits");
        settings.Add("BTL01_0010_tutorial", true, "Ch.1: Fellow Mourners", "FIGHTS");
        settings.Add("BTL01_0020_tutorial", true, "Ch.1: The Knife Fight", "FIGHTS");
        settings.Add("adv01_0060", true, "Ch.1: Theater Squares", "FIGHTS");
        settings.Add("btl01_0040", true, "Ch.1: Daigo Power Rangers", "FIGHTS");
        settings.Add("h26330_daigo_btlst", true, "Ch.1: Daigo Dojima", "FIGHTS");
        settings.Add("btl02_0020", true, "Ch.2: Ryuji's Retinue", "FIGHTS");
        settings.Add("h26000_ryuji_3combo", true, "Ch.3: Ryuji Goda", "FIGHTS");
        settings.Add("btl04_0020", true, "Ch.4: Esaki", "FIGHTS");
        // settings.Add("", true, "Ch.5: Mysterious Assassin", "FIGHTS");
        settings.Add("h26140_majima_combo", true, "Ch.5: Majima", "FIGHTS");
        settings.Add("h26300_kuro_revive", true, "Ch.6: Man in Black", "FIGHTS");
        settings.Add("btl07_0010", true, "Ch.7: Kimchoi", "FIGHTS");
        settings.Add("btl07_0020", true, "Ch.7: Bantam Brouhaha", "FIGHTS");
        settings.Add("btl08_0010", true, "Ch.8: Generator Gents", "FIGHTS");
        settings.Add("h26070_hayashi_tatakituke", true, "Ch.8: Hiroshi Hayashi", "FIGHTS");
        settings.Add("btl08_0040", true, "Ch.8: Shangri-Lads", "FIGHTS");
        settings.Add("h26130_shindo_fuiuchi", true, "Ch.9: Second Shindo", "FIGHTS");
        settings.Add("btl10_0010", true, "Ch.10: Riverside Rumble", "FIGHTS");
        settings.Add("btl11_0030", true, "Ch.11: Shogi Surprise", "FIGHTS");
        settings.Add("h25440_tiger_counter", true, "Ch.12: Fierce Tigers", "FIGHTS");
        settings.Add("h26219_explosion_trailer", true, "Ch.13: Man in Black", "FIGHTS");
        settings.Add("btl13_0030", true, "Ch.13: Kurahashi", "FIGHTS");
        settings.Add("btl14_0030", true, "Ch.14: Stardust Scuffle", "FIGHTS");
        settings.Add("btl16_0020_010", true, "Ch.16: Man in Black", "FIGHTS");
        settings.Add("h26010_ryuji2_katana_iai", true, "Ch.16: Ryuji Goda", "FIGHTS");
        settings.Add("h26090_terada_counter", true, "Ch.16: Daejin Kim", "FIGHTS");
        settings.Add("h26030_ryuji3_crosscounter", true, "Ch.16: Runback Ryuji", "FIGHTS");
        settings.Add("c91_0040", true, "[Majima Saga] Ch.1: Mysterious Assassins", "FIGHTS");
        settings.Add("btlst_bc_sb_m_uematsu", true, "[Majima Saga] Ch.2: Uematsu Family", "FIGHTS");
        settings.Add("adv92_0035", true, "[Majima Saga] Ch.2: Mysterious Assassins (outside Grand)", "FIGHTS");
        settings.Add("adv92_0060_01", true, "[Majima Saga] Ch.2: Mysterious Assassins (SE Shofukucho)", "FIGHTS");
        settings.Add("btlst_bc_sb_l_kawamura", true, "[Majima Saga] Ch.3: Kawamura", "FIGHTS");
        settings.Add("h26350_iibuchi", true, "[Majima Saga] Ch.3: Kei Ibuchi", "FIGHTS");

    settings.Add("MISC", false, "Misc. Splits");
        settings.Add("a61430_clan_btl_win", true, "Ch.5: After Clan Creator", "MISC");
        // settings.Add("cln_02_010", true, "Ch.5: After Clan Creator", "MISC"); // Different split timing

    // settings.Add("MAJI", false, "Majima Saga - Street Bosses");
    //     settings.Add("ms_encboss08_ed", true, "Tsujimoto the Bloodletter", "MAJI");
    // This is the format, I just can't be bothered to go fight all 18 street bosses right now.
}

// AS: 69746688, Steam: 69767168, community: 69738496, M Store: 78544896, GOG: 68591616
init
{
    int size = modules.First().ModuleMemorySize;

    if (size == 69767168)
    {
        version = "Steam";
        vars.Cucco   = 0x2EFB540;
        vars.HActAdj = 0x3EFEA80;
    }
    else if (size == 69738496)
    {
        version = "communitytestbranch";
        vars.Cucco   = 0x2EF5640;
        vars.HActAdj = 0x3EF8A80;
    }
    else if (size == 78544896)
    {
        version = "M Store";
        vars.Cucco   = 0x3742440;
        vars.HActAdj = 0x4745C80;
    }
    else if (size == 68591616)
    {
        version = "GOG";
        vars.Cucco   = 0x2E132C0;
        vars.HActAdj = 0x3E16B40;
    }
    else if (size == 69746688)
    {
        version = "AS";
        vars.Cucco   = 0x0; // No idea
        vars.HActAdj = 0x0;
    }
    else
    {
        print(String.Format("<<<  Unrecognized: Size is {0}  >>>", size));
    }
}

update
{
    // Check if the game is loading. (Currently only used to supplement autostart.)
    if (current.Load == 1 || current.FileTimer == old.FileTimer && current.Pause == 0) // TO-DO: Account for Continue screen.
    {
        vars.LoadCount++;
    }

    else if (vars.LoadCount > 0)
    {
        vars.LoadCount = 0;
    }
}

start
{
    vars.Start |= Math.Abs(current.FileTimer - old.FileTimer) > 15000; // Turn autostart on if we've had an IGT change.
    vars.Start &= current.Lua == "qloc_menu_scene"; // Turn autostart off if we're not in the main menu on a given frame.

    // For NG, IGT is set to 0.
    // For NG+, IGT is set to the IGT of the save file we're starting from, but we can't catch it until one frame later.
    return vars.Start && (current.FileTimer < 100 && vars.LoadCount == 0 || current.FileTimer == old.FileTimer && old.FileTimer > 15000);
}

onStart
{
    vars.Start = false;
    vars.Splits.Clear();
}

isLoading
{
    return current.Load == 1;
}

split
{
    // If we're not tracking a fight, and if the Magic string has changed:
    if (vars.OngoingFight == "" && current.Magic != old.Magic)
    {
        // Is the current Magic string a checked setting?
        if (current.Magic != null && settings.ContainsKey(current.Magic) && settings[current.Magic] && !vars.Splits.Contains(current.Magic))
        {
            // Is it a chapter title card? Or Clan Creator?
            if (settings["CHAPTERS"] && current.Magic.StartsWith("lexus2_END") || settings["MISC"] && current.Magic == "a61430_clan_btl_win")
            {
                vars.Splits.Add(current.Magic);
                return true;
            }

            // If not, then we should start tracking a fight.
            //  (We don't need a list of fight splits, but only because we're checking this category last.)
            else if (settings["FIGHTS"])
            {
                vars.OngoingFight = current.Magic;
            }
        }
    }

    // If we're now tracking a fight:
    if (vars.OngoingFight != "")
    {
        // Check if the fight has been lost. (You can't load a save in any fight, as best I can tell.)
        // Quitting to main menu during a fight probably splits. That being said, it will also auto-reset.
        if (current.Magic == "btllose_00")
        {
            vars.OngoingFight = "";
            vars.QTESuccess = null;
        }

        // If it's the last boss of the main game, handle it differently.
        else if (vars.OngoingFight == "h26030_ryuji3_crosscounter")
        {
            if (vars.QTESuccess == null)
            {
                // This pointer could be in the state, but we only need it right here at the end.
                int rax = new DeepPointer(vars.HActAdj, 0x0, 0xA0, 0x130, 0x8, 0x27C).Deref<int>(game);
                rax &= 0xFFFFF;
                rax <<= 5;
                if (rax == 0) return false;

                // 0x58 for success, 0x5C for failure.
                vars.QTESuccess = new DeepPointer(vars.Cucco + rax, 0x58);
            }

            // Check the QTE pointer for success.
            //  (We don't need to check for failure, btllose will do that for us AND reset the QTE pointer on failure.)
            if (vars.QTESuccess.Deref<byte>(game) == 1)
            {
                vars.Splits.Add(vars.OngoingFight);
                vars.OngoingFight = "";
                return true;
            }
        }

        // Otherwise, if there were enemies and there are now no more enemies, we're done.
        //  (We could check if the Magic starts with "btled", but some fights (e.g. Ch.13 MiB) don't end with that event.)
        else if (current.EnemyCount1 == 0 && current.EnemyCount2 == 0 && (old.EnemyCount1 > 0 || old.EnemyCount2 > 0))
        {
            vars.Splits.Add(vars.OngoingFight);
            vars.OngoingFight = "";
            return true;
        }
    }
}

onReset
{
    vars.Splits.Clear();
    vars.OngoingFight = "";
    vars.Start = false;
    vars.QTESuccess = null;
}
