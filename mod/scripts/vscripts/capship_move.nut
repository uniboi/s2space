global function MoveCapshipToPos
global function TimeBetweenPoints

void function MoveCapshipToPos( ShipStruct ship, vector pos, float speed = 500.0 )
{
    Signal( ship, "MovingToNewPos" )
    vector shipPos = ship.mover.GetOrigin()
    vector angles = ship.mover.GetAngles()
    vector fwd = AnglesToForward( angles )
    float time = TimeBetweenPoints( shipPos, pos, speed )
    if( !time ) return
    float half = time / 2
    float third = time / 3
    float sixth = third / 2

    ship.mover.NonPhysicsMoveTo( pos, time, half, half )
    ship.mover.NonPhysicsRotateTo( angles + < 0, 0, ( IsLeft( shipPos, shipPos + fwd, pos ) ? -10 : 10 ) >, third, sixth, sixth )
    wait time - third
    ship.mover.NonPhysicsRotateTo( angles, third, sixth, sixth )
}

float function TimeBetweenPoints( vector a, vector b, float speed )
{
    return Length( a - b ) / speed
}

bool function IsLeft( vector a, vector b, vector c )
{
    return ((b.x - a.x)*(c.y - a.y) - (b.y - a.y)*(c.x - a.x)) > 0;
}