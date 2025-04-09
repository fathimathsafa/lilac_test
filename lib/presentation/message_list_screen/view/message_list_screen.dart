import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lilac_test/core/constants/colors.dart';
import 'package:lilac_test/core/constants/text_styles.dart';
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: ColorTheme.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Messages',
          style: GLTextStyles.headline2(context),
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
                  height: 90.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    separatorBuilder: (_, __) => SizedBox(width: 12.w),
                    itemBuilder: (context, index) {
                      final message = controller.messageList[index];
                      return Column(
                        children: [
                          Flexible(
                            child: CircleAvatar(
                              radius: 24.r,
                              backgroundColor: Colors.black,
                              backgroundImage: NetworkImage(
                                message.attributes?.profilePhotoUrl ?? "",
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              message.attributes?.name ?? "Unknown",
                              style: GoogleFonts.urbanist(
                                  fontSize: 12.sp, color: ColorTheme.black),
                            ),
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
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle:
                                GoogleFonts.urbanist(color: ColorTheme.black),
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
                          style: GoogleFonts.urbanist(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                          ),
                        ),
                        trailing: Text(
                          message.attributes?.messageReceivedFromPartnerAt !=
                                  null
                              ? DateFormat.jm().format(message
                                  .attributes!.messageReceivedFromPartnerAt!)
                              : "",
                          style: GoogleFonts.urbanist(
                            color: Colors.grey,
                            fontSize: 13.sp,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                  name: message.attributes?.name ?? "",
                                  active: message.attributes?.isOnline ?? false,
                                  image: message.attributes?.profilePhotoUrl ??
                                      ""),
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
