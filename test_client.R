library(caret, quiet = TRUE)
library(base64enc)
library(httr, quiet = TRUE)

## multiclass classification in iris dataset:
    
dataset = as.matrix(iris[, -5])

model = train(Species ~ ., data = iris, method = "xgbTree")

WS_URL = "http://localhost:1888/model" # "https://sklearn2sql.herokuapp.com/model"

model_serialized <- serialize(model, NULL)
b64_data = base64encode(model_serialized)

data = list(Name = "xgboost_test_model", SerializedModel = b64_data , SQLDialect = "postgresql" , Mode="caret")

r = POST(WS_URL, body = data, encode = "json")
content = content(r)

lSQL = content$model$SQLGenrationResult[[1]]$SQL

cat(lSQL);
