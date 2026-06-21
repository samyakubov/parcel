import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/map_screen.dart';
import '../screens/chatbot_screen.dart';
import '../viewmodels/navigation_viewmodel.dart';
import '../../core/theme/app_theme.dart';

class MainShell extends ConsumerStatefulWidget {
  const MainShell({super.key});

  @override
  ConsumerState<MainShell> createState() => _MainShellState();
}

class _MainShellState extends ConsumerState<MainShell> {
  late final PageController _pageController;

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

  Widget _edgeSwipeZone({required bool isRight, required int currentIndex}) {
    return Positioned(
      right: isRight ? 0 : null,
      left: isRight ? null : 0,
      top: 0,
      bottom: 0,
      width: 36,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onHorizontalDragEnd: (details) {
          final velocity = details.primaryVelocity ?? 0;
          if (isRight && velocity < -300) {
            ref.read(selectedTabProvider.notifier).goTo(currentIndex + 1);
          } else if (!isRight && velocity > 300) {
            ref.read(selectedTabProvider.notifier).goTo(currentIndex - 1);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(selectedTabProvider);
    final bottomPadding = MediaQuery.paddingOf(context).bottom;
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    ref.listen<int>(selectedTabProvider, (_, next) => _goToTab(next));

    return Stack(
      children: [
        PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) => ref.read(selectedTabProvider.notifier).goTo(index),
          children: const [
            MapScreen(),
            ChatbotScreen(),
          ],
        ),
        if (currentIndex < _tabs.length - 1)
          _edgeSwipeZone(isRight: true, currentIndex: currentIndex),
        if (currentIndex > 0)
          _edgeSwipeZone(isRight: false, currentIndex: currentIndex),
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
                      onTap: () => ref.read(selectedTabProvider.notifier).goTo(i),
                      behavior: HitTestBehavior.opaque,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.all(8),
                        child: Icon(
                          currentIndex == i
                              ? _tabs[i].activeIcon
                              : _tabs[i].icon,
                          size: 24,
                          color: currentIndex == i
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
  }
}
