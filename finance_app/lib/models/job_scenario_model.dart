class JobScenario{
  final int? id;
  final String employerName;
  final String payType;
  final String wage;

  JobScenario({
    this.id,
    required this.employerName,
    required this.payType,
    required this.wage
  });

  Map <String, dynamic> toMap(){
    return {
      'id' : id,
      'employer_name' : employerName,
      'pay_type' : payType,
      'wage' : wage,
    };
  }

  factory JobScenario.fromMap(Map<String, dynamic> map){
    return JobScenario(
      id: map['id'],
      employerName: map['employer_name'], 
      payType: map['pay_type'], 
      wage: map['wage'],
    );  
  }

  JobScenario copyWith({
    int? id,
    String? employerName,
    String? payType,
    String? wage
  }) {
    return JobScenario(
      id: id ?? this.id,
      employerName: employerName ?? this.employerName,
      payType: payType ?? this.payType,
      wage: wage ?? this.wage,
    );
  }

  
}