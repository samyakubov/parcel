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
    required this.messages,
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
  @override
  ChatbotState build() => const ChatbotState(messages: []);

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

    try {
      final aiResponse = await ref
          .read(aiRepositoryProvider)
          .ask(trimmed, state.conversationHistory);
      final botMsg = ChatMessage(
        text: aiResponse.response,
        sender: MessageSender.bot,
        timestamp: DateTime.now(),
        propertyData: aiResponse.propertyData,
      );
      state = state.copyWith(
        messages: [...state.messages.sublist(0, state.messages.length - 1), botMsg],
        isSending: false,
        conversationHistory: aiResponse.updatedHistory,
      );
    } catch (e) {
      final errMsg = ChatMessage(
        text: 'Something went wrong. Please try again.',
        sender: MessageSender.bot,
        timestamp: DateTime.now(),
      );
      state = state.copyWith(
        messages: [...state.messages.sublist(0, state.messages.length - 1), errMsg],
        isSending: false,
      );
    }
  }

  void clearConversation() {
    state = const ChatbotState(messages: [], conversationHistory: []);
  }
}

final chatbotViewModelProvider =
    NotifierProvider<ChatbotViewModel, ChatbotState>(ChatbotViewModel.new);
