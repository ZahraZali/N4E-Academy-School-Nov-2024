### NFDI4Earth Hackathon Guidelines 

## Before
Please make sure you have a functional coding environment set up on your laptop, either R or Python, 
depending on which you plan to use during the Hackathon. Also, run the provided code in the GitHub repository, 
and install any required packages beforehand.

*GitHub repository*: https://github.com/ZahraZali/N4E-Academy-School-Nov-2024

## Focus
Collaborative model-building and critical reflection on machine learning workflows using an Air Quality (AQI) 
dataset (see [Dataset guide](https://github.com/ZahraZali/N4E-Academy-School-Nov-2024/blob/main/Dataset/Guide_dataset.md)). 
It is not only about performance but about understanding, justifying, 
and communicating how you got there.
Please note that the timetable and steps are guidelines, feel free to deviate from this plan

## Objective
- Develop, evaluate, and justify regression and classification models for the AQI dataset.
- Reflect on how modelling decisions affect performance, interpretability, and reproducibility.
- Communicate results clearly, linking model design to reasoning.

## ML Workflow Reference

Figure 1. Generalised overview of Machine Learning workflow


We already prepared **Steps 1–2** (problem framing and dataset understanding; Figure 1). 
You can find the details and code in this [repository](https://github.com/ZahraZali/N4E-Academy-School-Nov-2024). 
During the hackathon, you will focus on **Steps 3–5**:

| Description                                                     | Day                                 |
|-----------------------------------------------------------------|-------------------------------------|
| Explore, clean, modify data	                                    | Day 1 (afternoon) & Day 2 (morning) |
| Regression: Prepare for ML, Train Models & Evaluate results	    | Day 2 (morning)	                    |
| Classification: Prepare for ML, Train Models & Evaluate results	| Day 2 (afternoon)	                  |
| Final evaluation and presentation	                              | Day 2 (late afternoon)	            |

&nbsp;
&nbsp;

## Time table & guiding activities/questions
For each time block, we provided guiding activities and questions to get you started. 
Feel free to follow your own interests and ideas. You can also start with classification 
if you are more interested in this.

### Regression research questions
- How accurately can we predict the Air Quality Index (AQI) from the given environmental and activity variables (temperature, humidity, wind speed, traffic density, industrial activity)?
- Which of these variables contribute most strongly to high AQI values, and how do their effects differ in magnitude?

### Classification research questions
- Can we classify observations into AQI categories (e.g., Good, Moderate, Unhealthy) based on the five input variables, and how well are predictions balanced across categories?
- Which input conditions most often cause misclassification between “Moderate” and “Unhealthy” AQI categories?

&nbsp;
&nbsp;

### Day 1 – Exploration & Setup

*16:10–17:15 - Brainstorming & Dataset Exploration*

Objective: Take a first look at the data and discuss workflow expectations.

Activities:
- Explore variable types and relationships.
- Discuss potential predictors and outcome definitions.
- Identify data quality issues (missing, outliers, inconsistent values).
Initial guiding questions:
- What patterns in the data do we see?
- Which features are likely to influence AQI?

Documentation: Notes on key points and observations.

*17:15–17:30 - Wrap-up & Day 2 Preview*

&nbsp;
&nbsp;

### Day 2 – Hack & Reflect

*Morning - Data Preparation & Regression Modelling*

*09:20–10:30 - Data pre-processing & preparation*

Objective: Finalise data exploration and prepare the dataset for modelling.

Activities:
- Review feature distributions and correlations with AQI.
- Handle missing values and identified issues.
- Construct categorical target AQI_Bucket (based on given thresholds in the data set guide).
- Finalise data splits and scaling for modelling.
Initial guiding questions:
- Which data set preparation steps were needed, which were not and why?
- Why did we choose this split or scaling approach?

Documentation: Notes and code for data preparation steps. Identify 2-3 key points.

*10:30–11:30 - Regression baseline*

Objective: Build and validate a simple regression baseline model.

Activities:
- Decide on a model, e.g. linear regression.
- Identify appropriate validation and evaluation metrics and methods.
Reflective questions:
- How accurately can our model predict AQI?
- Which features appear most correlated with prediction error?
- How did you validate and evaluated your model? Why did you choose these methods and not others?

Documentation: Notes and code for conducted steps and the results. Identify 2-3 key points.

*11:30–12:30 - Regression improvement*

Objective: Build at least one additional regression model and compare these models.

Activities: 
- Build additional models, e.g. random forest and gradient boosting, and document why did you choose these.
- Target an improvement over baseline model.
- Add feature importance, SHAP plot or similar.
Reflective questions:
- How did you define improvement?
- Which design decisions improved model performance?
- How have you improved model performance of a model?
- Did you make any trade-offs during modelling?

Documentation: Comparison table, interpretability visual, Notes and code for conducted steps. Identify 2-3 key points.

&nbsp;
&nbsp;

*Afternoon - Classification Modelling & Evaluation*

*13:30–14:30 - Classification baseline*

Objective: Build and validate a simple classification baseline model.

Activities:
- Decide on a model, e.g. decision tree
- Identify appropriate validation and evaluation metrics and methods.
Reflective questions:
- How balanced are the AQI categories?
- How accurately can our model predict AQI?
- How did you validate and evaluated your model? Why did you choose these methods and not others?
- What would be the real-world usefulness of our metrics?

Documentation: Notes and code for conducted steps and the results. Identify 2-3 key points.

*14:30–15:30 - Classification improvement*

Objective: Build an improved classification model and evaluate results.

Activities: 
- Build additional models, e.g. random forest, and document why did you choose these.
- Target an improvement over baseline model.
- Add features for interpretability.
Reflective questions:
- Which features help separate classes best?
- Where are the largest misclassifications, and why?
- How have you improved model performance of a model?
- How confident should we be in the model’s predictions?

Documentation: Comparison table, interpretability visual, Notes and code for conducted steps. Identify 2-3 key points.

*Late Afternoon - Evaluation & Communication*

*15:30–17:00 - Presentation preparation*

Objective: Finalise results and insights.

Activities: 
- Prepare a presentation (≤7 slides; 7–10 min) covering the answers to the research questions and the most important key insights for Machine Learning workflows.
Reflective questions:
- Where do you need more practice and insights?
- What are the three key takeaways from the day?
- What did work as a group and what not?

Documentation: Presentation

*17:00–18:00	Team Presentations (7–10 min per team, incl. brief Q&A)*

*18:00–18:30	Plenary Discussion: Reflections, challenges, key learnings*

&nbsp;
&nbsp;

### Stretch Goals (if you have time)
- Cross-validation.
- Feature engineering (interaction terms, nonlinear transforms).
- Classification threshold tuning beyond standard AQI cutoffs.
- Sensitivity and robustness analysis.
