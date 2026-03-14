function move(dir)
{
    if (moving) return;

    var tx = x;
    var ty = y;

    switch (dir)
    {
        case "up":
            tx += 8;
            ty -= 5;
            break;
        
        case "down":
            tx -= 8;
            ty += 5;
            break;
        
        case "left":
            tx -= 8;
            ty -= 5;
            break;
        
        case "right":
            tx += 8;
            ty += 5;
            break;
    }

    // collision check
    if (!place_meeting(tx, ty, obj_wall))
    {
        target_x = tx;
        target_y = ty;
        moving = true;
    }
}
