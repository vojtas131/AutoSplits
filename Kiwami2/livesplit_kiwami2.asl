state("YakuzaKiwami2", "AS")
{
    byte isLoad : 0x2F04580, 0x224;
    byte diffStart : 0x029FA6E0, 0x360;
    string10 value : 0x2A04510;
    string26 end : 0x2A04100;
}
state("YakuzaKiwami2", "EU/US")
{
    byte isLoad : 0x2F05A00, 0x224;
    byte diffStart : 0x029FB430, 0x360;
    string10 value : 0x2A054B0;
    string26 end : 0x2A050A0; 
}
//EU: 69767168 AS: 69746688
init
{
    if(modules.First().ModuleMemorySize==69746688)
    {
        version = "AS";
    }
    if(modules.First().ModuleMemorySize==69767168)
    {
        version = "EU/US";
    }
    //vars.doSplit = true;
    vars.endFight = false;
}
//Doesn't work for normal difficulty
start
{
    if(current.value.StartsWith("qloc_menu_") && current.diffStart!=old.diffStart)
    {
        vars.endFight = false;
        return true;
    }
    /*
    Start starts like a 1s late with this one
    
    if(current.value.StartsWith("lexus2_tit"))
    {
        return true;
    }
    */
}
isLoading
{
    return current.isLoad == 1;

}
split
{
   if(current.value.StartsWith("lexus2_END") && !old.value.StartsWith("lexus2_END"))
   {
        //vars.doSplit = false;
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

   return false;
}