import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationScreen> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phản hồi nhanh'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Xử lý khi nhấn nút back
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Xử lý khi nhấn nút search
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Xử lý khi nhấn nút filter
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            _buildDatePicker(context),
            _buildSearchButton(),
            Expanded(
              child: _buildNotificationList(),
            ),
          ],
        ),
      ),
      );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Từ khóa...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(Icons.calendar_today),
          SizedBox(width: 8),
          GestureDetector(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: selectedDate ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null && pickedDate != selectedDate)
                setState(() {
                  selectedDate = pickedDate;
                });
            },
            child: Text(
              selectedDate == null
                  ? 'Chọn ngày'
                  : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ElevatedButton(
        onPressed: () {
          // Xử lý khi nhấn nút Tìm Kiếm
        },
        child: Text('Tìm Kiếm'),
      ),
    );
  }

  Widget _buildNotificationList() {
    return ListView(
      children: [
        _buildNotificationItem(
          'assets/avatar1.png', // Thay thế bằng đường dẫn thực tế của ảnh đại diện
          'Trao đổi tại Ghi chú ghi chú mô hình - Kiểm thử combine mô hình',
          'không xóa được ghi chú đã đăng',
          Colors.green.shade100,
        ),
        _buildNotificationItem(
          'assets/avatar2.png', // Thay thế bằng đường dẫn thực tế của ảnh đại diện
          'Trao đổi tại Thảo luận Quy trình đang thảo luận',
          'ngfjgngdnbfdb\n171011_QĐ 1056-QĐ-BXD-Chương trình khung đào tạo BIM.pdf',
          Colors.yellow.shade100,
        ),
        _buildNotificationItem(
          'assets/avatar1.png', // Thay thế bằng đường dẫn thực tế của ảnh đại diện
          'Trao đổi tại Thảo luận Quy trình đang thảo luận',
          'Hương Giang: Đã có bản final nhé.',
          Colors.green.shade100,
        ),
        // Thêm các item khác tương tự
      ],
    );
  }

  Widget _buildNotificationItem(
      String avatarPath, String title, String subtitle, Color bgColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(avatarPath),
            radius: 24,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 4),
                Text(subtitle),
              ],
            ),
          ),
          Icon(Icons.check_box_outline_blank),
        ],
      ),
    );
  }
}
