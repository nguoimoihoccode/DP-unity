import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(20.0,), // Chiều cao tùy chỉnh của AppBar
        child: AppBar(
          title: Text('Chat'),
        ),
      ),
      body: Column(
        children: <Widget>[
          _buildHeader(),
          _buildSearchBar(),
          _buildChatList(),
        ],
      ),
    );
  }


  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Wrap(
            spacing: 16, // Khoảng cách ngang giữa các mục
            runSpacing: 16, // Khoảng cách dọc giữa các hàng
            children: [
              _buildHeaderItem(
                'Dự án của tôi',
                'Đường sắt trên cao',
                'assets/project.png', // Thay thế bằng đường dẫn thực tế của ảnh dự án
              ),
              _buildHeaderItem(
                'Nhóm của tôi',
                'TVGS - iDECO',
                'assets/group.png', // Thay thế bằng đường dẫn thực tế của ảnh nhóm
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildHeaderItem(String title, String subtitle, String imagePath) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 24,
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(subtitle),
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward, color: Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Tìm kênh chat',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildChatList() {
    return Expanded(
      child: ListView(
        children: [
          _buildChatItem(
            'Nhà đầu tư iDECO',
            'Tran Nguyen: cần trao đổi thêm',
            '10 phút',
            '3',
            true,
            'assets/investor.png', // Thay thế bằng đường dẫn thực tế của ảnh đại diện
          ),
          _buildChatItem(
            'Minh Hiếu',
            'Bạn: Ok',
            '49 phút',
            '5',
            false,
            'assets/user1.png', // Thay thế bằng đường dẫn thực tế của ảnh đại diện
          ),
          _buildChatItem(
            'Kim Vui',
            'Bạn: Đồng ý!',
            '55 phút',
            '',
            false,
            'assets/user2.png', // Thay thế bằng đường dẫn thực tế của ảnh đại diện
          ),
          _buildChatItem(
            'Gia Thịnh',
            'Trong cuối tuần này thì kịp.',
            '1 giờ',
            '',
            false,
            'assets/user3.png', // Thay thế bằng đường dẫn thực tế của ảnh đại diện
          ),
          _buildChatItem(
            'Nhóm thiết kế',
            'Hương Giang: Đã có bản final nhé.',
            '',
            '',
            false,
            'assets/design_team.png', // Thay thế bằng đường dẫn thực tế của ảnh đại diện
          ),
        ],
      ),
    );
  }

  Widget _buildChatItem(String title, String subtitle, String time, String badgeCount, bool isGroup, String imagePath) {
    return ListTile(
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
    );
  }
}
