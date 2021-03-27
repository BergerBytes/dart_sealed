import 'package:equatable/equatable.dart';

class Sealed {
  final SealedEquality equality;

  const Sealed({
    this.equality = SealedEquality.data,
  });

  @override
  String toString() => 'Sealed(equality: $equality)';
}

class SealedFrom {
  final Type type;

  const SealedFrom(this.type);

  @override
  String toString() => 'SealedFrom(type: $type)';
}

enum SealedEquality {
  data,
  identity,
  distinct,
}

abstract class SealedEqualityData extends Equatable {
  @override
  List<Object?> get props => [];

  @override
  bool operator ==(Object other);

  @override
  int get hashCode;

  @override
  String toString();
}

abstract class SealedEqualityIdentity {
  @override
  bool operator ==(Object other) => identical(this, other);

  @override
  int get hashCode => identityHashCode(this);

  @override
  String toString();
}

abstract class SealedEqualityDistinct {
  @override
  bool operator ==(Object other) => false;

  @override
  int get hashCode => identityHashCode(this);

  @override
  String toString();
}
