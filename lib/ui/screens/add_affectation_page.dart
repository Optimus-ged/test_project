import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

class AddAffectation extends StatefulWidget {
  const AddAffectation({Key key}) : super(key: key);

  @override
  _AddAffectationState createState() => _AddAffectationState();
}

class _AddAffectationState extends State<AddAffectation> {
  io.File _image;
  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = io.File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[50],
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).padding.top,
              color: Colors.white,
            ),
            _buildAppBar(context),
            _buildContent(context)
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.only(left: 5),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: EdgeInsets.all(10),
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(180 / 360),
                child: Icon(Icons.arrow_right_alt),
              ),
            ),
          ),
          Text('Creer une affectation')
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                // color: Colors.amber,
                padding: EdgeInsets.only(bottom: 20, top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      _loginInput(color: Colors.blue[50], hint: 'Nom participant'),
                      _loginInput(color: Colors.blue[50], hint: 'tache attribuee'),
                      _loginInput(color: Colors.blue[50], hint: 'role')
                    ],
                  ),
                ),
              ),
            ),
            _buildButton(context),
          ],
        ),
      ),
    );
  }

 
  Widget _loginInput(
      {Color color,
      String hint,
      bool isPassword = false,
      bool isLogin = false,
      VoidCallback onTap,
      TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
      child: Container(
        height: 55,
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 15, right: !isPassword ? 15 : 0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                obscureText: isLogin,
                style: TextStyle(fontWeight: FontWeight.w600),
                decoration: InputDecoration.collapsed(
                  hintText: '$hint',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            if (isPassword)
              InkWell(
                onTap: onTap,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.remove_red_eye_sharp,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 0, left: 20, right: 20),
      alignment: Alignment.bottomCenter,
      child: Material(
        elevation: 4,
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            // color: CustomTheme.redColor,
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            // onTap: () => _loginBtnPressed(),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddAffectation(),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.save, color: Colors.white),
                SizedBox(width: 5),
                Text(
                  'Enregistrer',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
