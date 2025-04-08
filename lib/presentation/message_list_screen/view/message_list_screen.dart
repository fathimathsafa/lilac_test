import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_test/presentation/chat_screen/view/chat_screen.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Messages',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Horizontal profile list
            SizedBox(
              height: 80.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                separatorBuilder: (_, __) => SizedBox(width: 12.w),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CircleAvatar(radius: 24.r, backgroundColor: Colors.black
                          // backgroundImage: AssetImage("assets/images/avatar${index + 1}.jpg"),
                          ),
                      Text(
                        "User ${index + 1}",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ],
                  );
                },
              ),
            ),

            SizedBox(height: 20.h),

            /// Search bar
            Container(
              height: 45.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  SizedBox(width: 12.w),
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            /// Chat List
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                        radius: 24.r, backgroundColor: Colors.black

                        // backgroundImage: AssetImage("assets/images/avatar${index + 1}.jpg"),
                        ),
                    title: Text(
                      "User ${index + 1}",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),
                    ),
                    subtitle: Text(
                      "Last message...",
                      style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                    ),
                    trailing: Text(
                      "10:00 AM",
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(),
                          ));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
