import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:todo_boards_macos/src/data/model/local/project_model.dart';
import 'bloc/dashboard_bloc.dart';
import 'bloc/dashboard_models.dart';
import 'widgets/add_project_widget.dart';
import 'widgets/card_item.dart';
import 'widgets/list_cards.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  ScrollController controller1 = ScrollController();
  ScrollController controller2 = ScrollController();
  ScrollController controller3 = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardScreenState>(
        builder: (context, state) {
      return PlatformMenuBar(
        menus: const [
          PlatformMenu(
            label: 'TODO app',
            menus: [
              PlatformProvidedMenuItem(
                type: PlatformProvidedMenuItemType.about,
              ),
              PlatformProvidedMenuItem(
                type: PlatformProvidedMenuItemType.quit,
              ),
            ],
          ),
          PlatformMenu(
            label: 'Window',
            menus: [
              PlatformProvidedMenuItem(
                type: PlatformProvidedMenuItemType.minimizeWindow,
              ),
              PlatformProvidedMenuItem(
                type: PlatformProvidedMenuItemType.zoomWindow,
              ),
            ],
          ),
        ],
        body: MacosWindow(
          sidebar: _sidebar(state.projects, state.projectIndex),
          child: MacosScaffold(
            toolBar: _toolBar(state.projects, state.projectIndex),
            children: [
              ContentArea(
                builder: ((context, scrollController) {
                  return Row(
                    children: [
                      ListCards(
                        title: 'TODO',
                        cards: state.cards1,
                        controller: controller1,
                        onTapAdd: () => _addCard(
                          projectId: state.projectIndex,
                          categoryId: 0,
                        ),
                      ),
                      ListCards(
                        title: 'IN PROGRESS',
                        cards: state.cards2,
                        controller: controller2,
                        onTapAdd: () => _addCard(
                          projectId: state.projectIndex,
                          categoryId: 1,
                        ),
                      ),
                      ListCards(
                        title: 'DONE',
                        cards: state.cards3,
                        controller: controller3,
                        onTapAdd: () => _addCard(
                          projectId: state.projectIndex,
                          categoryId: 2,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      );
    });
  }

  Sidebar _sidebar(List<ProjectModel> projects, projectIndex) {
    return Sidebar(
      minWidth: 200,
      top: Column(
        children: [
          Row(
            children: [
              const Text('Projects'),
              const Spacer(),
              MacosIconButton(
                icon: const MacosIcon(
                  CupertinoIcons.add_circled,
                ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(7),
                onPressed: () => _addProject(),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
      builder: (context, scrollController) {
        return SidebarItems(
          currentIndex: projectIndex,
          scrollController: scrollController,
          onChanged: (index) {
            this.context
                .read<DashboardBloc>()
                .add(SetProjectEvent(projectIndex: index));
          },
          items: [
            for (int i = 0; i < projects.length; i++)
              SidebarItem(
                leading: const MacosIcon(CupertinoIcons.home),
                label: Row(
                  children: [
                    Text(projects[i].name),
                    const SizedBox(
                      width: 16,
                    ),
                    // MacosPulldownButton(
                    //   icon: CupertinoIcons.ellipsis_circle,
                    //   items: [
                    //     MacosPulldownMenuItem(
                    //       title: const Text('Delete'),
                    //       onTap: () {
                    //         _showDelDialog(projectsLength: projects.length);
                    //        },
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }

  ToolBar _toolBar(List<ProjectModel> projects, int projectIndex) {
    return ToolBar(
      title: Text(projects.isEmpty
          ? ''
          : projects[projectIndex].name), //Text(projects[_projectIndex].name),
      titleWidth: 300.0,
      actions: [
        ToolBarIconButton(
          label: "Add project",
          icon: const MacosIcon(
            CupertinoIcons.add_circled,
          ),
          onPressed: () => _addProject(),
          showLabel: false,
        ),
        ToolBarIconButton(
          label: "Change",
          icon: const MacosIcon(
            Icons.edit,
          ),
          onPressed: () {
            if (projects.isNotEmpty) {
              _showChangeDialog(projects, projectIndex);
            }
          },
          showLabel: false,
        ),
        const ToolBarSpacer(),
        ToolBarIconButton(
          label: "Delete",
          icon: const MacosIcon(
            CupertinoIcons.trash,
          ),
          onPressed: () {
            if (projects.isNotEmpty) {
              _showDelDialog(projects, projectIndex);
            }
          },
          showLabel: false,
        ),
        // ToolBarPullDownButton(
        //   label: "Actions",
        //   icon: CupertinoIcons.ellipsis_circle,
        //   items: [
        //     MacosPulldownMenuItem(
        //       label: "New Folder",
        //       title: const Text("New Folder"),
        //       onTap: () => debugPrint("Creating new folder..."),
        //     ),
        //     MacosPulldownMenuItem(
        //       label: "Open",
        //       title: const Text("Open"),
        //       onTap: () => debugPrint("Opening..."),
        //     ),
        //   ],
        // ),
      ],
    );
  }

  void _showDelDialog(List<ProjectModel> projects, int projectIndex) {
    showMacosAlertDialog(
      context: context,
      builder: (context) => MacosAlertDialog(
        appIcon: const MacosIcon(
          CupertinoIcons.trash,
          size: 32,
        ),
        title: Text(
          'Warning',
          style: MacosTheme.of(context)
              .typography
              .title2
              .copyWith(fontWeight: FontWeight.bold),
        ),
        message: Text(
          'Do you want to delete project ${projects[projectIndex].name} with all tasks?',
          textAlign: TextAlign.center,
        ),
        horizontalActions: false,
        primaryButton: PushButton(
          buttonSize: ButtonSize.large,
          onPressed: () {
            bool indexMinus = false;
            if (projectIndex == projects.length - 1 && projectIndex != 0) {
              this.context
                  .read<DashboardBloc>()
                  .add(SetProjectEvent(projectIndex: projectIndex - 1));
              indexMinus = true;
            }
            this.context.read<DashboardBloc>().add(DelProjectEvent(
                index: indexMinus ? projectIndex + 1 : projectIndex));

            Navigator.of(context).pop();
          },
          child: const Text('YES'),
        ),
        secondaryButton: PushButton(
          buttonSize: ButtonSize.large,
          isSecondary: true,
          onPressed: Navigator.of(context).pop,
          child: const Text('NO'),
        ),
      ),
    );
  }

  void _addProject() {
    TextEditingController controller = TextEditingController();
    showMacosSheet(
      context: context,
      builder: (_) => AddProjectWidget(
        controller: controller,
        onTapAdd: () {
          if (controller.text.trim().isNotEmpty) {
            context
                .read<DashboardBloc>()
                .add(AddProjectEvent(name: controller.text));
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }

  void _showChangeDialog(List<ProjectModel> projects, int projectIndex) {
    TextEditingController controller = TextEditingController();
    controller.text = projects[projectIndex].name;
    showMacosAlertDialog(
      context: context,
      builder: (context) => MacosAlertDialog(
        appIcon: const MacosIcon(
          Icons.edit,
          size: 32,
        ),
        title: Text(
          'Change project',
          style: MacosTheme.of(context)
              .typography
              .title2
              .copyWith(fontWeight: FontWeight.bold),
        ),
        message: MacosTextField(
          controller: controller,
          placeholder: 'Project name',
        ),
        horizontalActions: false,
        primaryButton: PushButton(
          buttonSize: ButtonSize.large,
          onPressed: () {
            if (controller.text.trim().isNotEmpty) {
              this.context.read<DashboardBloc>().add(
                    ChangeProjectNameEvent(
                      index: projectIndex,
                      name: controller.text,
                    ),
                  );
              Navigator.of(context).pop();
            }
          },
          child: const Text('YES'),
        ),
        secondaryButton: PushButton(
          buttonSize: ButtonSize.large,
          isSecondary: true,
          onPressed: Navigator.of(context).pop,
          child: const Text('NO'),
        ),
      ),
    );
  }

  void _addCard({
    required int projectId,
    required int categoryId,
  }) {
    context.read<DashboardBloc>().add(AddCardEvent(
      note: 'item www',
      projectId: projectId,
      categoryId: categoryId,
    ));
  }
}
