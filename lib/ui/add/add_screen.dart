import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:storyappsdicoding/ui/add/upload_provider.dart';
import 'package:storyappsdicoding/ui/home/home_provider.dart';
import 'package:storyappsdicoding/utils/common.dart';
import 'package:storyappsdicoding/utils/resource_helpers/colors.dart';
import 'package:storyappsdicoding/utils/result_state.dart';
import 'package:storyappsdicoding/widget/custom_dialog.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddScreen> {
  late TextEditingController _descriptionController;
  late TextEditingController _locationController;
  late final UploadProvider _uploadProvider;
  late final HomeProvider _homeProvider;
  LatLng? _pickedLocation;
  XFile? _selectedImage;
  bool isPressed = false;

  listenImageUploadState() {
    _uploadProvider.addListener(imageUploadState);
  }

  imageUploadState() {
    if (mounted) {
      if (_uploadProvider.state == ResultState.loading) {
        showLoadingDialog(context);
      } else if (_uploadProvider.state == ResultState.error) {
        GoRouter.of(context).pop();
        showErrorDialog(context, _uploadProvider.message);
      } else if (_uploadProvider.state == ResultState.success) {
        _homeProvider.getStories(isRefresh: true);
        GoRouter.of(context).go('/home');
      }
    }
  }

  _pickImage(bool isFromGallery) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(
        source: isFromGallery ? ImageSource.gallery : ImageSource.camera);
    if (image != null) {
      return image;
    }
  }

  _uploadImage() async {
    _selectedImage!.readAsBytes().then((value) {
      final fileName = _selectedImage!.path.split('/').last;
      _uploadProvider.addStory(value, fileName, _descriptionController.text,
          _pickedLocation!.latitude, _pickedLocation!.longitude);
    });
  }

  showImagePickerDialog() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    _pickImage(false).then((value) {
                      setState(() {
                        _selectedImage = value;
                      });
                      GoRouter.of(context).pop();
                    });
                  },
                  leading: const Icon(Icons.camera_alt),
                  title: Text(
                      AppLocalizations.of(context)?.cameraStory ?? "Camera"),
                ),
                ListTile(
                  onTap: () {
                    _pickImage(true).then((value) {
                      setState(() {
                        _selectedImage = value;
                      });
                      GoRouter.of(context).pop();
                    });
                  },
                  leading: const Icon(Icons.photo),
                  title: Text(AppLocalizations.of(context)?.galleryStory ??
                      "Gallery Story"),
                ),
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    _uploadProvider = Provider.of<UploadProvider>(context, listen: false);
    _homeProvider = Provider.of<HomeProvider>(context, listen: false);
    listenImageUploadState();
    _descriptionController = TextEditingController();
    _locationController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.addScreen ?? 'Add Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          GestureDetector(
            onTap: () {
              showImagePickerDialog();
            },
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: _selectedImage != null
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(File(_selectedImage!.path)))
                    : null,
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: _selectedImage == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.upload_file,
                          size: 50,
                        ),
                        const SizedBox(height: 10),
                        Text(AppLocalizations.of(context)?.addPhoto ?? ''),
                      ],
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 20),
          // PICK LOCATION FORM
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              readOnly: true,
              onTap: () async {
                final LatLng? pickedLocation = await GoRouter.of(context)
                    .pushNamed('pick-location') as LatLng?;
                if (pickedLocation != null) {
                  final placeMarks = await placemarkFromCoordinates(
                      pickedLocation.latitude, pickedLocation.longitude);
                  setState(() {
                    final placeMark = placeMarks.first;
                    _pickedLocation = pickedLocation;
                    _locationController.text =
                        '${placeMark.street},${placeMark.subLocality},${placeMark.subAdministrativeArea},${placeMark.administrativeArea}';
                  });
                }
              },
              controller: _locationController,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.addressStory,
                fillColor: Colors.grey[200],
                filled: true,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText:
                      AppLocalizations.of(context)?.descriptionStory ?? '',
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                ),
              )),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () {
                if (_selectedImage != null &&
                    _descriptionController.text.isNotEmpty &&
                    _pickedLocation != null) {
                  FocusScope.of(context).unfocus();
                  _uploadImage();
                } else {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          AppLocalizations.of(context)?.pleaseFillAllFields ??
                              "Please Fill All Fields"),
                    ));
                  }
                }
                setState(() {
                  isPressed = true;
                });
                Timer(const Duration(seconds: 1), () {
                  setState(() {
                    isPressed = false;
                  });
                });
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: Text(
                AppLocalizations.of(context)?.uploadStory ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: isPressed
                    ? Colors.orangeAccent : Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
