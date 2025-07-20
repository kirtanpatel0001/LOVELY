import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _showPassword = false;
  bool _showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 60.0,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Title
                      Text(
                        'New to WeProvision?',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3748),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Create your account',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      SizedBox(height: 40),

                      // Form
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // Full Name Field
                            _buildTextField(
                              controller: _fullNameController,
                              hintText: 'Full Name',
                              icon: null,
                            ),
                            SizedBox(height: 20),

                            // Email Field
                            _buildTextField(
                              controller: _emailController,
                              hintText: 'Email',
                              icon: null,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: 20),

                            // Password Field
                            _buildTextField(
                              controller: _passwordController,
                              hintText: 'Password',
                              icon: _showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              obscureText: !_showPassword,
                              onIconTap: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                            ),
                            SizedBox(height: 20),

                            // Confirm Password Field
                            _buildTextField(
                              controller: _confirmPasswordController,
                              hintText: 'Confirm Password',
                              icon: _showConfirmPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              obscureText: !_showConfirmPassword,
                              onIconTap: () {
                                setState(() {
                                  _showConfirmPassword = !_showConfirmPassword;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),

                      // Create Account Button
                      Container(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Handle signup
                              print('Creating account...');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF6366F1),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

                      // Login Link
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already Have An Account? ',
                              style: TextStyle(
                                color: Color(0xFF6B7280),
                                fontSize: 14,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Color(0xFF6366F1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    IconData? icon,
    bool obscureText = false,
    TextInputType? keyboardType,
    VoidCallback? onIconTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: TextStyle(fontSize: 16, color: Color(0xFF374151)),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xFF9CA3AF), fontSize: 16),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          suffixIcon: icon != null
              ? GestureDetector(
                  onTap: onIconTap,
                  child: Icon(icon, color: Color(0xFF9CA3AF), size: 20),
                )
              : null,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          if (hintText == 'Email' && !value.contains('@')) {
            return 'Please enter a valid email';
          }
          if (hintText == 'Password' && value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          if (hintText == 'Confirm Password' &&
              value != _passwordController.text) {
            return 'Passwords do not match';
          }
          return null;
        },
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}

class IsometricIllustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final purplePaint = Paint()
      ..color = Color(0xFF6366F1)
      ..style = PaintingStyle.fill;

    final purpleLightPaint = Paint()
      ..color = Color(0xFF8B5CF6)
      ..style = PaintingStyle.fill;

    final cyanPaint = Paint()
      ..color = Color(0xFF06B6D4)
      ..style = PaintingStyle.fill;

    final cyanLightPaint = Paint()
      ..color = Color(0xFF67E8F9)
      ..style = PaintingStyle.fill;

    // Draw purple donut/torus
    final center = Offset(size.width * 0.6, size.height * 0.4);
    final outerRadius = 80.0;
    final innerRadius = 40.0;

    // Outer circle
    canvas.drawCircle(center, outerRadius, purplePaint);
    // Inner circle (cut out)
    canvas.drawCircle(center, innerRadius, Paint()..color = Color(0xFFF8F9FA));

    // Draw cyan rectangular blocks
    _drawIsometricBlock(
      canvas,
      Offset(size.width * 0.8, size.height * 0.3),
      60,
      20,
      cyanPaint,
      cyanLightPaint,
      'NAME',
    );

    _drawIsometricBlock(
      canvas,
      Offset(size.width * 0.85, size.height * 0.45),
      70,
      20,
      cyanPaint,
      cyanLightPaint,
      'EMAIL',
    );

    _drawIsometricBlock(
      canvas,
      Offset(size.width * 0.9, size.height * 0.6),
      80,
      20,
      cyanPaint,
      cyanLightPaint,
      'PASSWORD',
    );

    // Draw purple geometric shapes
    _drawIsometricShape(
      canvas,
      Offset(size.width * 0.4, size.height * 0.2),
      100,
      30,
      purplePaint,
      purpleLightPaint,
    );

    _drawIsometricShape(
      canvas,
      Offset(size.width * 0.3, size.height * 0.7),
      80,
      25,
      purplePaint,
      purpleLightPaint,
    );
  }

  void _drawIsometricBlock(
    Canvas canvas,
    Offset position,
    double width,
    double height,
    Paint frontPaint,
    Paint topPaint,
    String text,
  ) {
    // Front face
    final frontRect = Rect.fromLTWH(position.dx, position.dy, width, height);
    canvas.drawRRect(
      RRect.fromRectAndRadius(frontRect, Radius.circular(8)),
      frontPaint,
    );

    // Top face (isometric)
    final topPath = Path();
    topPath.moveTo(position.dx, position.dy);
    topPath.lineTo(position.dx + 15, position.dy - 10);
    topPath.lineTo(position.dx + width + 15, position.dy - 10);
    topPath.lineTo(position.dx + width, position.dy);
    topPath.close();
    canvas.drawPath(topPath, topPaint);

    // Right face
    final rightPath = Path();
    rightPath.moveTo(position.dx + width, position.dy);
    rightPath.lineTo(position.dx + width + 15, position.dy - 10);
    rightPath.lineTo(position.dx + width + 15, position.dy + height - 10);
    rightPath.lineTo(position.dx + width, position.dy + height);
    rightPath.close();
    canvas.drawPath(
      rightPath,
      Paint()..color = frontPaint.color.withOpacity(0.7),
    );

    // Draw text
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        position.dx + (width - textPainter.width) / 2,
        position.dy + (height - textPainter.height) / 2,
      ),
    );
  }

  void _drawIsometricShape(
    Canvas canvas,
    Offset position,
    double width,
    double height,
    Paint frontPaint,
    Paint topPaint,
  ) {
    // Simple isometric rectangle
    final frontRect = Rect.fromLTWH(position.dx, position.dy, width, height);
    canvas.drawRRect(
      RRect.fromRectAndRadius(frontRect, Radius.circular(12)),
      frontPaint,
    );

    // Top face
    final topPath = Path();
    topPath.moveTo(position.dx, position.dy);
    topPath.lineTo(position.dx + 20, position.dy - 15);
    topPath.lineTo(position.dx + width + 20, position.dy - 15);
    topPath.lineTo(position.dx + width, position.dy);
    topPath.close();
    canvas.drawPath(topPath, topPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
