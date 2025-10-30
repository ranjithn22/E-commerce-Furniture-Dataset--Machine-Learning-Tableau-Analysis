# 🛋️ E-commerce Furniture Dataset 2024 — Machine Learning & Tableau Analysis

## 📌 Project Overview
This project analyzes and predicts sales performance of furniture items from an e-commerce platform (AliExpress). It combines **data analytics**, **machine learning**, and **data visualization (Tableau)** to uncover insights into pricing, discounts, and consumer behavior.

---

## 🎯 Objective
To **predict the number of items sold (`sold`)** based on product attributes such as:
- Product Title  
- Original Price  
- Current Price  
- Shipping Tags (`tagText`)

---

## 🧰 Tools & Technologies
| Category | Tools Used |
|-----------|-------------|
| Programming | Python, Pandas, NumPy |
| Visualization | Tableau, Matplotlib, Seaborn |
| Machine Learning | Scikit-learn |
| Data Handling | Excel, CSV |
| Database (optional) | SQL |

---

## 📊 Dataset Description
- **Source:** [AliExpress (Scraped Data)](https://drive.google.com/file/d/1EwYcFTnjwuZTpdfd2uaKjNVDLPmRsSMD/view?usp=sharing)  
- **Size:** 2,000 entries  
- **Attributes:**
  - `productTitle`: Name of the furniture item
  - `originalPrice`: Price before discount
  - `price`: Final selling price
  - `sold`: Number of units sold
  - `tagText`: Shipping information or offer tag

---

## ⚙️ Machine Learning Workflow

### 1. Data Preprocessing
- Removed missing values  
- Encoded categorical columns  
- Cleaned price fields (removed `$`, `,` symbols)  
- Created a new feature: **discount percentage**

```python
df['discount_percentage'] = ((df['originalPrice'] - df['price']) / df['originalPrice']) * 100
```
### 2. Exploratory Data Analysis (EDA)

- Visualized price vs. sales trends

- Distribution of sales (sold)

- Shipping tag frequency and impact

## Example plots:

- Histogram of prices

- Scatterplot: price vs sold

- Countplot: Shipping types

### 3. Model Training

Used two regression models:

1. Linear Regression

2. Random Forest Regressor
```python
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.ensemble import RandomForestRegressor

X = df.drop('sold', axis=1)
y = df['sold']
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

lr = LinearRegression().fit(X_train, y_train)
rf = RandomForestRegressor(n_estimators=100, random_state=42).fit(X_train, y_train)
```
### 4. Model Evaluation

Evaluated using:

- Mean Squared Error (MSE)
- R² Score
- Model	MSE	R² Score

### 📈 Tableau Dashboard

An interactive Tableau dashboard was created to visualize:
Top-selling furniture items
Relationship between price and sales
Impact of discounts and shipping types on sales

### 🖼️ Key Insights:

Most products with free shipping sold better.

Lower-priced items had higher sales volumes.

Certain product types consistently dominated sales.

### 🧠 Key Insights

Price and free shipping strongly influence sales volume.

Discount percentage plays a major role in attracting customers.

Random Forest outperformed Linear Regression in predicting sales.
