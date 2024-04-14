function SummonShape() {
	EnableLive;
	with(oShapeSummoner) {
		if (hasShape and shapeRadius > 0.8)
			instance_create_depth(x,y,depth-1,oShapeExplode);
		shapeRadius = 0;
		hasShape = true;
		pulse = 1;
	}
}