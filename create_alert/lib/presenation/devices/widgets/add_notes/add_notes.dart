import 'package:create_alert/constants/defines/images/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:fy_flutter_ui/fy_flutter_ui.dart';

class AddNotes extends StatefulWidget {
  final String note;
  const AddNotes({Key? key, required this.note}) : super(key: key);

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  TextEditingController noteController = TextEditingController();
  bool isError = false;

  @override
  void initState() {
    noteController.text = widget.note;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: FyPaddingConstants.paddingAll10,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 8.0),
                    child: Container(
                      color: FyColor.black100,
                      height: 3.0,
                      width: 36.0,
                    ),
                  )
                ],
              ),
              Row(children: [
                Padding(
                  padding: FyPaddingConstants.paddingAll10,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: FyColor.blue100,
                    ),
                    child: Padding(
                      padding: FyPaddingConstants.paddingAll4,
                      child: FyUi.fyImage(
                        image: ImageConstants.notesIconPath,
                        color: FyColor.blue500,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Add Notes",
                  style: FyTextStyle.msgSubTitleBold(color: FyColor.black400),
                ),
              ]),
              Padding(
                padding: FyPaddingConstants.paddingAll10,
                child: FyUi.fyDivider(),
              ),
              Row(
                children: [
                  Expanded(
                    child: ValueListenableBuilder(
                        valueListenable: noteController,
                        builder: (context, value, child) {
                          return FyUi.fyTextFormField(
                            focusNode: FocusNode(),
                            keyboardType: TextInputType.multiline,
                            maxLength: 100,
                            maxLines: 2,
                            controller: noteController,
                            textAlign: TextAlign.start,
                            isTextObscure: false,
                            validator: (String? value) {
                              if (value!.length > 100) {
                                return '';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              errorStyle: const TextStyle(height: 0),
                              hintText: "Notes",
                              counterText: '',
                              hintStyle: FyTextStyle.msgSubTitleBold(
                                  color: FyColor.black100),
                              alignLabelWithHint: false,
                              enabled: true,
                              prefixIconConstraints: const BoxConstraints(
                                  minWidth: 16, minHeight: 48.0),
                              prefixIcon: const SizedBox(height: 48.0),
                              suffixIcon: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 8.0,
                                    ),
                                    child: Text(
                                        '${noteController.text.length}/100',
                                        style: FyTextStyle.bodyBoldBlack400),
                                  ),
                                ],
                              ),
                              contentPadding: const EdgeInsets.only(
                                  left: 16.0, bottom: 16.0, top: 16.0),
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      color: FyTheme.blue400, width: 1.5)),
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      color: FyTheme.black100,
                                      // style: BorderStyle.solid,
                                      width: 1.5)),
                              floatingLabelStyle: FyTextStyle.bodyBoldBlack400,
                            ),
                            cursorWidth: 2.0,
                            enableSuggestions: false,
                          );
                        }),
                  ),
                ],
              ),
              Padding(
                padding: FyPaddingConstants.paddingAll10,
                child: Row(
                  children: [
                    Expanded(
                      child: FyUi.fyPrimaryButton(
                        text: "Submit",
                        disabledColor: FyColor.blue100,
                        buttonTextStyle: FyTextStyle.msgSubTitleBold(
                            color: FyColor.black100),
                        onPressed: () =>
                            Navigator.of(context).pop(noteController.text),
                        fyButtonSize: FyButtonSize.medium,
                      ),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
