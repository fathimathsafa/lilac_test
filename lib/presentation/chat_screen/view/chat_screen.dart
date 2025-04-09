import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_test/presentation/chat_screen/controller/chat_controller.dart';
import 'package:provider/provider.dart';
import 'package:lilac_test/repository/chat_screen/model/chat_screen_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {super.key,
      required this.name,
      required this.image,
      required this.active});
  final String name;
  final bool active;

  final dynamic image;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();


  final int currentUserId = 55; 

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ChatController>(context, listen: false).fetchChats(context);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _sendMessage() {
    final message = _controller.text.trim();
    if (message.isNotEmpty) {
      _controller.clear();
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatController>(builder: (context, controller, _) {
      if (!controller.isLoading && controller.chatList.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
      }

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            forceMaterialTransparency: true,
            elevation: 0,
            title: Row(
              children: [
                IconButton(
                  icon:
                      const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: widget.image.isNotEmpty
                      ? NetworkImage(widget.image)
                      : const Icon(Icons.person) as ImageProvider,
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          widget.active ? "Online" : "Offline",
                          style: TextStyle(
                            color: widget.active ? Colors.green : Colors.grey,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Icon(Icons.circle,
                            size: 6,
                            color: widget.active ? Colors.green : Colors.grey),
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Center(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text("Today", style: TextStyle(fontSize: 12.sp)),
                ),
              ),
            ),

            Expanded(
              child: controller.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : controller.chatList.isEmpty
                      ? const Center(child: Text("No messages yet"))
                      : ListView.builder(
                          controller: _scrollController,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          itemCount: controller.chatList.length,
                          itemBuilder: (context, index) {
                            final message = controller.chatList[index];
                            final isSentByMe =
                                message.attributes?.senderId == currentUserId;

                            return _buildMessageBubble(message, isSentByMe);
                          },
                        ),
            ),

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
                        decoration: const InputDecoration(
                          hintText: "Type a message...",
                          border: InputBorder.none,
                        ),
                        onSubmitted: (_) => _sendMessage(),
                      ),
                    ),
                    IconButton(
                      onPressed: _sendMessage,
                      icon: const Icon(Icons.send, color: Colors.pink),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildMessageBubble(ChatModel message, bool isSentByMe) {
    final messageText = message.attributes?.message ?? '';
    final messageTime = message.attributes?.sentAt;

    String formattedTime = '';
    if (messageTime != null) {
      final hour = messageTime.hour.toString().padLeft(2, '0');
      final minute = messageTime.minute.toString().padLeft(2, '0');
      formattedTime = '$hour:$minute';
    }

    return Padding(
      padding: EdgeInsets.only(
          left: isSentByMe ? 80.w : 16.w,
          right: isSentByMe ? 16.w : 80.w,
          bottom: 12.h),
      child: Align(
        alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment:
              isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 250.w),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: BoxDecoration(
                color:
                    isSentByMe ? const Color(0xFFFF4D67) : Colors.grey.shade200,
                borderRadius: isSentByMe
                    ? BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r),
                        bottomLeft: Radius.circular(12.r),
                      )
                    : BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r),
                        bottomRight: Radius.circular(12.r),
                      ),
              ),
              child: Text(
                messageText,
                style: TextStyle(
                  color: isSentByMe ? Colors.white : Colors.black,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment:
                  isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Text(
                  formattedTime,
                  style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                ),
                SizedBox(width: 3),
                Icon(isSentByMe ? Icons.done_all : null,
                    size: 11.sp, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
