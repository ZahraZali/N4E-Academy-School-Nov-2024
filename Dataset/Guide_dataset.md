## Dataset Summary
Total Records: 14,235
Target Variable: AQI (Air Quality Index)
Features:
- temperature (°C)
- humidity (%)
- wind_speed (km/h)
- traffic_density (scale 1–10) with lowest traffic_density = 1 and highest traffic_density = 10 
- industrial_activity (activity index 0–100)

Air quality is usually measured as raw concentrations of Ozone, Particulate Matter, 
Carbon Monoxide, Nitrogen Dioxide and Sulfur Dioxide in the air. 
These raw concentrations are the converted in “individual pollutant 
Air Quality Indices” (Details can be found in the Air quality information.pdf). 
Based on these individual AQI and overall, aka composite, AQI can be calculated. 

Air quality can be separated into six levels:
| AQI range  | Descriptor                     | Color  | RGB values |
|------------|--------------------------------|--------|------------|
| 0 to 50    | Good                           | Green  | 0 228 0    |
| 51 to 100  | Moderate                       | Yellow | 255 255 0  |
| 101 to 150 | Unhealthy for sensitive groups | Orange | 255 126 0  |
| 151 to 200 | Unhealthy                      | Red    | 255 0 0    |
| 201 to 300 | Very unhealthy                 | Purple | 143 63 151 |
| 301+       | Hazardous                      | Maroon | 126 0 35   |

The data represent daily measurements of different measurement stations, 
assuming no biases, e.g. skew to one season.  

## Data Notes
The data is based on patterns observed in real-world sources such as OpenAQ and AQICN.
It includes seasonal and daily pollution fluctuations, as well as natural variance 
and noise commonly present in environmental datasets.
It also includes missing data.

## Links

- [Data set](https://www.kaggle.com/datasets/price438/urban-air-quality-and-environmental-dataset?resource=download&select=aqi_dataset.csv)
- [Viewer on real time air pollutants (raw concentrations)](https://explore.openaq.org/?location=3156#12/52.02316/8.54837)
- [Historical AQI data](https://aqicn.org/data-platform/register/)
- [Realtime 3D air quality global map](https://www.iqair.com/de/earth)
- [Viewer on real time European Air Quality](https://airindex.eea.europa.eu/AQI/index.html)

