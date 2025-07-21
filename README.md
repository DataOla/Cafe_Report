# Cafe Sales Insight

This project analyzed transaction data from cafe to uncover patterns in product performance, customer behavior, and trends in sales/orders. The workflow includes data cleaning in Excel & SQL, data modeling, and data visualization in Tableau.

---

## Data Cleaning & Visualization

**Cleaning and Preparing the Data**

The raw data set contained 10,000 transactions with loads of errors. On top of that, SQL wasn't loading all the rows because the dataset had text values in integer cells. So I had to start cleaning and standardizing in Excel.

We had invalid entries such as "error", "empty", "unknown", and blanks, which were fixed with IF and SWITCH formulas.

In SQL, UPDATE queries were used to normalize the data, and unfixable rows were turned to NULL.



**Viaualization**

A fully interactive dashboard was built in Tableau to communicate key business metrics and trends. Features include product performance, time trends, and payment method distribution.


<p float="left">
  <img src="https://github.com/DataOla/Cafe_Report/blob/main/Cafe%20Sales%20Dashboard.png" alt="Dashboard" width="700"/>
</p>
<p float="left">
  <img src="https://github.com/DataOla/Cafe_Report/blob/main/Cafe%20Sales%20Dashboard%20Anno.png" alt="Dashboard" width="700"/>
</p>

**[See dashboard here!](https://public.tableau.com/app/profile/olamilekan.lawal3922/viz/CafeSalesDashboard_17530696752750/Home#1)**

---

## 🛠️ Tools Used

| Tool                | Purpose                                 |
| ------------------- | --------------------------------------- |
| **Excel & SQL**     | Data cleaning, transformation, analysis |
| **Tableau**         | Dashboard design and visualization      |
| **Canva and Figma** | Layout mockups and Annotation           |

---
## My Files

* README file - `README.md` 
* Original Dataset - `dirty_cafe_data.csv`
* Cleaned Dataset - `Cleaned_cafe_data.csv`
* Excel Formula - `Preliminary Cleaning in Excel.pdf`
* SQL Script - `Cafe_Sales.sql`
* Image of the Dashboard - `Cafe Sales Dashboard.png`
* Image of the Annotation - `Cafe Sales Dashboard Anno.png`

---

 

