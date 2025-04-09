import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_test/presentation/chat_screen/view/chat_screen.dart';
import 'package:lilac_test/presentation/message_list_screen/controller/message_list_screen_controller.dart';
import 'package:provider/provider.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MessageListController>(context, listen: false)
          .fetchMessages(context);
    });
    super.initState();
  }

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
      body: Consumer<MessageListController>(
        builder: (context, controller, _) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    separatorBuilder: (_, __) => SizedBox(width: 12.w),
                    itemBuilder: (context, index) {
                      final message = controller.messageList[index];
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 24.r,
                            backgroundColor: Colors.black,
                            backgroundImage: NetworkImage(
                            message.attributes?.profilePhotoUrl ?? "",
                          ),
                          ),
                          Text(
                            message.attributes?.name ?? "Unknown",
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                SizedBox(height: 20.h),

                Container(
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 12.w),
                      const Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 8.w),
                      const Expanded(
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

                Expanded(
                  child: ListView.builder(
                    itemCount: controller.messageList.length,
                    itemBuilder: (context, index) {
                      final message = controller.messageList[index];
                      print(message.attributes?.name);
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          radius: 24.r,
                          backgroundColor: Colors.black,
                          backgroundImage: NetworkImage(
                            message.attributes?.profilePhotoUrl ?? "",
                          ),
                        ),
                        title: Text(
                          message.attributes?.name ?? "Unknown",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(name: message.attributes?.name ?? "", active: message.attributes?.isOnline ?? false,image: message.attributes?.profilePhotoUrl ?? ""),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}