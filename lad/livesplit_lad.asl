state("YakuzaLikeADragon", "1.0")
{
    byte isLoad : 0x2816858, 0xB08, 0xCC8, 0xF90, 0xAC8, 0xF90, 0x4A4;
}

// 363524096
state("YakuzaLikeADragon", "windowsStore")
{
    byte isLoad : 0x21AC1D0, 0x48, 0x8, 0xC0, 0x10, 0x714;
}

// 412098560
state("YakuzaLikeADragon", "1.9")
{
    byte isLoad : 0x2E56A10, 0x48, 0x8, 0xC0, 0x10, 0x104;
}

// 435302400
state("YakuzaLikeADragon", "1.9.1")
{
    byte isLoad : 0x2FD8910, 0x48, 0x8, 0xC0, 0x10, 0x104;
}

// multiple patches
// 436711424
// 434040832
// 414711808
// 447401984
state("YakuzaLikeADragon", "1.9.2")
{
    byte isLoad : 0x2FD8950, 0x48, 0x8, 0xC0, 0x20, 0x104;
}

// 415830016
state("YakuzaLikeADragon", "latest")
{
    byte isLoad : 0x2FD4910, 0x48, 0x8, 0xC0, 0x10, 0x104;
}

init
{
    switch (modules.First().ModuleMemorySize)
    {
        case 435302400:
            version = "1.9.1";
            break;
        case 412098560:
            version = "1.9";
            break;
        case 363524096:
            version = "windowsStore";
            break;
        // last few patches have worked with this so just assume it'll keep working 
        // update: until the latest one so just gonna assume this was the last version
        case 447401984:
            version = "1.9.2";
            break;
        //new one until it breaks
        default:
            version = "latest";
            break;
        // unknown memory size, will need to be found if someone wants to run on it
        // default:
        //     version = "1.0";
        //     break;
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
