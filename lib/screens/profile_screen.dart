// import 'package:flutter/material.dart';

// final TextEditingController nameController = TextEditingController();
// final TextEditingController phoneController = TextEditingController();
// final TextEditingController emailController = TextEditingController();
// final TextEditingController changeController = TextEditingController();
// final _formKey = GlobalKey<FormState>();

// class ProfileScreen extends StatefulWidget {
//   ProfileScreen({Key key, this.uid}) : super(key: key);

//   final String uid;

//   @override
//   State<StatefulWidget> createState() {
//     return ProfileScreenState();
//   }
// }

// class ProfileScreenState extends State<ProfileScreen> {
//   // File _image;

//   String displayName;
//   String displayPhoneNumber;
//   String displayEmail;
//   String displayPassword;

//   // Future<FirebaseUser> user = firebaseAuth.currentUser();

//   // get userdata => null;

//   @override
//   Widget build(BuildContext context) {
//     void getUserData() async {
//       var firebaseUser = await FirebaseAuth.instance.currentUser();
//       databaseReference
//           .collection("users")
//           .document(firebaseUser.uid)
//           .get()
//           .then((value) {
//         var userdata = value.data;
//         print('${userdata['name']}');
//       });
//     }

//     // print('${value.data['name']}');
//     // print(Text);

//     //  setState(() {
//     //    nameController.text = value.data["name"];
//     //    emailController.text = value.data["email"];
//     //    phoneController.text = value.data["phoneNumber"];
//     //    passwordController.text = value.data["password"];
//     // });

//     // Text('name: ${document.data['name']}');

//     // initState(){
//     //   super.initState();
//     //   getUserData();
//     // }

//     //  void getUserData()async{
//     //    firebaseAuth.currentUser().then((currentUser)=>
//     //       databaseReference
//     //      .collection("users")
//     //      .document(currentUser.uid)
//     //      .get()
//     //      .then((DocumentSnapshot result){
//     //        if(result != null){
//     //          return Text("Loading..");
//     //        }
//     //        var userdata = result.data;
//     //        setState(() {
//     //         nameController.text = userdata["name"];
//     //         emailController.text = userdata["email"];
//     //         phoneController.text = userdata["phoneNumber"];

//     //        });
//     //      }));
//     //  }

//     Future uploadPic(BuildContext context) async {
//       String fileName = basename(_image.path);
//       StorageReference firebaseStorageRef =
//           FirebaseStorage.instance.ref().child(fileName);
//       StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
//       StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
//       setState(() {
//         print("profile picture uploaded");
//         Scaffold.of(context)
//             .showSnackBar(SnackBar(content: Text('profile picture uploaded')));
//       });
//     }

//     final name = TextFormField(
//       //  onChanged: saveOnChanged,
//       // initialValue: value.data["name"],
//       validator: (value) {
//         if (value.isEmpty) {
//           return 'please enter your name';
//         }
//         // return Text('${userdata['name']}');
//         // return Text('${value.data['name']}');
//         // var text = (!isAlpha(value.toString())) ? 'enter a valid name' : null;
//         // return text;
//       },
//       controller: nameController,
//       decoration: InputDecoration(
//         labelText: 'Name',
//         labelStyle: TextStyle(color: ColorConstants.secondaryColor),
//         contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//         border: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: ColorConstants.secondaryColor,
//             ),
//             borderRadius: const BorderRadius.all(
//               const Radius.circular(0.0),
//             )),
//       ),
//     );
//     final phoneNumber = TextFormField(
//       validator: (value) {
//         if (value.isEmpty) {
//           return 'please enter your phone number';
//         }
//         var text = (!isNumeric(value.toString()))
//             ? 'enter a valid phone number'
//             : null;
//         return text;
//       },
//       controller: phoneController,
//       decoration: InputDecoration(
//         labelText: 'PhoneNumber',
//         labelStyle: TextStyle(color: ColorConstants.secondaryColor),
//         contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//         border: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: ColorConstants.secondaryColor,
//             ),
//             borderRadius: const BorderRadius.all(
//               const Radius.circular(0.0),
//             )),
//       ),
//     );
//     final emailField = TextFormField(
//       validator: (value) {
//         if (value.isEmpty) {
//           return 'please enter your email';
//         }
//         var text =
//             (!isAlphanumeric(value.toString())) ? 'enter a valid email' : null;
//         return text;
//       },
//       controller: emailController,
//       decoration: InputDecoration(
//         labelText: 'Email',
//         labelStyle: TextStyle(color: ColorConstants.secondaryColor),
//         contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//         border: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: ColorConstants.secondaryColor,
//             ),
//             borderRadius: const BorderRadius.all(
//               const Radius.circular(0.0),
//             )),
//       ),
//     );
//     final changePassword = TextFormField(
//       validator: (value) {
//         if (value.isEmpty) {
//           return 'please enter your password';
//         }
//         var text =
//             (!isAlpha(value.toString())) ? 'enter a valid password' : null;
//         return text;
//       },
//       controller: changeController,
//       decoration: InputDecoration(
//         labelText: 'Change password',
//         labelStyle: TextStyle(color: ColorConstants.secondaryColor),
//         contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//         border: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: ColorConstants.secondaryColor,
//             ),
//             borderRadius: const BorderRadius.all(
//               const Radius.circular(0.0),
//             )),
//       ),
//     );
//     final submitButton = Material(
//         elevation: 5.0,
//         borderRadius: BorderRadius.circular(0.0),
//         color: ColorConstants.secondaryColor,
//         child: Builder(builder: (context) {
//           return MaterialButton(
//             onPressed: () {
//               if (_formKey.currentState.validate()) {
//                 Scaffold.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('Saving data'),
//                   ),
//                 );
//               }
//               uploadPic(context);
//             },
//             padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//             child: Text(
//               'Save',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: ColorConstants.primaryColor,
//               ),
//             ),
//           );
//         }));

//     final logout = Material(
//       borderRadius: BorderRadius.circular(0.0),
//       color: ColorConstants.secondaryColor,
//       child: Builder(builder: (context) {
//         return MaterialButton(
//           onPressed: () {
//             // FirebaseAuth auth = FirebaseAuth.instance;
//             // auth.signOut().then((res){
//             //   Navigator.pushReplacement(context,
//             //   MaterialPageRoute(builder: (context) => Login()),
//             //   );

//             // });

//             getUserData();
//           },
//           padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//           child: Text(
//             'Logout',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: ColorConstants.primaryColor,
//             ),
//           ),
//         );
//       }),
//     );

//     Future<void> getImage() async {
//       var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//       setState(() {
//         _image = image;
//         print('image path $_image');
//       });
//     }

//     return Material(
//         child: Container(
//       child: Column(
//         children: <Widget>[
//           Container(
//             height: 200.0,
//             width: 400.0,
//             color: ColorConstants.secondaryColor,
//             child: Padding(
//               padding: const EdgeInsets.only(
//                 left: 20.0,
//                 top: 30.0,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   GestureDetector(
//                     child: CircleAvatar(
//                       radius: 50,
//                       backgroundColor: ColorConstants.primaryColor,
//                       child: ClipOval(
//                         child: SizedBox(
//                           width: 180.0,
//                           height: 180.0,
//                           child: _image == null
//                               ? Icon(Icons.add)
//                               : Image.file(_image, fit: BoxFit.fill),
//                         ),
//                       ),
//                     ),
//                     onTap: getImage,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Container(
//                         child: Text(
//                       "user name",
//                       style: TextStyle(color: ColorConstants.primaryColor),
//                     )),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Form(
//             key: _formKey,
//             child: Expanded(
//               child: ListView(children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(left: 50.0, right: 50.0),
//                   child: Column(children: <Widget>[
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     name,
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     phoneNumber,
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     emailField,
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     changePassword,
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     Row(
//                       children: <Widget>[
//                         submitButton,
//                         Padding(
//                           padding: const EdgeInsets.only(left: 60.0),
//                           child: logout,
//                         ),
//                       ],
//                     ),
//                   ]),
//                 )
//               ]),
//             ),
//           )
//         ],
//       ),
//     ));
//   }
// }
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("hello"),
    );
  }
}
