# Data Analysis for Qualifying Paper One

The current project aims to investigate whether acoustic-phonetic signals known to distinguish men from women may also vary systematically within each gender group in relation to measures of speaker's self-rated masculinity/femininity. We have a sample of 74 speakers (36 men, 38 women), all monolingual native American English speakers. The acoustic cues the current paper analyze include

- fundamental frequency (f0):
    - Characterize the pitch of ones' speech
    - Women's speech have higher pitch than men's

- Vowel space size:
    - Corner vowels in American English /i/, /u/, /ɛ/, and /ɑ/ are used as the stimuli in the experiment
    - The first two formants of the vowels (F1 and F2) characterizes the quality of the vowels
    - We can plot the corner vowels along a F1 × F2 space, forming a quadrilateral whose geometric area is used to characterize vowel space size
    - Women have larger vowel space size than men (i.e. the geometric area enclosed by corner vowels in the F1 × F2 space for women is larger than that of men's)

- Spectral mean (a.k.a. center of gravity, CoG) of sibilant /s/: 
    - Women have higher CoG values than men

We also elicit speakers' self-rated masculinity-femininty levels useing the following two questionnaires

- The Femininity scale of the Extended Personal Attributes Questionnaire (EPAQ-F+)
- Traditional Masculinity-Femininity Scale (TMF)
- The larger the scores, the more femininine speakers rate themselves to be

## Data

- Data Wrangling
    - [Process JSON](https://github.com/YuxiaoLuo/RUG-RUserGroup/blob/main/data_analysis/ProcessJSON.md)
- Text Analysis
    - [Intro to `stringr`](https://github.com/YuxiaoLuo/RUG-RUserGroup/blob/main/RUG_stringr.md)
    - [Intro to Regular Expression](https://github.com/YuxiaoLuo/RUG-RUserGroup/blob/main/RUG_RgularExpr.md)
    - [Corpus, Document Term Matrix, TF-IDF](https://github.com/YuxiaoLuo/RUG-RUserGroup/blob/main/data_analysis/Corpus_DTM_TFIDF.R)
    - [Topic Modeling](https://github.com/YuxiaoLuo/RUG-RUserGroup/blob/main/data_analysis/topicmodel.R)
- Statistical Analysis
    - [Hypothesis testing](https://github.com/YuxiaoLuo/RUG-RUserGroup/blob/main/data_analysis/HypothesisTest.R)
- R Markdown
    - [Intro to R Markdown](https://github.com/YuxiaoLuo/RUG-RUserGroup/blob/main/Intro_RMarkdown.md)
- R Shiny
    - [Intro to R Shiny](https://github.com/YuxiaoLuo/RUG-RUserGroup/blob/main/r_shiny/intro_shiny.md)
        - [R Shiny Scripts Folder](https://github.com/YuxiaoLuo/RUG-RUserGroup/tree/main/r_shiny)
- Other Topics
    - [Intro to Geocoding in R ](https://github.com/YuxiaoLuo/RUG-RUserGroup/blob/main/other_topics/Tidygeocoder.md)
    - [Compare Floats in R](https://github.com/YuxiaoLuo/RUG-RUserGroup/blob/main/other_topics/comparing_float.md)

## Summer Meetings

- [Summer Meetings 2022](https://github.com/YuxiaoLuo/RUG-RUserGroup/tree/main/summer_meeting)