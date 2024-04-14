function WaveSetup(_xMin, _xMax, _yMargin, _xTarget) {
	var _circleMaxRadius = 220;

	var _percentX = (ValuePercent(x,_xMin,_xMax)-0.5) * 2;

	yOffset = _yMargin * _percentX
	maxDistY = oShapeSummoner.y - yOffset;
	circleRadius = _circleMaxRadius * ValuePercent(x,oInputCircle.x,_xMax)
	yStartCircle = maxDistY+circleRadius;
	xEndCircle = x-circleRadius;

	distToStartCircle = y - yStartCircle;
	distToEndAfterCircle = xEndCircle - _xTarget;
	circleDist = pi * 0.5 * circleRadius;

	var _totalDist = distToStartCircle + distToEndAfterCircle + circleDist;

	percentStart = distToStartCircle / _totalDist;
	percentEnd = (distToEndAfterCircle-32) / _totalDist;
	percentCircle = circleDist / _totalDist;
}

function WaveGetPoint(_percent,_moveToShape=true) {
	var _points = {x: xstart, y:ystart};
	if (_percent < percentStart) {
		_points.y = lerp(ystart, yStartCircle, _percent / percentStart);
	} else if (_percent >= percentStart+percentCircle) {
		_points.x = lerp(xEndCircle, xEndCircle-distToEndAfterCircle,min(1,(_percent-(percentStart+percentCircle))/percentEnd));
		if (_moveToShape)
			_points.y = lerp(maxDistY, oShapeSummoner.y,min(1,(_percent-(percentStart+percentCircle))/percentEnd));
		else
			_points.y = maxDistY;
	} else {
		var _dir = (_percent-percentStart)/percentCircle*90;
		_points.x = xstart-circleRadius+lengthdir_x(circleRadius, _dir);
		_points.y = yStartCircle+lengthdir_y(circleRadius, _dir);
	}
	return _points;
}	