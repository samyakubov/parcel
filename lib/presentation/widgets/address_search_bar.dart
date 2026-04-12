import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/property_search_viewmodel.dart';

class AddressSearchBar extends ConsumerStatefulWidget {
  const AddressSearchBar({super.key});

  @override
  ConsumerState<AddressSearchBar> createState() => _AddressSearchBarState();
}

class _AddressSearchBarState extends ConsumerState<AddressSearchBar> {
  final TextEditingController _controller = TextEditingController();

  void _onSearch() {
    if (_controller.text.isNotEmpty) {
      ref.read(propertySearchViewModelProvider.notifier).searchByAddress(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(propertySearchViewModelProvider);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),
        ],
      ),
      child: TextField(
        controller: _controller,
        textInputAction: TextInputAction.search,
        onSubmitted: (_) => _onSearch(),
        decoration: InputDecoration(
          hintText: 'Search address...',
          prefixIcon: const Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          suffixIcon: state.isLoading 
            ? const Padding(
                padding: EdgeInsets.all(12),
                child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)),
              )
            : IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _controller.clear();
                  ref.read(propertySearchViewModelProvider.notifier).clearSearch();
                },
              ),
        ),
      ),
    );
  }
}
