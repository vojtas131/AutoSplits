state("YakuzaKiwami2")
{
    byte isLoad : 0x2F05A00, 0x224;
    byte diffStart : 0x029FB430, 0x360;
    string10 value : 0x2A054B0;
    string26 end : 0x2A050A0;
}
init
{
    vars.doSplit = true;
}
//Doesn't work for normal difficulty
start
{
    if(current.value.StartsWith("qloc_menu_") && current.diffStart!=old.diffStart)
    {
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
   if(current.value.StartsWith("lexus2_END"))
   {
       if(vars.doSplit)
       {
            vars.doSplit = false;
            return true;
       }
       
   }
   else
   {
       vars.doSplit = true;
   }
   /*
   Ending that splits like 4s late then rules says needs more testing if it's 4s
   if(old.end.StartsWith("h26030_ryuji3_crosscounter") && current.end.StartsWith("btled_tod_s_f"))
   {
       return true;
   }
   */
   return false;
}