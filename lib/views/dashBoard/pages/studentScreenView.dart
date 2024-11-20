import 'package:flutter/material.dart';
import 'package:swing_sheet/models/drawerModel.dart';
import 'package:swing_sheet/models/drawerModelData.dart';
import 'package:swing_sheet/utilities/appColors.dart';
import 'package:swing_sheet/viewWidgets/drawerView.dart';
import 'package:swing_sheet/views/inviteStudentScreenView.dart';

class StudentScreenView extends StatefulWidget {
  const StudentScreenView({super.key});

  @override
  State<StudentScreenView> createState() => _StudentScreenViewState();
}

class _StudentScreenViewState extends State<StudentScreenView> {
  List<DrawerModel> drawerDataList = [];
  final List<Map<String, String>> students = [
    {
      "name": "John Doe",
      "phone": "+1 xxx-xxx-xxx",
      "email": "john.doe@example.com",
      "status": "Active",
      "image": "assets/images/profile.png",
    },
    {
      "name": "Jane Smith",
      "phone": "+1 xxx-xxx-xxx",
      "email": "jane.smith@example.com",
      "status": "Invited",
      "image": "assets/images/profile.png",
    },
    {
      "name": "Alice Brown",
      "phone": "+1 xxx-xxx-xxx",
      "email": "alice.brown@example.com",
      "status": "Active",
      "image": "assets/images/profile.png",
    },
    {
      "name": "John Doe",
      "phone": "+1 xxx-xxx-xxx",
      "email": "john.doe@example.com",
      "status": "Active",
      "image": "assets/images/profile.png",
    },
    {
      "name": "Jane Smith",
      "phone": "+1 xxx-xxx-xxx",
      "email": "jane.smith@example.com",
      "status": "Invited",
      "image": "assets/images/profile.png",
    },
    {
      "name": "Alice Brown",
      "phone": "+1 xxx-xxx-xxx",
      "email": "alice.brown@example.com",
      "status": "Active",
      "image": "assets/images/profile.png",
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    drawerDataList = getDrawerData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      drawer: drawerView(context, drawerDataList),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: blackColor,
        title: Image.asset(
          "assets/images/appBanner.png",
          width: 200,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle, color: blackColor),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("My Students",
                    style: TextStyle(
                        color: blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InviteStudentScreenView(),
                        ));
                  },
                  icon: Icon(
                    Icons.person_add_alt_1,
                    color: blackColor,
                    size: 28,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey[600]),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search students...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: students.length,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  final student = students[index];
                  return buildStudentTile(
                    student["name"]!,
                    student["phone"]!,
                    student["email"]!,
                    student["status"]!,
                    student["image"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStudentTile(
    String name,
    String phone,
    String email,
    String status,
    String image,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200]!,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: 30,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                    ),
                    Icon(Icons.call,
                        color: status == "Active"
                            ? blackColor
                            : orangeColor.withOpacity(0.3)),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      phone,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    Icon(Icons.message,
                        color: status == "Active"
                            ? blackColor
                            : orangeColor.withOpacity(0.3)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    Icon(Icons.mail,
                        color: status == "Active"
                            ? blackColor
                            : orangeColor.withOpacity(0.3)),
                  ],
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: status == "Active"
                        ? greenColor.withOpacity(0.3)
                        : orangeColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: status == "Active" ? greenColor : orangeColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
