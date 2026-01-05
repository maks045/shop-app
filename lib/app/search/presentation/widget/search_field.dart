import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/app/shop/app/product_search_provider.dart';
import 'package:shop_app/core/theme/app_theme.dart';

class SearchField extends ConsumerStatefulWidget {
  final TextEditingController controller;

  const SearchField({super.key, required this.controller});

  @override
  ConsumerState<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends ConsumerState<SearchField> {
  final FocusNode _focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() => isFocused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(productSearchProvider);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        onChanged: (value) {
          ref.read(productSearchProvider.notifier).search(value);
        },
        decoration: InputDecoration(
          hintText: 'Search products',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),

          /// ✅ Appears when focused AND query exists
          suffixIcon: (isFocused && searchState.query.isNotEmpty)
              ? IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    widget.controller.clear();
                    ref.read(productSearchProvider.notifier).clear();
                  },
                )
              : null,
        ),
      ),
    );
  }
}
