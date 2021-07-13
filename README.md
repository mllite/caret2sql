# caret2sql : Caret R Models Deployment using SQL databases

Caret2SQL is a SQL-based deployment system for R caret models. It relies on the existing framework in [sklearn2sql](https://github.com/antoinecarme/sklearn2sql_heroku). 

[Caret](https://github.com/topepo/caret) is a modular R system used to train and predict machine learning models in a standard way. It supports almost all known [machine learning model types](http://topepo.github.io/caret/train-models-by-tag.html) (its coverage is comparable to python [scikit-learn](http://scikit-learn.org/stable/modules/classes.html))

Sklearn2sql provides a framework for translating [scikit-learn](https://github.com/scikit-learn/scikit-learn) predictive models into a SQL code for deployment purposes. Using this framework, for example, it is possible for a C, perl or java developper to deploy such a model simply by executing the [generated SQL code](https://github.com/antoinecarme/sklearn2sql-demo/blob/master/sample_outputs_round_4/MLPClassifier/BreastCancer/oracle/demo1_MLPClassifier_oracle.sql). The system supports the major market databases.

Caret2SQL applies the same framework to R caret models, eventually by using a common JSON format with python version models (mapping caret models with equivalent scikit-learn models).

Some machine learning libraries (xgboost , lightGBM) already support exporting and loading models in a specific JSON format, which makes implementing these cases straightforward (python xgboost models are already supported in sklearn2sql).

# Demo

```R
library(caret, quiet = TRUE)
library(base64enc)
library(httr, quiet = TRUE)

## multiclass classification on iris dataset:

# build/train a caret model
model = train(Species ~ ., data = iris, method = "ctree2")

WS_URL = "https://sklearn2sql.herokuapp.com/model"

model_serialized <- serialize(model, NULL)
b64_data = base64encode(model_serialized)

data = list(Name = "ctree2_test_model", SerializedModel = b64_data , SQLDialect = "postgresql" , Mode="caret")

r = POST(WS_URL, body = data, encode = "json")
content = content(r)

lSQL = content$model$SQLGenrationResult[[1]]$SQL

cat(lSQL);

```

# Supported Models

The most used models are now implemented in the [web-service](https://github.com/antoinecarme/caret2sql/issues/3)

1. Classification models (GLMxx , naive bayes, decision trees (rpart + ctree + ctree2), SVMs , Neural Nets, Earth/MARS )
2. Regressions (almost he same as above , except naive bayes)
3. Preprocessings : "center", "scale", "pca"
4. Ensembles : Boosting, Bagging, Random Forests, XGBoost.

Some R jupyter notebooks are provided as a [demo](https://github.com/antoinecarme/caret2sql/tree/master/doc).

A [more complete list](https://github.com/antoinecarme/caret2sql/tree/master/demo) of supported models and generated  SQL codes for various databases is available.

# References

A good introduction for Caret is given by the author ( @topepo ) :

Kuhn, M. (2008), “Building predictive models in R using the caret package, ” Journal of Statistical Software, (http://www.jstatsoft.org/article/view/v028i05/v28i05.pdf). 


Your feedback is welcome.
