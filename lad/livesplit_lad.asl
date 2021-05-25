state("YakuzaLikeADragon", "1.0")
{
    byte isLoad : 0x2816858, 0xB08, 0xCC8, 0xF90, 0xAC8, 0xF90, 0x4A4;
}

state("YakuzaLikeADragon", "windowsStore")
{
    byte isLoad : 0x21AC1D0, 0x48, 0x8, 0xC0, 0x10, 0x714;
}

state("YakuzaLikeADragon", "1.9")
{
    byte isLoad : 0x2E56A10, 0x48, 0x8, 0xC0, 0x10, 0x104;
}

state("YakuzaLikeADragon", "1.9.1")
{
    byte isLoad : 0x2FD8910, 0x48, 0x8, 0xC0, 0x10, 0x104;
}

state("YakuzaLikeADragon", "1.9.2")
{
    byte isLoad : 0x2FD8950, 0x48, 0x8, 0xC0, 0x20, 0x104;
}

init
{
    switch (modules.First().ModuleMemorySize)
    {
        case 414711808:
        case 434040832:
        case 436711424:
            version = "1.9.2";
            break;
        case 435302400:
            version = "1.9.1";
            break;
        case 412098560:
            version = "1.9";
            break;
        case 363524096:
            version = "windowsStore";
            break;
        default:
            version = "1.0";
            break;
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
