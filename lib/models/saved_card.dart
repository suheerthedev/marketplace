class SavedCard {
  final String id;
  final String name;
  final String number;
  final String date;
  final String paymentType;
  final bool isSelected;

  SavedCard({
    required this.id,
    required this.name,
    required this.number,
    required this.date,
    required this.paymentType,
    this.isSelected = false,
  });

  SavedCard copyWith({bool? isSelected}) {
    return SavedCard(
      id: id,
      name: name,
      number: number,
      date: date,
      paymentType: paymentType,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
