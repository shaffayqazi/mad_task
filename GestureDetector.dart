import "package:flutter/material.dart";

class ZoomableContainer extends StatefulWidget {
  @override
  _ZoomableContainerState createState() => _ZoomableContainerState();
}

class _ZoomableContainerState extends State<ZoomableContainer> {
  double _scale = 1.0;
  double _previousScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zoomable Container'),
      ),
      body: Center(
        child: GestureDetector(
          onScaleStart: (details) {
            _previousScale = _scale;
          },
          onScaleUpdate: (details) {
            setState(() {
              _scale = _previousScale * details.scale;
            });
          },
          child: Transform.scale(
            scale: _scale,
            child: Container(
              width: 300,
              height: 300,
              color: Colors.deepPurple,
              child: Center(
                child: Text(
                  'Pinch to Zoom',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
