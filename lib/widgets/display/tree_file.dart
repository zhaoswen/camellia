import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

// 文件/目录树组件，用于显示指定目录下的目录结构
class XFileTree extends StatefulWidget {
  final String rootPath;

  const XFileTree({super.key, required this.rootPath});

  @override
  XFileTreeState createState() => XFileTreeState();
}

class XFileTreeState extends State<XFileTree> {
  final Map<String, bool> _expanded = {};

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FileSystemEntity>>(
      future: _getDirectoryContents(widget.rootPath),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No files or directories found.');
        } else {
          return _buildTree(snapshot.data!);
        }
      },
    );
  }

  Future<List<FileSystemEntity>> _getDirectoryContents(String path) async {
    final directory = Directory(path);
    try {
      final contents = await directory.list().toList();
      return contents;
    } catch (e) {
      // showSnackbar("错误", "目录结构读取失败: $e", type: XSnackbarType.error);
      return [];
    }
  }

  Widget _buildTree(List<FileSystemEntity> entities) {
    return ListView.builder(
      itemCount: entities.length,
      itemBuilder: (context, index) {
        final entity = entities[index];
        return _buildTreeNode(entity);
      },
    );
  }

  Widget _buildTreeNode(FileSystemEntity entity) {
    final isDirectory = entity is Directory;
    final name = entity.path.split('/').last;

    return Column(
      children: [
        ListTile(
          title: Text(
            name,
            style: TextStyle(
              color:
                  Theme.of(context).textTheme.titleMedium?.color ??
                  Colors.black,
              fontSize: 13,
            ),
          ),
          leading: HugeIcon(
            icon: isDirectory
                ? HugeIcons.strokeRoundedFolder02
                : HugeIcons.strokeRoundedFile01,
            color:
                Theme.of(context).textTheme.titleMedium?.color ?? Colors.black,
            size: 13,
          ),
          trailing: isDirectory
              ? IconButton(
                  icon: HugeIcon(
                    icon: _expanded[entity.path] ?? false
                        ? HugeIcons.strokeRoundedArrowUp01
                        : HugeIcons.strokeRoundedArrowDown01,
                    color:
                        Theme.of(context).textTheme.titleMedium?.color ??
                        Colors.black,
                    size: 13,
                  ),
                  onPressed: () {
                    setState(() {
                      _expanded[entity.path] =
                          !(_expanded[entity.path] ?? false);
                    });
                  },
                )
              : null,
          onTap: () {
            // Handle file tap if needed
          },
        ),
        if ((_expanded[entity.path] ?? false) && isDirectory)
          FutureBuilder<List<FileSystemEntity>>(
            future: _getDirectoryContents(entity.path),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('No files or directories found.');
              } else {
                return Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    // 使用 Column 替代 ListView
                    children: snapshot.data!
                        .map((entity) => _buildTreeNode(entity))
                        .toList(),
                  ),
                );
              }
            },
          ),
      ],
    );
  }
}
