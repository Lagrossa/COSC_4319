import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'themeColors.dart';

class HabitBox extends StatelessWidget {
  final String name;
  final bool completed;
  final Function(bool?) onChanged;
  final Function(BuildContext)? settingsTap;
  final Function(BuildContext)? deleteTap;

  const HabitBox({
    super.key,
    required this.name,
    required this.completed,
    required this.onChanged,
    required this.settingsTap,
    required this.deleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: settingsTap,
              backgroundColor: ThemeColors.secondary,
              icon: Icons.edit,
            ),
            SlidableAction(
                onPressed: deleteTap,
                backgroundColor: ThemeColors.button,
                icon: Icons.delete_forever,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    topRight: Radius.circular(16)))
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            MSHCheckbox(
              value: completed,
              onChanged: onChanged,
              size: 28,
              style: MSHCheckboxStyle.fillFade,
              uncheckedColor: ThemeColors.tertiary,
              checkedColor: ThemeColors.button,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Lexend',
                            color: ThemeColors.button,
                            fontSize: 16,
                          ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                      child: Text(
                        "Description of task...",
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lexend',
                              color: ThemeColors.white,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "11/15/2023",
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Lexend',
                          color: ThemeColors.button,
                        ),
                  ),
                  /*Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Text(
                      "3h ago",
                      textAlign: TextAlign.end,
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
