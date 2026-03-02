import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:up_todo/shared/dialogs/category_dialog.dart';
import 'package:up_todo/shared/dialogs/task_priorty_dialog.dart';

import '../../../../core/constants/icons.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../shared/components/custom_textfield.dart';
import '../../../../shared/dialogs/custom_calendart_dialog.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../tasks/presentation/bloc/task_bloc.dart';
import '../../../tasks/presentation/bloc/task_event.dart';

class AddNewTaskSheet extends StatefulWidget {
  const AddNewTaskSheet({super.key});

  @override
  State<AddNewTaskSheet> createState() => _AddNewTaskSheetState();
}

class _AddNewTaskSheetState extends State<AddNewTaskSheet> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? _selectedCategory;
  int? _selectedPriority;
  DateTime? _selectedDate;
  String? _selectedCategoryIcon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: context.colors.strokeColor,
                    ),
                    height: 4.h,
                    width: 32.w,
                  ),
                ),
                16.verticalSpace,
                Text('Add Task', style: context.typography.h5Bold),
                12.verticalSpace,
                CustomTextfield(
                  textColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  hintTextColor: Color(0xFFAFAFAF),
                  fillColor: Colors.transparent,
                  controller: _titleController,
                  hintText: 'Task Title',
                  onChanged: (value) => _formKey.currentState!.validate(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title can not be empty';
                    }
                    return null;
                  },
                ),
                8.verticalSpace,
                CustomTextfield(
                  textColor: Colors.white,
                  minLines: 3,
                  hintTextColor: Color(0xFFAFAFAF),
                  fillColor: Colors.transparent,
                  controller: _descriptionController,
                  hintText: 'Task Description',
                  maxLines: 8,
                  onChanged: (value) => _formKey.currentState!.validate(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description can not be empty';
                    }
                    return null;
                  },
                ),
                16.verticalSpace,
                Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        AppIconPath.timer,
                        color: _selectedDate != null
                            ? context.colors.primary
                            : null,
                      ),
                      onPressed: () async {
                        final date = await showDialog(
                          context: context,
                          builder: (_) => const CustomCalendarDialog(),
                        );
                        if (date != null) {
                          setState(() {
                            _selectedDate = date;
                          });
                        }
                      },
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        AppIconPath.tag,
                        color: _selectedCategory != null
                            ? context.colors.primary
                            : null,
                      ),
                      onPressed: () async {
                        final result = await showDialog(
                          context: context,
                          builder: (_) => const CategoryDialog(),
                        );
                        if (result != null) {
                          setState(() {
                            _selectedCategory = result['category'];
                            _selectedCategoryIcon = result['icon'];
                          });
                        }
                      },
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        AppIconPath.flag,
                        color: _selectedPriority != null
                            ? context.colors.primary
                            : null,
                      ),
                      onPressed: () async {
                        final priority = await showDialog(
                          context: context,
                          builder: (_) => const TaskPriorityDialog(),
                        );
                        if (priority != null) {
                          setState(() {
                            _selectedPriority = priority;
                          });
                        }
                      },
                    ),
                    Spacer(),
                    IconButton(
                      icon: SvgPicture.asset(AppIconPath.send),
                      onPressed: () {
                        final userId = context.read<AuthBloc>().state.user!.uid;
                        if (_formKey.currentState!.validate()) {
                          context.read<TaskBloc>().add(
                            AddTaskRequested(
                              categoryName:
                                  _selectedCategory ?? 'Uncategorized',

                              categoryIcon:
                                  _selectedCategoryIcon ?? AppIconPath.home,
                              title: _titleController.text,
                              userId: userId,
                              description: _descriptionController.text,
                              dueDate: _selectedDate ?? DateTime.now(),
                              priority: _selectedPriority ?? 1,
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
