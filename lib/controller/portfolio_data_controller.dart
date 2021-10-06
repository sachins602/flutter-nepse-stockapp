import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jsonproject/controller/common_dailog.dart';
import 'package:jsonproject/models/porfolio_model.dart';


class DataController extends GetxController{
  final firebaseInstance = FirebaseFirestore.instance;
  var currentUser = FirebaseAuth.instance.currentUser;
  List<PortfolioModel> loginUserData = [];

  Map userProfileData ={'firstName': '', 'email': ''};
  void onReady(){
    super.onReady();
    getUserProfileData();
  }
  Future<void> getUserProfileData() async {
    // print("user id ${authController.userId}");
    try {
      var response = await firebaseInstance
          .collection('users')
          .where('uid', isEqualTo: currentUser!.uid)
          .get();
      // response.docs.forEach((result) {
      //   print(result.data());
      // });
      if (response.docs.length > 0) {
        userProfileData['firstName'] = response.docs[0]['firstName'];
        userProfileData['email'] = response.docs[0]['email'];
      }
      print(userProfileData);
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    }
  }

  Future<void> addNewStock(Map stockdata) async {

    try {
      CommonDialog.showLoading();
      var response = await firebaseInstance.collection('portfoliolist').add({
        'stock_symbol': stockdata['stock_symbol'],
        'stock_amount': stockdata['stock_amount'],
       // 'stock_type': stockdata['stock_type'],
        'uid': currentUser!.uid,
      });
      print("Firebase response1111 $response");
      CommonDialog.hideLoading();
      Get.back();
    } catch (exception) {
      CommonDialog.hideLoading();
      print("Error Saving Data at firestore $exception");
    }
  }

  Future<void> getLoginUserProduct() async {
    print("loginUserData Yes $loginUserData");
    loginUserData = [];
    try {
      CommonDialog.showLoading();
      final List<PortfolioModel> loadedStock = [];
      var response = await firebaseInstance
          .collection('portfoliolist')
          .where('uid', isEqualTo: currentUser!.uid)
          .get();

      if (response.docs.length > 0) {
        response.docs.forEach(
              (result) {
            print(result.data());
            print("Product ID  ${result.id}");
            loadedStock.add(
              PortfolioModel(
                  companyId: result.id,
                  uid : result.data()['uid'],
                  companySymbol : result.data()['stock_symbol'],
                  totalStock : result.data()['stock_amount'],
                //  stockType : result.data()['stock_type'],
              ),
            );
          },
        );
      }
      loginUserData.addAll(loadedStock);
      update();
      CommonDialog.hideLoading();

    } on FirebaseException catch (e) {
      CommonDialog.hideLoading();
      print("Error $e");
    } catch (error) {
      CommonDialog.hideLoading();
      print("error $error");
    }
  }

  Future editProduct(companyId, price) async {
    print("Product Id  $companyId");
    try {
      CommonDialog.showLoading();
      await firebaseInstance
          .collection("portfoliolist")
          .doc(companyId)
          .update({"stock_amount": price}).then((_) {
        CommonDialog.hideLoading();
        getLoginUserProduct();
      });
    } catch (error) {
      CommonDialog.hideLoading();
      CommonDialog.showErrorDialog();

      print(error);
    }
  }
  Future deleteProduct(String companyId) async {
    print("Product Iddd  $companyId");
    try {
      CommonDialog.showLoading();
      await firebaseInstance
          .collection("portfoliolist")
          .doc(companyId)
          .delete()
          .then((_) {
        CommonDialog.hideLoading();
        getLoginUserProduct();
      });
    } catch (error) {
      CommonDialog.hideLoading();
      CommonDialog.showErrorDialog();
      print(error);
    }
  }




}