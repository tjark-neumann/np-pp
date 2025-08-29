import pandas as pd
import statsmodels.api as sm
import matplotlib.pyplot as plt
import numpy as np


X = data_train[column_names[5]]
y = data_train[column_names[4]]
X_const = sm.add_constant(X)

model = sm.OLS(y, X_const).fit()
print(model.summary())


y_pred = model.predict(X_const)

plt.scatter(X, y, color="blue")
plt.plot(X, y_pred, color="red", linewidth=2, label="Regressionslinie")

plt.xlabel("idi")
plt.ylabel("esi")
plt.legend()

plt.savefig("linear_regression.png", dpi=300, bbox_inches="tight")

plt.show()
