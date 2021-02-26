state("YakuzaLikeADragon", "1.0")
{
    byte isLoad : 0x2816858, 0xB08, 0xCC8, 0xF90, 0xAC8, 0xF90, 0x4A4;
}

state("YakuzaLikeADragon", "windowsStore")
{
    byte isLoad : 0x21AC1D0, 0x48, 0x8, 0xC0, 0x10, 0x714;
}

state("YakuzaLikeADragon", "1.7-1.8")
{
    byte isLoad : 0x2E56950, 0x48, 0x8, 0xC0, 0x10, 0x104;
}

state("YakuzaLikeADragon", "1.9")
{
    byte isLoad : 0x2E56A10, 0x48, 0x8, 0xC0, 0x10, 0x104;
}

state("YakuzaLikeADragon", "1.9.1")
{
    byte isLoad : 0x2FD8910, 0x48, 0x8, 0xC0, 0x10, 0x104;
}

init
{
    if(modules.First().ModuleMemorySize==435302400)
    {
        version = "1.9.1";
    }
    else if(modules.First().ModuleMemorySize==412098560)
    {
        version = "1.9";
    }
    else if(modules.First().ModuleMemorySize==446337024 || modules.First().ModuleMemorySize==406532096)
    {
        version = "1.7-1.8";
    }
    else if(modules.First().ModuleMemorySize==363524096)
    {
        version = "windowsStore";
    }
    else
    {
        version = "1.0";
    }   
}

/*
update
{
    print(modules.First().ModuleMemorySize.ToString());
}
*/

//a01_0020 p00_start
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
