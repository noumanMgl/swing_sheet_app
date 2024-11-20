import 'package:swing_sheet/models/homeContainerModel.dart';

List<HomeContainerModel> getInstructorHomeContainerModelData(context) {
  List<HomeContainerModel> instructorHomeContainerModelData = [];

  instructorHomeContainerModelData.add(HomeContainerModel(
      imagePath: "assets/homeImages/calendarImage.jpeg", title: "Calendar"));
  instructorHomeContainerModelData.add(HomeContainerModel(
      imagePath: "assets/homeImages/studentImage.jpg", title: "Instructors"));
  instructorHomeContainerModelData.add(HomeContainerModel(
      imagePath: "assets/homeImages/bookingImage.jpg", title: "Booking"));
  instructorHomeContainerModelData.add(HomeContainerModel(
      imagePath: "assets/homeImages/profileImage.jpeg", title: "Profile"));
  instructorHomeContainerModelData.add(HomeContainerModel(
      imagePath: "assets/homeImages/locationImage.jpg", title: "Location"));
  instructorHomeContainerModelData.add(HomeContainerModel(
      imagePath: "assets/homeImages/mediaImage.jpeg", title: "Media"));

  return instructorHomeContainerModelData;
}

List<HomeContainerModel> getStudentHomeContainerModelData(context) {
  List<HomeContainerModel> studentHomeContainerModelData = [];

  studentHomeContainerModelData.add(HomeContainerModel(
      imagePath: "assets/homeImages/calendarImage.jpeg", title: "Calendar"));
  studentHomeContainerModelData.add(HomeContainerModel(
      imagePath: "assets/homeImages/studentImage.jpg", title: "Students"));
  studentHomeContainerModelData.add(HomeContainerModel(
      imagePath: "assets/homeImages/bookingImage.jpg", title: "Booking"));
  studentHomeContainerModelData.add(HomeContainerModel(
      imagePath: "assets/homeImages/profileImage.jpeg", title: "Profile"));
  studentHomeContainerModelData.add(HomeContainerModel(
      imagePath: "assets/homeImages/locationImage.jpg", title: "Location"));
  studentHomeContainerModelData.add(HomeContainerModel(
      imagePath: "assets/homeImages/mediaImage.jpeg", title: "Media"));

  return studentHomeContainerModelData;
}
