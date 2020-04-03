module math.geometry.circle;

import vec_ = math.linear.vector;
import point_ = math.linear.point;

alias PRCircle = PointRadiusCircle;
alias PointRCircle = PointRadiusCircle;
alias RCircle = PointRadiusCircle;
alias Circle = PointRadiusCircle;
struct PointRadiusCircle(T) {
	PVec2!T pos; alias point=pos; alias p=pos;
	T radius; alias r=radius;
}


T distance(T)(Circle!T a, Circle!T b) {
	return vec_.distance(a.pos,b.pos) - a.r - b.r;
}
 
