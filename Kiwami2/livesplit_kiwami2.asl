state("YakuzaKiwami2")
{
    byte isLoad : 0x2F05A00, 0x224;
    string10 value : 0x2A054B0;
    string26 end : 0x2A050A0;
}
init
{
    vars.doSplit = true;
}
//Start starts like a 1s late
start
{
    if(current.value.StartsWith("lexus2_tit"))
    {
        return true;
    }
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