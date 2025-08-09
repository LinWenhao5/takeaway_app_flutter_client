import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/application/provider.dart';

class CheckoutNoteField extends ConsumerStatefulWidget {
  const CheckoutNoteField({super.key});

  @override
  ConsumerState<CheckoutNoteField> createState() => _CheckoutNoteFieldState();
}

class _CheckoutNoteFieldState extends ConsumerState<CheckoutNoteField> {
  bool showNoteField = false;
  late final TextEditingController _noteController;

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController(
      text: ref.read(checkoutNoteProvider),
    );
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final note = ref.watch(checkoutNoteProvider);
    final theme = Theme.of(context);

    if (!showNoteField) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: note.isEmpty
            ? Align(
                alignment: Alignment.centerLeft,
                child: FilledButton.icon(
                  icon: const Icon(Icons.edit_note, size: 20),
                  label: Text(context.t.checkout.note),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    elevation: 0,
                  ),
                  onPressed: () {
                    setState(() {
                      showNoteField = true;
                    });
                  },
                ),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                margin: EdgeInsets.zero,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        note,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit, size: 20),
                      tooltip: context.t.checkout.addNote,
                      color: theme.colorScheme.primary,
                      splashRadius: 20,
                      onPressed: () {
                        setState(() {
                          showNoteField = true;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: theme.colorScheme.error, size: 20),
                      tooltip: context.t.common.clear,
                      splashRadius: 20,
                      onPressed: () {
                        setState(() {
                          _noteController.clear();
                          ref.read(checkoutNoteProvider.notifier).state = '';
                        });
                      },
                    ),
                  ],
                ),
              ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: TextField(
          controller: _noteController,
          autofocus: true,
          textAlignVertical: TextAlignVertical.center,
          style: theme.textTheme.bodyMedium,
          maxLength: 80,
          decoration: InputDecoration(
            labelText: context.t.checkout.note,
            labelStyle: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.primary),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: theme.dividerColor,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: theme.dividerColor,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.check_circle, color: theme.colorScheme.primary),
                  tooltip: context.t.common.confirm,
                  splashRadius: 20,
                  onPressed: () {
                    setState(() {
                      showNoteField = false;
                    });
                  },
                ),
              ],
            ),
          ),
          onChanged: (value) {
            ref.read(checkoutNoteProvider.notifier).state = value;
          },
        ),
      );
    }
  }
}