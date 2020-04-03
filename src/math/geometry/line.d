module math.geometry.line;

import math.linear.vector;
import math.linear.point;
import vec_ = math.linear.vector;
import point_ = math.linear.point;

alias PointLine = PointPointLine;
alias PPLine = PointPointLine;
struct PointPointLine(T) {
	PVec2!T pointA; alias a=pointA;
	PVec2!T pointB; alias b=pointB;

	PointVecLine!T opCast(_:PointVecLine!T)() {
		return VecLine!T(pointA,pointB-pointA);
	}
}
alias VecLine = PointVecLine;
alias PVLine = PointVecLine;
struct PointVecLine(T) {
	PVec2!T pos; alias point=pos; alias p=pos;
	Vec2!T vector; alias vec=vector; alias v=vector; alias offset=vector;
	
	PointPointLine!T opCast(_:PointPointLine!T)() {
		return PointLine!T(pos,pos+vec);
	}
}


T distance(T)(Point!(Vec!(T,2)) p, VecLine!T l) {
	import std.algorithm.comparison;
	import std.math;
	auto ms = l.vec.magnitudeSquared;
	if (ms == 0)
		return (cast(T) sqrt(cast(real) ms)).abs;
	auto t = max(0, min(1, dot(p - l.pos, l.vec) / ms));
	auto projection = l.pos + t*l.vec;
	return vec_.distance(p.v, projection.v);
}
T distance(T)(VecLine!T l, Point!(Vec!(T,2)) p) {
	return distance(p,l);
}
T distance(T)(Point!(Vec!(T,2)) p, PointLine!T l) {
	return distance!T(p, cast(VecLine!T) l);
}
T distance(T)(PointLine!T l, Point!(Vec!(T,2)) p) {
	return distance(p, cast(VecLine!T) l);
}

/// This does not work when two lines cross.
/// TODO: Make this work for when two lines cross.
/// TODO: This needs optimized.
T distance(T)(VecLine!T l, VecLine!T m) {
	import std.algorithm.comparison;
	return min(
		distance(l.pos	,m),
		distance(l.pos+l.vec	,m),
		distance(m.pos	,l),
		distance(m.pos+m.vec	,l),
	);
}
/// Ditto
T distance(T)(PointLine!T l, PointLine!T m) {
	import std.algorithm.comparison;
	return min(
		distance(l.a	,m),
		distance(l.b	,m),
		distance(m.a	,l),
		distance(m.b	,l),
	);
}


@("Point Line Distance")
unittest {
	assert(distance(pvec(1f,0f), PPLine!float(pvec(0f,1f),pvec(0f,-1f)))==1f);
	assert(distance(pvec(-1f,0f), PPLine!float(pvec(0f,1f),pvec(0f,-1f)))==1f);
	assert(distance(pvec(1f,0f), PPLine!float(pvec(0f,-1f),pvec(0f,1f)))==1f);
	assert(distance(pvec(1f,2f), PPLine!float(pvec(0f,1f),pvec(0f,-1f)))==vec_.distance(vec(1f,2f), vec(0f,1f)));
}
@("Line Line Distance")
unittest {
	assert(distance(PPLine!float(pvec(1f,0f), pvec(2f,0f)), PPLine!float(pvec(0f,1f),pvec(0f,-1f)))==1f);
}
 
