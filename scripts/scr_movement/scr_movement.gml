function move(dir)
{
    if (moving) return; // don't start another move while sliding

    switch (dir)
    {
        case "up":
            target_x = x + 8;
            target_y = y - 8;
            break;
        
        case "down":
            target_x = x - 8;
            target_y = y + 8;
            break;
        
        case "left":
            target_x = x - 8;
            target_y = y - 8;
            break;
        
        case "right":
            target_x = x + 8;
            target_y = y + 8;
            break;
    }

    moving = true;
}