import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/map_screen.dart';
import '../screens/chatbot_screen.dart';
import '../viewmodels/navigation_viewmodel.dart';
import '../../core/theme/app_theme.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  late final PageController _pageController;
  int _currentIndex = 0;

  static const _tabs = [
    (icon: Icons.map_outlined, activeIcon: Icons.map, label: 'Map'),
    (icon: Icons.chat_bubble_outline_rounded, activeIcon: Icons.chat_bubble_rounded, label: 'Assistant'),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToTab(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.paddingOf(context).bottom;
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Consumer(
      builder: (context, ref, _) {
        ref.listen<int>(selectedTabProvider, (_, next) {
          if (next != _currentIndex) _goToTab(next);
        });

        return Stack(
          children: [
            PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) => setState(() => _currentIndex = index),
              children: const [
                MapScreen(),
                ChatbotScreen(),
              ],
            ),
            if (_currentIndex < _tabs.length - 1)
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                width: 36,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onHorizontalDragEnd: (details) {
                    if ((details.primaryVelocity ?? 0) < -300) _goToTab(_currentIndex + 1);
                  },
                ),
              ),
            if (_currentIndex > 0)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                width: 36,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onHorizontalDragEnd: (details) {
                    if ((details.primaryVelocity ?? 0) > 300) _goToTab(_currentIndex - 1);
                  },
                ),
              ),
            Positioned(
              bottom: bottomPadding + 4,
              left: 24,
              right: 24,
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: isDark ? 0.45 : 0.12),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    for (int i = 0; i < _tabs.length; i++)
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _goToTab(i),
                          behavior: HitTestBehavior.opaque,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.all(8),
                            child: Icon(
                              _currentIndex == i
                                  ? _tabs[i].activeIcon
                                  : _tabs[i].icon,
                              size: 24,
                              color: _currentIndex == i
                                  ? colorScheme.accentColor
                                  : colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
