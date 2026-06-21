import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/chatbot_viewmodel.dart';
import '../../domain/entities/property.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants.dart';
import '../../core/utils/property_formatters.dart';

class ChatbotScreen extends ConsumerStatefulWidget {
  const ChatbotScreen({super.key});

  @override
  ConsumerState<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends ConsumerState<ChatbotScreen> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _send() {
    ref.read(chatbotViewModelProvider.notifier).sendMessage(_controller.text);
    _controller.clear();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatbotViewModelProvider);
    final colorScheme = Theme.of(context).colorScheme;

    ref.listen(chatbotViewModelProvider, (prev, next) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    });

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 8, 0),
              child: Row(
                children: [
                  Text(
                    'Parcel AI',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.2,
                          color: colorScheme.onSurfaceVariant,
                        ),
                  ),
                  const Spacer(),
                  if (chatState.messages.isNotEmpty)
                    IconButton(
                      onPressed: () => ref
                          .read(chatbotViewModelProvider.notifier)
                          .clearConversation(),
                      icon: const Icon(Icons.edit_outlined),
                      iconSize: 18,
                      color: colorScheme.onSurfaceVariant,
                      tooltip: 'New chat',
                      padding: const EdgeInsets.all(8),
                      constraints: const BoxConstraints(),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: chatState.messages.isEmpty
                ? const _EmptyState()
                : ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                    itemCount: chatState.messages.length,
                    itemBuilder: (context, index) {
                      final msg = chatState.messages[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: msg.sender == MessageSender.user
                            ? _UserBubble(message: msg)
                            : _BotMessage(message: msg),
                      );
                    },
                  ),
          ),
          _InputBar(
            controller: _controller,
            onSend: _send,
            enabled: !chatState.isSending,
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ask anything about\na property.',
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
              height: 1.2,
              letterSpacing: -0.5,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Ownership history, violations, permits,\nzoning — all in one place.',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}

class _UserBubble extends StatelessWidget {
  final ChatMessage message;
  const _UserBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.78,
        ),
        child: Text(
          message.text,
          textAlign: TextAlign.right,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface,
                height: 1.45,
              ),
        ),
      ),
    );
  }
}

MarkdownStyleSheet _chatMarkdownStyle(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;
  final textTheme = Theme.of(context).textTheme;
  final body = textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface, height: 1.6);
  return MarkdownStyleSheet(
    p: body,
    strong: body?.copyWith(fontWeight: FontWeight.w700),
    em: body?.copyWith(fontStyle: FontStyle.italic),
    listBullet: body,
    code: textTheme.bodySmall?.copyWith(
      color: colorScheme.onSurface,
      backgroundColor: colorScheme.surfaceContainerHighest,
      fontFamily: 'monospace',
    ),
    codeblockDecoration: BoxDecoration(
      color: colorScheme.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(8),
    ),
    blockquoteDecoration: BoxDecoration(
      border: Border(left: BorderSide(color: colorScheme.outlineVariant, width: 3)),
    ),
    h1: textTheme.titleLarge?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w700),
    h2: textTheme.titleMedium?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w700),
    h3: textTheme.titleSmall?.copyWith(color: colorScheme.onSurface, fontWeight: FontWeight.w700),
  );
}

class _BotMessage extends StatelessWidget {
  final ChatMessage message;
  const _BotMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (message.isLoading)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: _TypingDots(),
                )
              else ...[
                if (message.propertyData != null) ...[
                  _PropertyCard(property: message.propertyData!),
                  const SizedBox(height: 12),
                ],
                MarkdownBody(
                  data: message.text,
                  styleSheet: _chatMarkdownStyle(context),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _TypingDots extends StatefulWidget {
  const _TypingDots();

  @override
  State<_TypingDots> createState() => _TypingDotsState();
}

class _TypingDotsState extends State<_TypingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _opacity = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurfaceVariant;
    return FadeTransition(
      opacity: _opacity,
      child: Text(
        'Thinking...',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: color,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

class _PropertyCard extends StatelessWidget {
  final Property property;
  const _PropertyCard({required this.property});

  String _fmtSqft(double? sqft, double? front, double? depth) {
    if (sqft == null) return 'N/A';
    final base = '${numberFmt.format(sqft.round())} ft²';
    if (front != null && depth != null) {
      return '$base\n${fmtDim(front)}×${fmtDim(depth)}';
    }
    return base;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final lastSold = property.lastSold;
    final info = property.propertyInfo;
    final coords = property.coordinates;

    final imageUrl = (coords?.latitude != null && coords?.longitude != null)
        ? 'https://maps.googleapis.com/maps/api/streetview?size=800x400&scale=2&fov=90&pitch=10'
          '&location=${coords!.latitude},${coords.longitude}'
          '&key=${AppConstants.streetViewApiKey}'
        : null;

    String price = 'N/A';
    String soldDate = '';
    if (lastSold?.lastSoldPrice != null) {
      price = fmtPrice(lastSold!.lastSoldPrice!);
    }
    if (lastSold?.lastSoldDate != null) {
      try {
        soldDate = dateFmt.format(DateTime.parse(lastSold!.lastSoldDate!));
      } catch (_) {
        soldDate = lastSold!.lastSoldDate!;
      }
    }

    final year = lastSold?.yearBuilt?.toString() ?? 'N/A';
    final grossSqft = _fmtSqft(lastSold?.grossSqft, info?.bldgFront, info?.bldgDepth);
    final landSqft = _fmtSqft(lastSold?.landSqft, info?.lotFront, info?.lotDepth);

    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
          border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Street view photo
            if (imageUrl != null)
              Image.network(
                imageUrl,
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 140,
                  color: colorScheme.surfaceContainerHighest,
                  child: Icon(Icons.broken_image_rounded, size: 32, color: colorScheme.onSurfaceVariant),
                ),
                loadingBuilder: (_, child, progress) => progress == null
                    ? child
                    : Container(
                        height: 140,
                        color: colorScheme.surfaceContainerHighest,
                        child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                      ),
              ),

            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // BBL
                  if (info?.bbl != null)
                    Text(
                      'BBL ${info!.bbl!}',
                      style: textTheme.labelSmall?.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                        color: colorScheme.accentColor,
                      ),
                    ),

                  const SizedBox(height: 10),

                  // Stats strip
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _statItem(context, 'Last Sale', price, sub: soldDate),
                        _divider(colorScheme),
                        _statItem(context, 'Year Built', year),
                        _divider(colorScheme),
                        _statItem(context, 'Gross Area', grossSqft),
                        _divider(colorScheme),
                        _statItem(context, 'Land Area', landSqft),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statItem(BuildContext context, String label, String value, {String? sub}) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: colorScheme.onSurface,
          ),
        ),
        if (sub != null && sub.isNotEmpty) ...[
          const SizedBox(height: 1),
          Text(
            sub,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }

  Widget _divider(ColorScheme colorScheme) {
    return Container(
      width: 1,
      height: 32,
      color: colorScheme.outlineVariant,
      margin: const EdgeInsets.symmetric(horizontal: 12),
    );
  }
}

class _InputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final bool enabled;

  const _InputBar({
    required this.controller,
    required this.onSend,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bottomPadding = MediaQuery.paddingOf(context).bottom;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Container(
      color: colorScheme.surface,
      padding: EdgeInsets.fromLTRB(12, 8, 12, bottomPadding + AppConstants.bottomNavBarHeight + 16),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1C1C1E) : const Color(0xFFF2F2F7),
          borderRadius: BorderRadius.circular(26),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Row(
          children: [
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: controller,
                enabled: enabled,
                textCapitalization: TextCapitalization.sentences,
                onSubmitted: enabled ? (_) => onSend() : null,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                decoration: InputDecoration(
                  hintText: 'Message',
                  hintStyle: TextStyle(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 15,
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(width: 4),
            _SendButton(onSend: onSend, enabled: enabled),
          ],
        ),
      ),
    );
  }
}

class _SendButton extends StatefulWidget {
  final VoidCallback onSend;
  final bool enabled;
  const _SendButton({required this.onSend, required this.enabled});

  @override
  State<_SendButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<_SendButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _anim;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _anim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scale = Tween<double>(begin: 1, end: 0.88).animate(
      CurvedAnimation(parent: _anim, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _anim.dispose();
    super.dispose();
  }

  void _onTap() {
    if (!widget.enabled) return;
    _anim.forward().then((_) { if (mounted) _anim.reverse(); });
    widget.onSend();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Semantics(
      button: true,
      enabled: widget.enabled,
      label: 'Send message',
      child: ScaleTransition(
        scale: _scale,
        child: GestureDetector(
          onTap: _onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: widget.enabled
                  ? colorScheme.accentColor
                  : colorScheme.onSurface.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_upward_rounded,
              color: widget.enabled
                  ? Colors.white
                  : colorScheme.onSurfaceVariant,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}
