function WaveSetup(_xMin, _xMax, _yMargin, _xTarget) {
	var _circleMaxRadius = 500;

	var _percentX = (ValuePercent(x,_xMin,_xMax)-0.5) * 2;

	xTarget = _xTarget;
	yOffset = _yMargin * _percentX
	maxDistY = oShapeSummoner.y - yOffset;
	circleRadius = _circleMaxRadius * ValuePercent(x,_xMin,_xMax)
	yStartCircle = maxDistY+circleRadius;
	xEndCircle = x-circleRadius;

	distToStartCircle = y - yStartCircle;
	distToEndAfterCircle = xEndCircle - _xTarget;
	circleDist = pi * 0.5 * circleRadius;

	var _totalDist = distToStartCircle + distToEndAfterCircle + circleDist;

	percentStart = distToStartCircle / _totalDist;
	percentEnd = distToEndAfterCircle / _totalDist;
	percentCircle = circleDist / _totalDist;
	
	xstart = x;
	ystart = y;
}

function WaveGetPoint(_percent) {
	var _points = {x: xstart, y:ystart};
	if (_percent < percentStart) {
		_points.y = lerp(ystart, yStartCircle, _percent / percentStart);
	} else if ((_percent-percentStart)/percentCircle >= 1) {
		_points.x = lerp(xEndCircle, xTarget,(_percent-(1-percentEnd))/percentEnd);
		_points.y = maxDistY;
	} else {
		var _dir = (_percent-percentStart)/percentCircle*90;
		_points.x += -circleRadius+lengthdir_x(circleRadius, _dir);
		_points.y = yStartCircle+lengthdir_y(circleRadius, _dir);
	}
	return _points;
}	