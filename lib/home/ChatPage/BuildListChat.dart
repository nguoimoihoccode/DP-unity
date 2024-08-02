import 'package:flutter/material.dart';
import 'package:ideco_app/home/ChatPage/Chat/ChatDetailScreen.dart';

class Buildlistchat extends StatefulWidget {
  const Buildlistchat({super.key});

  @override
  State<Buildlistchat> createState() => _BuildlistchatState();
}

class _BuildlistchatState extends State<Buildlistchat> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          _buildChatItem(
            context,
            'Nhà đầu tư iDECO',
            'Tran Nguyen: cần trao đổi thêm',
            '10 phút',
            '3',
            true,
            'assets/images/meme-tat-22.jpg', // Thay thế bằng đường dẫn thực tế của ảnh đại diện
            ChatDetailPage(), // Trang mới khi ấn vào mục này
          ),
          _buildChatItem(
            context,
            'Minh Hiếu',
            'Bạn: Ok',
            '49 phút',
            '5',
            false,
            'assets/images/meme-tat-22.jpg', // Thay thế bằng đường dẫn thực tế của ảnh đại diện
            ChatDetailPage(), // Trang mới khi ấn vào mục này
          ),
          _buildChatItem(
            context,
            'Kim Vui',
            'Bạn: Đồng ý!',
            '55 phút',
            '',
            false,
            'assets/images/meme-tat-22.jpg', // Thay thế bằng đường dẫn thực tế của ảnh đại diện
            ChatDetailPage(), // Trang mới khi ấn vào mục này
          ),
          _buildChatItem(
            context,
            'Gia Thịnh',
            'Trong cuối tuần này thì kịp.',
            '1 giờ',
            '',
            false,
            'assets/images/meme-tat-22.jpg', // Thay thế bằng đường dẫn thực tế của ảnh đại diện
            ChatDetailPage(), // Trang mới khi ấn vào mục này
          ),
          _buildChatItem(
            context,
            'Nhóm thiết kế',
            'Hương Giang: Đã có bản final nhé.',
            '',
            '',
            false,
            'assets/images/meme-tat-22.jpg', // Thay thế bằng đường dẫn thực tế của ảnh đại diện
            ChatDetailPage(), // Trang mới khi ấn vào mục này
          ),
        ],
      ),
    );
  }

  Widget _buildChatItem(BuildContext context, String title, String subtitle, String time, String badgeCount, bool isGroup, String imagePath, Widget destinationPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 24,
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(time, style: TextStyle(color: Colors.grey)),
            if (badgeCount.isNotEmpty)
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: Text(
                  badgeCount,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}