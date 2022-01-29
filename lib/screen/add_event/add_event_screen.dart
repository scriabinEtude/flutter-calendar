import 'dart:async';
import 'dart:io';

import 'package:calendar/screen/add_event/add_event_app_bar.dart';
import 'package:calendar/screen/add_event/add_event_event.dart';
import 'package:calendar/screen/add_event/add_event_screen_arguments.dart';
import 'package:calendar/screen/add_event/add_event_state.dart';
import 'package:calendar/screen/add_event/add_event_ui_event.dart';
import 'package:calendar/screen/add_event/add_event_view_model.dart';
import 'package:calendar/screen/calendar/calendar_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

const deActivateFontColor = Colors.black38;
const activateFontColor = Colors.black;
const activateBorderColor = Colors.black54;
const deActivateBorderColor = Colors.black12;
const double mainIconSize = 20;

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({Key? key}) : super(key: key);

  static const routeName = '/addEvent';

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<AddEventViewModel>(
      create: (context) => AddEventViewModel(),
      child: const AddEventScreenScaffold()
    );
  }
}

class AddEventScreenScaffold extends StatefulWidget {
  const AddEventScreenScaffold({Key? key}) : super(key: key);

  @override
  State<AddEventScreenScaffold> createState() => _AddEventScreenScaffoldState();
}

class _AddEventScreenScaffoldState extends State<AddEventScreenScaffold> {

  StreamSubscription<AddEventUiEvent>? _streamSubscription;

  @override
  void initState() {
    super.initState();
    final viewModel = context.read<AddEventViewModel>();

    /// state initialize
    Future.microtask((){
      final args = ModalRoute.of(context)!.settings.arguments as AddEventScreenArguments;
      viewModel(AddEventEvent.setDate(args.selectedDay));
      if(args.event != null){
        viewModel(AddEventEvent.loadEvent(args.event!));
      }
    });

    /// ui event listener
    _streamSubscription = viewModel.addEventStream.listen((event) {
      event.when(
        notValid: _showSnackBar,
        eventFailed: _showSnackBar,
        eventSuccess: () => Navigator.pushNamedAndRemoveUntil(
          context,
          CalendarScreen.routeName,
          (route)=>false
        ),
      );
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AddEventAppBar(),
      body: AddEventForm(),
      floatingActionButton: DeleteEventWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class DeleteEventWidget extends StatelessWidget {
  const DeleteEventWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final viewModel = context.watch<AddEventViewModel>();

    return FloatingActionButton.small(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              title: const Text('DELETE'),
              content: const Text("do you really want to delete?"),
              actions: [
                /// cancel
                TextButton(onPressed: ()=>Navigator.pop(context), child: const Text('cancel')),
                /// ok
                TextButton(
                  onPressed: () => viewModel(const AddEventEvent.deleteEvent()),
                  child: const Text('ok')
                )
              ],
            );
          }
        );

      },
      backgroundColor: Colors.white,
      child: const Icon(Icons.delete_forever_outlined, color: Colors.black,),
    );
  }
}



class AddEventForm extends StatelessWidget {
  const AddEventForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: ListView(
        children: const <Widget>[
          TitleFormField(),
          StartEndTimeRangePickerSelector(),
          Description(),
          ImageUpload(),
          ImageUploadPreview(),
          SelectColor()
        ],
      ),
    );
  }
}

class TitleFormField extends StatelessWidget {
  const TitleFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addEventViewModel = context.watch<AddEventViewModel>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: addEventViewModel.state.titleController,
        onChanged: (title) => addEventViewModel(AddEventEvent.updateTitle(title)),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: const InputDecoration.collapsed(
          hintText: 'Title',
          hintStyle: TextStyle(
            color: Colors.black38,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty){
            return 'Please enter title';
          }
          return null;
        },
      ),
    );
  }
}



class Divider extends StatelessWidget {
  const Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.black12, width: 1)
          )
      ),
    );
  }
}


class StartEndTimeRangePickerSelector extends StatelessWidget {
  const StartEndTimeRangePickerSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addEventViewModel = context.watch<AddEventViewModel>();
    final state = addEventViewModel.state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const AllDayToggleButton(),
        const SizedBox(height: 8,),
        state.isAllDay ? Container() : const PickerSelector(),
        state.isAllDay ? Container() : const StartEndTimeRangePicker(),
      ],
    );
  }
}

class AllDayToggleButton extends StatelessWidget {
  const AllDayToggleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final addEventViewModel = context.watch<AddEventViewModel>();
    final state = addEventViewModel.state;

    return GestureDetector(
      onTap: () => addEventViewModel(const AddEventEvent.toggleAllDay()),
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: state.isAllDay
              ? activateBorderColor
              : deActivateBorderColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20))
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 3),
        child: Text(
          'all day',
          style: TextStyle(
            color: state.isAllDay
              ? activateFontColor
              : deActivateFontColor
          ),
        ),
      ),
    );
  }
}



class PickerSelector extends StatelessWidget {
  const PickerSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addEventModel = context.watch<AddEventViewModel>();
    final state = addEventModel.state;

    const double divideWidth = 20;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double itemWidth = (screenWidth - divideWidth) / 2;
    const double itemHeight = 50;


    return Row(
      children: [
        GestureDetector(
          onTap: (){
            addEventModel(const AddEventEvent.selectDatePickerType(ActivateDatePickerType.start));
          },
          child: Container(
            width: itemWidth,
            height: itemHeight,
            decoration: BoxDecoration(
                border: state.activateDatePickerType == ActivateDatePickerType.start
                    ? const Border(
                  top: BorderSide(width: 1, color: activateBorderColor),
                  bottom: BorderSide(width: 1, color: activateBorderColor),
                  left: BorderSide(width: 1, color: activateBorderColor),
                )
                    : const Border(
                  top: BorderSide(width: 1, color: deActivateBorderColor),
                  bottom: BorderSide(width: 1, color: deActivateBorderColor),
                  left: BorderSide(width: 1, color: deActivateBorderColor),
                )
            ),
            child: Center(
              child: Text(
                DateFormat.jm().format(state.start!),
                style: TextStyle(
                    color: state.activateDatePickerType == ActivateDatePickerType.start
                        ? activateFontColor
                        : deActivateFontColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w300
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: state.activateDatePickerType == ActivateDatePickerType.start
                  ? const Border(
                top: BorderSide(width: 1, color: deActivateBorderColor),
                bottom: BorderSide(width: 1, color: deActivateBorderColor),
              )
                  : const Border(
                top: BorderSide(width: 1, color: activateBorderColor),
                bottom: BorderSide(width: 1, color: activateBorderColor),
              )
          ),
          width: divideWidth,
          height: itemHeight,
          child: const CustomPaint(
            painter: CalendarDividePainter(
                width: divideWidth,
                height: itemHeight
            ),
          ),
        ),
        GestureDetector(
          onTap: () => addEventModel(const AddEventEvent.selectDatePickerType(ActivateDatePickerType.end)),
          child: Container(
            width: itemWidth,
            height: itemHeight,
            decoration: BoxDecoration(
                border: state.activateDatePickerType == ActivateDatePickerType.end
                    ? const Border(
                  top: BorderSide(width: 1, color: activateBorderColor),
                  bottom: BorderSide(width: 1, color: activateBorderColor),
                  right: BorderSide(width: 1, color: activateBorderColor),
                )
                    : const Border(
                  top: BorderSide(width: 1, color: deActivateBorderColor),
                  bottom: BorderSide(width: 1, color: deActivateBorderColor),
                  right: BorderSide(width: 1, color: deActivateBorderColor),
                )
            ),
            child: Center(
              child: Text(
                DateFormat.jm().format(state.end!),
                style: TextStyle(
                    color: state.activateDatePickerType == ActivateDatePickerType.end
                        ? activateFontColor
                        : deActivateFontColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w300
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}




class StartEndTimeRangePicker extends StatefulWidget {
  const StartEndTimeRangePicker({Key? key}) : super(key: key);

  @override
  State<StartEndTimeRangePicker> createState() => _StartEndTimeRangePickerState();
}

class _StartEndTimeRangePickerState extends State<StartEndTimeRangePicker> {
  UniqueKey key = UniqueKey();

  ActivateDatePickerType type = ActivateDatePickerType.start;

  bool isToggledType(ActivateDatePickerType selectedType){
    if(type == selectedType){
      return false;
    }else {
      type = selectedType;
      return true;
    }
  }

  UniqueKey newKeyWhenActivateTypeIsToggled(ActivateDatePickerType selectedType){
    return isToggledType(selectedType) ? UniqueKey() : key;
  }

  @override
  Widget build(BuildContext context) {

    final addEventViewModel = context.watch<AddEventViewModel>();
    final state = addEventViewModel.state;

    return SizedBox(
      width: double.infinity,
      height: 150,
      child: CupertinoDatePicker(
        key: newKeyWhenActivateTypeIsToggled(state.activateDatePickerType),
        mode: CupertinoDatePickerMode.time,
        initialDateTime: state.activateDatePickerType == ActivateDatePickerType.start
            ? state.start
            : state.end,
        onDateTimeChanged: (time){
          addEventViewModel(AddEventEvent.updatePickedDate(state.activateDatePickerType, time));
        },
      ),
    );
  }
}


class CalendarDividePainter extends CustomPainter {
  const CalendarDividePainter({
    required this.width,
    required this.height
  });

  final double width;
  final double height;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(const Offset(0,0), Offset(width, height/2), Paint());
    canvas.drawLine(Offset(width,height/2), Offset(0, height), Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddEventViewModel>();
    final state = viewModel.state;

    return Container(
      padding: const EdgeInsets.only(left: 16, right: 8),
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 24,
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.description_outlined,
              size: mainIconSize,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 68,
            child: Stack(
              children: [
                state.description!.isEmpty
                  ? const Text(
                      'description',
                      style: TextStyle(
                        fontSize: 16,
                        color: deActivateFontColor
                      )
                    )
                  : Container()
                ,
                TextField(
                  controller: state.descriptionController,
                  onChanged: (description) => viewModel(AddEventEvent.updateDescription(description)),
                  decoration: const InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(0)
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ],
            ),
          ),
          Container(
            width: 14,
            alignment: Alignment.centerRight,
            child: state.description!.isNotEmpty
              ? const Icon(
                  Icons.clear,
                  size: 14,
                )
              : Container()
          )
        ],
      ),
    );
  }
}


class ImageUpload extends StatefulWidget {
  const ImageUpload({Key? key}) : super(key: key);

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {

  final ImagePicker _imagePicker = ImagePicker();

  Widget _bottomSheetItem({required String title, required ImageSource imageSource}){

    final AddEventViewModel addEventViewModel = context.watch<AddEventViewModel>();

    return GestureDetector(
      onTap: () async {
        Navigator.of(context).pop();

        /// 갤러리에서 가져온다.
        if(imageSource == ImageSource.gallery){
          List<XFile>? images = await _imagePicker.pickMultiImage();
          if(images != null && images.isNotEmpty){
            addEventViewModel(AddEventEvent.addImages(images));
          }

        /// 즉석에서 카메라로 찍어 가져온다.
        }else if(imageSource == ImageSource.camera){
          XFile? image = await _imagePicker.pickImage(source: imageSource);
          if(image != null){
            addEventViewModel(AddEventEvent.addImages([image]));
          }
        }else{
          if (kDebugMode) {
            print('지정되지 않은 imageSource');
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.only(left: 16, top: 16),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () async {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          context: context,
          builder: (context){
            return SizedBox(
              height: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _bottomSheetItem(title: 'get from gallery', imageSource: ImageSource.gallery),
                  _bottomSheetItem(title: 'get from camera', imageSource: ImageSource.camera)
                ],
              ),
            );
          }
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16),
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.image_outlined,
                  size: mainIconSize,
                ),
                Text(
                  'images',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 30,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 12,
            ),
          )
        ],
      ),
    );
  }
}

class ImageUploadPreview extends StatelessWidget {
  const ImageUploadPreview({Key? key}) : super(key: key);

  _imagePreviewItemsBuilder({
    required List<XFile> images,
    required AddEventViewModel viewModel
  }){

    return images.map((image){

      return Container(
        margin: const EdgeInsets.only(right: 8),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.file(
                File(image.path),
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () => viewModel(AddEventEvent.deleteImage(image)),
                child: const Icon(Icons.clear, color: Colors.white,),
              )
            )
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddEventViewModel>();
    final state = viewModel.state;

    return state.images!.isEmpty
      ? Container(
          margin: const EdgeInsets.only(bottom: 8),
        )
      : SizedBox(
          height: 116,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
            scrollDirection: Axis.horizontal,
            // shrinkWrap: true,
            children: _imagePreviewItemsBuilder(images: state.images!, viewModel: viewModel),
          ),
        );
  }
}

class SelectColor extends StatelessWidget {
  const SelectColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final viewModel = context.watch<AddEventViewModel>();
    final state = viewModel.state;

    return Container(
      margin: const EdgeInsets.only(left: 16, right: 9),
      child: GestureDetector(
        onTap: () => colorChoiceBottomSheet(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: const Icon(Icons.palette_outlined, size: 20,)
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    width: 16,
                    height: 16,
                    color: state.color,
                  ),
                )
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 12,
            ),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> colorChoiceBottomSheet(BuildContext context){
  final viewModel = Provider.of<AddEventViewModel>(context, listen: false);
  final selectedColor = viewModel.state.color;

  Widget _colorItem(Color color){
    return GestureDetector(
      onTap: (){
        viewModel(AddEventEvent.updateColor(color));
        Navigator.of(context).pop();
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color
            ),
            width: 42,
            height: 42,
          ),
          color != selectedColor
              ? Container()
              : Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 2),
            ),
          )
        ],
      ),
    );
  }

  Widget _colorItemRow({required List<Color> colors}){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 42, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: colors.map((color) => _colorItem(color)).toList(),
      ),
    );
  }

  return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
      context: context,
      builder: (context){
        return SizedBox(
          height: MediaQuery.of(context).size.height-40,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: selectedColor
                ),
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.clear),
                    ),
                    const Text(
                      'Color',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: const Icon(Icons.settings_outlined),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    _colorItemRow(
                        colors: [
                          Colors.red[900]!,
                          Colors.red[700]!,
                          Colors.red,
                          Colors.red[300]!,
                          Colors.red[100]!,
                        ]
                    ),
                    _colorItemRow(
                        colors: [
                          Colors.amber[900]!,
                          Colors.amber[700]!,
                          Colors.amber,
                          Colors.amber[300]!,
                          Colors.amber[100]!,
                        ]
                    ),
                    _colorItemRow(
                        colors: [
                          Colors.brown[900]!,
                          Colors.brown[700]!,
                          Colors.brown,
                          Colors.brown[300]!,
                          Colors.brown[100]!,
                        ]
                    ),
                    _colorItemRow(
                        colors: [
                          Colors.purple[900]!,
                          Colors.purple[700]!,
                          Colors.purple,
                          Colors.purple[300]!,
                          Colors.purple[100]!,
                        ]
                    ),
                    _colorItemRow(
                        colors: [
                          Colors.blue[900]!,
                          Colors.blue[700]!,
                          Colors.blue,
                          Colors.blue[300]!,
                          Colors.blue[100]!,
                        ]
                    ),
                    _colorItemRow(
                        colors: [
                          Colors.blueGrey[900]!,
                          Colors.blueGrey[700]!,
                          Colors.blueGrey,
                          Colors.blueGrey[300]!,
                          Colors.blueGrey[100]!,
                        ]
                    ),
                    _colorItemRow(
                        colors: [
                          Colors.green[900]!,
                          Colors.green[700]!,
                          Colors.green,
                          Colors.green[300]!,
                          Colors.green[100]!,
                        ]
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }
  );
}
