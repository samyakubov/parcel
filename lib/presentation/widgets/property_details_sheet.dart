import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/utils/property_formatters.dart';
import '../viewmodels/property_search_viewmodel.dart';
import '../../core/constants.dart';
import '../../domain/entities/property.dart';

// Tab Imports
import 'property_details/tabs/owners_tab.dart';
import 'property_details/tabs/mortgage_tab.dart';
import 'property_details/tabs/activity_tab.dart';
import 'property_details/tabs/jobs_tab.dart';
import 'property_details/tabs/issues_tab.dart';
import '../../core/theme/app_theme.dart';

class PropertyDetailsSheet extends ConsumerStatefulWidget {
  const PropertyDetailsSheet({super.key});

  @override
  ConsumerState<PropertyDetailsSheet> createState() => _PropertyDetailsSheetState();
}

class _PropertyDetailsSheetState extends ConsumerState<PropertyDetailsSheet>
    with SingleTickerProviderStateMixin {
  final _sheetController = DraggableScrollableController();
  late final TabController _tabController;
  // One dedicated controller per tab so only the active tab uses the sheet's
  // scrollController. TabBarView keeps adjacent tabs alive, causing the sheet
  // controller to be attached to multiple scroll views if all tabs share it.
  final List<ScrollController> _tabScrollControllers =
      List.generate(5, (_) => ScrollController());

  static const double _minSize = 0.5;
  static const double _maxSize = 0.95;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) setState(() {});
  }

  @override
  void dispose() {
    _sheetController.dispose();
    _tabController
      ..removeListener(_onTabChanged)
      ..dispose();
    for (final c in _tabScrollControllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _onHeaderDragUpdate(DragUpdateDetails details) {
    if (!_sheetController.isAttached) return;
    final screenHeight = MediaQuery.of(context).size.height;
    final delta = details.primaryDelta ?? 0;
    final newSize = (_sheetController.size - delta / screenHeight)
        .clamp(_minSize, _maxSize);
    _sheetController.jumpTo(newSize);
  }

  void _onHeaderDragEnd(DragEndDetails details) {
    if (!_sheetController.isAttached) return;
    final velocity = details.primaryVelocity ?? 0;
    final current = _sheetController.size;
    final double target;

    if (velocity < -400) {
      target = _maxSize;
    } else if (velocity > 400) {
      target = _minSize;
    } else {
      target = current > (_minSize + _maxSize) / 2 ? _maxSize : _minSize;
    }

    _sheetController.animateTo(
      target,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(propertySearchViewModelProvider);
    final property = state.value;
    final isLoading = state.isLoading;
    final theme = Theme.of(context);

    if (property == null && !isLoading) return const SizedBox.shrink();

    return DraggableScrollableSheet(
      controller: _sheetController,
      initialChildSize: _minSize,
      minChildSize: _minSize,
      maxChildSize: _maxSize,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
            boxShadow: [
              BoxShadow(
                color: theme.brightness == Brightness.light
                    ? Colors.black.withValues(alpha: 0.12)
                    : Colors.black.withValues(alpha: 0.4),
                blurRadius: 20,
                spreadRadius: 2,
                offset: const Offset(0, -2),
              )
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: isLoading
              ? _buildSkeleton(theme)
              : _buildContent(context, property!, scrollController, theme),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, Property property, ScrollController scrollController, ThemeData theme) {
    String addressTitle = 'Property Details';
    if (property.records.isNotEmpty) {
      final firstRecord = property.records.first;
      final streetNumber = firstRecord['prop_streetnumber'] ?? '';
      final streetName = firstRecord['prop_streetname'] ?? '';
      if (streetNumber.toString().isNotEmpty || streetName.toString().isNotEmpty) {
        addressTitle = '$streetNumber $streetName'.trim();
      }
    }

    final coords = property.coordinates;
    final imageUrl = coords != null
        ? 'https://maps.googleapis.com/maps/api/streetview?size=800x600&scale=2&fov=90&pitch=10&location=${coords.latitude},${coords.longitude}&key=${AppConstants.streetViewApiKey}'
        : null;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header — draggable from anywhere in this block
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onVerticalDragUpdate: _onHeaderDragUpdate,
            onVerticalDragEnd: _onHeaderDragEnd,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Street view image
                Stack(
                  children: [
                    if (imageUrl != null)
                      Image.network(
                        imageUrl,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 200,
                          color: theme.brightness == Brightness.light ? Colors.grey.shade100 : theme.cardColor,
                          child: Center(child: Icon(Icons.broken_image_rounded, size: 48, color: theme.colorScheme.secondary)),
                        ),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            height: 200,
                            color: theme.brightness == Brightness.light ? Colors.grey.shade50 : theme.cardColor,
                            child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                          );
                        },
                      )
                    else
                      Container(height: 200, color: theme.brightness == Brightness.light ? Colors.grey.shade100 : theme.cardColor),

                    // Drag handle
                    Positioned(
                      top: 0, left: 0, right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.35),
                              Colors.transparent,
                            ],
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 52,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Bottom gradient
                    Positioned(
                      bottom: 0, left: 0, right: 0,
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              theme.scaffoldBackgroundColor.withValues(alpha: 0),
                              theme.scaffoldBackgroundColor,
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Close button
                    Positioned(
                      top: 16, right: 16,
                      child: GestureDetector(
                        onTap: () => ref.read(propertySearchViewModelProvider.notifier).clearSearch(),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.4),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.close_rounded, color: Colors.white, size: 20),
                        ),
                      ),
                    ),
                  ],
                ),

                // Address + BBL
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 14, 24, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        addressTitle,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.8,
                          color: theme.colorScheme.onSurface,
                          height: 1.1,
                        ),
                      ),
                      if (property.propertyInfo?.bbl != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          property.propertyInfo!.bbl!,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                // Stats strip
                _buildStatsStrip(property, theme),

                // Tab bar
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: theme.brightness == Brightness.light ? Colors.grey.shade100 : theme.cardColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: theme.brightness == Brightness.light ? Colors.white : theme.dividerColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    labelColor: theme.colorScheme.accentColor,
                    unselectedLabelColor: theme.colorScheme.secondary,
                    labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    tabs: const [
                      Tab(text: 'Records'),
                      Tab(text: 'Owners'),
                      Tab(text: 'Mortgage'),
                      Tab(text: 'Permits'),
                      Tab(text: 'Violations'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),

          // Tab content — only the active tab receives the sheet's
          // scrollController; others use their own dedicated controllers.
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ActivityTab(property: property, controller: _tabController.index == 0 ? scrollController : _tabScrollControllers[0]),
                OwnersTab(property: property, controller: _tabController.index == 1 ? scrollController : _tabScrollControllers[1]),
                MortgageTab(property: property, controller: _tabController.index == 2 ? scrollController : _tabScrollControllers[2]),
                JobsTab(property: property, controller: _tabController.index == 3 ? scrollController : _tabScrollControllers[3]),
                IssuesTab(property: property, controller: _tabController.index == 4 ? scrollController : _tabScrollControllers[4]),
              ],
            ),
          ),
        ],
    );
  }

  Widget _buildStatsStrip(Property property, ThemeData theme) {
    final lastSold = property.lastSold;

    String price = 'N/A';
    if (lastSold?.lastSoldPrice != null) {
      price = fmtPrice(lastSold!.lastSoldPrice!);
    }

    final year = lastSold?.yearBuilt?.toString() ?? 'N/A';

    String soldDate = '';
    if (lastSold?.lastSoldDate != null) {
      try {
        soldDate = dateFmt.format(DateTime.parse(lastSold!.lastSoldDate!));
      } catch (_) {
        soldDate = lastSold!.lastSoldDate!;
      }
    }

    final info = property.propertyInfo;
    final grossSqft = _fmtSqft(lastSold?.grossSqft, info?.bldgFront, info?.bldgDepth);
    final landSqft = _fmtSqft(lastSold?.landSqft, info?.lotFront, info?.lotDepth);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _statItem('Last Sale', price, theme, subValue: soldDate),
          _vertDivider(theme),
          _statItem('Year Built', year, theme),
          _vertDivider(theme),
          _statItem('Gross Area', grossSqft, theme),
          _vertDivider(theme),
          _statItem('Land Area', landSqft, theme),
        ],
      ),
    );
  }

  Widget _statItem(String label, String value, ThemeData theme, {String? subValue}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: theme.colorScheme.secondary,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: theme.colorScheme.onSurface,
          ),
        ),
        if (subValue != null && subValue.isNotEmpty) ...[
          const SizedBox(height: 2),
          Text(
            subValue,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.secondary.withValues(alpha: 0.8),
            ),
          ),
        ],
      ],
    );
  }

  String _fmtSqft(double? sqft, double? front, double? depth) {
    if (sqft == null) return 'N/A';
    final base = '${numberFmt.format(sqft.round())} ft²';
    if (front != null && depth != null) return '$base (${fmtDim(front)}×${fmtDim(depth)})';
    return base;
  }

  Widget _vertDivider(ThemeData theme) {
    return Container(
      width: 1,
      height: 32,
      color: theme.dividerColor,
      margin: const EdgeInsets.symmetric(horizontal: 16),
    );
  }

  Widget _buildSkeleton(ThemeData theme) {
    return Shimmer.fromColors(
      baseColor: theme.brightness == Brightness.light
          ? Colors.grey.shade100
          : theme.cardColor,
      highlightColor: theme.brightness == Brightness.light
          ? Colors.white
          : theme.dividerColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(height: 200, color: Colors.white),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 28,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 48,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: 3,
              itemBuilder: (_, _) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
