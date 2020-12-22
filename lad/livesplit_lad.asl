state("YakuzaLikeADragon", "1.0")
{
    byte isLoad : 0x2816858, 0xB08, 0xCC8, 0xF90, 0xAC8, 0xF90, 0x4A4;
}

state("YakuzaLikeADragon", "1.3")
{
    byte isLoad : 0x2E53C50, 0x48, 0x8, 0xC0, 0x10, 0x104;
}

state("YakuzaLikeADragon", "1.4")
{
    byte isLoad : 0x2E55950, 0x50, 0x8, 0xC0, 0x10, 0x4A4;
}

state("YakuzaLikeADragon", "1.5")
{
    byte isLoad : 0x2E53950, 0x48, 0x8, 0xC0, 0x10, 0x104;
}

state("YakuzaLikeADragon", "windowsStore")
{
    byte isLoad : 0x23CF740, 0x50, 0x8, 0xC0, 0x10, 0x104;
}

state("YakuzaLikeADragon", "1.6")
{
    byte isLoad : 0x2E54950, 0x48, 0x8, 0xC0, 0x10, 0x104;
}


init
{
    if(modules.First().ModuleMemorySize==424333312)
    {
        version = "1.6";
    }
    else if(modules.First().ModuleMemorySize==362835968)
    {
        version = "windowsStore";
    }
    else if(modules.First().ModuleMemorySize==421687296)
    {
        version = "1.5";
    }
    else if(modules.First().ModuleMemorySize==417984512)
    {
        version = "1.4";
    }
    else if(modules.First().ModuleMemorySize==451039232)
    {
        version = "1.3";
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
