# Project 1 Investigation of the Convergence of the Arithmetic Mean Distribution


## Simulation Steps

1. **Present Characteristics of the Distribution**  
   Describe the distribution from which the data will be generated, including expected value, standard deviation, skewness, and kurtosis. Provide a density/probability plot.

2. **Generate Data**  
   For a fixed \( k \), generate \( k \) data points from the given distribution.

3. **Calculate Arithmetic Mean**  
   Compute the arithmetic mean of the generated data points.

4. **Repeat Simulation**  
   Repeat steps 2-3 \( N \) times.

5. **Analyze the Results**  
   Examine the basic characteristics of the set of calculated arithmetic means: mean, standard deviation, skewness, and kurtosis.

6. **Visualize the Data**  
   Present the results using a box plot and a histogram.

7. **Check for Normality**  
   Verify if the means follow a normal distribution (e.g., using the Shapiro-Wilk test).

## Experiment Parameters

Perform steps 1-7 for \( N = 300 \) and \( k = 5, 10, 20, 30, 50, 100, 200, 500, 1000 \). Summarize the results to show how the distribution of arithmetic means changes with an increase in the number of data points \( k \) and the characteristics of the original data distribution.

### Variants of the Study

1. **Variant 1**  
   In step 2, simply draw data from the given distribution.

2. **Variant 2**  
   In step 2, draw data from the given distribution and square them. For this variant, calculate the characteristics in step 1 based on 10,000 generated data points.

## Distributions to be Considered

5. **Log-Normal Distribution**
   - \( \mu = 0 \)
   - \( \sigma = \frac{1}{8}, 1, 10 \)

# Project 2 Analysis of Stock Returns



## Data Collection

Download the stock prices of a chosen company from the WIG20 index and another from the mWIG40 index from the period of early 2022 to the end of 2023 from stooq.pl (or another reliable source).

## Steps of Analysis

### 1. Calculate Returns

1. **Daily and Weekly Returns**  
   Calculate daily and weekly (using weekly data) logarithmic returns of the stock prices based on the downloaded data.

### 2. Distribution Characteristics

2. **Basic Characteristics of Returns**  
   Compute the basic characteristics of the return distributions (mean, standard deviation, skewness, kurtosis). Present the distribution graphically using a histogram and a box plot.

### 3. Normal Distribution Fit

3. **Check Normal Distribution Fit**  
   Examine the fit of the daily and weekly return distributions to a normal distribution using the following tests:
   - Chi-Squared Test
   - Kolmogorov-Smirnov Test
   - Shapiro-Wilk Test

### 4. Student's t-Distribution Fit

4. **Check Student's t-Distribution Fit**  
   Examine the fit of the daily and weekly return distributions to a Student's t-distribution using the following tests:
   - Chi-Squared Test
   - Kolmogorov-Smirnov Test
   
   If issues arise, multiply the returns by 100.

## Variants of the Study

Conduct the study using the entire dataset and only samples with a maximum length of 1/3 of the original data length.

## Notes

- Additional explanations are provided for some tasks.
- The calculation of returns is explained in the file `stopy.xlsx`.


# Project 3 Analysis of Maximum Likelihood Estimators (MLE) for Weibull Distribution Parameters



## Objectives

Conduct simulations to investigate the properties of Maximum Likelihood Estimators (MLE) for the parameters of a given distribution. Focus on the following aspects:

- How does the accuracy of the estimation change with the number of data points used for parameter estimation?
- How do the skewness and kurtosis of the estimated parameter values change with the number of data points used for parameter estimation?
- Is the distribution of the parameter estimates normal? How does this depend on the number of data points?
- Does the behavior of MLEs depend on which parameter of the distribution is being estimated?
- Does the behavior of MLEs differ based on the true value of the estimated parameter (e.g., is it different for \( \theta = 1 \) versus \( \theta = 10 \))?

## Steps of the Simulation

### 1. Generate Data

1. **Weibull Distribution Data**  
   Generate data from a Weibull distribution with the true shape parameter \( k \) and scale parameter \( \lambda \).

### 2. Estimate Parameters

2. **MLE Estimation**  
   Estimate the parameters \( k \) and \( \lambda \) using the Maximum Likelihood Estimation (MLE) method for different sample sizes.

### 3. Analyze Accuracy

3. **Accuracy of Estimates**  
   Investigate how the accuracy of the parameter estimates changes with the number of data points.

### 4. Skewness and Kurtosis

4. **Distribution Shape**  
   Analyze how the skewness and kurtosis of the estimated parameter values change with the number of data points.

### 5. Normality Check

5. **Normality of Estimates**  
   Check if the distribution of the parameter estimates follows a normal distribution for different sample sizes.

### 6. Parameter Dependency

6. **Estimator Behavior Based on Parameter**  
   Investigate if the behavior of MLEs depends on which parameter of the Weibull distribution (shape or scale) is being estimated.

### 7. True Value Dependency

7. **Effect of True Parameter Value**  
   Examine if the behavior of MLEs differs based on the true value of the estimated parameter (e.g., \( \theta = 1 \) versus \( \theta = 10 \)).

## Methodology

1. **Simulate Weibull Data**  
   - Generate Weibull-distributed data with various sample sizes (e.g., \( n = 50, 100, 500, 1000 \)) for different true parameter values \( \theta \).

2. **Estimate Parameters Using MLE**  
   - Use MLE to estimate the Weibull parameters for each sample.

3. **Evaluate Estimator Properties**  
   - Calculate the bias, variance, skewness, and kurtosis of the parameter estimates.
   - Perform normality tests (e.g., Shapiro-Wilk test) on the distribution of the estimates.

4. **Compare Results**  
   - Analyze and compare the results for different sample sizes and true parameter values.

## Notes

- Conduct the simulations for various true parameter values to observe how the MLE behavior changes.
- Present the findings using appropriate visualizations such as histograms, box plots, and Q-Q plots.
- Summarize the results to highlight the key insights about the properties of MLEs for Weibull distribution parameters.
