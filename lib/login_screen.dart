import 'package:flutter/material.dart';

import 'admin/dashboard_screen.dart';
import 'developer/dashboard_screen.dart';
import 'employee/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _showPassword = false;
  bool _rememberMe = false;
  String? _error;
  bool _isLoading = false;

  void _navigateBasedOnRole(String? role) {
    if (!mounted) return;
    switch (role?.toLowerCase()) {
      case 'admin':
        Navigator.pushReplacementNamed(context, '/admin_dashboard');
        break;
      case 'developer':
        Navigator.pushReplacementNamed(context, '/developer_dashboard');
        break;
      case 'employee':
        Navigator.pushReplacementNamed(context, '/employee_dashboard');
        break;
      default:
        setState(() {
          _error = 'Unknown user role. Please login again.';
        });
    }
  }

  // ...existing code...
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3748),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Login to your account',
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
                            // Email Field
                            _buildTextField(
                              controller: _emailController,
                              hintText: 'Email',
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: 20),

                            // Password Field
                            _buildTextField(
                              controller: _passwordController,
                              hintText: 'Password',
                              icon: Icons.visibility_off_outlined,
                              obscureText: !_showPassword,
                              onIconTap: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),

                      // Remember Me Checkbox
                      Row(
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                            activeColor: Color(0xFF6366F1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          Text(
                            'Remember Me',
                            style: TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),

                      // Login Button
                      Container(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Handle login
                              print('Logging in...');
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
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Forgot Password Link
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            // Handle forgot password
                          },
                          child: Text(
                            'Forgot Your Password?',
                            style: TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

                      // Sign Up Link
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t Have An Account? ',
                              style: TextStyle(
                                color: Color(0xFF6B7280),
                                fontSize: 14,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: Text(
                                'Sign Up',
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
                  child: Icon(
                    _showPassword ? Icons.visibility_outlined : icon,
                    color: Color(0xFF9CA3AF),
                    size: 20,
                  ),
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
          return null;
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

class LoginIsometricIllustrationPainter extends CustomPainter {
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

    // Add 3D depth effect
    final shadowPaint = Paint()
      ..color = Color(0xFF4F46E5).withOpacity(0.3)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(center.dx + 5, center.dy + 5),
      outerRadius,
      shadowPaint,
    );

    // Draw cyan rectangular blocks with labels
    _drawIsometricBlock(
      canvas,
      Offset(size.width * 0.8, size.height * 0.25),
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
      Offset(size.width * 0.9, size.height * 0.65),
      80,
      20,
      cyanPaint,
      cyanLightPaint,
      'PASSWORD',
    );

    // Draw purple geometric shapes
    _drawIsometricShape(
      canvas,
      Offset(size.width * 0.35, size.height * 0.15),
      120,
      35,
      purplePaint,
      purpleLightPaint,
    );

    _drawIsometricShape(
      canvas,
      Offset(size.width * 0.25, size.height * 0.7),
      90,
      30,
      purplePaint,
      purpleLightPaint,
    );

    // Add some floating elements
    _drawFloatingElement(
      canvas,
      Offset(size.width * 0.15, size.height * 0.3),
      15,
      cyanPaint,
    );
    _drawFloatingElement(
      canvas,
      Offset(size.width * 0.75, size.height * 0.8),
      12,
      purplePaint,
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
    // Shadow
    final shadowRect = Rect.fromLTWH(
      position.dx + 3,
      position.dy + 3,
      width,
      height,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(shadowRect, Radius.circular(8)),
      Paint()..color = Colors.black.withOpacity(0.1),
    );

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
    // Shadow
    final shadowRect = Rect.fromLTWH(
      position.dx + 4,
      position.dy + 4,
      width,
      height,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(shadowRect, Radius.circular(12)),
      Paint()..color = Colors.black.withOpacity(0.1),
    );

    // Front face
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

  void _drawFloatingElement(
    Canvas canvas,
    Offset position,
    double radius,
    Paint paint,
  ) {
    // Shadow
    canvas.drawCircle(
      Offset(position.dx + 2, position.dy + 2),
      radius,
      Paint()..color = Colors.black.withOpacity(0.1),
    );
    // Element
    canvas.drawCircle(position, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
