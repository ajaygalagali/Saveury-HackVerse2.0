import firebase_admin
from firebase_admin import credentials
from firebase_admin import db


cred = credentials.Certificate("serviceAccountKey.json")
firebase_admin.initialize_app(cred ,
                              {
                                'databaseURL': 'https://savoury-hackverse-default-rtdb.firebaseio.com/',
                              })
ref = db.reference('/recipies/south_indian')

ref.set({
'breakfast':{
    'mallige idli':{
        'urad dal' : '128',
        'poha' : '100',
        'idli rice' : '200',
        'salt' : '5.69',
        'oil ' : '5'
    },
    'rava idli' : {
        'oil' : '15',
        'mustard' : '5.69',
        'cumin' :'2.5',
        'chana dal' : '6',
        'rava': '220',
        'curd' : '100',
        'cashew' : '20',
    }
}
})