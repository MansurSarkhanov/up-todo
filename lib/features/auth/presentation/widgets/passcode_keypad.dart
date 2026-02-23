part of '../screens/passcode_screen.dart';

class PasscodeKeypad extends StatelessWidget {
  const PasscodeKeypad({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 12,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.1,
        ),
        itemBuilder: (context, index) {
          if (index == 9) {
            return _buildBackspace(context: context);
          } else if (index == 11) {
            return _buildFingerprint();
          } else {
            final number = (index == 10) ? 0 : index + 1;
            return _buildNumber(number: number, context: context);
          }
        },
      ),
    );
  }

  Widget _buildNumber({required int number, required BuildContext context}) {
    return _keyContainer(
      onPressed: () {
        context.read<PasscodeBloc>().add(NumberEntered(number));
      },
      child: Text(number.toString(), style: context.typography.h4SemiBold),
    );
  }

  Widget _buildBackspace({required BuildContext context}) {
    return _keyContainer(
      onPressed: () {
        context.read<PasscodeBloc>().add(BackspacePressed());
      },
      gradient: const LinearGradient(
        colors: [Color(0xFF8E7CFF), Color(0xFF6C63FF)],
      ),
      child: const Icon(
        Icons.backspace_outlined,
        color: Colors.white70,
        size: 24,
      ),
    );
  }

  Widget _buildFingerprint() {
    return _keyContainer(
      onPressed: () {},
      gradient: const LinearGradient(
        colors: [Color(0xFF8E7CFF), Color(0xFF6C63FF)],
      ),
      child: const Icon(Icons.fingerprint, color: Colors.white, size: 24),
    );
  }

  Widget _keyContainer({
    required Widget child,
    VoidCallback? onPressed,
    Gradient? gradient,
  }) {
    return AnimationButtonEffect(
      lowerBound: 0.95,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: WidgetStatePropertyAll(10),
          shadowColor: WidgetStatePropertyAll(
            Colors.black.withValues(alpha: .6),
          ),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.r)),
          ),
          backgroundColor: WidgetStateProperty.resolveWith((state) {
            if (state.contains(WidgetState.pressed)) {
              return Colors.transparent;
            }
            return Color(0xFF1A1A24);
          }),
        ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            gradient: gradient,
          ),
          child: Container(alignment: Alignment.center, child: child),
        ),
      ),
    );
  }
}
