import 'package:get/get.dart';


class PressedState extends GetxController {
  RxBool pressedBool = true.obs;
  RxBool pressedBoolTableView = true.obs;

  void changeStatus() {
    pressedBool.toggle();
  }

  void tableView() {
    pressedBoolTableView.toggle();
  }
}