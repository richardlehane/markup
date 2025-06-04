import 'package:fluent_ui/fluent_ui.dart'; // material import 'package:fluent_ui/fluent_ui.dart';

import 'app_state.dart';
import 'app_state_manager.dart';

/// The toggle buttons that can be selected.
enum ToggleButtonsState { bold, italic, underline }

class FormattingToolbar extends StatelessWidget {
  const FormattingToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStateManager manager = AppStateManager.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ToggleButton(
            child: const Text('Emphasis'),
            checked: manager.appState.toggleButtonsState.contains(
              ToggleButtonsState.bold,
            ),
            onChanged:
                (v) => AppStateWidget.of(
                  context,
                ).updateToggleButtonsStateOnButtonPressed(0),
          ),
          ToggleButton(
            child: const Text('Source'),
            checked: manager.appState.toggleButtonsState.contains(
              ToggleButtonsState.italic,
            ),
            onChanged:
                (v) => AppStateWidget.of(
                  context,
                ).updateToggleButtonsStateOnButtonPressed(1),
          ),
          ToggleButton(
            child: const Text('Link'),
            checked: manager.appState.toggleButtonsState.contains(
              ToggleButtonsState.underline,
            ),
            onChanged:
                (v) => AppStateWidget.of(
                  context,
                ).updateToggleButtonsStateOnButtonPressed(2),
          ),
          ToggleButton(
            child: const Text("List"),
            checked: false,
            onChanged: (v) => {},
          ),
        ],
      ),
    );
  }
}
