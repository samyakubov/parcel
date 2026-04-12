import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import '../viewmodels/property_search_viewmodel.dart';
import '../../core/constants.dart';

// Tab Imports
import 'property_details/tabs/details_tab.dart';
import 'property_details/tabs/owners_tab.dart';
import 'property_details/tabs/mortgage_tab.dart';
import 'property_details/tabs/activity_tab.dart';
import 'property_details/tabs/violations_tab.dart';
import 'property_details/tabs/jobs_tab.dart';
import 'property_details/tabs/complaints_tab.dart';
import '../../core/theme/app_theme.dart';

class PropertyDetailsSheet extends ConsumerWidget {
  const PropertyDetailsSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(propertySearchViewModelProvider);
    final property = state.value;
    final isLoading = state.isLoading;
    final theme = Theme.of(context);

    if (property == null && !isLoading) return const SizedBox.shrink();

    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
            boxShadow: [
              BoxShadow(
                color: theme.brightness == Brightness.light
                    ? Colors.black.withOpacity(0.12)
                    : Colors.black.withOpacity(0.4),
                blurRadius: 20,
                spreadRadius: 2,
                offset: const Offset(0, -2),
              )
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: isLoading 
            ? _buildSkeleton(theme)
            : _buildContent(context, ref, property!, scrollController, theme),
        );
      },
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
          // Image Skeleton
          Container(
            height: 240,
            color: Colors.white,
          ),
          
          // Address & Tabs Skeleton
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
          ),
          
          // Content Skeleton
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: 3,
              itemBuilder: (_, __) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref, dynamic property, ScrollController scrollController, ThemeData theme) {
    // Try to extract address from the first record if available
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

    return DefaultTabController(
      length: 7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top Header Section (Static street view image)
          Stack(
            children: [
              if (imageUrl != null)
                Image.network(
                  imageUrl,
                  height: 240,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 240,
                    color: theme.brightness == Brightness.light ? Colors.grey.shade100 : theme.cardColor,
                    child: Center(child: Icon(Icons.broken_image_rounded, size: 48, color: theme.colorScheme.secondary)),
                  ),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 240,
                      color: theme.brightness == Brightness.light ? Colors.grey.shade50 : theme.cardColor,
                      child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                    );
                  },
                )
              else
                Container(height: 240, color: theme.brightness == Brightness.light ? Colors.grey.shade100 : theme.cardColor),
              
              // Drag Handle Overlay
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.35),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 52,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              // Bottom Gradient Transition
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        theme.scaffoldBackgroundColor.withOpacity(0),
                        theme.scaffoldBackgroundColor,
                      ],
                    ),
                  ),
                ),
              ),
              // Close Button
              Positioned(
                top: 16,
                right: 16,
                child: GestureDetector(
                  onTap: () => ref.read(propertySearchViewModelProvider.notifier).clearSearch(),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          // Address & TabBar Section
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 12),
            child: Text(
              addressTitle,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.8,
                color: theme.colorScheme.onSurface,
                height: 1.1,
              ),
            ),
          ),
          
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: theme.brightness == Brightness.light ? Colors.grey.shade100 : theme.cardColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: theme.brightness == Brightness.light ? Colors.white : theme.dividerColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              labelColor: theme.colorScheme.goldAccent,
              unselectedLabelColor: theme.colorScheme.secondary,
              labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              tabs: const [
                Tab(text: 'Details'),
                Tab(text: 'Owners'),
                Tab(text: 'Mortgage'),
                Tab(text: 'Activity'),
                Tab(text: 'Violations'),
                Tab(text: 'Jobs'),
                Tab(text: 'Complaints'),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: TabBarView(
              children: [
                DetailsTab(property: property, controller: scrollController),
                OwnersTab(property: property, controller: scrollController),
                MortgageTab(property: property, controller: scrollController),
                ActivityTab(property: property, controller: scrollController),
                ViolationsTab(property: property, controller: scrollController),
                JobsTab(property: property, controller: scrollController),
                ComplaintsTab(property: property, controller: scrollController),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
