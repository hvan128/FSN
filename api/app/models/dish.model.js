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

  const dish = new Dish(
    ownerId,
    label,
    description,
    image,
    cookingTime,
    rangOfPeople  
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

  Promise.all([stepsPromise, ingredientsPromise])
    .then(([steps, ingredients]) => {
      db.query(`SELECT * FROM dish WHERE id = ${id}`, (err, res0) => {
        if (err) {
          console.log(err);
          result(err, null);
          return;
        }
        result(null, { ...res0[0], steps, ingredients });
      });
    })
    .catch((err) => {
      console.log(err);
      result(err, null);
    });
};

Dish.findByOwnerId = (ownerId, result) => {
  var dishes = [];

  // Lấy danh sách món ăn dựa trên ownerId
  db.query(`SELECT * FROM dish WHERE ownerId = ${ownerId}`, (err, res) => {
    if (err) {
      console.log(err);
      result(err, null);
      return;
    }

    // Duyệt qua từng món ăn
    res.forEach((dish) => {
      var dishId = dish.id;
      var stepsPromise = new Promise((resolve, reject) => {
        // Lấy bước thực hiện của món ăn
        Step.getStepsByDishId(dishId, (err, steps) => {
          if (err) {
            reject(err);
          } else {
            resolve(steps);
          }
        });
      });

      var ingredientsPromise = new Promise((resolve, reject) => {
        // Lấy nguyên liệu của món ăn
        Ingredient.getIngredientsByDishId(dishId, (err, ingredients) => {
          if (err) {
            reject(err);
          } else {
            resolve(ingredients);
          }
        });
      });

      // Sử dụng Promise.all để đợi cho cả hai promise hoàn thành
      Promise.all([stepsPromise, ingredientsPromise])
        .then(([steps, ingredients]) => {
          // Thêm thông tin món ăn vào mảng dishes
          dishes.push({ ...dish, steps, ingredients });

          // Kiểm tra xem đã lấy thông tin của tất cả món ăn hay chưa
          if (dishes.length === res.length) {
            result(null, dishes); // Trả về danh sách món ăn khi đã hoàn thành
          }
        })
        .catch((err) => {
          console.log(err);
          result(err, null);
        });
    });
  });
};


Dish.findByIngredients = (ingredient1, ingredient2, page, pageSize, result) => {
  var matchedDishes = new Set();
  const offset = (page - 1) * pageSize;

  // Truy vấn cơ sở dữ liệu để lấy danh sách món ăn chứa ingredient1
  db.query(
    `SELECT DISTINCT dishId FROM ingredient WHERE category = '${ingredient1}'`,
    (err, res1) => {
      if (err) {
        console.log(err);
        result(err, null);
        return;
      }

      // Truy vấn cơ sở dữ liệu để lấy danh sách món ăn chứa ingredient2
      db.query(
        `SELECT DISTINCT dishId FROM ingredient WHERE category = '${ingredient2}'`,
        (err, res2) => {
          if (err) {
            console.log(err);
            result(err, null);
            return;
          }

          // Kết hợp danh sách món ăn từ cả hai nguyên liệu
          res1.forEach(dish => {
            matchedDishes.add(dish.dishId);
          });

          res2.forEach(dish => {
            matchedDishes.add(dish.dishId);
          });

          matchedDishes = Array.from(matchedDishes);

          // Lấy tổng số lượng món ăn
          const totalCount = matchedDishes.length;

          // Phân trang bằng cách chỉ lấy phần của matchedDishes tương ứng với trang hiện tại
          const paginatedDishes = matchedDishes.slice(offset, offset + pageSize);

          var promises = paginatedDishes.map(dishId => {
            return new Promise((resolve, reject) => {
              // Gọi hàm findById để lấy thông tin chi tiết của mỗi món ăn
              Dish.findById(dishId, (err, dishInfo) => {
                if (err) {
                  reject(err);
                } else {
                  resolve(dishInfo);
                }
              });
            });
          });

          // Trả về kết quả khi tất cả các promise đã được giải quyết
          Promise.all(promises)
            .then(results => {
              result(null, { total: totalCount, data: results });
            })
            .catch(err => {
              console.log(err);
              result(err, null);
            });
        }
      );
    }
  );
};


Dish.getAllDish = (page, pageSize, result) => {
  const offset = (page - 1) * pageSize;

  db.query('SELECT COUNT(*) AS total FROM dish', (err, countResult) => {
    if (err) {
      console.log(err);
      result(err, null);
      return;
    }

    const totalCount = countResult[0].total;

    db.query(
      `SELECT * FROM dish ORDER BY createdAt DESC LIMIT ${pageSize} OFFSET ${offset}`,
      (err, res) => {
        if (err) {
          console.log(err);
          result(err, null);
          return;
        }

        const promises = res.map(dish => {
          return new Promise((resolve, reject) => {
            const dishId = dish.id;

            Step.getStepsByDishId(dishId, (err, steps) => {
              if (err) {
                reject(err);
              } else {
                Ingredient.getIngredientsByDishId(dishId, (err, ingredients) => {
                  if (err) {
                    reject(err);
                  } else {
                    const dishInfo = { ...dish, steps, ingredients };
                    resolve(dishInfo);
                  }
                });
              }
            });
          });
        });

        Promise.all(promises)
          .then(results => {
            result(null, { total: totalCount, data: results });
          })
          .catch(err => {
            console.log(err);
            result(err, null);
          });
      }
    );
  });
};


export default Dish;
