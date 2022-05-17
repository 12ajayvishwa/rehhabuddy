class DiseaseData {
  String diseaseName;
  String imgUrl;

  DiseaseData(this.diseaseName, this.imgUrl);
}

List<DiseaseData> diseaseData = [
  DiseaseData("Fever", "assets/disease_images/fever.png"),
  DiseaseData("Unexplained change in\nweight",
      "assets/disease_images/weight-scale.png"),
  DiseaseData("Fatigue/Malaise", "assets/disease_images/heart-attack.png"),
  DiseaseData("Headaches/Migraines", "assets/disease_images/first-aid-kit.png"),
  DiseaseData("Dizziness", "assets/disease_images/dizziness.png"),
  DiseaseData("Sinus\nPain/Pressure", "assets/disease_images/sinus.png"),
  DiseaseData("Excessive snoring", "assets/disease_images/fever.png"),
  DiseaseData(
      "Wheezing/Chronic\nCough", "assets/disease_images/weight-scale.png"),
  DiseaseData(" Shortness of breath", "assets/disease_images/heart-attack.png"),
  DiseaseData(
      "Chest pain, pressure", "assets/disease_images/first-aid-kit.png"),
  DiseaseData(
      "Swelling of\nhands/feet/ankles", "assets/disease_images/dizziness.png"),
  DiseaseData("Nausea/Vomiting", "assets/disease_images/sinus.png"),
  DiseaseData("Abdominal pain", "assets/disease_images/fever.png"),
  DiseaseData("Heartburn", "assets/disease_images/weight-scale.png"),
  DiseaseData(
      "Constipation or diarrhea", "assets/disease_images/first-aid-kit.png"),
];
