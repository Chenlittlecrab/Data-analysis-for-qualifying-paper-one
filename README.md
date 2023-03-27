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

### Vowels and fricatives
- txt file that ONLY has measurements averaged across items
    - [grand average data](https://github.com/Chenlittlecrab/Data-analysis-for-qualifying-paper-one/blob/master/gender_grand_ave.txt)
- txt file that displays all the measurements for each item
    - [vowel data](https://github.com/Chenlittlecrab/Data-analysis-for-qualifying-paper-one/blob/master/gd_vowels_recode.txt)
    - [fricative data](https://github.com/Chenlittlecrab/Data-analysis-for-qualifying-paper-one/blob/master/gd_fricatives_recode.txt)

## descriptive statistical analysis
- R markdown file
    -[Analysis file](https://github.com/Chenlittlecrab/Data-analysis-for-qualifying-paper-one/blob/master/descriptive_stats.Rmd)
- HTML link pushed to Rpubs
    -[HTML link](https://rpubs.com/Chen_Z_0913/1020903)

## f0 error detection (ongoing)

- [f0 error ](https://github.com/Chenlittlecrab/F0-error-detection)
