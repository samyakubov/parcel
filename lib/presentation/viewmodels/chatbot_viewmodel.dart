import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/ai_repository_impl.dart';
import '../../domain/entities/property.dart';

enum MessageSender { user, bot }

class ChatMessage {
  final String text;
  final MessageSender sender;
  final DateTime timestamp;
  final Property? propertyData;
  final bool isLoading;

  const ChatMessage({
    required this.text,
    required this.sender,
    required this.timestamp,
    this.propertyData,
    this.isLoading = false,
  });
}

class ChatbotState {
  final List<ChatMessage> messages;
  final bool isSending;
  final List<Map<String, dynamic>> conversationHistory;

  const ChatbotState({
    this.messages = const [],
    this.isSending = false,
    this.conversationHistory = const [],
  });

  ChatbotState copyWith({
    List<ChatMessage>? messages,
    bool? isSending,
    List<Map<String, dynamic>>? conversationHistory,
  }) {
    return ChatbotState(
      messages: messages ?? this.messages,
      isSending: isSending ?? this.isSending,
      conversationHistory: conversationHistory ?? this.conversationHistory,
    );
  }
}

class ChatbotViewModel extends Notifier<ChatbotState> {
  int _generation = 0;

  @override
  ChatbotState build() => const ChatbotState();

  List<ChatMessage> _replaceTyping(ChatMessage replacement) => [
    ...state.messages.sublist(0, state.messages.length - 1),
    replacement,
  ];

  Future<void> sendMessage(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty || state.isSending) return;

    final userMsg = ChatMessage(
      text: trimmed,
      sender: MessageSender.user,
      timestamp: DateTime.now(),
    );

    final typingMsg = ChatMessage(
      text: '',
      sender: MessageSender.bot,
      timestamp: DateTime.now(),
      isLoading: true,
    );

    state = state.copyWith(
      messages: [...state.messages, userMsg, typingMsg],
      isSending: true,
    );

    final gen = _generation;
    try {
      final aiResponse = await ref
          .read(aiRepositoryProvider)
          .ask(trimmed, state.conversationHistory);
      if (_generation != gen) return;
      final botMsg = ChatMessage(
        text: aiResponse.response,
        sender: MessageSender.bot,
        timestamp: DateTime.now(),
        propertyData: aiResponse.propertyData,
      );
      state = state.copyWith(
        messages: _replaceTyping(botMsg),
        isSending: false,
        conversationHistory: aiResponse.updatedHistory,
      );
    } catch (e) {
      if (_generation != gen) return;
      final errMsg = ChatMessage(
        text: 'Something went wrong. Please try again.',
        sender: MessageSender.bot,
        timestamp: DateTime.now(),
      );
      state = state.copyWith(
        messages: _replaceTyping(errMsg),
        isSending: false,
      );
    }
  }

  void clearConversation() {
    _generation++;
    state = const ChatbotState();
  }
}

final chatbotViewModelProvider =
    NotifierProvider<ChatbotViewModel, ChatbotState>(ChatbotViewModel.new);
