import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
from recipe_scarping import price_scrapping

cred = credentials.Certificate("serviceAccountKey.json")
firebase_admin.initialize_app(cred ,
                              {
                                'databaseURL': 'https://savoury-hackverse-default-rtdb.firebaseio.com/',
                              })


def update_prices():
    ref= db.reference('/ingredients_address')
    list_dishes = ref.get()
    for dish in list_dishes:
        d = db.reference((f'/ingredients_address/{dish}/')).get()
        ref1 = db.reference((f'/ingredients_address/{dish}/'))
        updated_price = price_scrapping(d['url'])
        if updated_price > 0:
            ref1.set({
                'url': d['url'],
                'quantity': d['quantity'],
                'price': updated_price
            })


def calculate_minimum_food(style,food):
    ref = db.reference(f'/recipes/{style}/{food}/')
    breakfast_list = ref.get()
    prices = []
    min_dishes = dict()
    for dishes in breakfast_list:
        ingredients = db.reference((f'/recipes/{style}/{food}/{dishes}/')).get()
        total=0.00
        for ingredient in ingredients:
            d = db.reference((f'/ingredients_address/{ingredient}/')).get()
            total = total + ((float(d['price']) / float(d['quantity'])) * float(ingredients[ingredient])) / 3;
        prices.append(total)
        min_dishes[total] = dishes
    ref1 = db.reference(f'/recomended/{style}/{food}/')
    ref1.set({
        'recomended_dish': min_dishes[min(prices)],
        'recomended_dish_price': round(min(prices) , 2)
    })


calculate_minimum_food("south_indian", "breakfast")
calculate_minimum_food("south_indian", "lunch")
calculate_minimum_food("south_indian", "dinner")

