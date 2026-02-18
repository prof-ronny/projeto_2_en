sealed class Classification {
  const Classification();
}

final class Approved extends Classification {
  const Approved();
}

final class Recovery extends Classification {
  const Recovery();
}

final class Failed extends Classification {
  const Failed();
}

({List<int> valid, List<Object?> invalid})
filterGrades(List<Object?> raw) {
  final valid = <int>[];
  final invalid = <Object?>[];

  for (final n in raw) {
    switch (n) {
      case int v when v >= 0 && v <= 100:
        valid.add(v);
      default:
        invalid.add(n);
    }
  }

  return (valid: valid, invalid: invalid);
}

({double average, Classification status})
evaluate(List<int> grades) {
  final average = grades.isEmpty
      ? 0.0
      : grades.reduce((a, b) => a + b) /
            grades.length;

  final status = switch (average) {
    >= 70 => const Approved(),
    >= 50 => const Recovery(),
    _ => const Failed(),
  };

  return (average: average, status: status);
}

String finalReport(List<Object?> raw) {
  final (:valid, :invalid) = filterGrades(raw);
  final (:average, :status) = evaluate(valid);

  final statusLine = switch (status) {
    Approved() => 'Status: APPROVED',
    Recovery() => 'Status: RECOVERY',
    Failed() => 'Status: FAILED',
  };

  final gradesText = valid.join(', ');
  final invalidText = invalid.isEmpty
      ? 'none'
      : invalid.join(', ');

  return 'Valid grades: ' +
      gradesText +
      '\n\nIgnored (invalid): ' +
      invalidText +
      '\n\nAverage: ' +
      average.toStringAsFixed(2) +
      '\n\n' +
      statusLine;
}

void main() {
  print(
    finalReport([90, 75, 60, 40, -5, 101, 'xx']),
  );
}
