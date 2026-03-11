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
}