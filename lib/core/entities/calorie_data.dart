class CalorieData{
  double totalKcal;
  double protein;
  double carbohydrates;
  double fats;

  CalorieData({
    this.carbohydrates = 0,
    this.protein = 0,
    this.fats = 0,
    this.totalKcal = 0,
  });

  void addValue(CalorieData calorieData){
    totalKcal += calorieData.totalKcal;
    protein += calorieData.protein;
    fats += calorieData.fats;
    carbohydrates += calorieData.carbohydrates;
  }
}