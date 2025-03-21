# Chocolate-Sales-Canada-Data-Analysis

## Table of Contents
- [Project Background](#Project-Background)
- [Technologies Used](#Technologies-Used)
- [Insights Deep-Dive](#Insights-Deep-Dive)
  - [Product Pricing](#Product-Pricing)
  - [Statistical Tests](#Statistical-Tests)
  - [Sales by Date](#Sales-by-Date)
- [Final Recommendations](#Final-Recommendations)

## Project Background
Among the six countries being tracked, Canada ranks at the bottom in total chocolate sales. This project aims to analyze key trends, consumer preferences, and sales performance within the Canadian chocolate market to identify insights and provide actionable recommendations for improving sales.

## Technologies Used
* SQL - Used for querying, filtering, and preprocessing data
* Python(Pandas, Statsmodels) - Used for data analysis, and statistical testing.
* PostgreSQL – Served as the database management system for structured storage and efficient data retrieval.
* Tableau – Used for creating interactive dashboards and visualizations for insights.

## Insights Deep-Dive

### Product Pricing
The first thing to look at is the pricing differences between the 6 countries to see if that is a factor in sales amount. I first took at a look at the products that Canada had priced higher than the other countries but was selling less. I took the products that Canada had been ranking either first or second in price but ranking 4th or lower in amount sold and found these 4 products.

<img width="706" alt="Image" src="https://github.com/user-attachments/assets/9a5a8255-f159-4c75-88ea-c0c7c72d31ba" />

I then compared the pricing of this product across different countries and noticed a significant discrepancy. I believe adjusting the price could help increase sales in Canada. To determine a more competitive price, I calculated the average price from the top three countries with the highest sales for this product.

While analyzing the pricing and sales data, I identified several products that were priced among the lowest but still had very low sales. Typically, we would expect lower-priced products to perform well, as affordability is a key driver of consumer demand. 

<img width="706" alt="Image" src="https://github.com/user-attachments/assets/405d586e-9d27-4723-a214-1e4b2eff0a9a" />

To explore possible reasons for their low sales, I examined the nutritional data to see if any correlations existed between certain nutritional factors and sales.

I focused on calories and sugar as key variables. After standardizing the calorie values to be per 100g and plotting them against sales, I observed a negative correlation between a product’s calorie content and its sales, which suggests that higher-calorie chocolates may be less popular among consumers in Canada.

<img width="1047" alt="Image" src="https://github.com/user-attachments/assets/e6109eb3-f340-48e2-a4f5-2fbfbf134aa1" />

### Statistical Tests

To verify whether the observed negative correlation between calorie content and sales was statistically significant, I performed a linear regression analysis using statsmodels. In this model, calories per 100g served as the independent variable (X), while amount sold was the dependent variable (y). By applying the Ordinary Least Squares method, I obtained the following results.

<img width="820" alt="Image" src="https://github.com/user-attachments/assets/103c1c34-8a9b-4341-9b01-75813f7ddec1" />

From the results we can see an R-squared value of 0.42 meaning 42% of the variance in amount sold is due to the amount of calories in the product. The p-value for calories is less than 0.05, indicating that the relationship between calories and the amount sold is statistically significant. We can also see that the slope is -82.28, meaning that for every unit increase in calories, we can expect a decrease of 82.28 units in sales.

I ran the same test for sugar but there didn't appear to be a correlation between sugar and amount sold.

<img width="1051" alt="Image" src="https://github.com/user-attachments/assets/36aa6f8a-ee50-4859-b9be-3e40ed9ebd05" />
<img width="792" alt="Image" src="https://github.com/user-attachments/assets/8263c6b1-7728-4c91-a394-132e18f0cef6" />

### Sales by Date

Next, I wanted to analyze whether the time of year had an impact on sales in Canada. I plotted Canada's sales over the months alongside the average sales for the other countries to identify which months Canada was struggling in.

<img width="1050" alt="Image" src="https://github.com/user-attachments/assets/204e8ca9-280a-49a7-913d-b8026fbc09f8" />

Canada is not performing very well in June 2022 where as the other countries performed very well on average. Looking into that month one possible cause could be the Bank of Canada raised its benchmark overnight interest rate by 50 basis points to 1.50% in early June 2022 potentially dampened spending.

By plotting the sales of all the other countries, I can see that the UK performed exceptionally well in June. It might be worth investigating whether the UK ran any marketing campaigns that month or if there were other factors that contributed to the boost in sales during that period.

<img width="1051" alt="Image" src="https://github.com/user-attachments/assets/6e86f2ab-4ec4-4940-82e7-7c931d96d5c8" />

## Final Recommendations
##### <u>Price</u>
There isn’t clear evidence that price is a determining factor in the amount sold, but to explore this further, I suggest testing price adjustments. Specifically, I identified four products that were priced higher and had lower sales compared to other countries. By reducing the price of these products and monitoring sales over a set period, we can assess whether price plays a significant role in influencing demand. 

##### <u>Nutrition</u>
The analysis of nutrition data revealed a clear correlation between calories and the amount sold, indicating that products with lower calorie counts influence purchasing behavior. I recommend expanding the selection of low-calorie offerings by introducing new products or reformulating existing ones to reduce calorie content while maintaining taste. Marketing efforts should emphasize calorie content through packaging, advertisements, and health-conscious branding. Additionally, optimizing product placement by positioning low-calorie options more prominently in stores and online could further boost sales.

##### <u>Period of the Year</u>
Sales during the spring months showed a noticeable decline in Canada, raising questions about whether this is a recurring seasonal trend or a one-time issue. To better understand this, additional data from other years should be analyzed to determine if spring sales consistently underperform or if something specific to the spring of 2022 caused the drop. Meanwhile, the UK performed exceptionally well during these months, suggesting that their approach may offer valuable insights. Analyzing their marketing campaigns, pricing strategies, or other contributing factors could help identify best practices that could be applied to improve sales performance in Canada during the spring months.
