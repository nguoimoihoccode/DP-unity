import 'package:flutter/material.dart';

class CloudPage extends StatelessWidget {
  final List<FileCardData> fileCardDataList = [
    FileCardData('Nội bộ', 'A01 - 28/03/2024', 'assets/folder.png', ['assets/avatar1.png', 'assets/avatar2.png']),
    FileCardData('Kiểm tra phân quyền', 'A01 - 28/03/2024', 'assets/folder.png', ['assets/avatar1.png', 'assets/avatar2.png']),
    FileCardData('Chức năng mới', 'A01 - 28/03/2024', 'assets/folder.png', ['assets/avatar1.png', 'assets/avatar2.png']),
    FileCardData('Xử lý lỗi', 'A01 - 28/03/2024', 'assets/folder.png', ['assets/avatar1.png', 'assets/avatar2.png']),
    FileCardData('Mô hình upload V3', 'A01 - 28/03/2024', 'assets/folder.png', ['assets/avatar1.png', 'assets/avatar2.png']),
    FileCardData('separation.mp3', 'A01 - 15/05/2024', 'assets/music.png', ['assets/avatar1.png', 'assets/avatar2.png']),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Quản lý tập tin'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Xử lý tìm kiếm
              },
            ),
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {
                // Xử lý lọc
              },
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.green,
            labelColor: Colors.green,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(text: 'Đang xử lý'),
              Tab(text: 'Chia sẻ'),
              Tab(text: 'Phát hành'),
              Tab(text: 'Lưu trữ'),
            ],
          ),
        ),
        body: TabBarView(
          children: List.generate(4, (index) => _buildFileGrid()),
        ),
      ),
    );
  }

  Widget _buildFileGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // Điều chỉnh kích thước tối đa của phần tử
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 2 / 3, // Điều chỉnh tỷ lệ phần tử nếu cần
      ),
      padding: EdgeInsets.all(8),
      itemCount: fileCardDataList.length,
      itemBuilder: (context, index) {
        final fileData = fileCardDataList[index];
        return _buildFileCard(fileData);
      },
    );
  }

  Widget _buildFileCard(FileCardData data) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(data.iconPath, height: 40, width: 40),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.title, style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(data.date, style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: data.avatars.map((avatar) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(avatar),
                    radius: 12,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class FileCardData {
  final String title;
  final String date;
  final String iconPath;
  final List<String> avatars;

  FileCardData(this.title, this.date, this.iconPath, this.avatars);
}
