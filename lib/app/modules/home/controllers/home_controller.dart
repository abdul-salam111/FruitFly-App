
import 'package:fruitfly/app/data/getmodels/getFliesModel.dart';
import 'package:fruitfly/app/repositories/getDetectedFlies.dart';
import 'package:fruitfly/app/repositories/uploadImageRepo.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  GetDetectedFliesRepository getDetectedFlies = GetDetectedFliesRepository();
  UploadImageRepository uploadImageRepository = UploadImageRepository();

  var isloading = false.obs;

  //variable for tracking the no of images user uploaded in a plan if it exceeds the limit it means the plan
  //is expired then the graph will be showing. the user have to purchase any of the plan to see the graph
  // var isShowGraph = false.obs;

// // variable to track number of insects, to show the alert popup of spray for the user.
//   var totalQuantityOfInsect = 0.obs;

//   //check for the quanityt and show the popup
//   showPopUp(){
//     if(totalQuantityOfInsect.value>=20){
//       print("exceeded");
//     }
//     else{
//       print("not exceeded");
//     }
//   }

//Objec to store the data of no of images
  // var countOfImages = GetCountModel().obs;

  // Future<void> getNoOfImages() async {
  //   isloading.value = true;
  //   try {
  //     countOfImages.value = await uploadImageRepository.getImageCount();
  //     if (countOfImages.value.payload![0].numberImageUpload !=
  //         int.parse(countOfImages
  //             .value.payload![0].user!.plans![0].numberOfImages!)) {
  //       isShowGraph.value = true;
  //     } else {
  //       isShowGraph.value = false;
  //     }
  //   } finally {
  //     isloading.value = false;
  //   }
  // }

  //get flies data that user have uploaded, the result will be fetched in this api.

  Future<GetFliesModel> getFlies(context) async {
    return getDetectedFlies.fetchDetectedFlies();
  }

  var dates = <DateTime>[].obs;
  var quantities = <int>[0, 10, 20, 30, 40, 50];

  @override
  void onInit() {
    super.onInit();
    // Load initial data or fetch from an API
    loadData();
    // getNoOfImages();
  }

  void loadData() async {
    // Sample data
    GetFliesModel getFliesModel = await getDetectedFlies.fetchDetectedFlies();

    for (int i = 0; i < getFliesModel.payload!.length; i++) {
      dates.add(getFliesModel.payload![i].dateTime!);
      quantities.add(getFliesModel.payload![i].quantity!);
      // print(getFliesModel.payload![i].dateTime!);
      // print(getFliesModel.payload![i].quantity!);
    }
  }
// var data = <Map<String, dynamic>>[].obs;

// @override
// void onInit() {
//   super.onInit();
//   // Add data from API
//   addDataFromAPI();
// }

// void addDataFromAPI() async {
//   GetFliesModel datas = await getDetectedFlies.fetchDetectedFlies();

//   List<int> quantity = [10, 20, 30, 40, 50]; // Ensure the quantity list is the same length as datas.payload!

//   for (int i = 0; i < datas.payload!.length; i++) {
//     data.add({
//       'date': datas.payload![i].dateTime!.millisecondsSinceEpoch,
//       'quantity': (quantity[i]).toDouble(),
//     });
//   }
// }

// List<FlSpot> get chartData => data
//   .map((entry) => FlSpot(
//       entry['date'].toDouble(),
//       entry['quantity'],
//   ))
//   .toList();


}
