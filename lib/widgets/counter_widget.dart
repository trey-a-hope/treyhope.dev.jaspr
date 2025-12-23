import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:treyhope_dev/extensions/widget_extensions.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => CounterCubit(),
    child: const CounterWidgetView().mApp(),
  );
}

class CounterWidgetView extends StatelessWidget {
  const CounterWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final counterCubit = context.read<CounterCubit>();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have pushed the button this many times:',
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              BlocBuilder<CounterCubit, int>(
                builder: (context, state) {
                  return Text(
                    '${state}',
                    style: textTheme.displayLarge,
                  );
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () => counterCubit.decrement(),
                    tooltip: 'Decrement',
                    child: const Icon(LucideIcons.minus),
                  ),
                  const SizedBox(width: 16),
                  FloatingActionButton(
                    onPressed: () => counterCubit.reset(),
                    tooltip: 'Reset',
                    child: const Icon(Icons.rotate_90_degrees_cw_outlined),
                  ),
                  const SizedBox(width: 16),
                  FloatingActionButton(
                    onPressed: () => counterCubit.increment(),
                    tooltip: 'Increment',
                    child: const Icon(LucideIcons.plus),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
  void reset() => emit(0);
}
