import 'package:create_alert/constants/defines/images/image_constants.dart';
import 'package:create_alert/presenation/devices/widgets/add_notes/add_notes.dart';
import 'package:flutter/material.dart';
import 'package:fy_flutter_ui/fy_flutter_ui.dart';

class AlertNote extends StatefulWidget {
  const AlertNote({super.key});

  @override
  State<AlertNote> createState() => _AlertNoteState();
}

class _AlertNoteState extends State<AlertNote> {
  showNotesBottomsheet(BuildContext context, String route) {
    showModalBottomSheet(
      backgroundColor: FyTheme.black00,
      context: context,
      isScrollControlled: true,
      routeSettings: RouteSettings(
        name: route,
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0))),
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setStateModal) {
          return const AddNotes(note: "");
        });
      },
    ).then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => showNotesBottomsheet(
              context,
              "",
            ),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: FyUi.fyImage(
                  image: ImageConstants.notesIconPath,
                  width: 16,
                  height: 16,
                ),
              ),
              Text(
                'Add Notes',
                style: FyTextStyle.bodyBoldBlack500,
              ),
              Text(
                '(Optional)',
                style: FyTextStyle.smallBodyBlack400,
              )
            ]),
          ),
          TextButton(
              onPressed: () {
                // helper.noteController.clear();
                // helper.rebuilder.value = !helper.rebuilder.value;
              },
              child: Text("Remove", style: FyTextStyle.bodyBlack400)),
        ],
      ),
    );
  }
}
