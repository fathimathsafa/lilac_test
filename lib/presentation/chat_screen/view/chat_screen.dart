import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              CircleAvatar(
                radius: 20.r,
                backgroundImage: AssetImage('assets/images/avatar1.jpg'),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Regina Bearden",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Online",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(Icons.circle, size: 6, color: Colors.green),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          /// Day tag
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Text("Today", style: TextStyle(fontSize: 12.sp)),
              ),
            ),
          ),

          /// Chat bubble (Right-aligned)
          Padding(
            padding: EdgeInsets.only(left: 80.w, right: 16.w, bottom: 12.h),
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF4D67),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r),
                        bottomLeft: Radius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      "Hi",
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "10:00 AM",
                    style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),

          const Spacer(),

          /// Message Input
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Happy Birthday",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // TODO: Handle send action
                    },
                    icon: Icon(Icons.send, color: Colors.pink),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
