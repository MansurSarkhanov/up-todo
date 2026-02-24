import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/picker_manager.dart';
import '../../../../injection.dart';
import '../bloc/user_bloc.dart';
import '../bloc/user_event.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, this.photoUrl});
  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    final pickerManager = getIt<PickerManager>();
    return GestureDetector(
      onTap: () async {
        final file = await pickerManager.pickImageFromGallery();
        if (file != null && context.mounted) {
          context.read<UserBloc>().add(UpdateUserProfile(image: file));
        }
      },
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        height: 85,
        width: 85,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: Tween<double>(begin: 0, end: 1).animate(animation),
                child: child,
              ),
            );
          },
          child: photoUrl != null
              ? ClipOval(
                  child: Image.network(
                    photoUrl!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                )
              : const Icon(Icons.person_rounded, size: 40),
        ),
      ),
    );
  }
}
