import db from "../common/connect.js";
import Step from "../models/step.model.js";
import Ingredient from "./ingredient.model.js";
import Feel from "./feel.model.js";
import Save from "./save.model.js";
import User from "./user.model.js";

class Dish {
  constructor(
    ownerId,
    label,
    description,
    image,
    cookingTime,
    rangeOfPeople,
    type,
    id
  ) {
    this.ownerId = ownerId;
    this.label = label;
    this.description = description;
    this.image = image;
    this.cookingTime = cookingTime;
    this.rangeOfPeople = rangeOfPeople;
    this.type = type;
    this.id = id;
  }
}

Dish.create = (data, result) => {
  const {
    ownerId,
    cookingTime,
    label,
    image,
    description,
    type,
    ingredients,
    steps,
    rangeOfPeople,
  } = data;

  const dish = new Dish(
    ownerId,
    label,
    description,
    image,
    cookingTime,
    rangeOfPeople,
    type
  );

  db.query("INSERT INTO dish SET ?", dish, (err, res) => {
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
            image: steps[i].image,
          },
          result
        );
      }
      for (let i = 0; i < ingredients.length; i++) {
        Ingredient.create(
          {
            value: ingredients[i].value,
            label: ingredients[i].label,
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

Dish.update = (data, result) => {
  const {
    ownerId,
    cookingTime,
    label,
    image,
    description,
    ingredients,
    steps,
    rangeOfPeople,
    id,
  } = data;

  const dish = new Dish(
    ownerId,
    label,
    description,
    image,
    cookingTime,
    rangeOfPeople,
    id
  );

  db.query("UPDATE dish SET ? WHERE id = ?", [dish, id], (err, res) => {
    if (err) {
      console.log(err);
      result(err, null);
      return;
    } else {
      Step.deleteStepByDishId(id, result);
      Ingredient.deleteIngredientByDishId(id, result);
      for (let i = 0; i < steps.length; i++) {
        Step.create(
          {
            no: steps[i].no,
            description: steps[i].description,
            dishId: id,
            image: steps[i].image,
          },
          result
        );
      }
      for (let i = 0; i < ingredients.length; i++) {
        Ingredient.create(
          {
            value: ingredients[i].value,
            label: ingredients[i].label,
            quantity: ingredients[i].quantity,
            unit: ingredients[i].unit,
            dishId: id,
          },
          result
        );
      }
      result(null, dish);
    }
  });
};

Dish.findById = (id, result) => {
  var stepsPromise = new Promise((resolve, reject) => {
    Step.getStepsByDishId(id, (err, res1) => {
      if (err) {
        reject(err);
      } else {
        resolve(res1);
      }
    });
  });

  var ingredientsPromise = new Promise((resolve, reject) => {
    Ingredient.getIngredientsByDishId(id, (err, res2) => {
      if (err) {
        reject(err);
      } else {
        resolve(res2);
      }
    });
  });

  var feelsPromise = new Promise((resolve, reject) => {
    Feel.findByDishId(id, (err, feels) => {
      if (err) {
        reject(err);
      } else {
        resolve(feels);
      }
    });
  });

  var savePromise = new Promise((resolve, reject) => {
    Save.findByDishId(id, (err, saves) => {
      if (err) {
        reject(err);
      } else {
        resolve(saves);
      }
    });
  });  

  Promise.all([stepsPromise, ingredientsPromise, feelsPromise, savePromise])
    .then(([steps, ingredients, feels, saves]) => {
      db.query(`SELECT * FROM dish WHERE id = ${id}`, (err, [dish]) => {
        if (err) {
          console.log(err);
          result(err, null);
          return;
        }
        if (dish?.ownerId === undefined) {
          result(null, { ...dish, steps, ingredients, feels, saves });
        } else {
          User.findById(dish.ownerId, (err, [owner]) => {
            if (err) {
              console.log(err);
              result(err, null);
              return;
            }
            result(null, {
              ...dish,
              steps,
              ingredients,
              feels,
              saves,
              owner,
            });
          });
        }
      });
    })
    .catch((err) => {
      console.log(err);
      result(err, null);
    });
};

Dish.findByOwnerId = (ownerId, page, pageSize, type, result) => {
  var offset = (page - 1) * pageSize;
  var limit = pageSize;
  var totalDishes = 0;
  var dishes = [];

  db.query(
    `SELECT COUNT(*) as total FROM dish WHERE ownerId = ${ownerId} AND type = '${type}'`,
    (err, countResult) => {
      if (err) {
        console.log(err);
        result(err, null);
        return;
      }
      totalDishes = countResult[0].total;

      db.query(
        `SELECT * FROM dish WHERE ownerId = ${ownerId} AND type = '${type}' LIMIT ${limit} OFFSET ${offset}`,
        (err, res) => {
          if (err) {
            console.log(err);
            result(err, null);
            return;
          }

          res.forEach((dish) => {
            var dishId = dish.id;
            var stepsPromise = new Promise((resolve, reject) => {
              Step.getStepsByDishId(dishId, (err, steps) => {
                if (err) {
                  reject(err);
                } else {
                  resolve(steps);
                }
              });
            });

            var ingredientsPromise = new Promise((resolve, reject) => {
              Ingredient.getIngredientsByDishId(dishId, (err, ingredients) => {
                if (err) {
                  reject(err);
                } else {
                  resolve(ingredients);
                }
              });
            });

            var feelsPromise = new Promise((resolve, reject) => {
              Feel.findByDishId(dishId, (err, feels) => {
                if (err) {
                  reject(err);
                } else {
                  resolve(feels);
                }
              });
            });

            var savesPromise = new Promise((resolve, reject) => {
              Save.findByDishId(dishId, (err, saves) => {
                if (err) {
                  reject(err);
                } else {
                  resolve(saves);
                }
              });
            });
            var userPromise = new Promise((resolve, reject) => {
              User.findById(dish.ownerId, (err, [owner]) => {
                if (err) {
                  reject(err);
                } else {
                  resolve(owner);
                }
              });
            });

            Promise.all([
              stepsPromise,
              ingredientsPromise,
              feelsPromise,
              savesPromise,
              userPromise,
            ])
              .then(([steps, ingredients, feels, saves, owner]) => {
                dishes.push({
                  ...dish,
                  steps,
                  ingredients,
                  feels,
                  saves,
                  owner,
                });

                if (dishes.length === res.length) {
                  var response = {
                    totalItems: totalDishes,
                    totalPages: Math.ceil(totalDishes / pageSize),
                    currentPage: page,
                    data: dishes,
                  };
                  result(null, response);
                }
              })
              .catch((err) => {
                console.log(err);
                result(err, null);
              });
          });
        }
      );
    }
  );
};

Dish.findByIngredients = (ingredient1, ingredient2, page, pageSize, result) => {
  var matchedDishes = new Set();
  const offset = (page - 1) * pageSize;

  db.query(
    `SELECT DISTINCT dishId FROM ingredient WHERE value = '${ingredient1}'`,
    (err, res1) => {
      if (err) {
        console.log(err);
        result(err, null);
        return;
      }

      db.query(
        `SELECT DISTINCT dishId FROM ingredient WHERE value = '${ingredient2}'`,
        (err, res2) => {
          if (err) {
            console.log(err);
            result(err, null);
            return;
          }

          res1.forEach((dish) => {
            matchedDishes.add(dish.dishId);
          });

          res2.forEach((dish) => {
            matchedDishes.add(dish.dishId);
          });

          matchedDishes = Array.from(matchedDishes);

          const totalCount = matchedDishes.length;

          const paginatedDishes = matchedDishes.slice(
            offset,
            offset + pageSize
          );

          var promises = paginatedDishes.map((dishId) => {
            return new Promise((resolve, reject) => {
              Dish.findById(dishId, (err, dishInfo) => {
                if (err) {
                  reject(err);
                } else {
                  resolve(dishInfo);
                }
              });
            });
          });

          Promise.all(promises)
            .then((results) => {
              result(null, { total: totalCount, data: results });
            })
            .catch((err) => {
              console.log(err);
              result(err, null);
            });
        }
      );
    }
  );
};

Dish.getAllDish = (page, pageSize, type, result) => {
  const offset = (page - 1) * pageSize;
  console.log(type)

  db.query(
    `SELECT COUNT(*) AS total FROM dish WHERE type = '${type}'`,
    (err, countResult) => {
      if (err) {
        console.log(err);
        result(err, null);
        return;
      }

      const totalCount = countResult[0].total;

      db.query(
        `SELECT id FROM dish WHERE type = '${type}' ORDER BY createdAt DESC LIMIT ${pageSize} OFFSET ${offset}`,
        (err, res) => {
          if (err) {
            console.log(err);
            result(err, null);
            return;
          }
          console.log(res);

          var promises = res.map((dishId) => {
            return new Promise((resolve, reject) => {
              Dish.findById(dishId.id, (err, dishInfo) => {
                if (err) {
                  reject(err);
                } else {
                  resolve(dishInfo);
                }
              });
            });
          });

          Promise.all(promises)
            .then((results) => {
              result(null, { total: totalCount, data: results });
            })
            .catch((err) => {
              console.log(err);
              result(err, null);
            });
        }
      );
    }
  );
};

Dish.getSavedDishesByUserId = (userId, page, pageSize, type, callback) => {
  const offset = (page - 1) * pageSize;

  var totalCount = 0;

  const query = `
      SELECT d.id
      FROM saved_dish sd
      JOIN dish d ON sd.dishId = d.id
      WHERE sd.userId = ${userId} AND d.type = '${type}'
      ORDER BY sd.savedAt DESC
      LIMIT ${pageSize} OFFSET ${offset}
    `;
  db.query(query, (err, results) => {
    if (err) {
      console.error("Error fetching saved dishes:", err);
      callback(err, null);
      return;
    } else {
      const promises = results.map((dish) => {
        return new Promise((resolve, reject) => {
          const dishId = dish.id;
          Dish.findById(dishId, (err, dishInfo) => {
            if (err) {
              reject(err);
            } else {
              resolve(dishInfo);
            }
          });
        });
      });
      Promise.all(promises)
        .then((results) => {
          results.forEach((dish) => {
            dish.type === type ? totalCount++ : null;
          });
          callback(null, { total: totalCount, data: results });
        })
        .catch((err) => {
          console.log(err);
          callback(err, null);
        });
    }
  });
};

export default Dish;
