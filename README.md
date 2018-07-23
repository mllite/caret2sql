# caret2sql : Caret R Models Deployment using SQL databases

This is an attempt to design a SQL-based deployment system for R caret models relying on existing framework in sklearn2sql. 

[Caret](https://github.com/topepo/caret) is a modular R system used to train and predict machine learning models in a standard way. It supports almost all known [machine learning model types](http://topepo.github.io/caret/train-models-by-tag.html) (its coverage is comparable to python [scikit-learn](http://scikit-learn.org/stable/modules/classes.html))

Sklearn2sql provides a framework for translating [scikit-learn](https://github.com/scikit-learn/scikit-learn) predictive models into a SQL code for deployment purposes. Using this framework, for example, it is possible for a C, perl or java developper to deploy such a model simply by executing the [generated SQL code](https://github.com/antoinecarme/sklearn2sql-demo/blob/master/sample_outputs_round_4/MLPClassifier/BreastCancer/oracle/demo1_MLPClassifier_oracle.sql). The system supports the major market databases.

The goal of this POC is to see if this framework can be applied to R caret models, eventually by using a common JSON format with python version models (mapping R with python equivalent models).

Some machine learning libraries (xgboost , lightGBM) already support exporting and loading models in a specific 
JSON foramt, which makes implementing these cases straightforward.

Your feedback is welcome.
