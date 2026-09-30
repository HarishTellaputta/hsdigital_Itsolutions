import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';
import '../core/responsive.dart';
import '../widgets/primary_button.dart';
import '../widgets/responsive_container.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _businessController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  String _projectType = 'Website';

  @override
  void dispose() {
    _nameController.dispose();
    _businessController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Thanks! Your project details have been received.'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _openWhatsApp() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('WhatsApp: +91 9010737075'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _callNow() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Call: +91 9010737075'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 80 : 120),
      decoration: const BoxDecoration(color: AppColors.background),
      child: ResponsiveContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ContactHeader(isMobile: isMobile),
            const SizedBox(height: 55),
            isMobile
                ? Column(
                    children: [
                      _ContactInfo(onWhatsApp: _openWhatsApp, onCall: _callNow),
                      const SizedBox(height: 40),
                      _ContactForm(
                        formKey: _formKey,
                        nameController: _nameController,
                        businessController: _businessController,
                        phoneController: _phoneController,
                        messageController: _messageController,
                        projectType: _projectType,
                        onProjectTypeChanged: (value) {
                          setState(() {
                            _projectType = value;
                          });
                        },
                        onSubmit: _submitForm,
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: _ContactInfo(
                          onWhatsApp: _openWhatsApp,
                          onCall: _callNow,
                        ),
                      ),
                      const SizedBox(width: 70),
                      Expanded(
                        flex: 6,
                        child: _ContactForm(
                          formKey: _formKey,
                          nameController: _nameController,
                          businessController: _businessController,
                          phoneController: _phoneController,
                          messageController: _messageController,
                          projectType: _projectType,
                          onProjectTypeChanged: (value) {
                            setState(() {
                              _projectType = value;
                            });
                          },
                          onSubmit: _submitForm,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// HEADER
// ============================================================

class _ContactHeader extends StatelessWidget {
  final bool isMobile;

  const _ContactHeader({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'GET IN TOUCH',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),

        const SizedBox(height: 14),

        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Text(
            'Need a website or mobile app in Khammam?',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: isMobile ? 38 : 56,
              height: 1.05,
              fontWeight: FontWeight.w700,
              letterSpacing: -1.5,
            ),
          ),
        ),

        const SizedBox(height: 18),

        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: const Text(
            'Tell us about your website, mobile app, custom software, '
            'hosting or digital marketing requirement. HS Digital Solutions '
            'helps businesses in Khammam, Telangana and across India build '
            'practical digital solutions.',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 16,
              height: 1.7,
            ),
          ),
        ),
      ],
    );
  }
}
// ============================================================
// CONTACT INFO
// ============================================================

class _ContactInfo extends StatelessWidget {
  final VoidCallback onWhatsApp;
  final VoidCallback onCall;

  const _ContactInfo({required this.onWhatsApp, required this.onCall});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _InfoVisual(),
        const SizedBox(height: 35),

        const Text(
          'START A CONVERSATION',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(height: 12),

        const Text(
          'Whether you need a website, mobile app, custom software, '
          'or digital growth support, let’s discuss your requirements.',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            height: 1.7,
          ),
        ),

        const SizedBox(height: 30),

        _ContactDetail(
          icon: Icons.location_on_outlined,
          title: 'Office',
          value:
              'Vijayanagara Colony,\n'
              'Near RestInt Hotel,\n'
              'Khammam, Telangana',
        ),

        const SizedBox(height: 18),

        _ContactDetail(
          icon: Icons.phone_outlined,
          title: 'Call / WhatsApp',
          value: '+91 9010737075',
        ),

        const SizedBox(height: 30),

        Row(
          children: [
            PrimaryButton(
              text: 'WhatsApp',
              icon: Icons.chat_outlined,
              onPressed: onWhatsApp,
            ),
            const SizedBox(width: 12),
            PrimaryButton(
              text: 'Call Us',
              icon: Icons.call_outlined,
              outlined: true,
              onPressed: onCall,
            ),
          ],
        ),
      ],
    );
  }
}

// ============================================================
// CONTACT VISUAL
// ============================================================

class _InfoVisual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
      ),
      child: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: _ContactGridPainter())),

          Positioned(
            left: 30,
            top: 30,
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withOpacity(0.12),
                border: Border.all(color: AppColors.primary.withOpacity(0.3)),
              ),
              child: const Icon(
                Icons.connect_without_contact_rounded,
                color: AppColors.primary,
                size: 24,
              ),
            ),
          ),

          const Positioned(
            left: 30,
            bottom: 32,
            child: Text(
              'HS DIGITAL SOLUTIONS',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
          ),

          Positioned(
            right: 28,
            top: 28,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                color: AppColors.surfaceLight,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColors.border),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.circle, size: 7, color: Colors.greenAccent),
                  SizedBox(width: 7),
                  Text(
                    'OPEN FOR PROJECTS',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.7,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            right: 30,
            bottom: 30,
            child: Icon(
              Icons.arrow_outward_rounded,
              color: AppColors.primary.withOpacity(0.7),
              size: 34,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// CONTACT DETAIL
// ============================================================

class _ContactDetail extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _ContactDetail({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(11),
            border: Border.all(color: AppColors.border),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ============================================================
// CONTACT FORM
// ============================================================

class _ContactForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  final TextEditingController nameController;
  final TextEditingController businessController;
  final TextEditingController phoneController;
  final TextEditingController messageController;

  final String projectType;
  final ValueChanged<String> onProjectTypeChanged;
  final VoidCallback onSubmit;

  const _ContactForm({
    required this.formKey,
    required this.nameController,
    required this.businessController,
    required this.phoneController,
    required this.messageController,
    required this.projectType,
    required this.onProjectTypeChanged,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tell us about your project',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Share a few details and we’ll understand what you need.',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 28),

            _FormField(
              controller: nameController,
              label: 'Your Name',
              hint: 'Enter your name',
              icon: Icons.person_outline,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),

            const SizedBox(height: 18),

            _FormField(
              controller: businessController,
              label: 'Business / Company',
              hint: 'Enter business name',
              icon: Icons.business_outlined,
            ),

            const SizedBox(height: 18),

            _FormField(
              controller: phoneController,
              label: 'Phone / WhatsApp',
              hint: 'Enter your phone number',
              icon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),

            const SizedBox(height: 18),

            _ProjectDropdown(
              value: projectType,
              onChanged: onProjectTypeChanged,
            ),

            const SizedBox(height: 18),

            _FormField(
              controller: messageController,
              label: 'Project Details',
              hint: 'Tell us briefly about your project...',
              icon: Icons.notes_outlined,
              maxLines: 5,
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                text: 'Send Project Enquiry',
                icon: Icons.arrow_forward_rounded,
                onPressed: onSubmit,
              ),
            ),

            const SizedBox(height: 12),

            const Center(
              child: Text(
                'We’ll use your details only to respond to your enquiry.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textSecondary, fontSize: 11),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// FORM FIELD
// ============================================================

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final int maxLines;
  final String? Function(String?)? validator;

  const _FormField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.keyboardType,
    this.maxLines = 1,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(bottom: maxLines > 1 ? 65 : 0),
              child: Icon(icon, color: AppColors.textSecondary, size: 19),
            ),
            filled: true,
            fillColor: AppColors.background,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 15,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
          ),
        ),
      ],
    );
  }
}

// ============================================================
// PROJECT DROPDOWN
// ============================================================

class _ProjectDropdown extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;

  const _ProjectDropdown({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    const projectTypes = [
      'Website',
      'Mobile App',
      'Custom Software',
      'E-commerce',
      'Digital Growth',
      'Hosting & Maintenance',
      'Other',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Project Type',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),

        DropdownButtonFormField<String>(
          initialValue: value,
          dropdownColor: AppColors.surfaceLight,
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.textSecondary,
          ),
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.category_outlined,
              color: AppColors.textSecondary,
              size: 19,
            ),
            filled: true,
            fillColor: AppColors.background,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
          ),
          items: projectTypes.map((type) {
            return DropdownMenuItem<String>(value: type, child: Text(type));
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              onChanged(value);
            }
          },
        ),
      ],
    );
  }
}

// ============================================================
// BACKGROUND GRID
// ============================================================

class _ContactGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.border.withOpacity(0.45)
      ..strokeWidth = 1;

    const spacing = 32.0;

    for (double x = 0; x <= size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = 0; y <= size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    final glowPaint = Paint()
      ..color = AppColors.primary.withOpacity(0.07)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 45);

    canvas.drawCircle(
      Offset(size.width * 0.75, size.height * 0.45),
      90,
      glowPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
