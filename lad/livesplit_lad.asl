state("YakuzaLikeADragon", "1.0")
{
    byte isLoad : 0x2816858, 0xB08, 0xCC8, 0xF90, 0xAC8, 0xF90, 0x4A4;
}

state("YakuzaLikeADragon", "1.3")
{
    byte isLoad : 0x2E53C50, 0x48, 0x8, 0xC0, 0x10, 0x104;
}

init
{
    if(modules.First().ModuleMemorySize==451039232)
    {
        version = "1.3";
    }
    else
    {
        version = "1.0";
    }   
}

start
{

}
isLoading
{
    return current.isLoad == 1;
}
split
{
   
}