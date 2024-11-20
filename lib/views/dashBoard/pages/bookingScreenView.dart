import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swing_sheet/models/drawerModel.dart';
import 'package:swing_sheet/models/drawerModelData.dart';
import 'package:swing_sheet/utilities/appColors.dart';
import 'package:swing_sheet/utilities/textStyles.dart';
import 'package:swing_sheet/viewWidgets/drawerView.dart';
import 'package:swing_sheet/views/bokingDetailsConfirmationScreenView.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingScreenView extends StatefulWidget {
  const BookingScreenView({super.key});

  @override
  State<BookingScreenView> createState() => _BookingScreenViewState();
}

class _BookingScreenViewState extends State<BookingScreenView> {
  String? selectedInstructor;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  List<DrawerModel> drawerDataList = [];

  final List<String> instructors = [
    "Mr. Ali",
    "Dr. Fiaz",
    "Mr. Sameer",
    "Dr. Rafeeq"
  ];

  final List<DateTime> availableDates = [
    DateTime.now(),
    DateTime.now().add(Duration(days: 2)),
    DateTime.now().add(Duration(days: 5)),
    DateTime.now().add(Duration(days: 8)),
  ];

  final List<String> timeSlots = [
    "10:00 AM - 10:30 AM",
    "11:00 AM - 11:30 AM",
    "1:00 PM - 1:30 PM",
    "2:00 PM - 2:30 PM",
    "4:00 PM - 4:30 PM",
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
              icon: Icon(
                CupertinoIcons.profile_circled,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Instructor:", style: textStyleH2(blackColor)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: whiteColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: greenColor, width: 2),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              value: selectedInstructor,
              hint: const Text(
                "Choose an instructor",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              dropdownColor: whiteColor,
              icon: Icon(Icons.arrow_drop_down, color: blackColor),
              items: instructors
                  .map(
                    (name) => DropdownMenuItem(
                      value: name,
                      child: Row(
                        children: [
                          Icon(Icons.person, color: greenColor, size: 20),
                          const SizedBox(width: 10),
                          Text(
                            name,
                            style: textStyleRegular(),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedInstructor = value;
                  selectedDay = null;
                });
              },
            ),
            const SizedBox(height: 16),
            if (selectedInstructor != null) ...[
              Text(
                "Available Booking Dates:",
                style: textStyleH2(blackColor),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: TableCalendar(
                  firstDay: DateTime.now().subtract(const Duration(days: 365)),
                  lastDay: DateTime.now().add(const Duration(days: 365)),
                  focusedDay: focusedDay,
                  selectedDayPredicate: (day) => isSameDay(selectedDay, day),
                  onDaySelected: (selected, focused) {
                    setState(() {
                      selectedDay = selected;
                      focusedDay = focused;
                    });
                  },
                  onPageChanged: (focused) {
                    setState(() {
                      focusedDay = focused;
                    });
                  },
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: blackColor,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: greenColor,
                      shape: BoxShape.circle,
                    ),
                    markerDecoration: BoxDecoration(
                      color: greenColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    leftChevronIcon: const Icon(Icons.chevron_left),
                    rightChevronIcon: const Icon(Icons.chevron_right),
                  ),
                  calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, day, focusedDay) {
                      if (availableDates.contains(day)) {
                        return Center(
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: greenColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${day.day}',
                                style: TextStyle(color: whiteColor),
                              ),
                            ),
                          ),
                        );
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (selectedDay != null) ...[
                Center(
                  child: Text(
                    "Available Time for ${selectedDay!.toLocal().toString().split(' ')[0]}:",
                    style: textStyleBold(blackColor),
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: timeSlots.map((slot) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BookingDetailsConfirmationScreenView(
                              instructorName: selectedInstructor!,
                              bookingDate: selectedDay!,
                              slotTiming: slot,
                              location:
                                  "Green Palms Golf Course 2422 W. Boulevard 90 Dallas, TX 74382",
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Text(slot, style: textStyleBold(whiteColor)),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ]
          ],
        ),
      ),
    );
  }
}
