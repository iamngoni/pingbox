//
//  pingbox
//  home.dart
//
//  Created by Ngonidzashe Mangudya on 2025/05/17.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';
import '../widgets/favourite_entry.dart';
import '../widgets/ping_entry.dart';
import '../widgets/quick_action.dart';

class Pingbox extends StatelessWidget {
  const Pingbox({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: RelativeBuilder(
        builder: (context, height, width, sy, sx) => Scaffold(
          backgroundColor: PingboxColors.navyBlue,
          appBar: AppBar(
            backgroundColor: PingboxColors.navyBlue,
            elevation: 0,
            title: const Text(
              'PingBox',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: const TabBar(
              labelColor: Colors.lightBlueAccent,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.lightBlueAccent,
              tabs: [
                Tab(icon: Icon(Icons.grid_view), text: 'Ping'),
                Tab(icon: Icon(Icons.bolt), text: 'API Tester'),
                Tab(icon: Icon(Icons.notes), text: 'Notes'),
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(sx(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: sy(10),
                ),
                Text(
                  'Quick Actions',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: sy(10),
                  ),
                ),
                SizedBox(
                  height: sy(8),
                ),
                Wrap(
                  spacing: sx(12),
                  runSpacing: sy(5),
                  children: const [
                    QuickAction(label: 'Quick Ping', highlighted: true),
                    QuickAction(label: 'DNS Lookup'),
                    QuickAction(label: 'Port Scanner'),
                    QuickAction(label: 'Trace Route'),
                  ],
                ),
                SizedBox(
                  height: sy(20),
                ),
                Text(
                  'Recent Activities',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: sy(10),
                  ),
                ),
                SizedBox(
                  height: sy(10),
                ),
                const Column(
                  children: [
                    PingEntry(
                      domain: 'google.com',
                      timeAgo: '2m ago',
                      latency: '32ms',
                      ok: true,
                    ),
                    PingEntry(
                      domain: 'github.com',
                      timeAgo: '5m ago',
                      latency: '125ms',
                      ok: true,
                    ),
                    PingEntry(
                      domain: 'cloudflare.com',
                      timeAgo: '8m ago',
                      latency: '89ms',
                      ok: false,
                    ),
                  ],
                ),
                SizedBox(
                  height: sy(20),
                ),
                Text(
                  'Favorites',
                  style: TextStyle(
                    color: PingboxColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: sy(10),
                  ),
                ),
                SizedBox(height: sy(8)),
                Wrap(
                  spacing: sx(12),
                  runSpacing: sy(12),
                  children: const [
                    FavoriteEntry(label: 'AWS', ok: true),
                    FavoriteEntry(label: 'GCP', ok: true),
                    FavoriteEntry(label: 'Azure', ok: false),
                    FavoriteEntry(label: 'DigitalOcean', ok: true),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
