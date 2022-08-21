import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:todo_boards_macos/src/data/model/local/project_model.dart';
import 'bloc/dashboard_bloc.dart';
import 'bloc/dashboard_models.dart';
import 'widgets/add_project_widget.dart';
import 'widgets/card_item.dart';
import 'widgets/dialogs.dart';
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
                        context: this.context,
                        title: 'TODO',
                        cards: state.cards1,
                        controller: controller1,
                        categoryIndex: 0,
                        projectId: state.projectKey,
                        onTapAdd: () => _addCard(
                          projectId: state.projectKey,
                          categoryId: 0,
                        ),
              //          onCardTapDel: () {},
                      ),
                      ListCards(
                        context: this.context,
                        title: 'IN PROGRESS',
                        cards: state.cards2,
                        controller: controller2,
                        categoryIndex: 1,
                        projectId: state.projectKey,
                        onTapAdd: () => _addCard(
                          projectId: state.projectKey,
                          categoryId: 1,
                        ),
                      ),
                      ListCards(
                        context: this.context,
                        title: 'DONE',
                        cards: state.cards3,
                        controller: controller3,
                        categoryIndex: 2,
                        projectId: state.projectKey,
                        onTapAdd: () => _addCard(
                          projectId: state.projectKey,
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
            this
                .context
                .read<DashboardBloc>()
                .add(SetProjectEvent(projectIndex: index));
          },
          items: [
            for (int i = 0; i < projects.length; i++)
              SidebarItem(
                leading: const MacosIcon(CupertinoIcons.home),
                label: Row(
                  children: [
                    SizedBox(
                      width: 120,
                      child: Text(
                        projects[i].name,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
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
    Dialogs.showTextDialog(
      context: context,
      icon: const MacosIcon(
        CupertinoIcons.trash,
        size: 32,
      ),
      title: 'Warning',
      message:
          'Do you want to delete project ${projects[projectIndex].name} with all tasks?',
      onTapYes: () {
        context.read<DashboardBloc>().add(DelProjectEvent(index: projectIndex));

        Navigator.of(context).pop();
      },
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

    Dialogs.showEditTextDialog(
      context: context,
      icon: const MacosIcon(
        Icons.edit,
        size: 32,
      ),
      title: 'Change project',
      placeholder: 'Project name',
      controller: controller,
      onTapYes: () {
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
    );
  }

  void _addCard({
    required int projectId,
    required int categoryId,
  }) {
    TextEditingController controller = TextEditingController();

    Dialogs.showEditTextDialog(
      context: context,
      icon: const MacosIcon(
        Icons.add,
        size: 32,
      ),
      title: 'Create new card',
      placeholder: 'Card name',
      controller: controller,
      onTapYes: () {
        if (controller.text.isNotEmpty) {
          context.read<DashboardBloc>().add(AddCardEvent(
            note: controller.text,
            projectId: projectId,
            categoryId: categoryId,
          ));

          Navigator.of(context).pop();
        }
      },
    );
  }

}
