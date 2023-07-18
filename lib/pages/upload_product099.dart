import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'bottom_nav.dart';

class ProductUploadPage extends StatefulWidget {
  @override
  _ProductUploadPageState createState() => _ProductUploadPageState();
}

class _ProductUploadPageState extends State<ProductUploadPage> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _availableColorsController = TextEditingController();
  final TextEditingController _releaseDateController = TextEditingController();
  final TextEditingController _sellerAddressController = TextEditingController();
  List<File> _selectedImages = [];

  Future<void> _uploadProduct() async {

    String? midID = FirebaseAuth.instance.currentUser?.uid;
    String userID = midID.toString();
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signInAnonymously();
    String productName = _productNameController.text;
    String productPrice = _productPriceController.text;
    String availableColors = _availableColorsController.text;
    String releaseDate = _releaseDateController.text; 
    String sellerAddress = _sellerAddressController.text;
    List<File> selectedImages = _selectedImages;
    List<String> imageUrls = await Future.wait(
      selectedImages.map((image) async {
        final imagePath =
        await FirebaseStorage.instance.ref().child('products').child(image.path).putFile(image);
        return await imagePath.ref.getDownloadURL();
      }),
    );
    await FirebaseFirestore.instance.collection('products').add({
      'productName': productName,
      'productPrice': productPrice,
      'availableColors': availableColors,
      'releaseDate': releaseDate,
      'sellerAddress': sellerAddress,
      'imageUrls': imageUrls,
      'userID' : userID,
    });
    // Show a snackbar to indicate that the product has been uploaded
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Product uploaded successfully'),
      ),
    );
  }


  Future<void> _pickImages() async {
    final ImagePicker _picker = ImagePicker();
    List<XFile>? images = await _picker.pickMultiImage(
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 80,
    );

    if (images != null) {
      setState(() {
        _selectedImages = images.map((image) => File(image.path)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload Product',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _productNameController,
                    decoration: InputDecoration(
                      hintText: 'Product Name',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _productPriceController,
                    decoration: InputDecoration(
                      hintText: 'Product Price',
                      prefixText: '\$',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _availableColorsController,
                    decoration: InputDecoration(
                      hintText: 'Available Colors',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _releaseDateController,
                    decoration: InputDecoration(
                      hintText: 'Release Date',
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _sellerAddressController,
                    decoration: InputDecoration(
                      hintText: 'Seller Address',
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Selected Images:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _selectedImages.map((image) {
                      return SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.file(image, fit: BoxFit.cover),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _pickImages,
                    child: Text('Select Images'),
                  ),
                  SizedBox(height: 16),

                ],
              ),
           ),
        SizedBox(height: 80,),
        Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNav())),


                  style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromHeight(70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text('Cancel', style: TextStyle(fontSize: 20, color: Colors.black),),
                ),
              ),

              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    _uploadProduct();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNav()));

                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromHeight(70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0), // Set the borderRadius to 0 for rectangle shape
                      ),
                      primary: Color.fromRGBO(219, 185, 88, 1)
                  ),
                  child: Text('Upload', style: TextStyle(fontSize: 20, color: Colors.white),),
                ),
              ),
            ],
          ),],
        ),
      ),
    );
  }
}