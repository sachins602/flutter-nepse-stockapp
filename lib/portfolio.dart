import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:jsonproject/json_api_entry.dart';
import 'package:jsonproject/main.dart';
import 'package:jsonproject/models/porfolio_model.dart';
import 'package:jsonproject/models/user_model.dart';
import 'package:jsonproject/parsing_json.dart';
import 'package:jsonproject/widget/addstock_screen.dart';
import 'package:get/get.dart';
import 'controller/portfolio_data_controller.dart';

class PortfolioContainer extends StatefulWidget {
  const PortfolioContainer({Key? key}) : super(key: key);

  @override
  _PortfolioContainerState createState() => _PortfolioContainerState();
}

class _PortfolioContainerState extends State<PortfolioContainer> {
  final DataController controller = Get.find();

  final editStockValue = TextEditingController();
  List<LiveNepseData> characterList = new List<LiveNepseData>.empty(growable: true);

  editProduct(companyId, totalStock) {
    editStockValue.text = totalStock.toString();
    Get.bottomSheet(
      ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        child: Container(
          color: Color(0xFF1F1F21),
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: "Enter Updated total Stocks",
                      labelStyle: TextStyle(color: Colors.white)),
                  controller: editStockValue,
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                    controller.editProduct(companyId, editStockValue.text);
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getLiveNepsedatafromApi() async {
    LiveNepseApi.getNepseData().then((response) {
      if(this.mounted) {
        setState(() {
          Iterable list = json.decode(response.body);
          characterList = list.map((model) => LiveNepseData.fromJson(model)).toList();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getLiveNepsedatafromApi();

  }
  compareSymbol(){

  }
  //
  // final List<PortfolioModel> portfolioModel = [
  //   //PortfolioModel(companySymbol: 'adbl', totalStock: 100, stockType: 'ipo')
  // ];
  // User? user = FirebaseAuth.instance.currentUser;
  // UserModel loggedInUser = UserModel();
  //
  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(user!.uid)
  //       .get()
  //       .then((value) {
  //     this.loggedInUser = UserModel.fromMap(value.data());
  //     setState(() {});
  //   });
  // }
  // Future<void> showInformationDialog(BuildContext context) async{
  //   return await showDialog(context: context,
  //   builder: (context){
  //     final TextEditingController _textEditingController = TextEditingController();
  //     return AlertDialog(
  //       scrollable: true,
  //       content: Form(child: Container(
  //         height: 150,
  //         width: 300,
  //         child: Column(
  //           children: [
  //             TextFormField(
  //               controller: _textEditingController,
  //               validator: (value){
  //                 return value!.isNotEmpty ? null : "Invalid Field";
  //               },
  //               decoration: InputDecoration(hintText: "Number of Stocks"),
  //             ),
  //
  //             TextFormField(
  //               controller: _textEditingController,
  //               validator: (value){
  //                 return value!.isNotEmpty ? null : "Invalid Field";
  //               },
  //               decoration: InputDecoration(hintText: "Number of Stocks"),
  //             ),
  //             TextFormField(
  //               controller: _textEditingController,
  //               validator: (value){
  //                 return value!.isNotEmpty ? null : "Invalid Field";
  //               },
  //               decoration: InputDecoration(hintText: "Stock Type"),
  //             ),
  //           ],
  //         ),
  //       ),),
  //       actions: <Widget>[
  //         TextButton(
  //           child: Text('Enter'),
  //           onPressed: (){
  //             Navigator.of(context).pop();
  //           },
  //         )
  //       ],
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.getLoginUserProduct();
    });

    return Scaffold(
      backgroundColor: Color(0xFF181D2A),
      appBar: AppBar(
        backgroundColor: Color(0xFF1F1F21),
        title: Text(''),
        actions: [
          IconButton(
            alignment: Alignment.center,
            onPressed: () {
              Get.to(() => AddStockScreen());
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: GetBuilder<DataController>(
        builder: (controller) => controller.loginUserData.isEmpty
            ? Center(
                child: Text(
                  ' NO DATA FOUND LOG IN OR ADD DATA !!',
                  style: TextStyle(color: Colors.white),
                ),
              )
            : ListView.builder(
                itemCount: controller.loginUserData.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Company Symbol: ${controller.loginUserData[index].companySymbol}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Total Stock: ${controller.loginUserData[index].totalStock}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  // Text(
                                  //   'Stock Type: ${controller.loginUserData[index].stockType}',
                                  //   style:
                                  //       TextStyle(fontWeight: FontWeight.bold),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  editProduct(
                                      controller.loginUserData[index].companyId,
                                      controller
                                          .loginUserData[index].totalStock);
                                },
                                child: Text('Edit'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  controller.deleteProduct(controller
                                      .loginUserData[index].companyId!);
                                },
                                child: Text('Delete'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}

//  checkUserLogin(){
//   if(user == null){
//     return Container(
//       color: Color(0xFF3D4D4E),
//       width: MediaQuery
//           .of(context)
//           .size
//           .width,
//       height: MediaQuery
//           .of(context)
//           .size
//           .height,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Text("User not logged in"),
//
//               ],
//             ),
//
//           ),
//           FloatingActionButton(
//             backgroundColor: Colors.green,
//             child: Icon(Icons.add),
//             onPressed: () {
//
//             },
//           ),
//
//         ],
//       ),
//     );
//   } else{
//     return Container(
//       color: Color(0xFF3D4D4E),
//       width: MediaQuery
//           .of(context)
//           .size
//           .width,
//       height: MediaQuery
//           .of(context)
//           .size
//           .height,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           Container(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Text("User logged in"),
//
//               ],
//             ),
//
//           ),
//           FloatingActionButton(
//             backgroundColor: Colors.green,
//             child: Icon(Icons.add),
//             onPressed: () {
//               logout(context);
//
//             },
//           ),
//
//         ],
//       ),
//     );
//   }
// }

// Container(
// color: Color(0xFF3D4D4E),
// width: MediaQuery
//     .of(context)
// .size
//     .width,
// height: MediaQuery
//     .of(context)
// .size
//     .height,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: <Widget>[
// Container(
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: <Widget>[
// Text("This is for Portfolio"),
//
// ],
// ),
//
// ),
// FloatingActionButton(
// backgroundColor: Colors.green,
// child: Icon(Icons.add),
// onPressed: () {
//
// },
// ),
//
// ],
// ),
// );

// Widget build(BuildContext context) {
//   return StreamBuilder(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       // ignore: missing_return
//       builder: (context, userSnapshot) {
//         if (userSnapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (userSnapshot.connectionState == ConnectionState.active) {
//           if (userSnapshot.hasData) {
//             print('The user is already logged in');
//             return MainScreens();
//           } else  {
//             print('The user didn\'t login yet');
//             return LandingPage();
//           }
//         } else if (userSnapshot.hasError) {
//           return Center(
//             child: Text('Error occured'),
//           );
//         }
//       });
// }

//
// final _auth = FirebaseAuth.instance;
//
// // our form key
// final _formKey = GlobalKey<FormState>();
// // editing Controller
// final firstNameEditingController = new TextEditingController();
// final secondNameEditingController = new TextEditingController();
// final emailEditingController = new TextEditingController();
// final passwordEditingController = new TextEditingController();
// final confirmPasswordEditingController = new TextEditingController();
//
// @override
// Widget build(BuildContext context) {
//   //first name field
//   final firstNameField = TextFormField(
//       autofocus: false,
//       controller: firstNameEditingController,
//       keyboardType: TextInputType.name,
//       validator: (value) {
//         RegExp regex = new RegExp(r'^.{3,}$');
//         if (value!.isEmpty) {
//           return ("First Name cannot be Empty");
//         }
//         if (!regex.hasMatch(value)) {
//           return ("Enter Valid name(Min. 3 Character)");
//         }
//         return null;
//       },
//       onSaved: (value) {
//         firstNameEditingController.text = value!;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.account_circle),
//         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         hintText: "First Name",
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ));
//
//   //second name field
//   final secondNameField = TextFormField(
//       autofocus: false,
//       controller: secondNameEditingController,
//       keyboardType: TextInputType.name,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return ("Second Name cannot be Empty");
//         }
//         return null;
//       },
//       onSaved: (value) {
//         secondNameEditingController.text = value!;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.account_circle),
//         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         hintText: "Second Name",
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ));
//
//   //email field
//   final emailField = TextFormField(
//       autofocus: false,
//       controller: emailEditingController,
//       keyboardType: TextInputType.emailAddress,
//       validator: (value) {
//         if (value!.isEmpty) {
//           return ("Please Enter Your Email");
//         }
//         // reg expression for email validation
//         if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//             .hasMatch(value)) {
//           return ("Please Enter a valid email");
//         }
//         return null;
//       },
//       onSaved: (value) {
//         firstNameEditingController.text = value!;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.mail),
//         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         hintText: "Email",
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ));
//
//   //password field
//   final passwordField = TextFormField(
//       autofocus: false,
//       controller: passwordEditingController,
//       obscureText: true,
//       validator: (value) {
//         RegExp regex = new RegExp(r'^.{6,}$');
//         if (value!.isEmpty) {
//           return ("Password is required for login");
//         }
//         if (!regex.hasMatch(value)) {
//           return ("Enter Valid Password(Min. 6 Character)");
//         }
//       },
//       onSaved: (value) {
//         firstNameEditingController.text = value!;
//       },
//       textInputAction: TextInputAction.next,
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.vpn_key),
//         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         hintText: "Password",
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ));
//
//   //confirm password field
//   final confirmPasswordField = TextFormField(
//       autofocus: false,
//       controller: confirmPasswordEditingController,
//       obscureText: true,
//       validator: (value) {
//         if (confirmPasswordEditingController.text !=
//             passwordEditingController.text) {
//           return "Password don't match";
//         }
//         return null;
//       },
//       onSaved: (value) {
//         confirmPasswordEditingController.text = value!;
//       },
//       textInputAction: TextInputAction.done,
//       decoration: InputDecoration(
//         prefixIcon: Icon(Icons.vpn_key),
//         contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         hintText: "Confirm Password",
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ));
//
//   //signup button
//   final signUpButton = Material(
//     elevation: 5,
//     borderRadius: BorderRadius.circular(30),
//     color: Colors.redAccent,
//     child: MaterialButton(
//         padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
//         minWidth: MediaQuery.of(context).size.width,
//         onPressed: () {
//           signUp(emailEditingController.text, passwordEditingController.text);
//         },
//         child: Text(
//           "SignUp",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//               fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
//         )),
//   );
//
//   return Scaffold(
//     backgroundColor: Colors.white,
//     appBar: AppBar(
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       leading: IconButton(
//         icon: Icon(Icons.arrow_back, color: Colors.red),
//         onPressed: () {
//           // passing this to our root
//           Navigator.of(context).pop();
//         },
//       ),
//     ),
//     body: Center(
//       child: SingleChildScrollView(
//         child: Container(
//           color: Colors.white,
//           child: Padding(
//             padding: const EdgeInsets.all(36.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   SizedBox(
//                       height: 180,
//                       child: Icon(Icons.account_balance_outlined, size: 100,)),
//                   SizedBox(height: 45),
//                   firstNameField,
//                   SizedBox(height: 20),
//                   secondNameField,
//                   SizedBox(height: 20),
//                   emailField,
//                   SizedBox(height: 20),
//                   passwordField,
//                   SizedBox(height: 20),
//                   confirmPasswordField,
//                   SizedBox(height: 20),
//                   signUpButton,
//                   SizedBox(height: 15),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
//
// void signUp(String email, String password) async {
//   if (_formKey.currentState!.validate()) {
//     await _auth
//         .createUserWithEmailAndPassword(email: email, password: password)
//         .then((value) => {postDetailsToFirestore()})
//         .catchError((e) {
//       Fluttertoast.showToast(msg: e!.message);
//     });
//   }
// }
//
// postDetailsToFirestore() async {
//   // calling our firestore
//   // calling our user model
//   // sedning these values
//
//   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//   User? user = _auth.currentUser;
//
//   UserModel userModel = UserModel();
//
//   // writing all the values
//   userModel.email = user!.email;
//   userModel.uid = user.uid;
//   userModel.firstName = firstNameEditingController.text;
//   userModel.secondName = secondNameEditingController.text;
//
//   await firebaseFirestore
//       .collection("users")
//       .doc(user.uid)
//       .set(userModel.toMap());
//   Fluttertoast.showToast(msg: "Account created successfully :) ");
//
//   Navigator.pushAndRemoveUntil(
//       (context),
//       MaterialPageRoute(builder: (context) => ScaffoldWidgetForHome()),
//           (route) => false);
// }
