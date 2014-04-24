##SOMA
(Part 1 of Final Project)

Soma is an API for inputting and analyzing blood test results. 

Created with: [Megan Folsom](https://github.com/mfolsom), [James Hunter](https://github.com/NotTheUsual), [Makis Otman](https://github.com/Maikon)

## Documentation

Avaiable endpoints

### legend

```ruby
get '/blood-tests/legend'
```

Has all the metadata about a blood test

```javascript
{
  "hb":{
    "name":"Hb",
    "fullname":"Haemoglobin",
    "unit":"g/L",
    "min":11.5,
    "max":16
  },
  "mcv":{
    "name":"MCV",
    "fullname":"Mean Cell Volume",
    "unit":"fL",
    "min":80,
    "max":100
  },
  "wbc":{
    "name":"WBC",
    "fullname":"White Blood Cells",
    "unit":"x10<sup>9</sup>/L",
    "min":4,
    "max":11
  },
  "platelets":{
    "name":"Platelets",
    "fullname":"Platelets",
    "unit":"x10<sup>9</sup>/L",
    "min":140,
    "max":440
  },
  "neutrophils":{
    "name":"Neutrophils",
    "fullname":"Neutrophils",
    "unit":"x10<sup>9</sup>/L",
    "min":2.5,
    "max":7.5
  },
  "lymphocytes":{
    "name":"Lymphocytes",
    "fullname":"Lymphocytes",
    "unit":"x10<sup>9</sup>/L",
    "min":1.0,
    "max":4.8
  },
  "alt":{
    "name":"ALT",
    "fullname":"Alanine Aminotransferase",
    "unit":"µkat/L",
    "min":10,
    "max":40
  },
  "alk_phos":{
    "name":"Alk Phos",
    "fullname":"Alkaline Phosphates",
    "unit":"U/L",
    "min":44,
    "max":147
  },
  "creatinine":{
    "name":"Creatinine",
    "fullname":"Creatinine",
    "unit":"μmol/L",
    "min":50,
    "max":98
  },
  "esr":{
    "name":"ESR",
    "fullname":"Erythrocyte Sedimentation Rate",
    "unit":"mm/hr",
    "min":0,
    "max":26
  },
  "crp":{
    "name":"CRP",
    "fullname":"C Reactive Protein",
    "unit":"mg/L",
    "min":0,
    "max":5
  }
}
```

### all blood tests

```ruby
get '/blood-tests/users/:user_id'
```

Has all the blood tests for a user

```javascript
[{
  "id":6,
  "taken_on":"2014-03-25",
  "created_at":"2014-03-28T09:36:23.109Z",
  "updated_at":"2014-03-28T09:36:23.109Z",
  "hb":12.0,
  "mcv":90.0,
  "wbc":10.0,
  "platelets":300.0,
  "neutrophils":8.0,
  "lymphocytes":4.0,
  "alt":30.0,
  "alk_phos":100.0,
  "creatinine":120.0,
  "esr":5.0,
  "crp":"6",
  "user_id":2
},
{
  "id":7,
  "taken_on":"2014-03-17",
  "created_at":"2014-03-28T09:37:44.861Z",
  "updated_at":"2014-03-28T09:37:44.861Z",
  "hb":15.0,
  "mcv":95.0,
  "wbc":4.0,
  "platelets":200.0,
  "neutrophils":9.0,
  "lymphocytes":6.0,
  "alt":30.0,
  "alk_phos":140.0,
  "creatinine":60.0,
  "esr":25.0,
  "crp":"4",
  "user_id":2
}]
```

### blood tests for a particular test

```ruby
get '/blood-tests/users/:user_id/:test_name'
```

Has all the results in a particular test for a user

```javascript
[{
  "date":"2014-03-17",
  "result":15.0
},
{
  "date":"2014-03-25",
  "result":12.0
}]
```

### individual blood tests

```ruby
get '/blood-tests/:id.json'
```

Has the data for one blood test

```javascript
{
  "id":6,
  "taken_on":"2014-03-25",
  "created_at":"2014-03-28T09:36:23.109Z",
  "updated_at":"2014-03-28T09:36:23.109Z",
  "hb":12.0,
  "mcv":90.0,
  "wbc":10.0,
  "platelets":300.0,
  "neutrophils":8.0,
  "lymphocytes":4.0,
  "alt":30.0,
  "alk_phos":100.0,
  "creatinine":120.0,
  "esr":5.0,
  "crp":"6",
  "user_id":2
}
```

### Dangerous results

```ruby
get '/blood-tests/:user_id/dangerous-results'
```

All the out of range results for a user

```javascript
[{
  "id":6,
  "taken_on":"2014-03-25",
  "neutrophils":8.0,
  "creatinine":120.0
},
{
  "id":7,
  "taken_on":"2014-03-17",
  "neutrophils":9.0,
  "lymphocytes":6.0
}]
```

### post new blood test

```ruby
post '/blood-tests/remote'
```

Adds a new blood test from the client

### register new user

```ruby
post '/users'
```

Registers a user in the Soma database
