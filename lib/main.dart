import 'package:flutter/material.dart';
import 'dart:math'; // Required for the 3D flip calculation

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text("Employee Profile"),
          backgroundColor: const Color.fromARGB(255, 22, 40, 112),
          foregroundColor: Colors.white,
        ),
        body: const Center(
          child: EmployeeFlipCard(),
        ),
      ),
    );
  }
}

class EmployeeFlipCard extends StatefulWidget {
  const EmployeeFlipCard({super.key});

  @override
  State<EmployeeFlipCard> createState() => _EmployeeFlipCardState();
}

class _EmployeeFlipCardState extends State<EmployeeFlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _isFront = !_isFront;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final angle = _animation.value * pi;
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.001) // Adds 3D perspective
            ..rotateY(angle);

          return Transform(
            transform: transform,
            alignment: Alignment.center,
            // If angle is less than 90 degrees, show front.
            // If angle is more than 90 degrees, show back (rotated).
            child: angle < pi / 2
                ? _buildFrontSide()
                : Transform(
                    transform: Matrix4.identity()..rotateY(pi),
                    alignment: Alignment.center,
                    child: _buildBackSide(),
                  ),
          );
        },
      ),
    );
  }

  // ---------------------------------------------------
  // FRONT SIDE (Logo, Photo with Border, Name)
  // ---------------------------------------------------
  Widget _buildFrontSide() {
    return Container(
      width: 350,
      height: 320, // Height increased to fit the logo
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 1. Company Logo
          Image.network(
            'https://tse1.mm.bing.net/th/id/OIP.sGSr0jQ-deGQcCKMz8ahIAHaGy?rs=1&pid=ImgDetMain&o=7&rm=3',
            height: 40,
          ),
          const SizedBox(height: 10),

          // 2. Photo with Border
          CircleAvatar(
            radius: 54, // Outer circle (border)
            backgroundColor: const Color.fromARGB(255, 22, 40, 112),
            child: CircleAvatar(
              radius: 50, // Inner circle (image)
              backgroundImage: NetworkImage(
                  'https://visafoto.com/img/docs/zz_35x45.jpg'),
            ),
          ),
          const SizedBox(height: 15),

          // 3. Text Info
          const Text(
            "Reem Al-Ahmed",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Senior Flutter Developer",
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 22, 40, 112).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "Mobile Development Dept.",
              style: TextStyle(
                  color: Color.fromARGB(255, 22, 40, 112),
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 15),
          const Text("Tap to view details",
              style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  // ---------------------------------------------------
  // BACK SIDE (Contact Info)
  // ---------------------------------------------------
  Widget _buildBackSide() {
    return Container(
      width: 350,
      height: 320, // Height matched to front side
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 22, 40, 112),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Employee Details",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const Divider(color: Colors.white54),
            const SizedBox(height: 10),
            _whiteInfoRow(Icons.email, "reem@company.com"),
            _whiteInfoRow(Icons.phone, "+966 55 123 4567"),
            _whiteInfoRow(Icons.cake, "15 Jan 1998"),
            _whiteInfoRow(Icons.bloodtype, "Blood Type: O+"),
          ],
        ),
      ),
    );
  }

  // Helper widget to avoid repeating code
  Widget _whiteInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 18),
          const SizedBox(width: 10),
          Text(text,
              style: const TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}