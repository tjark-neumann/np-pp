import pandas as pd
import numpy as np
import statsmodels.api as sm
import matplotlib.pyplot as plt
import numpy as np
from mpl_toolkits.mplot3d import Axes3D


data1 = pd.read_csv('./datenstatz_power.csv',  sep=';', decimal=",")
data_train = pd.DataFrame(data1)
column_names = data_train.columns.tolist()

print(column_names)


X = data_train[[column_names[1], column_names[5]]]
y = data_train[[column_names[4]]]

print(X)
print(y)
X_const = sm.add_constant(X)


model = sm.OLS(y, X_const).fit()
print(model.summary())

y_pred = model.predict(X_const)


fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

ax.scatter(data_train[column_names[1]], data_train[column_names[5]], y, color="red")


x1_range = np.linspace(data_train[column_names[1]].min(), data_train[column_names[1]].max(), 20)
x2_range = np.linspace(data_train[column_names[5]].min(), data_train[column_names[5]].max(), 20)
x1_surf, x2_surf = np.meshgrid(x1_range, x2_range)

exog = pd.DataFrame({
    "const": 1,
    column_names[1]: x1_surf.ravel(),
    column_names[5]: x2_surf.ravel()
})
y_surf = model.predict(exog).values.reshape(x1_surf.shape)

ax.plot_surface(x1_surf, x2_surf, y_surf, color="red", alpha=0.3)

ax.set_xlabel('gen')
ax.set_ylabel('idi')
ax.set_zlabel('esi')
plt.legend()
plt.savefig("regression_plane.png", dpi=300, bbox_inches="tight")
