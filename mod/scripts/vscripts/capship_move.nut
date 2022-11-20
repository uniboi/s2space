global function MoveCapshipToPos
global function IdleCapshipMovement

const float CAPSHIP_MOVEMENT_SPEED = 500.0
const float CAPSHIP_IDLE_SPEED = 50.0

void function MoveCapshipToPos( ShipStruct ship, vector pos, float speed = CAPSHIP_MOVEMENT_SPEED )
{
    Signal( ship, "MovingToNewPos" )
    waitthread MoveCapshipToPosInternal( ship, pos, speed)
    thread IdleCapshipMovement( ship )
}

void function MoveCapshipToPosInternal( ShipStruct ship, vector pos, float speed )
{
    vector shipPos = ship.mover.GetOrigin()
    vector angles = ship.mover.GetAngles()
    vector fwd = AnglesToForward( angles )
    float time = TimeBetweenPoints( shipPos, pos, speed )
    if( !time ) return
    float half = time / 2
    float third = time / 3
    float sixth = third / 2

    ship.mover.NonPhysicsMoveTo( pos, time, half, half )
    ship.mover.NonPhysicsRotateTo( angles + < 0, 0, ( IsLeftofLine( shipPos, shipPos + fwd, pos ) ? -5 : 5 ) >, third, sixth, sixth )
    wait time - third * 1.25
    ship.mover.NonPhysicsRotateTo( angles, third, sixth, sixth )
    wait third
}

float function TimeBetweenPoints( vector a, vector b, float speed )
{
    return Length( a - b ) / speed
}

bool function IsLeftofLine( vector a, vector b, vector c )
{
    return ( ( b.x - a.x ) * ( c.y - a.y ) - ( b.y - a.y ) * ( c.x - a.x ) ) > 0;
}

float function CalcTime( vector a, vector b, float speed )
{
        return Length( b - a ) / speed
}

void function IdleCapshipMovement( ShipStruct ship )
{
    EndSignal( ship, "MovingToNewPos" )
    vector patrol = ship.mover.GetOrigin()
    vector angles = ship.mover.GetAngles()

    OnThreadEnd( function() : ()
    {
        print( "onend" )
    } )

    while( 1 )
    {
        vector pos = ship.mover.GetOrigin()
        vector toPatrol = Normalize( patrol - pos )
        vector fwd = AnglesToForward( angles )
        vector up = AnglesToUp( angles )
        vector newPos
        if( toPatrol == <0, 0, 0>)
        {
            newPos = pos + AnglesToRight( ship.mover.GetAngles() ) * 250 + fwd * 250 + up * 250
        } else {
            newPos = pos + toPatrol * RandomFloatRange( 400, 1000 ) + fwd * RandomFloatRange( 150, 500 )
        }
        float time = CalcTime( pos, newPos, CAPSHIP_IDLE_SPEED )
        Assert( time )
        float half = time / 2
        float quarter = half / 2
        ship.mover.NonPhysicsMoveTo( newPos, time, 0,0 )

        bool isLeft = IsLeftofLine( pos, pos + fwd, newPos )
        ship.mover.NonPhysicsRotateTo( angles + < 0, 0, ( isLeft ? -3 : 3 )>, half, quarter, quarter )
        wait half
        wait 0.2
        ship.mover.NonPhysicsRotateTo( angles + < 0, 0, ( !isLeft ? -3 : 3 )>, half, quarter, quarter )
        wait half
    }
}