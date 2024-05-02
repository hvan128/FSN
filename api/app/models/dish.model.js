import db from "../common/connect.js";
import Step from "../models/step.model.js";
import Ingredient from "./ingredient.model.js";

class Dish {
  constructor(
    ownerId,
    label,
    description,
    image,
    cookingTime,
    id,
    rangeOfPeople
  ) {
    this.ownerId = ownerId;
    this.label = label;
    this.description = description;
    this.image = image;
    this.cookingTime = cookingTime;
    this.id = id;
    this.rangeOfPeople = rangeOfPeople;
  }
}

Dish.create = (data, result) => {
  const {
    ownerId,
    cookingTime,
    label,
    image,
    description,
    ingredients,
    steps,
    rangOfPeople,
  } = data;

  const dish = Dish(
    ownerId,
    label,
    description,
    image,
    cookingTime,
    rangOfPeople
  );

  db.query("INSERT INTO dishes SET ?", dish, (err, res) => {
    if (err) {
      console.log(err);
      result(err, null);
      return;
    } else {
      for (let i = 0; i < steps.length; i++) {
        Step.create(
          {
            no: steps[i].no,
            description: steps[i].description,
            dishId: res.insertId,
          },
          result
        );
      }
      for (let i = 0; i < ingredients.length; i++) {
        Ingredient.create(
          {
            category: ingredients[i].category,
            quantity: ingredients[i].quantity,
            unit: ingredients[i].unit,
            dishId: res.insertId,
          },
          result
        );
      }

      result(null, { id: res.insertId, ...dish });
    }
  });
};

export default Dish;
