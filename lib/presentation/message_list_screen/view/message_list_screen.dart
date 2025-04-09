// user_profile_screen.dart
import 'package:flutter/material.dart';
import 'package:lilac_test/repository/message_list_screen/model/message_list_screen_model.dart';
import 'package:lilac_test/repository/message_list_screen/service/message_list_screen_service.dart';
import 'package:provider/provider.dart';


class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch data when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserProfileProvider>(context, listen: false).fetchUserProfiles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profiles'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => Provider.of<UserProfileProvider>(context, listen: false).refreshUserProfiles(),
          ),
        ],
      ),
      body: Consumer<UserProfileProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (provider.error.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${provider.error}',
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => provider.refreshUserProfiles(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          
          if (provider.userProfiles.isEmpty) {
            return const Center(child: Text('No user profiles found'));
          }
          
          return ListView.builder(
            itemCount: provider.userProfiles.length,
            itemBuilder: (context, index) {
              final user = provider.userProfiles[index];
              return _buildUserProfileCard(user);
            },
          );
        },
      ),
    );
  }

  Widget _buildUserProfileCard(Customer user) {
    final attributes = user.attributes;
    
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 40,
              backgroundImage: attributes.profilePhotoUrl != null 
                ? NetworkImage(attributes.profilePhotoUrl!) 
                : const AssetImage('assets/images/default_avatar.png') as ImageProvider,
            ),
            const SizedBox(width: 16),
            // User Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    attributes.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '@${attributes.username}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  if (attributes.email.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      attributes.email,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                  if (attributes.countryName != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      attributes.countryName!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:lilac_test/presentation/chat_screen/view/chat_screen.dart';
// import 'package:lilac_test/presentation/message_list_screen/controller/message_list_screen_controller.dart';
// import 'package:lilac_test/core/utils/app_utils.dart';

// class MessagesScreen extends StatefulWidget {
//   const MessagesScreen({super.key});

//   @override
//   State<MessagesScreen> createState() => _MessagesScreenState();
// }

// class _MessagesScreenState extends State<MessagesScreen> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<MessageListController>(context, listen: false).fetchMessages(context);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           'Messages',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20.sp,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: false,
//       ),
//       body: Consumer<MessageListController>(
//         builder: (context, controller, _) {
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 80.h,
//                   child: ListView.separated(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: 6,
//                     separatorBuilder: (_, __) => SizedBox(width: 12.w),
//                     itemBuilder: (context, index) {
//                       return Column(
//                         children: [
//                           CircleAvatar(
//                             radius: 24.r,
//                             backgroundColor: Colors.black,
//                           ),
//                           Text(
//                             "User ${index + 1}",
//                             style: TextStyle(fontSize: 12.sp),
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 20.h),

//                 /// Search Bar
//                 Container(
//                   height: 45.h,
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade200,
//                     borderRadius: BorderRadius.circular(12.r),
//                   ),
//                   child: Row(
//                     children: [
//                       SizedBox(width: 12.w),
//                       Icon(Icons.search, color: Colors.grey),
//                       SizedBox(width: 8.w),
//                       Expanded(
//                         child: TextField(
//                           decoration: InputDecoration(
//                             hintText: "Search",
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 20.h),

//                 /// Message List
//                 Expanded(
//                   child: controller.messageModel.data == null
//                       ? Center(child: CircularProgressIndicator())
//                       : controller.messageModel.data!.isEmpty
//                           ? Center(child: Text("No messages"))
//                           : ListView.builder(
//                               itemCount: controller.messageModel.data!.length,
//                               itemBuilder: (context, index) {
//                                 final message = controller.messageModel.data![index];
//                                 final user = message.attributes;
//                                 final profilePhotoUrl = user?.profilePhotoUrl;

//                                 return ListTile(
//                                   contentPadding: EdgeInsets.symmetric(vertical: 8.h),
//                                   dense: true,
//                                   leading: CircleAvatar(
//                                     radius: 24.r,
//                                     backgroundColor: Colors.grey.shade300,
//                                     backgroundImage: (profilePhotoUrl != null && profilePhotoUrl.isNotEmpty)
//                                         ? NetworkImage(profilePhotoUrl)
//                                         : null,
//                                     child: (profilePhotoUrl == null || profilePhotoUrl.isEmpty)
//                                         ? Icon(Icons.person, color: Colors.white)
//                                         : null,
//                                   ),
//                                   title: Text(
//                                     user?.name ?? "Unknown",
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 15.sp,
//                                     ),
//                                   ),
//                                   subtitle: Text(
//                                     user?.username ?? '',
//                                     style: TextStyle(fontSize: 12.sp, color: Colors.grey),
//                                   ),
//                                   trailing: Text(
//                                     user?.messageReceivedFromPartnerAt != null
//                                         ? formatTime(user!.messageReceivedFromPartnerAt!)
//                                         : "",
//                                     style: TextStyle(fontSize: 12.sp, color: Colors.grey),
//                                   ),
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => ChatScreen(),
//                                       ),
//                                     );
//                                   },
//                                 );
//                               },
//                             ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   String formatTime(DateTime dateTime) {
//     final now = DateTime.now();
//     final difference = now.difference(dateTime);

//     if (difference.inDays == 0) {
//       return "${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}";
//     } else if (difference.inDays == 1) {
//       return "Yesterday";
//     } else {
//       return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
//     }
//   }
// }
