import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final Color startColor;
  final Color endColor;
  final double width;
  final double height;

  const CustomButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed, 
    this.startColor = const Color.fromARGB(236, 86, 240, 163),
    this.endColor = const Color.fromARGB(206, 1, 73, 131),
    this.width = 200,
    this.height = 55,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() => _scale = 0.95);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: () => setState(() => _scale = 1.0),
      child: Transform.scale(
        scale: _scale,
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [widget.startColor, widget.endColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: widget.startColor.withValues(alpha:  0.5),
                offset: Offset(0, 4),
                blurRadius: 10,
              ),
            ],
          ),
          child: ElevatedButton.icon(
            onPressed: widget.onPressed,
            icon: Icon(widget.icon, color: Colors.white, size: 20),
            label: Text(
              widget.text,
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,fontFamily: 'Roboto'),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            ),
          ),
        ),
      ),
    );
  }
}
