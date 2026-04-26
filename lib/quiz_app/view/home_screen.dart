import 'package:depi_five/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/quiz_cubit.dart';
import '../cubit/quiz_state.dart';
import 'quiz_screen.dart';


class QuizHomeScreen extends StatelessWidget {
  const QuizHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: BlocListener<QuizCubit, QuizState>(
        listener: (context, state) {
          if (state is QuizLoaded) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => BlocProvider.value(
                value: context.read<QuizCubit>(),
                child: const QuizScreen(),
              )),
            );
          } else if (state is QuizError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message), backgroundColor: Colors.red),
            );
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.quiz_rounded, size: 100, color: Color(0xFF6C63FF)),
                const SizedBox(height: 32),
                 Text(
                  AppLocalizations.of(context)!.quizApp,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                 Text(
                 AppLocalizations.of(context)!.appDesc,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white54),
                ),
                const SizedBox(height: 56),
                BlocBuilder<QuizCubit, QuizState>(
                  builder: (context, state) {
                    final isLoading = state is QuizLoading;
                    return ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () => context.read<QuizCubit>().fetchQuizzes(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6C63FF),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 8,
                      ),
                      child: isLoading
                          ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.5,
                              ),
                            )
                          :  Text(
                              AppLocalizations.of(context)!.startQuiz,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
