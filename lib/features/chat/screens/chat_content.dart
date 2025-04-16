import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common_widgets/common_scaffold.dart';
import '../../../core/styles/dimension.dart';
import '_components/cells/item_chat.dart';
import '_components/chat_appbar.dart';
import '_components/chat_persistent_delegate.dart';
import 'bloc/chat_bloc.dart';

class ChatContent extends StatefulWidget {

  const ChatContent({super.key});

  @override
  State<ChatContent> createState() => _ChatContentState();
}

class _ChatContentState extends State<ChatContent> with SingleTickerProviderStateMixin {
  
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return CommonScaffold(
          body: NestedScrollView(
            headerSliverBuilder: (ctx, innerBoxIsScrolled) {
              return [
                ChatAppBar(),
                SliverPersistentHeader(
                  delegate: ChatPersistentDelegate(
                    controller: tabController,
                    onTap: (index) {
                      log("TAPPED: $index");
                    }
                  ),
                  pinned: true,
                  floating: true,
                )
              ];
            },
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimension.paddingMedium
                  ),
                  itemBuilder: (ctx, index) {
                    return ItemChat();
                  }, 
                  separatorBuilder: (ctx, index) {
                    return Divider(
                      thickness: 0.5,
                    );
                  }, 
                  itemCount: 10
                ),
                ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimension.paddingMedium
                  ),
                  itemBuilder: (ctx, index) {
                    return ItemChat();
                  }, 
                  separatorBuilder: (ctx, index) {
                    return Divider(
                      thickness: 0.5,
                    );
                  }, 
                  itemCount: 10
                ),
              ]
            )
          )
        );
      },
    );
  }
}