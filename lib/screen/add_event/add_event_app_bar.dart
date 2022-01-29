import 'package:calendar/screen/add_event/add_event_event.dart';
import 'package:calendar/screen/add_event/add_event_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddEventAppBar extends StatelessWidget with PreferredSizeWidget{
  const AddEventAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addEventViewModel = context.watch<AddEventViewModel>();
    final state = addEventViewModel.state;

    return AppBar(
      title: Text(
          'event',
          textAlign: TextAlign.center,
          style: GoogleFonts.cormorantGaramond(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        state.title!.isEmpty
          ? Container()
          : GestureDetector(
            child: const Icon(Icons.check),
            onTap: () => addEventViewModel(const AddEventEvent.insertOrUpdateEvent()),
          )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}