import 'package:fluent_ui/fluent_ui.dart';
import 'package:simplistic_editor/markup/app_state.dart';
import 'app_state_manager.dart';
import 'basic_text_field.dart';
import 'formatting_toolbar.dart';
import 'replacements.dart';
import 'text_editing_delta_history_view.dart';

class Markup extends StatelessWidget {
  const Markup({super.key});
  @override
  Widget build(BuildContext context) {
    return AppStateWidget(child: MarkupWidget());
  }
}

class MarkupWidget extends StatefulWidget {
  const MarkupWidget({super.key});

  @override
  State<MarkupWidget> createState() => _MarkupWidgetState();
}

class _MarkupWidgetState extends State<MarkupWidget> {
  late ReplacementTextEditingController _replacementTextEditingController;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _replacementTextEditingController = ReplacementTextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _replacementTextEditingController =
        AppStateManager.of(context).appState.replacementsController;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FluentTheme.of(context).micaBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const FormattingToolbar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: BasicTextField(
                    controller: _replacementTextEditingController,
                    style: const TextStyle(fontSize: 18.0, color: Colors.black),
                    focusNode: _focusNode,
                  ),
                ),
              ),
              const Expanded(child: TextEditingDeltaHistoryView()),
            ],
          ),
        ),
      ),
    );
  }
}
