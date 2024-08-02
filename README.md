![image](https://github.com/The2035Initiative/Buffer_Protocol_2035_Initiative_draft/assets/141206781/a801039a-1760-48e7-915c-76a41e71eac8)
# Global Climate Adaptation Observatory

### Overview
In order to design effective policies and interventions, it is essential to understand how vulnerable people respond to climate-related shocks. However, barriers such as the high mobility typically associated with informal settlements, make it difficult to survey the same people consistently. Furthermore, a large distribution of vulnerable women, and migrants face a wide breadth of social and economic barriers that prevent them from participating in in-person surveys, as a result of safety and privacy concerns. As a result, there is a social data gap related to how residents are responding to climate-related shocks and the types of information they require to prepare better and advocate for their interests with relevant government agencies. To address this data inequality, a proof-of-concept system of high-frequency data collection with climate-vulnerable populations is underway. This is to better understand how vulnerable people around the world are coping with climate risks. We are seeking to identify which populations are in greatest need of assistance, and how policies that extend public services build resilience (Buntaine 2023).

![image](https://github.com/user-attachments/assets/7999e6d0-5929-4e0c-b9b3-8e5794036d7a)

In June of 2022, 80% of the residents in Sylhet, Bangladesh were flooded. Sylhet contains half a million people and sits on the eastern side of Bangladesh, on the Surma River. Above we can see the resilence residents relied on for transportation [(The New Humanitarian 2022).](https://www.thenewhumanitarian.org/photo-feature/2022/07/05/floods-climate-change-india-bangladesh-natural-disasters)



#### Population Data
- [Bangladesh Population Density Data](https://data.humdata.org/dataset/worldpop-population-density-for-bangladesh)
- [India Population Density Data](https://data.humdata.org/dataset/worldpop-population-density-for-india)

#### Maximum Water Extent Satellite Data
- [Microsoft Planetary Computer: JRC Global Surface Water -- Maximum water extent, most recent filters](https://planetarycomputer.microsoft.com/explore?c=88.6465%252C16.2266&z=2.71&v=2)

#### AMD1 Boundary Data
- [AMD1 Boundaries: Bangladesh Humanitarian Data Exchange](https://data.humdata.org/dataset/geoboundaries-admin-boundaries-for-bangladesh)
- [ADM1 Boundaries: India Humanitarian Data Exchange](https://data.humdata.org/dataset/geoboundaries-admin-boundaries-for-india)

##### Data Notes
The data utilized from MPC was hand clipped using the link above. When collecting data for India, the angel at which the satellite was positioned is irregular and makes the data difficult to work with. 

### File Overview 
```
├── Script/
|   ├── geospatial/
|          ├── GIS_identification_aoi_to_survey/
|              └── generating_survey_points.qmd
|          ├── GIS_response_analysis/
|              └── map_responses_R1.Rmd
|
|   ├── response_analysis/
|          ├── survey_questions/
|              └── adaptation_observatory_survey_questions_round_1.csv
|          ├── R/
|              └── demo_breakdowns_R1.qmd
|              └── mark_sofia_walkthru_R1.qmd
|              └── respondent_accuracy_R1.qmd
|              └── Treemap_R1.Rmd
|
|   ├── scratch/
|        └── (leftover & half-baked ideas)
|
|
├── Deliverables/
|   ├── geospatial/
|          ├── GIS_identification_aoi_to_survey/
|              └──
|          ├── GIS_response_analysis/
|              └── map_responses_R1.Rmd
|
|   ├── response_analysis/
|          ├── data_maid/
|              └── (data_maid.qmd and respective analysis output files)
|
├── .gitignore
├── README.md
├── LICENSE
|
├── environment.yml (future works, pending)
├── requirements.txt (future works, pending)
```
### Task Descriptions
#### `GIS AOI Identification for Surveying`
##### The Question
Is there an effective way to automate global citizen surveying workflow for regions at risk of climate events, such as flooding, rather than the traditional door-to-door surveying style?

##### The Deliverable
Develop a raster manipulation workflow (at 1kmx1km resolution) that can pin-point climate-vulnerable geo-locations, particularly areas with high population density at risk of flooding, for mobile-phone micro-surveying. The data sets generated from this process will be fed into a Facebook ad campaign to target specific demographics within regions more effectively. Interaction with the ad will be redirected to a Qualtric Survey, where they may consent to being recontacted to participate in our Global Climate Adaptation Observatory project in exchange for compensation. The survey intends to gain insights on how residents are responding to climate-related shocks and what types of information they need to prepare better and advocate for their interests with relevant government agencies.

##### The Methodology In-Between
Collected publicly available data to leverage for this project. Isolated MPC raster data 1 km resolution, applying raster masks, and performing raster multiplication to identify AOI. K-means clustering was applied to reduce the number of surveying points, but retain equal distribution throughout high populated regions at risk.

#### `Response Analysis`
##### The Questions
- How does the experience of flood events affect livelihood, housing, investment, and migration choices of residents of informal settlements? 
- Does information about the risks of flooding affect residents’ preparation for or response to flood events?
- Does the timing of risk messaging affect the way that people respond to flood-related information?

##### The Deliverable
A proof-of-concept system of high-frequency data collection with climate-vulnerable populations to understand how they are coping with climate risks, which populations are in greatest need of assistance, and how policies that extend public services build resilience (Buntaine 2023).

##### The Methodology In-Between
After initial cleaning & wrangling (standarizing data types, response lanaguages, assigning categorizations), a combination of mapping and data visualization techniques were employed to analyze the response distribution by gender and age demographics, as well as region, and income_bracket. An assessment of duplicated IPAddresses + location in  the Round 1 ("R1") were conducted to isolate repetitive responses. A refined data set containing the responses of only those that qualified for repeated surveying was created for Round 2 ("R2").

### Data Citations
```
1. Bangladesh - Population Density  - Humanitarian Data Exchange. data.humdata.org/dataset/worldpop-population-density-for-bangladesh.
2. India - Population Density  - Humanitarian Data Exchange. data.humdata.org/dataset/worldpop-population-density-for-india.
3. Microsoft Planetary Computer. planetarycomputer.microsoft.com/dataset/jrc-gsw
4. Bangladesh - Subnational Administrative Boundaries  - Humanitarian Data Exchange. data.humdata.org/dataset/geoboundaries-admin-boundaries-for-bangladesh.
5. India - Subnational Administrative Boundaries  - Humanitarian Data Exchange. data.humdata.org/dataset/geoboundaries-admin-boundaries-for-india.
```



