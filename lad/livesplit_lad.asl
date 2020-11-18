state("YakuzaLikeADragon")
{
    byte isLoad : 0x2816858, 0xB08, 0xCC8, 0xF90, 0xAC8, 0xF90, 0x4A4;
}

init
{
    
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