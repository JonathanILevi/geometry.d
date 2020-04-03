module math.geometry.rectangle;

import math.linear.vector;
import math.linear.point;

alias VecRect = PointVecRect;
alias VRect = PointVecRect;
alias Rect = PointVecRect;
alias PVRect = PointVecRect;
struct PointVecRect(T) {
	PVec2!T pos; alias point=pos; alias p=pos;
	Vec2!T offset; alias vector=offset; alias vec=offset; alias v=offset;
}
alias SizeRect = PointSizeRect;
alias SRect = PointSizeRect;
struct PointSizeRect(T) {
	PVec2!T pos; alias point=pos; alias p=pos;
	Vec2!T size; alias vector=size; alias vec=size; alias v=size;
	
	PointVecRect pointVecRect() {
		return cast(PointVecRect) this;
	}
	alias pointVecRect this;
}
alias PointRect = PointPointRect;
alias PPRect = PointPointRect;
struct PointPointRect(T) {
	PVec2!T pointA; alias a=pointA;
	PVec2!T pointB; alias b=pointB;
}
alias OrdPointPointRect = MinPointMaxPointRect;
alias OrdPointRect = MinPointMaxPointRect;
alias OrdPPRect = MinPointMaxPointRect;
alias MinPMaxPRect = MinPointMaxPointRect;
struct MinPointMaxPointRect(T) {
	PVec2!T minPoint; alias pointA=minPoint; alias a=minPoint; alias min=minPoint;
	PVec2!T maxPoint; alias pointB=maxPoint; alias b=maxPoint; alias max=maxPoint;
	
	PointPointRect pointPointRect() {
		return cast(PointPointRect) this;
	}
	alias pointPointRect this;
}




 
