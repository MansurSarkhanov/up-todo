part of '../screens/home_view.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final category = categories.firstWhere(
      (c) => c.name.toLowerCase() == task.category.name.toLowerCase(),
      orElse: () => CategoryModel(
        icon: AppIconPath.home,
        name: task.category.name,
        color: Colors.transparent,
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Slidable(
        key: ValueKey(task.id),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.circular(8.r),
            ),
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
              borderRadius: BorderRadius.circular(8.r),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () => context.push(
            Routes.taskDetail,
            extra: {'id': task.id, 'color': category.color},
          ),
          child: Container(
            decoration: BoxDecoration(
              color: context.colors.secondary,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.title, style: context.typography.body1Regular),
                  6.verticalSpace,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Today At 16:45',
                        style: context.typography.body2Regular.copyWith(
                          color: Color(0xFFAFAFAF),
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: category.color,
                          border: Border.all(color: category.color, width: 1),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              task.category.icon,
                              width: 20,
                              height: 20,
                            ),
                            8.horizontalSpace,
                            Text(
                              task.category.name,
                              style: context.typography.subtitle3Regular
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      12.horizontalSpace,
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: context.colors.primary,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppIconPath.flag,
                              width: 20,
                              height: 20,
                            ),
                            4.horizontalSpace,
                            Text(
                              task.priority.toString(),
                              style: context.typography.subtitle3Regular
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
